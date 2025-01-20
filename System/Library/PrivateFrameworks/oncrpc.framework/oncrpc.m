uint64_t _newrpclib_callrpc(char *__s2, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t result;
  const char *v8;
  hostent *v9;
  hostent *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x263EF8340];
  v6 = callrpc_private;
  if (!callrpc_private)
  {
    result = (uint64_t)calloc(1uLL, 0x20uLL);
    if (!result) {
      return result;
    }
    v6 = result;
    callrpc_private = result;
  }
  v13 = 0;
  v14 = 0;
  v8 = *(const char **)(v6 + 24);
  if (!v8)
  {
    v8 = (const char *)malloc(0x100uLL);
    *(void *)(v6 + 24) = v8;
    *v8 = 0;
    *(_DWORD *)(v6 + 8) = -1;
  }
  v12 = 0;
  if (!*(_DWORD *)(v6 + 20) || *(_DWORD *)(v6 + 12) != a2 || *(_DWORD *)(v6 + 16) != a3 || strcmp(v8, __s2))
  {
    *(_DWORD *)(v6 + 20) = 0;
    *(_DWORD *)(v6 + 8) = -1;
    if (*(void *)v6)
    {
      (*(void (**)(void))(*(void *)(*(void *)v6 + 8) + 32))();
      *(void *)v6 = 0;
    }
    v9 = getipnodebyname(__s2, 2, 0, &v12);
    if (!v9) {
      return 13;
    }
    v10 = v9;
    v13 = 0;
    v14 = 0;
    __memmove_chk();
    freehostent(v10);
    BYTE1(v13) = 2;
    WORD1(v13) = 0;
    v11 = _newrpclib_clntudp_create((unsigned __int8 *)&v13, a2, a3, 5, 0, (int *)(v6 + 8));
    *(void *)v6 = v11;
    if (!v11) {
      return *(unsigned int *)_newrpclib___rpc_createerr();
    }
    *(_DWORD *)(v6 + 16) = a3;
    *(_DWORD *)(v6 + 20) = 1;
    *(_DWORD *)(v6 + 12) = a2;
    strcpy(*(char **)(v6 + 24), __s2);
  }
  result = (**(uint64_t (***)(void))(*(void *)v6 + 8))();
  if (result) {
    *(_DWORD *)(v6 + 20) = 0;
  }
  return result;
}

uint64_t _newrpclib_authnone_create()
{
  int v0 = pthread_once(&authnone_once_init, (void (*)(void))authnone_init);
  if (v0)
  {
    int v1 = v0;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_authnone_create_cold_1(v1);
    }
  }
  return authnone_private;
}

char *authnone_init()
{
  result = (char *)calloc(1uLL, 0x60uLL);
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    memset(v6, 0, sizeof(v6));
    authnone_private = (uint64_t)result;
    uint64_t v2 = (uint64_t)(result + 24);
    long long v3 = _newrpclib__null_auth;
    *(_OWORD *)(result + 24) = _newrpclib__null_auth;
    uint64_t v4 = qword_268B95F98;
    *((void *)result + 5) = qword_268B95F98;
    *((void *)result + 2) = v4;
    *(_OWORD *)result = v3;
    *((void *)result + 7) = ops;
    _newrpclib_xdrmem_create((uint64_t)v6, (uint64_t)(result + 72), 20, 0);
    _newrpclib_xdr_opaque_auth((uint64_t (***)(void))v6, v1);
    _newrpclib_xdr_opaque_auth((uint64_t (***)(void))v6, v2);
    result = (char *)(*(uint64_t (**)(_OWORD *))(*((void *)&v6[0] + 1) + 32))(v6);
    *(_DWORD *)(v1 + 92) = result;
    v5 = *(uint64_t (**)(_OWORD *))(*((void *)&v6[0] + 1) + 56);
    if (v5) {
      return (char *)v5(v6);
    }
  }
  return result;
}

uint64_t authnone_marshal(uint64_t a1, uint64_t a2)
{
  if (authnone_private) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(a2 + 8) + 24))(a2, authnone_private + 72, *(unsigned int *)(authnone_private + 92));
  }
  else {
    return 0;
  }
}

uint64_t authnone_validate()
{
  return 1;
}

uint64_t authnone_refresh()
{
  return 0;
}

_OWORD *_newrpclib_authunix_create(uint64_t a1, unsigned int a2, unsigned int a3, int a4, uint64_t a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  memset(__src, 0, sizeof(__src));
  memset(v21, 0, sizeof(v21));
  v10 = calloc(1uLL, 0x48uLL);
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_authunix_create_cold_1();
    }
    return 0;
  }
  v11 = v10;
  v12 = (char *)calloc(1uLL, 0x1C8uLL);
  if (!v12)
  {
    free(v11);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_authunix_create_cold_2();
    }
    return 0;
  }
  v13 = v12;
  v22.tv_sec = 0;
  *(void *)&v22.tv_usec = 0;
  *((void *)v11 + 7) = auth_unix_ops;
  *((void *)v11 + 8) = v12;
  uint64_t v14 = qword_268B95F98;
  *((void *)v12 + 5) = qword_268B95F98;
  long long v15 = _newrpclib__null_auth;
  *(_OWORD *)(v12 + 24) = _newrpclib__null_auth;
  *(_OWORD *)((char *)v11 + 24) = v15;
  *((void *)v11 + 5) = v14;
  *((_DWORD *)v12 + 12) = 0;
  gettimeofday(&v22, 0);
  LODWORD(v23) = v22.tv_sec;
  *((void *)&v23 + 1) = a1;
  *(void *)&long long v24 = __PAIR64__(a3, a2);
  DWORD2(v24) = a4;
  uint64_t v25 = a5;
  _newrpclib_xdrmem_create((uint64_t)v21, (uint64_t)__src, 400, 0);
  if (!_newrpclib_xdr_authunix_parms((uint64_t (***)(void))v21, (uint64_t)&v23))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_authunix_create_cold_3();
    }
    goto LABEL_15;
  }
  unsigned int v16 = (*(uint64_t (**)(timeval *))(*(void *)&v21[0].tv_usec + 32))(v21);
  v13[4] = v16;
  size_t v17 = v16;
  _DWORD *v13 = 1;
  v18 = calloc(1uLL, v16);
  *((void *)v13 + 1) = v18;
  if (!v18)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_authunix_create_cold_4();
    }
    goto LABEL_15;
  }
  memmove(v18, __src, v17);
  uint64_t v19 = *((void *)v13 + 2);
  _OWORD *v11 = *(_OWORD *)v13;
  *((void *)v11 + 2) = v19;
  if (!marshal_new_auth((uint64_t)v11))
  {
LABEL_15:
    free(v13);
    free(v11);
    return 0;
  }
  return v11;
}

BOOL marshal_new_auth(uint64_t a1)
{
  memset(v5, 0, sizeof(v5));
  uint64_t v2 = *(void *)(a1 + 64);
  _newrpclib_xdrmem_create((uint64_t)v5, v2 + 52, 400, 0);
  if (_newrpclib_xdr_opaque_auth((uint64_t (***)(void))v5, a1)
    && _newrpclib_xdr_opaque_auth((uint64_t (***)(void))v5, a1 + 24))
  {
    *(_DWORD *)(v2 + 452) = (*(uint64_t (**)(_OWORD *))(*((void *)&v5[0] + 1) + 32))(v5);
    long long v3 = *(void (**)(_OWORD *))(*((void *)&v5[0] + 1) + 56);
    if (v3) {
      v3(v5);
    }
    return 1;
  }
  else
  {
    BOOL result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (result)
    {
      marshal_new_auth_cold_1();
      return 0;
    }
  }
  return result;
}

uint64_t _newrpclib_set_rpc_maxgrouplist(uint64_t result)
{
  if ((result - 1) <= 0xE) {
    maxgrplist = result;
  }
  return result;
}

_OWORD *_newrpclib_authunix_create_default()
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  *(_OWORD *)v6 = 0u;
  long long v7 = 0u;
  memset(v5, 0, sizeof(v5));
  if (gethostname(v6, 0xFFuLL) == -1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_authunix_create_default_cold_1();
    }
    return 0;
  }
  else
  {
    HIBYTE(v21) = 0;
    uid_t v0 = geteuid();
    gid_t v1 = getegid();
    int v2 = getgroups(16, (gid_t *)v5);
    if (v2 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _newrpclib_authunix_create_default_cold_2();
      }
      LODWORD(v5[0]) = v1;
      int v2 = 1;
    }
    if (v2 >= maxgrplist) {
      int v3 = maxgrplist;
    }
    else {
      int v3 = v2;
    }
    return _newrpclib_authunix_create((uint64_t)v6, v0, v1, v3, (uint64_t)v5);
  }
}

uint64_t authunix_marshal(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(a2 + 8) + 24))(a2, *(void *)(a1 + 64) + 52, *(unsigned int *)(*(void *)(a1 + 64) + 452));
}

BOOL authunix_validate(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 != 2) {
    return 1;
  }
  memset(v7, 0, sizeof(v7));
  int v3 = *(long long **)(a1 + 64);
  _newrpclib_xdrmem_create((uint64_t)v7, *(void *)(a2 + 8), *(_DWORD *)(a2 + 16), 1);
  uint64_t v4 = (void *)*((void *)v3 + 4);
  if (v4)
  {
    free(v4);
    *((void *)v3 + 4) = 0;
  }
  if (_newrpclib_xdr_opaque_auth((uint64_t (***)(void))v7, (uint64_t)v3 + 24))
  {
    int v3 = (long long *)((char *)v3 + 24);
  }
  else
  {
    LODWORD(v7[0]) = 2;
    _newrpclib_xdr_opaque_auth((uint64_t (***)(void))v7, (uint64_t)v3 + 24);
    *((void *)v3 + 4) = 0;
  }
  long long v6 = *v3;
  *(void *)(a1 + 16) = *((void *)v3 + 2);
  *(_OWORD *)a1 = v6;
  return marshal_new_auth(a1);
}

BOOL authunix_refresh(uint64_t a1)
{
  gid_t v1 = *(long long **)(a1 + 64);
  memset(v10, 0, sizeof(v10));
  memset(v8, 0, sizeof(v8));
  uint64_t v2 = *((void *)v1 + 1);
  if (*(void *)(a1 + 8) == v2) {
    return 0;
  }
  ++*((_DWORD *)v1 + 12);
  *((void *)&v10[0] + 1) = 0;
  uint64_t v11 = 0;
  _newrpclib_xdrmem_create((uint64_t)v8, v2, *((_DWORD *)v1 + 4), 1);
  if (_newrpclib_xdr_authunix_parms((uint64_t (***)(void))v8, (uint64_t)v10)
    && (v9.tv_sec = 0,
        *(void *)&v9.tv_usec = 0,
        gettimeofday(&v9, 0),
        LODWORD(v10[0]) = v9.tv_sec,
        LODWORD(v8[0].tv_sec) = 0,
        (*(void (**)(timeval *, void))(*(void *)&v8[0].tv_usec + 40))(v8, 0),
        _newrpclib_xdr_authunix_parms((uint64_t (***)(void))v8, (uint64_t)v10)))
  {
    long long v4 = *v1;
    *(void *)(a1 + 16) = *((void *)v1 + 2);
    *(_OWORD *)a1 = v4;
    BOOL v5 = marshal_new_auth(a1);
  }
  else
  {
    BOOL v5 = 0;
  }
  LODWORD(v8[0].tv_sec) = 2;
  _newrpclib_xdr_authunix_parms((uint64_t (***)(void))v8, (uint64_t)v10);
  long long v6 = *(void (**)(timeval *))(*(void *)&v8[0].tv_usec + 56);
  if (v6) {
    v6(v8);
  }
  return v5;
}

void authunix_destroy(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  free(*(void **)(v2 + 8));
  int v3 = *(void **)(v2 + 32);
  if (v3) {
    free(v3);
  }
  free(*(void **)(a1 + 64));
  long long v4 = *(void **)(a1 + 32);
  if (v4) {
    free(v4);
  }
  free((void *)a1);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Eu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

BOOL _newrpclib_xdr_authunix_parms(uint64_t (***a1)(void), uint64_t a2)
{
  return _newrpclib_xdr_uint32_t(a1, (int *)a2)
      && _newrpclib_xdr_string(a1, (char **)(a2 + 8), 0xFFu)
      && _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 16))
      && _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 20))
      && _newrpclib_xdr_array(a1, (void **)(a2 + 32), (int *)(a2 + 24), 0x10u, 4u, (uint64_t (*)(uint64_t (***)(void), char *))_newrpclib_xdr_uint32_t);
}

void *_newrpclib_clnt_create_timeout(char *a1, uint64_t a2, unsigned int a3, char *__s2, long long *a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  memset(&v16, 0, 128);
  uint64_t v14 = 0;
  unint64_t v15 = 0;
  if (_newrpclib_netid2socparms(__s2, &v15, (_DWORD *)&v14 + 1, &v14, 1))
  {
    uint64_t v9 = _newrpclib___rpc_createerr();
    int v10 = 17;
LABEL_3:
    *uint64_t v9 = v10;
    uint64_t v11 = _newrpclib___rpc_createerr();
    BOOL result = 0;
    v11[2] = 46;
    return result;
  }
  if (v15 == 1)
  {
    unint64_t v15 = 0xFFFFFFFF00000001;
    *(_WORD *)&v16.sa_len = 362;
    memset(v16.sa_data, 0, 104);
LABEL_6:
    if (HIDWORD(v14) == 1) {
      return clntticotsord_create_timeout(&v16, a2, a3, (int *)&v15 + 1, 0, 0, 0, a5);
    }
LABEL_19:
    uint64_t v9 = _newrpclib___rpc_createerr();
    int v10 = 12;
    goto LABEL_3;
  }
  if (gethostaddr(a1, v15, &v16))
  {
    long long v13 = _newrpclib___rpc_createerr();
    BOOL result = 0;
    _DWORD *v13 = 13;
  }
  else
  {
    HIDWORD(v15) = -1;
    if ((int)v15 > 1)
    {
      if (v15 != 30 && v15 != 2) {
        goto LABEL_19;
      }
    }
    else if (v15)
    {
      if (v15 != 1) {
        goto LABEL_19;
      }
      goto LABEL_6;
    }
    if (v14 == 6)
    {
      return _newrpclib_clnttcp_create_timeout(&v16, a2, a3, (int *)&v15 + 1, 0, 0, 0, a5);
    }
    else
    {
      if (v14 != 17) {
        goto LABEL_19;
      }
      return _newrpclib_clntudp_bufcreate_timeout(&v16.sa_len, a2, a3, (int *)&v15 + 1, 8800, 8800, 0, a5);
    }
  }
  return result;
}

void *_newrpclib_clnt_create(char *a1, uint64_t a2, unsigned int a3, char *__s2)
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v13 = 0;
  if (_newrpclib_netid2socparms(__s2, (_DWORD *)&v15 + 1, 0, &v15, 1))
  {
    long long v8 = _newrpclib___rpc_createerr();
    int v9 = 17;
LABEL_3:
    *long long v8 = v9;
    int v10 = _newrpclib___rpc_createerr();
    BOOL result = 0;
    _OWORD v10[2] = 46;
    return result;
  }
  if (v15 == 6)
  {
    long long v12 = 0;
  }
  else
  {
    if (v15 != 17)
    {
      long long v8 = _newrpclib___rpc_createerr();
      int v9 = 12;
      goto LABEL_3;
    }
    uint64_t v13 = 5;
    LODWORD(v14) = 0;
    long long v12 = (long long *)&v13;
  }
  return _newrpclib_clnt_create_timeout(a1, a2, a3, __s2, v12);
}

uint64_t clnt_auth_set(uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(result + 56) + 32))();
  }
  *a1 = a2;
  return result;
}

void *reply_addr_cache_create(size_t a1)
{
  if (a1) {
    size_t v1 = a1;
  }
  else {
    size_t v1 = 256;
  }
  uint64_t v2 = calloc(1uLL, 0x10uLL);
  if (v2)
  {
    int v3 = calloc(v1, 0x1CuLL);
    v2[1] = v3;
    if (v3)
    {
      *(_DWORD *)uint64_t v2 = v1;
    }
    else
    {
      free(v2);
      return 0;
    }
  }
  return v2;
}

void reply_addr_cache_destroy(void **a1)
{
  if (a1)
  {
    free(a1[1]);
    free(a1);
  }
}

uint64_t _newrpclib_clnt_multicasts_buf_timeout(uint64_t a1, size_t __count, unsigned int (*a3)(uint64_t, timeval *, _DWORD *, unint64_t), uint64_t a4, int *a5, size_t a6, _DWORD *a7, size_t a8, int *a9, unsigned int a10, unsigned int a11, int a12)
{
  size_t v16 = __count;
  uint64_t v108 = *MEMORY[0x263EF8340];
  long long v18 = calloc(__count, 0x20uLL);
  if (!v18) {
    return 12;
  }
  long long v19 = (char *)v18;
  v97 = 0;
  if (v16)
  {
    long long v20 = v18 + 7;
    size_t v21 = v16;
    do
    {
      *long long v20 = -1;
      v20 += 8;
      --v21;
    }
    while (v21);
  }
  uint64_t v22 = (pollfd *)calloc(v16, 8uLL);
  if (!v22)
  {
    free(v19);
    return 12;
  }
  v92 = v22;
  if (getifaddrs(&v97))
  {
LABEL_7:
    uint64_t v23 = 3;
    goto LABEL_119;
  }
  uint64_t v86 = a4;
  size_t v87 = a8;
  v85 = a3;
  if (!v16)
  {
    uint64_t v23 = 5;
    goto LABEL_36;
  }
  uint64_t v24 = 0;
  uint64_t v88 = a1;
  v89 = v19;
  do
  {
    uint64_t v25 = *(void *)(a1 + 8 * v24);
    v26 = v97;
    uint64_t v27 = &v19[32 * v24];
    LODWORD(__s2.tv_sec) = 1;
    *(void *)uint64_t v27 = 0;
    *((void *)v27 + 1) = v27;
    *((void *)v27 + 2) = v25;
    int v28 = *(unsigned __int8 *)(v25 + 1);
    if (v28 == 30)
    {
      if (*(unsigned __int8 *)(v25 + 8) != 255) {
        goto LABEL_117;
      }
      int v30 = 0;
      __int16 v93 = 0;
      int v29 = 32769;
      goto LABEL_20;
    }
    if (v28 != 2) {
      goto LABEL_117;
    }
    __int16 v93 = *(_WORD *)(v25 + 2);
    if (*(_DWORD *)(v25 + 4) == -1)
    {
      int v29 = 32771;
      int v30 = 1;
LABEL_20:
      *(_DWORD *)&v19[32 * v24 + 24] = v30;
      goto LABEL_21;
    }
    if ((v25 & 0xF0000000) != 0xE0000000) {
      goto LABEL_117;
    }
    int v29 = 32769;
LABEL_21:
    int v31 = socket(v28, 2, 0);
    v32 = &v19[32 * v24];
    *((_DWORD *)v32 + 7) = v31;
    v33 = (int *)(v32 + 28);
    if (v31 == -1)
    {
LABEL_117:
      uint64_t v23 = 3;
      goto LABEL_118;
    }
    if (setsockopt(v31, 0xFFFF, 32, &__s2, 4u))
    {
      uint64_t v23 = 3;
      goto LABEL_116;
    }
    for (; v26; v26 = v26->ifa_next)
    {
      if (*(unsigned __int8 *)(v25 + 1) == v26->ifa_addr->sa_family && (v29 & ~v26->ifa_flags) == 0)
      {
        v34 = calloc(1uLL, 0x98uLL);
        if (!v34)
        {
          uint64_t v23 = 12;
          goto LABEL_115;
        }
        v35 = v34;
        v34[16] = v34;
        if (*(_DWORD *)&v89[32 * v24 + 24])
        {
          __memcpy_chk();
          *(_WORD *)(v35[16] + 2) = v93;
        }
        else
        {
          __memcpy_chk();
        }
        *((_DWORD *)v35 + 34) = if_nametoindex(v26->ifa_name);
        v35[18] = 0;
        **((void **)v27 + 1) = v35;
        *((void *)v27 + 1) = v35 + 18;
      }
    }
    if (!*(void *)v27)
    {
      uint64_t v23 = 3;
LABEL_115:
      long long v19 = v89;
LABEL_116:
      free_interface_list((uint64_t)v27);
LABEL_118:
      MEMORY[0x23ECDA870](v97);
      goto LABEL_119;
    }
    v36 = &v92[v24];
    v36->fd = *v33;
    *(_DWORD *)&v36->events = 64;
    ++v24;
    a1 = v88;
    long long v19 = v89;
  }
  while (v24 != v16);
  uint64_t v23 = 0;
LABEL_36:
  MEMORY[0x23ECDA870](v97);
  if (!*a5)
  {
    LODWORD(v99.tv_sec) = 0;
    int v37 = open("/dev/random", 0, 0);
    int v38 = v37;
    if ((v37 & 0x80000000) == 0 && read(v37, &v99, 4uLL) == 4
      || (__s2.int tv_sec = 0,
          *(void *)&__s2.__darwin_suseconds_t tv_usec = 0,
          gettimeofday(&__s2, 0),
          int tv_sec = getpid() ^ LODWORD(__s2.tv_sec) ^ __s2.tv_usec,
          LODWORD(v99.tv_sec) = tv_sec,
          (v38 & 0x80000000) == 0))
    {
      close(v38);
      int tv_sec = v99.tv_sec;
    }
    *a5 = tv_sec;
  }
  unsigned int v84 = a10;
  if (a10 > a11) {
    goto LABEL_119;
  }
  while (2)
  {
    if (!v16) {
      goto LABEL_63;
    }
    uint64_t v40 = 0;
    while (2)
    {
      v41 = &v19[32 * v40];
      v42 = (int *)(v41 + 28);
      uint64_t v43 = *(void *)v41;
      if (!*(void *)v41) {
        goto LABEL_7;
      }
      char v94 = 0;
      v44 = v41 + 24;
      v45 = (const sockaddr **)(v41 + 16);
      int v46 = -1;
      uint64_t v23 = 3;
      while (2)
      {
        while (!*v44)
        {
          v47 = (unsigned __int8 *)(v43 + 136);
          if (*(_DWORD *)(v43 + 136) == v46) {
            goto LABEL_57;
          }
          int sa_family = (*v45)->sa_family;
          if (sa_family == 30)
          {
            int v49 = *v42;
            int v51 = 41;
            socklen_t v50 = 4;
          }
          else
          {
            if (sa_family != 2) {
              goto LABEL_56;
            }
            int v49 = *v42;
            v47 = *(unsigned __int8 **)(v43 + 128);
            socklen_t v50 = *v47;
            int v51 = 0;
          }
          if (setsockopt(v49, v51, 9, v47, v50)) {
            goto LABEL_57;
          }
LABEL_56:
          if (sendto(*v42, a5, a6, 0, *v45, (*v45)->sa_len) != a6) {
            goto LABEL_57;
          }
          uint64_t v23 = 0;
          int v46 = *(_DWORD *)(v43 + 136);
          uint64_t v43 = *(void *)(v43 + 144);
          char v94 = 1;
          if (!v43) {
            goto LABEL_62;
          }
        }
        if (sendto(*v42, a5, a6, 0, *(const sockaddr **)(v43 + 128), **(unsigned __int8 **)(v43 + 128)) == a6) {
          goto LABEL_62;
        }
LABEL_57:
        uint64_t v43 = *(void *)(v43 + 144);
        if (v43) {
          continue;
        }
        break;
      }
      if ((v94 & 1) == 0) {
        goto LABEL_119;
      }
LABEL_62:
      if (++v40 != v16) {
        continue;
      }
      break;
    }
LABEL_63:
    unsigned int v52 = v84;
    if (!v84)
    {
      int v95 = 0;
LABEL_110:
      int v78 = v95;
      goto LABEL_111;
    }
    int v95 = 0;
    int v83 = *a5;
    *(void *)v98 = 0;
    timeval __s2 = (timeval)0;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    unint64_t v53 = (int)(1000 * v84);
    v54 = v92;
    size_t v55 = v87;
    while (1)
    {
      v99.int tv_sec = 0;
      *(void *)&v99.__darwin_suseconds_t tv_usec = 0;
      gettimeofday(&v99, 0);
      __darwin_time_t v56 = v99.tv_sec;
      __darwin_suseconds_t tv_usec = v99.tv_usec;
      int v58 = poll(v54, v16, v53);
      if (!v58) {
        goto LABEL_110;
      }
      if (v58 <= 0)
      {
        while (v58 == -1)
        {
          if (*__error() != 4 && *__error() != 35)
          {
            uint64_t v23 = 4;
            goto LABEL_119;
          }
          gettimeofday(&v99, 0);
          __darwin_time_t v56 = v99.tv_sec;
          __darwin_suseconds_t tv_usec = v99.tv_usec;
          int v58 = poll(v54, v16, v53);
          if (!v58) {
            goto LABEL_110;
          }
          if (v58 >= 1) {
            goto LABEL_67;
          }
        }
      }
      else
      {
LABEL_67:
        gettimeofday(&v99, 0);
        unint64_t v59 = 1000 * (v99.tv_sec - v56) + v99.tv_usec / 1000 + tv_usec / -1000;
        BOOL v60 = v53 >= v59;
        unint64_t v61 = v53 - v59;
        unint64_t v53 = v60 ? v61 : 0;
      }
      unint64_t v82 = v53;
      v62 = a7;
      if ((int)v16 >= 1) {
        break;
      }
LABEL_106:
      unint64_t v53 = v82;
      if (!v82) {
        goto LABEL_110;
      }
    }
    uint64_t v63 = 0;
    v90 = v19;
    while (2)
    {
      v64 = &v54[v63];
      if ((v64->revents & 0x40) == 0) {
        goto LABEL_97;
      }
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      timeval __s2 = (timeval)0;
      long long v101 = 0u;
      LOBYTE(__s2.tv_sec) = 0x80;
      *(void *)v98 = 128;
      unint64_t v65 = recvfrom(v64->fd, v62, v55, 0, (sockaddr *)&__s2, v98);
      if ((v65 & 0x8000000000000000) == 0)
      {
LABEL_78:
        if (v65 >= 4 && *v62 == v83)
        {
          size_t tv_sec_low = LOBYTE(__s2.tv_sec);
          if (LOBYTE(__s2.tv_sec) >= 4u)
          {
            unsigned int v68 = 0;
            int v69 = LOBYTE(__s2.tv_sec) >> 2;
            p_s2 = &__s2;
            do
            {
              int v71 = p_s2->tv_sec;
              p_s2 = (timeval *)((char *)p_s2 + 4);
              unsigned int v68 = v71 + (v68 << 8);
              --v69;
            }
            while (v69);
          }
          else
          {
            unsigned int v68 = 0;
          }
          if (a9 && (uint64_t v72 = *((void *)a9 + 1)) != 0 && (v73 = *a9) != 0)
          {
            int v74 = 0;
            int v75 = v68 % v73;
            int v76 = *a9;
            while (1)
            {
              v77 = (unsigned __int8 *)(v72 + 28 * ((v74 + v75) % v73));
              if (!v77[1])
              {
                memcpy(v77, &__s2, tv_sec_low);
                goto LABEL_94;
              }
              if (*v77 == tv_sec_low && !memcmp(v77, &__s2, tv_sec_low)) {
                break;
              }
              ++v74;
              if (!--v76) {
                goto LABEL_94;
              }
            }
            long long v19 = v90;
            v62 = a7;
            v54 = v92;
            size_t v55 = v87;
          }
          else
          {
LABEL_94:
            v62 = a7;
            v54 = v92;
            size_t v55 = v87;
            if (v85(v86, &__s2, a7, v65))
            {
              uint64_t v23 = 0;
              long long v19 = v90;
              goto LABEL_119;
            }
            int v95 = 1;
            long long v19 = v90;
          }
          unsigned int v52 = v84;
        }
LABEL_97:
        if (++v63 == v16) {
          goto LABEL_106;
        }
        continue;
      }
      break;
    }
    while (*__error() == 4 || *__error() == 35)
    {
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      timeval __s2 = (timeval)0;
      long long v101 = 0u;
      LOBYTE(__s2.tv_sec) = 0x80;
      *(void *)v98 = 128;
      ssize_t v66 = recvfrom(v64->fd, v62, v55, 0, (sockaddr *)&__s2, v98);
      if ((v66 & 0x8000000000000000) == 0)
      {
        unint64_t v65 = v66;
        goto LABEL_78;
      }
    }
    int v78 = 4;
LABEL_111:
    unsigned int v79 = v52 + a12;
    uint64_t v23 = 5;
    if (v79 <= a11)
    {
      unsigned int v84 = v79;
      if (v78) {
        continue;
      }
    }
    break;
  }
LABEL_119:
  if (v16)
  {
    uint64_t v80 = (uint64_t)v19;
    do
    {
      free_interface_list(v80);
      v80 += 32;
      --v16;
    }
    while (v16);
  }
  free(v19);
  free(v92);
  return v23;
}

uint64_t free_interface_list(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    do
    {
      int v3 = (void *)v2[18];
      free(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t result = *(unsigned int *)(a1 + 28);
  if (result != -1)
  {
    uint64_t result = close(result);
    *(_DWORD *)(a1 + 28) = -1;
  }
  return result;
}

void *_newrpclib___rpc_createerr()
{
  if (pthread_once(&rpc_createerr_once, tsd_init_rpc_createerr))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib___rpc_createerr_cold_2();
    }
    return 0;
  }
  else
  {
    uid_t v0 = pthread_getspecific(rpc_createerr_key);
    if (!v0)
    {
      uid_t v0 = calloc(1uLL, 0x10uLL);
      if (pthread_setspecific(rpc_createerr_key, v0))
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          _newrpclib___rpc_createerr_cold_1();
        }
      }
    }
  }
  return v0;
}

void tsd_init_rpc_createerr()
{
  if (pthread_key_create((pthread_key_t *)&rpc_createerr_key, (void (__cdecl *)(void *))rpc_createerr_destroy))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      tsd_init_rpc_createerr_cold_1();
    }
  }
}

char *_newrpclib_clnt_sperror(uint64_t a1, unsigned char *a2)
{
  long long v4 = (char *)_buf();
  if (v4) {
    clnt_sperror_r(a1, a2, v4);
  }
  return v4;
}

void *_buf()
{
  if (pthread_once(&clnt_perror_once, tsd_init_buf))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _buf_cold_2();
    }
    return 0;
  }
  else
  {
    uid_t v0 = pthread_getspecific(buf);
    if (!v0)
    {
      uid_t v0 = malloc(0x100uLL);
      if (pthread_setspecific(buf, v0))
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          _buf_cold_1();
        }
      }
    }
  }
  return v0;
}

char *clnt_sperror_r(uint64_t a1, unsigned char *a2, char *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)__strerrbuf = 0u;
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  *a3 = 0;
  if (a2 && *a2) {
    slprintf(a3, v5, "%s: ", v6, v7, v8, v9, v10, (char)a2);
  }
  uint64_t v11 = 0;
  long long v12 = "RPC: (unknown error code)";
  while (rpc_errlist[v11])
  {
    v11 += 4;
    if (v11 == 72) {
      goto LABEL_9;
    }
  }
  long long v12 = *(const char **)&rpc_errlist[v11 + 2];
LABEL_9:
  strlcat(a3, v12, 0x100uLL);
  slprintf(a3, v13, "\n", v14, v15, v16, v17, v18, v20);
  return a3;
}

uint64_t _newrpclib_clnt_perror(uint64_t a1, unsigned char *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  memset(v4, 0, sizeof(v4));
  uint64_t v2 = (FILE *)*MEMORY[0x263EF8348];
  clnt_sperror_r(a1, a2, (char *)v4);
  return fputs((const char *)v4, v2);
}

const char *_newrpclib_clnt_sperrno(int a1)
{
  uint64_t v2 = 0;
  uint64_t result = "RPC: (unknown error code)";
  while (rpc_errlist[v2] != a1)
  {
    v2 += 4;
    if (v2 == 72) {
      return result;
    }
  }
  return *(const char **)&rpc_errlist[v2 + 2];
}

uint64_t _newrpclib_clnt_perrno(int a1)
{
  uint64_t v2 = 0;
  int v3 = "RPC: (unknown error code)";
  while (rpc_errlist[v2] != a1)
  {
    v2 += 4;
    if (v2 == 72) {
      return fputs(v3, (FILE *)*MEMORY[0x263EF8348]);
    }
  }
  int v3 = *(const char **)&rpc_errlist[v2 + 2];
  return fputs(v3, (FILE *)*MEMORY[0x263EF8348]);
}

char *_newrpclib_clnt_spcreateerror(char a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = _newrpclib___rpc_createerr();
  int v3 = (const char *)_buf();
  uint64_t v10 = 0;
  if (v3 && v2)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v10 = (char *)v3;
    long long v26 = 0u;
    long long v27 = 0u;
    *(_OWORD *)__strerrbuf = 0u;
    *int v3 = 0;
    slprintf(v3, v4, "%s: ", v5, v6, v7, v8, v9, a1);
    uint64_t v11 = 0;
    long long v12 = "RPC: (unknown error code)";
    while (rpc_errlist[v11] != *v2)
    {
      v11 += 4;
      if (v11 == 72) {
        goto LABEL_8;
      }
    }
    long long v12 = *(const char **)&rpc_errlist[v11 + 2];
LABEL_8:
    strlcat(v10, v12, 0x100uLL);
    if (*v2 == 12)
    {
      int v21 = v2[2];
      if (v21 < 1 || v21 >= *MEMORY[0x263EF8AA0])
      {
        LODWORD(v24) = v2[2];
        long long v22 = " - Error %d\n";
        goto LABEL_22;
      }
      strerror_r(v21, __strerrbuf, 0x50uLL);
      long long v24 = __strerrbuf;
LABEL_20:
      long long v22 = " - %s\n";
LABEL_22:
      slprintf(v10, v13, v22, v14, v15, v16, v17, v18, (char)v24);
      return v10;
    }
    if (*v2 == 14)
    {
      uint64_t v19 = 0;
      char v20 = "RPC: (unknown error code)";
      while (rpc_errlist[v19] != v2[1])
      {
        v19 += 4;
        if (v19 == 72) {
          goto LABEL_19;
        }
      }
      char v20 = *(const char **)&rpc_errlist[v19 + 2];
LABEL_19:
      LOBYTE(v24) = (_BYTE)v20;
      goto LABEL_20;
    }
    strlcat(v10, "\n", 0x100uLL);
  }
  return v10;
}

size_t slprintf(const char *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  size_t result = strlen(a1);
  if (result <= 0xFF) {
    return vsnprintf((char *)&a1[result], 256 - result, a3, &a9);
  }
  return result;
}

uint64_t _newrpclib_clnt_pcreateerror(char a1)
{
  size_t v1 = (FILE *)*MEMORY[0x263EF8348];
  uint64_t v2 = _newrpclib_clnt_spcreateerror(a1);
  return fputs(v2, v1);
}

void rpc_createerr_destroy(void *a1)
{
  if (a1) {
    free(a1);
  }
}

void tsd_init_buf()
{
  if (pthread_key_create((pthread_key_t *)&buf, (void (__cdecl *)(void *))bufdestroy))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      tsd_init_buf_cold_1();
    }
  }
}

void bufdestroy(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t _newrpclib_clntraw_create(int a1, int a2)
{
  uint64_t v4 = clntraw_private;
  if (!clntraw_private)
  {
    uint64_t v5 = calloc(1uLL, 0x2308uLL);
    uint64_t v4 = (uint64_t)v5;
    if (!v5) {
      return v4;
    }
    clntraw_private = (uint64_t)v5;
  }
  int v8 = 0;
  long long v11 = 0u;
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v9 = 0x200000000;
  int v10 = a1;
  LODWORD(v11) = a2;
  _newrpclib_xdrmem_create(v4 + 88, v4 + 8936, 24, 0);
  if (!_newrpclib_xdr_callhdr((uint64_t (***)(void))(v4 + 88), (uint64_t)&v8)
    && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    _newrpclib_clntraw_create_cold_1();
  }
  *(_DWORD *)(v4 + 8960) = (*(uint64_t (**)(uint64_t))(*(void *)(v4 + 96) + 32))(v4 + 88);
  uint64_t v6 = *(void (**)(uint64_t))(*(void *)(v4 + 96) + 56);
  if (v6) {
    v6(v4 + 88);
  }
  _newrpclib_xdrmem_create(v4 + 88, v4 + 136, 8800, 2);
  *(void *)(v4 + 8) = client_ops;
  *(void *)uint64_t v4 = _newrpclib_authnone_create();
  return v4;
}

uint64_t clntraw_call(uint64_t a1, int a2, unsigned int (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v23 = a2;
  uint64_t v6 = clntraw_private;
  if (!clntraw_private) {
    return 16;
  }
  long long v11 = (_DWORD *)(clntraw_private + 88);
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v16 = 0;
  int v17 = 0;
  while (1)
  {
    *(_DWORD *)(v6 + 88) = 0;
    (*(void (**)(uint64_t, void))(*(void *)(v6 + 96) + 40))(v6 + 88, 0);
    ++*(_DWORD *)(v6 + 8936);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(*(void *)(v6 + 96) + 24))(v6 + 88, v6 + 8936, *(unsigned int *)(v6 + 8960))|| !(*(unsigned int (**)(uint64_t, int *))(*(void *)(v6 + 96) + 8))(v6 + 88, &v23)|| !(*(unsigned int (**)(void))(*(void *)(*(void *)a1 + 56) + 8))()|| !a3(v6 + 88, a4))
    {
      return 1;
    }
    (*(void (**)(uint64_t))(*(void *)(v6 + 96) + 32))(v6 + 88);
    *(_DWORD *)(v6 + 88) = 1;
    (*(void (**)(uint64_t, void))(*(void *)(v6 + 96) + 40))(v6 + 88, 0);
    long long v19 = _newrpclib__null_auth;
    *(void *)&long long v20 = qword_268B95F98;
    *(void *)&long long v21 = a6;
    *((void *)&v21 + 1) = a5;
    if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))(v6 + 88), (uint64_t)&v18)) {
      return 2;
    }
    _newrpclib__seterr_reply(&v18, (int *)&v16);
    uint64_t v12 = v16;
    uint64_t v13 = *(void *)(*(void *)a1 + 56);
    if (!v16) {
      break;
    }
    if (!(*(unsigned int (**)(void))(v13 + 24))()) {
      return v12;
    }
  }
  uint64_t v12 = 7;
  if ((*(unsigned int (**)(void))(v13 + 16))())
  {
    if ((*(unsigned int (**)(void))(*(void *)(*(void *)a1 + 56) + 16))()) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 7;
    }
    if (*((void *)&v19 + 1))
    {
      _DWORD *v11 = 2;
      _newrpclib_xdr_opaque_auth((uint64_t (***)(void))(v6 + 88), (uint64_t)&v19);
    }
  }
  return v12;
}

uint64_t clntraw_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3 = clntraw_private;
  if (!clntraw_private) {
    return 16;
  }
  *(_DWORD *)(clntraw_private + 88) = 2;
  return a2(v3 + 88, a3);
}

uint64_t clntraw_control()
{
  return 0;
}

void *clntstrm_create_timeout(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6, uint64_t a7, long long *a8)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  v54.int tv_sec = 0;
  *(void *)&v54.__darwin_suseconds_t tv_usec = 0;
  v53.int tv_sec = 0;
  *(void *)&v53.__darwin_suseconds_t tv_usec = 0;
  long long v52 = 0uLL;
  uint64_t v51 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  pollfd v46 = 0;
  int v16 = *a4;
  int v17 = calloc(1uLL, 0x58uLL);
  if (!v17)
  {
    *(_DWORD *)_newrpclib___rpc_createerr() = 12;
    int v21 = *__error();
    *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v21;
    return v17;
  }
  unsigned int v44 = a5;
  unsigned int v45 = a3;
  long long v18 = (int *)calloc(1uLL, 0xF8uLL);
  if (!v18)
  {
    *(_DWORD *)_newrpclib___rpc_createerr() = 12;
    int v22 = *__error();
    *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v22;
LABEL_11:
    int v23 = (int *)v17;
LABEL_27:
    free(v23);
    return 0;
  }
  long long v19 = v18;
  unsigned int v43 = a6;
  int v20 = *a4;
  socklen_t v56 = 4;
  int v57 = 1;
  if ((v20 & 0x80000000) == 0)
  {
    socklen_t v55 = 128;
    if (!getsockopt(v20, 0xFFFF, 4104, &v57, &v56))
    {
      if (v57 != 1)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          clntstrm_create_timeout_cold_7();
        }
        goto LABEL_24;
      }
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      sockaddr v58 = (sockaddr)0;
      long long v59 = 0u;
      if (getsockname(v20, &v58, &v55))
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          clntstrm_create_timeout_cold_6();
        }
        goto LABEL_26;
      }
      if (a1)
      {
        unsigned int sa_family = v58.sa_family;
        if (a1->sa_family && a1->sa_family != v58.sa_family)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            clntstrm_create_timeout_cold_5();
          }
LABEL_24:
          long long v28 = __error();
          int v29 = 22;
LABEL_25:
          *long long v28 = v29;
          goto LABEL_26;
        }
      }
      else
      {
        unsigned int sa_family = v58.sa_family;
      }
      if (sa_family <= 0x1E && ((1 << sa_family) & 0x40000006) != 0)
      {
        setsockopt(v20, 0xFFFF, 4130, &v57, 4u);
        goto LABEL_43;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        clntstrm_create_timeout_cold_4();
      }
LABEL_33:
      long long v28 = __error();
      int v29 = 45;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      clntstrm_create_timeout_cold_1();
    }
    goto LABEL_24;
  }
  int v24 = a1->sa_family;
  int v25 = 6;
  if (v24 != 30 && v24 != 2)
  {
    if (v24 != 1)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        clntstrm_create_timeout_cold_2();
      }
      goto LABEL_33;
    }
    int v25 = 0;
  }
  int v26 = socket(a1->sa_family, 1, v25);
  if (v26 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      clntstrm_create_timeout_cold_3();
    }
    goto LABEL_26;
  }
  int v20 = v26;
  unsigned int sa_family = a1->sa_family;
  setsockopt(v26, 0xFFFF, 4130, &v57, 4u);
  if (v20 < 0)
  {
LABEL_26:
    *(_DWORD *)_newrpclib___rpc_createerr() = 12;
    int v30 = *__error();
    *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v30;
    free(v17);
    int v23 = v19;
    goto LABEL_27;
  }
LABEL_43:
  if (sa_family == 1)
  {
    if (!a1->sa_data[0])
    {
      *(void *)&v58.sa_len = 0;
      if (_newrpclib_socparms2netid(a1->sa_family, 1, 0, (const char **)&v58)) {
        goto LABEL_90;
      }
      if (a2 == 100000)
      {
        snprintf(a1->sa_data, 0x68uLL, "%s.%s", "/var/run/rpcb", *(const char **)&v58.sa_len);
      }
      else if (!_newrpclib_rpcb_getaddr_timeout(a1, *(void *)&v58.sa_len, a2, v45, a7, a8))
      {
        goto LABEL_90;
      }
    }
  }
  else if (sa_family == 30 || sa_family == 2)
  {
    if (!*(_WORD *)a1->sa_data)
    {
      *(void *)&v58.sa_len = 0;
      if (a2 == 100000)
      {
        *(_WORD *)a1->sa_data = 28416;
      }
      else if (_newrpclib_socparms2netid(a1->sa_family, 1, 6, (const char **)&v58) {
             || !_newrpclib_rpcb_getaddr_timeout(a1, *(void *)&v58.sa_len, a2, v45, a7, a8))
      }
      {
        goto LABEL_90;
      }
    }
    bindresvport_sa(v20, 0);
  }
  if ((v16 & 0x80000000) == 0)
  {
    int v32 = 0;
    unsigned int v33 = v45;
    goto LABEL_53;
  }
  if (a8)
  {
    long long v52 = *a8;
    fcntl(v20, 4, 4);
    if (connect(v20, a1, a1->sa_len) < 0 && *__error() != 36) {
      goto LABEL_74;
    }
    v46.fd = v20;
    *(_DWORD *)&v46.events = 4;
    int v37 = *((_DWORD *)a8 + 2) / 1000 + 1000 * *(_DWORD *)a8;
    gettimeofday(&v53, 0);
    int v38 = poll(&v46, 1u, v37);
    if (v38 == -1) {
      goto LABEL_74;
    }
    if (v38 != 1)
    {
      if (v38)
      {
        *__error() = 5;
LABEL_74:
        *(_DWORD *)_newrpclib___rpc_createerr() = 12;
        int v39 = *__error();
        *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v39;
LABEL_90:
        close(v20);
LABEL_91:
        free(v19);
        goto LABEL_11;
      }
LABEL_89:
      *(_DWORD *)_newrpclib___rpc_createerr() = 5;
      *((_DWORD *)_newrpclib___rpc_createerr() + 2) = 60;
      goto LABEL_90;
    }
    gettimeofday(&v54, 0);
    int v40 = v54.tv_usec - v53.tv_usec + 1000000;
    if (v54.tv_usec >= v53.tv_usec) {
      int v40 = v54.tv_usec - v53.tv_usec;
    }
    __darwin_time_t v41 = *(void *)a8 - (v54.tv_sec - v53.tv_sec + ((v54.tv_usec - v53.tv_usec) >> 31));
    *(void *)a8 = v41;
    int v42 = *((_DWORD *)a8 + 2) - v40;
    *((_DWORD *)a8 + 2) = v42;
    if (v42 < 0)
    {
      *(void *)a8 = --v41;
      *((_DWORD *)a8 + 2) = v42 + 1000000;
    }
    unsigned int v33 = v45;
    if (v41 < 0) {
      goto LABEL_89;
    }
  }
  else
  {
    unsigned int v33 = v45;
    if (connect(v20, a1, a1->sa_len) < 0) {
      goto LABEL_74;
    }
    fcntl(v20, 4, 4);
  }
  int v32 = 1;
LABEL_53:
  *long long v19 = v20;
  v19[1] = v32;
  *((void *)v19 + 1) = 60;
  v19[4] = 0;
  v19[6] = 0;
  if (a8)
  {
    *(_OWORD *)(v19 + 2) = v52;
    v19[6] = 1;
  }
  __memcpy_chk();
  int v34 = open("/dev/random", 0, 0);
  int v35 = v34;
  if ((v34 & 0x80000000) == 0 && read(v34, &v47, 4uLL) == 4
    || (gettimeofday(&v54, 0), LODWORD(v47) = getpid() ^ LODWORD(v54.tv_sec) ^ v54.tv_usec, (v35 & 0x80000000) == 0))
  {
    close(v35);
  }
  *(void *)((char *)&v47 + 4) = 0x200000000;
  HIDWORD(v47) = a2;
  LODWORD(v48) = v33;
  _newrpclib_xdrmem_create((uint64_t)(v19 + 50), (uint64_t)(v19 + 43), 24, 0);
  if (!_newrpclib_xdr_callhdr((uint64_t (***)(void))v19 + 25, (uint64_t)&v47))
  {
    if (!v19[1]) {
      goto LABEL_91;
    }
    goto LABEL_90;
  }
  v19[49] = (*(uint64_t (**)(int *))(*((void *)v19 + 26) + 32))(v19 + 50);
  v36 = *(void (**)(int *))(*((void *)v19 + 26) + 56);
  if (v36) {
    v36(v19 + 50);
  }
  _newrpclib_xdrrec_create((uint64_t)(v19 + 50), v44, v43, (uint64_t)v19, (uint64_t)readstrm, (uint64_t)writestrm);
  v17[1] = strm_ops;
  v17[2] = v19;
  *int v17 = _newrpclib_authnone_create();
  pthread_mutex_init((pthread_mutex_t *)(v17 + 3), 0);
  *a4 = v20;
  return v17;
}

ssize_t readstrm(int *a1, void *a2, size_t a3)
{
  if (!a3) {
    return 0;
  }
  pollfd v10 = (pollfd)0x4000000000;
  v10.fd = *a1;
  int v6 = a1[4] / 1000 + 1000 * a1[2];
  while (1)
  {
    int v7 = poll(&v10, 1u, v6);
    if (v7 != -1) {
      break;
    }
    if (*__error() != 4)
    {
      a1[40] = 4;
      a1[41] = *__error();
      return -1;
    }
  }
  if (v7)
  {
    ssize_t result = read(*a1, a2, a3);
    if (result == -1)
    {
      int v9 = *__error();
      a1[40] = 4;
      a1[41] = v9;
    }
    else
    {
      if (result) {
        return result;
      }
      *((void *)a1 + 20) = 0x3600000004;
    }
  }
  else
  {
    a1[40] = 5;
  }
  return -1;
}

uint64_t writestrm(int *a1, char *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  pollfd v12 = (pollfd)0x400000000;
  v12.fd = *a1;
  if (a3 >= 1)
  {
    ssize_t v6 = 0;
    int64_t v7 = a3;
    while (1)
    {
      int v8 = poll(&v12, 1u, -1);
      if (v8)
      {
        if (v8 == -1) {
          break;
        }
        ssize_t v6 = write(*a1, a2, v7);
        if (v6 == -1) {
          break;
        }
      }
      a2 += v6;
      BOOL v9 = v7 <= v6;
      v7 -= v6;
      if (v9) {
        return v3;
      }
    }
    int v10 = *__error();
    a1[40] = 3;
    a1[41] = v10;
    return -1;
  }
  return v3;
}

void *clntticotsord_create(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6)
{
  if (check_raddr((uint64_t)a1, 1))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      clntticotsord_create_cold_1();
    }
    return 0;
  }
  else
  {
    return clntstrm_create_timeout(a1, a2, a3, a4, a5, a6, 0, 0);
  }
}

uint64_t check_raddr(uint64_t a1, int a2)
{
  if (a1 && *(unsigned __int8 *)(a1 + 1) == a2) {
    return 0;
  }
  *(_DWORD *)_newrpclib___rpc_createerr() = 12;
  *((_DWORD *)_newrpclib___rpc_createerr() + 2) = 22;
  return 0xFFFFFFFFLL;
}

void *clntticots_create(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6)
{
  if (check_raddr((uint64_t)a1, 1))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      clntticots_create_cold_1();
    }
    return 0;
  }
  else
  {
    return clntticotsord_create(a1, a2, a3, a4, a5, a6);
  }
}

void *_newrpclib_clnttcp_create_sa(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6)
{
  if (check_raddr((uint64_t)a1, 2) && check_raddr((uint64_t)a1, 30))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_clnttcp_create_sa_cold_1();
    }
    return 0;
  }
  else
  {
    return clntstrm_create_timeout(a1, a2, a3, a4, a5, a6, 0, 0);
  }
}

void *_newrpclib_clnttcp_create_timeout(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6, uint64_t a7, long long *a8)
{
  if (check_raddr((uint64_t)a1, 2) && check_raddr((uint64_t)a1, 30))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_clnttcp_create_timeout_cold_1();
    }
    return 0;
  }
  else
  {
    return clntstrm_create_timeout(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

void *_newrpclib_clnttcp_create(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6)
{
  if (check_raddr((uint64_t)a1, 2))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_clnttcp_create_cold_1();
    }
    return 0;
  }
  else
  {
    return clntstrm_create_timeout(a1, a2, a3, a4, a5, a6, 0, 0);
  }
}

void *clntticotsord_create_timeout(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6, uint64_t a7, long long *a8)
{
  if (check_raddr((uint64_t)a1, 1))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      clntticotsord_create_timeout_cold_1();
    }
    return 0;
  }
  else
  {
    return clntstrm_create_timeout(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t clntstrm_call(void *a1, int a2, unsigned int (*a3)(uint64_t, uint64_t), uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v28 = a2;
  uint64_t v9 = a1[2];
  uint64_t v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  if (!*(_DWORD *)(v9 + 24))
  {
    *(void *)(v9 + 8) = a7;
    *(void *)(v9 + 16) = a8;
  }
  int v10 = (_DWORD *)(v9 + 200);
  uint64_t v11 = a7 | a8;
  BOOL v12 = (v11 | a5) != 0;
  uint64_t v13 = (unsigned int *)(v9 + 160);
  BOOL v20 = v11 == 0;
  int v14 = 2;
  while (1)
  {
    *(_DWORD *)(v9 + 200) = 0;
    *(_DWORD *)(v9 + 160) = 0;
    unsigned int v15 = *(_DWORD *)(v9 + 172) - 1;
    *(_DWORD *)(v9 + 172) = v15;
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(*(void *)(v9 + 208) + 24))(v9 + 200, v9 + 172, *(unsigned int *)(v9 + 196))|| !(*(unsigned int (**)(uint64_t, int *))(*(void *)(v9 + 208) + 8))(v9 + 200, &v28)|| !(*(unsigned int (**)(void))(*(void *)(*a1 + 56) + 8))()|| !a3(v9 + 200, a4))
    {
      if (!*v13) {
        unsigned int *v13 = 1;
      }
      _newrpclib_xdrrec_endofrecord(v9 + 200, 1);
      return *v13;
    }
    if (!_newrpclib_xdrrec_endofrecord(v9 + 200, v12))
    {
      uint64_t result = 3;
      goto LABEL_31;
    }
    if (!v12) {
      return 0;
    }
    if (v20) {
      break;
    }
    _DWORD *v10 = 1;
    long long v24 = _newrpclib__null_auth;
    *(void *)&long long v25 = qword_268B95F98;
    *(void *)&long long v26 = 0;
    *((void *)&v26 + 1) = _newrpclib_xdr_void;
    if (!_newrpclib_xdrrec_skiprecord(v9 + 200)) {
      return *v13;
    }
    unsigned int v16 = bswap32(v15);
    while (1)
    {
      if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))(v9 + 200), (uint64_t)&v23))
      {
        uint64_t result = *v13;
        if (result) {
          return result;
        }
        goto LABEL_17;
      }
      if (v23 == v16) {
        break;
      }
LABEL_17:
      long long v24 = _newrpclib__null_auth;
      *(void *)&long long v25 = qword_268B95F98;
      *(void *)&long long v26 = 0;
      *((void *)&v26 + 1) = _newrpclib_xdr_void;
      if (!_newrpclib_xdrrec_skiprecord(v9 + 200)) {
        return *v13;
      }
    }
    _newrpclib__seterr_reply(&v23, (int *)(v9 + 160));
    if (!*v13)
    {
      if ((*(unsigned int (**)(void))(*(void *)(*a1 + 56) + 16))())
      {
        if ((!a5 || !((unsigned int (*)(uint64_t, uint64_t))a5)(v9 + 200, a6)) && !*v13) {
          unsigned int *v13 = 2;
        }
      }
      else
      {
        *(void *)uint64_t v13 = 0x600000007;
      }
      if (*((void *)&v24 + 1))
      {
        _DWORD *v10 = 2;
        _newrpclib_xdr_opaque_auth((uint64_t (***)(void))(v9 + 200), (uint64_t)&v24);
      }
      return *v13;
    }
    if (v14)
    {
      --v14;
      if ((*(unsigned int (**)(void))(*(void *)(*a1 + 56) + 24))()) {
        continue;
      }
    }
    return *v13;
  }
  uint64_t result = 5;
LABEL_31:
  unsigned int *v13 = result;
  return result;
}

uint64_t clntstrm_geterr(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void *)(v2 + 160);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(v2 + 168);
  *(void *)a2 = v3;
  return result;
}

uint64_t clntstrm_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  *(_DWORD *)(v3 + 200) = 2;
  return a2(v3 + 200, a3);
}

void clntstrm_destroy(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (*(_DWORD *)(v2 + 4)) {
    close(*(_DWORD *)v2);
  }
  uint64_t v3 = *(void (**)(uint64_t))(*(void *)(v2 + 208) + 56);
  if (v3) {
    v3(v2 + 200);
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  free((void *)v2);
  free((void *)a1);
}

uint64_t clntstrm_control(uint64_t a1, int a2, _OWORD *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (a2 == 3)
  {
    long long v5 = *(_OWORD *)(v3 + 32);
    long long v6 = *(_OWORD *)(v3 + 48);
    long long v7 = *(_OWORD *)(v3 + 80);
    a3[2] = *(_OWORD *)(v3 + 64);
    a3[3] = v7;
    *a3 = v5;
    a3[1] = v6;
    long long v8 = *(_OWORD *)(v3 + 96);
    long long v9 = *(_OWORD *)(v3 + 112);
    long long v10 = *(_OWORD *)(v3 + 144);
    a3[6] = *(_OWORD *)(v3 + 128);
    a3[7] = v10;
    a3[4] = v8;
    a3[5] = v9;
    return 1;
  }
  if (a2 == 2)
  {
    *a3 = *(_OWORD *)(v3 + 8);
    return 1;
  }
  if (a2 != 1) {
    return 0;
  }
  *(_OWORD *)(v3 + 8) = *a3;
  uint64_t result = 1;
  *(_DWORD *)(v3 + 24) = 1;
  return result;
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

void *_newrpclib_clntudp_bufcreate_timeout(unsigned __int8 *a1, unsigned int a2, unsigned int a3, int *a4, int a5, int a6, _OWORD *a7, long long *a8)
{
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  *(void *)int v31 = 0;
  unsigned int v16 = calloc(1uLL, 0x58uLL);
  if (!v16)
  {
    *(_DWORD *)_newrpclib___rpc_createerr() = 12;
    int v24 = *__error();
    *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v24;
    return v16;
  }
  uint64_t v17 = (a5 + 3) & 0xFFFFFFFC;
  uint64_t v18 = (a6 + 3) & 0xFFFFFFFC;
  unsigned int v38 = (a6 + 3) & 0xFFFFFFFC;
  long long v19 = (char *)calloc(1uLL, v17 + v18 + 264);
  if (!v19)
  {
    *(_DWORD *)_newrpclib___rpc_createerr() = 12;
    int v25 = *__error();
    *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v25;
LABEL_28:
    free(v16);
    return 0;
  }
  BOOL v20 = v19;
  *((void *)v19 + 31) = &v19[v18 + 260];
  if (!*((_WORD *)a1 + 1))
  {
    v37.int tv_sec = 0;
    if (a2 == 100000)
    {
      *((_WORD *)a1 + 1) = 28416;
    }
    else if (_newrpclib_socparms2netid(a1[1], 2, 17, (const char **)&v37) {
           || !_newrpclib_rpcb_getaddr_timeout(a1, (char *)v37.tv_sec, a2, a3, (uint64_t)a7, a8))
    }
    {
LABEL_27:
      free(v20);
      goto LABEL_28;
    }
  }
  v16[1] = udp_ops;
  v16[2] = v20;
  memcpy(v20 + 8, a1, *a1);
  int v21 = v20[8];
  *((void *)v20 + 18) = 1;
  *((_DWORD *)v20 + 34) = v21;
  *((_DWORD *)v20 + 61) = v17;
  *((_DWORD *)v20 + 64) = v18;
  *((_DWORD *)v20 + 38) = 0;
  if (a7) {
    *((_OWORD *)v20 + 9) = *a7;
  }
  *((void *)v20 + 20) = -1;
  *((_DWORD *)v20 + 42) = -1;
  if (a8) {
    *((_OWORD *)v20 + 10) = *a8;
  }
  int v22 = open("/dev/random", 0, 0);
  int v23 = v22;
  if ((v22 & 0x80000000) == 0 && read(v22, &v32, 4uLL) == 4
    || (v37.int tv_sec = 0,
        *(void *)&v37.__darwin_suseconds_t tv_usec = 0,
        gettimeofday(&v37, 0),
        LODWORD(v32) = getpid() ^ LODWORD(v37.tv_sec) ^ v37.tv_usec,
        (v23 & 0x80000000) == 0))
  {
    close(v23);
  }
  *(void *)((char *)&v32 + 4) = 0x200000000;
  HIDWORD(v32) = a2;
  LODWORD(v33) = a3;
  _newrpclib_xdrmem_create((uint64_t)(v20 + 192), *((void *)v20 + 31), v17, 0);
  if (!_newrpclib_xdr_callhdr((uint64_t (***)(void))v20 + 24, (uint64_t)&v32)) {
    goto LABEL_27;
  }
  *((_DWORD *)v20 + 60) = (*(uint64_t (**)(char *))(*((void *)v20 + 25) + 32))(v20 + 192);
  if (*a4 < 0)
  {
    int v29 = 1;
    int v30 = 1;
    int v26 = socket(v20[9], 2, 17);
    *a4 = v26;
    if (v26 < 0)
    {
      *(_DWORD *)_newrpclib___rpc_createerr() = 12;
      int v27 = *__error();
      *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v27;
    }
    else
    {
      bindresvport_sa(v26, 0);
      ioctl(*a4, 0x8004667EuLL, &v30);
      setsockopt(*a4, 0xFFFF, 4130, &v29, 4u);
      *((_DWORD *)v20 + 1) = 1;
      v31[0] = 0;
      v31[1] = 4;
      if (!getsockopt(*a4, 0xFFFF, 4098, v31, &v31[1]))
      {
        v31[1] = 4;
        if (v18 <= v31[0] || !setsockopt(*a4, 0xFFFF, 4098, &v38, 4u)) {
          goto LABEL_17;
        }
      }
      close(*a4);
      *a4 = -1;
    }
    goto LABEL_27;
  }
  *((_DWORD *)v20 + 1) = 0;
LABEL_17:
  *(_DWORD *)BOOL v20 = *a4;
  *unsigned int v16 = _newrpclib_authnone_create();
  return v16;
}

void *_newrpclib_clntudp_bufcreate(unsigned __int8 *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, int *a6, int a7, int a8)
{
  *(void *)&long long v9 = a4;
  *((void *)&v9 + 1) = a5;
  if (!*a1 && a1[1] == 2) {
    *a1 = 16;
  }
  return _newrpclib_clntudp_bufcreate_timeout(a1, a2, a3, a6, a7, a8, &v9, 0);
}

void *_newrpclib_clntudp_create(unsigned __int8 *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, int *a6)
{
  return _newrpclib_clntudp_bufcreate(a1, a2, a3, a4, a5, a6, 8800, 8800);
}

void *_newrpclib_clntudp_bufcreate_sa(unsigned __int8 *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, int *a6, int a7, int a8)
{
  *(void *)&long long v9 = a4;
  *((void *)&v9 + 1) = a5;
  return _newrpclib_clntudp_bufcreate_timeout(a1, a2, a3, a6, a7, a8, &v9, 0);
}

void *_newrpclib_clntudp_create_sa(unsigned __int8 *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, int *a6)
{
  *(void *)&long long v7 = a4;
  *((void *)&v7 + 1) = a5;
  return _newrpclib_clntudp_bufcreate_timeout(a1, a2, a3, a6, 8800, 8800, &v7, 0);
}

uint64_t clntudp_call(uint64_t a1, int a2, unsigned int (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  uint64_t v9 = a4;
  uint64_t v10 = a1;
  uint64_t v48 = *MEMORY[0x263EF8340];
  int v39 = a2;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(v11 + 160);
  if (v12 == -1)
  {
    int v14 = a8 / 1000;
    int v13 = 1000 * a7;
  }
  else
  {
    int v13 = *(_DWORD *)(v11 + 168) / 1000;
    int v14 = 1000 * v12;
  }
  int v15 = 0;
  socklen_t v38 = 0;
  int v30 = v13 + v14;
  pollfd v37 = 0;
  sockaddr v40 = (sockaddr)0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v36 = 0;
  int v26 = (int *)(v11 + 176);
  int v27 = 2;
  memset(v31, 0, sizeof(v31));
LABEL_5:
  *(_DWORD *)(v11 + 192) = 0;
  (*(void (**)(uint64_t, void))(*(void *)(v11 + 200) + 40))(v11 + 192, *(unsigned int *)(v11 + 240));
  ++**(_WORD **)(v11 + 248);
  if (!(*(unsigned int (**)(uint64_t, int *))(*(void *)(v11 + 200) + 8))(v11 + 192, &v39)
    || !(*(unsigned int (**)(void))(*(void *)(*(void *)v10 + 56) + 8))()
    || !a3(v11 + 192, v9))
  {
    uint64_t result = 1;
LABEL_34:
    int *v26 = result;
    return result;
  }
  size_t v16 = (*(int (**)(uint64_t))(*(void *)(v11 + 200) + 32))(v11 + 192);
  while (1)
  {
    if (sendto(*(_DWORD *)v11, *(const void **)(v11 + 248), v16, 0, (const sockaddr *)(v11 + 8), *(_DWORD *)(v11 + 136)) != v16)
    {
      int v23 = *__error();
      uint64_t result = 3;
      goto LABEL_31;
    }
    if (!v30)
    {
LABEL_33:
      uint64_t result = 5;
      goto LABEL_34;
    }
    uint64_t v17 = v10;
    long long v33 = _newrpclib__null_auth;
    *(void *)&long long v34 = qword_268B95F98;
    uint64_t v18 = a6;
    *(void *)&long long v35 = a6;
    *((void *)&v35 + 1) = a5;
    v37.fd = *(_DWORD *)v11;
    *(_DWORD *)&v37.events = 64;
    int v19 = *(_DWORD *)(v11 + 152) / 1000 + 1000 * *(_DWORD *)(v11 + 144);
LABEL_12:
    while (1)
    {
      int v20 = poll(&v37, 1u, v19);
      if (v20 != -1) {
        break;
      }
      if (*__error() != 4) {
        goto LABEL_30;
      }
    }
    if (v20) {
      break;
    }
    v15 += v19;
    a6 = v18;
    uint64_t v10 = v17;
    if (v15 >= v30) {
      goto LABEL_33;
    }
  }
  do
  {
    socklen_t v38 = 128;
    unint64_t v21 = recvfrom(*(_DWORD *)v11, (void *)(v11 + 260), *(unsigned int *)(v11 + 256), 0, &v40, &v38);
    if ((v21 & 0x8000000000000000) == 0)
    {
      if (v21 < 4 || *(_DWORD *)(v11 + 260) != **(_DWORD **)(v11 + 248)) {
        goto LABEL_12;
      }
      _newrpclib_xdrmem_create((uint64_t)v31, v11 + 260, v21, 1);
      if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))v31, (uint64_t)&v32))
      {
        int *v26 = 2;
        return *v26;
      }
      _newrpclib__seterr_reply(&v32, v26);
      if (!*v26)
      {
        if (!(*(unsigned int (**)(void))(*(void *)(*(void *)v17 + 56) + 16))()) {
          *(void *)int v26 = 0x600000007;
        }
        if (*((void *)&v33 + 1))
        {
          *(_DWORD *)(v11 + 192) = 2;
          _newrpclib_xdr_opaque_auth((uint64_t (***)(void))(v11 + 192), (uint64_t)&v33);
        }
        return *v26;
      }
      uint64_t v9 = a4;
      if (!v27) {
        return *v26;
      }
      a6 = v18;
      uint64_t v10 = v17;
      --v27;
      if (!(*(unsigned int (**)(void))(*(void *)(*(void *)v17 + 56) + 24))()) {
        return *v26;
      }
      goto LABEL_5;
    }
  }
  while (*__error() == 4);
  if (*__error() == 35) {
    goto LABEL_12;
  }
LABEL_30:
  int v23 = *__error();
  uint64_t result = 4;
LABEL_31:
  *(_DWORD *)(v11 + 176) = result;
  *(_DWORD *)(v11 + 180) = v23;
  return result;
}

uint64_t clntudp_geterr(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void *)(v2 + 176);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(v2 + 184);
  *(void *)a2 = v3;
  return result;
}

uint64_t clntudp_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  *(_DWORD *)(v3 + 192) = 2;
  return a2(v3 + 192, a3);
}

void clntudp_destroy(void *a1)
{
  uint64_t v2 = a1[2];
  if (*(_DWORD *)(v2 + 4)) {
    close(*(_DWORD *)v2);
  }
  uint64_t v3 = *(void (**)(uint64_t))(*(void *)(v2 + 200) + 56);
  if (v3) {
    v3(v2 + 192);
  }
  free((void *)v2);
  free(a1);
}

uint64_t clntudp_control(uint64_t a1, int a2, _OWORD *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  switch(a2)
  {
    case 1:
      *(_OWORD *)(v3 + 160) = *a3;
      goto LABEL_11;
    case 2:
      long long v5 = *(_OWORD *)(v3 + 160);
      goto LABEL_9;
    case 3:
      long long v6 = *(_OWORD *)(v3 + 8);
      long long v7 = *(_OWORD *)(v3 + 24);
      long long v8 = *(_OWORD *)(v3 + 56);
      a3[2] = *(_OWORD *)(v3 + 40);
      a3[3] = v8;
      *a3 = v6;
      a3[1] = v7;
      long long v9 = *(_OWORD *)(v3 + 72);
      long long v10 = *(_OWORD *)(v3 + 88);
      long long v11 = *(_OWORD *)(v3 + 120);
      a3[6] = *(_OWORD *)(v3 + 104);
      a3[7] = v11;
      a3[4] = v9;
      a3[5] = v10;
      goto LABEL_11;
    case 4:
      *(_OWORD *)(v3 + 144) = *a3;
      goto LABEL_11;
    case 5:
      long long v5 = *(_OWORD *)(v3 + 144);
      goto LABEL_9;
    case 6:
      long long v5 = *(_OWORD *)(v3 + 192);
      long long v12 = *(_OWORD *)(v3 + 224);
      a3[1] = *(_OWORD *)(v3 + 208);
      a3[2] = v12;
LABEL_9:
      *a3 = v5;
      goto LABEL_11;
    case 7:
      *(_DWORD *)a3 = *(_DWORD *)(v3 + 240);
LABEL_11:
      uint64_t result = 1;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

hostent *_newrpclib_getrpcport(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8[2] = *MEMORY[0x263EF8340];
  uint64_t result = gethostbyname(a1);
  if (result)
  {
    v8[0] = 512;
    v8[1] = 0;
    __memmove_chk();
    return (hostent *)_newrpclib_pmap_getport((uint64_t)v8, a2, a3, a4);
  }
  return result;
}

uint64_t _newrpclib_pmap_getmaps(uint64_t a1)
{
  uint64_t v6 = 0;
  int v5 = -1;
  long long v4 = xmmword_23C0AD090;
  *(_WORD *)(a1 + 2) = 28416;
  uint64_t v2 = _newrpclib_clnttcp_create((const sockaddr *)a1, 100000, 2u, &v5, 0x32u, 0x1F4u);
  (*(void (**)(void *, uint64_t))(v2[1] + 40))(v2, 1);
  if (_newrpclib_pmapproc_dump_2(&v6, (uint64_t)v2)) {
    _newrpclib_clnt_perror((uint64_t)v2, "pmap_getmaps rpc problem");
  }
  (*(void (**)(void *))(v2[1] + 32))(v2);
  *(_WORD *)(a1 + 2) = 0;
  return v6;
}

void *pmap_getport_timeout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v13 = 0uLL;
  if (a5)
  {
    uint64_t v5 = *a5;
    a5 = (uint64_t *)a5[1];
  }
  else
  {
    uint64_t v5 = 5;
  }
  int v6 = *(unsigned __int8 *)(a1 + 1);
  if (v6 == 30)
  {
    *(_WORD *)(a1 + 2) = 0;
    cvt6to4(a1, (uint64_t)&v13);
    return 0;
  }
  if (v6 != 2) {
    return 0;
  }
  *(_WORD *)(a1 + 2) = 0;
  long long v13 = *(_OWORD *)a1;
  unsigned __int16 v12 = 0;
  int v11 = -1;
  WORD1(v13) = 28416;
  uint64_t result = _newrpclib_clntudp_bufcreate((unsigned __int8 *)&v13, 0x186A0u, 2u, v5, (uint64_t)a5, &v11, 400, 400);
  if (result)
  {
    long long v8 = result;
    if ((*(unsigned int (**)(void))result[1])())
    {
      *(_DWORD *)_newrpclib___rpc_createerr() = 14;
      long long v9 = *(void (**)(void *, char *))(v8[1] + 16);
      long long v10 = (char *)_newrpclib___rpc_createerr();
      v9(v8, v10 + 4);
    }
    else if (!v12)
    {
      *(_DWORD *)_newrpclib___rpc_createerr() = 15;
    }
    (*(void (**)(void *))(v8[1] + 32))(v8);
    return (void *)v12;
  }
  return result;
}

void *_newrpclib_pmap_getport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return pmap_getport_timeout(a1, a2, a3, a4, 0);
}

void *_newrpclib_pmap_getport_sa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return pmap_getport_timeout(a1, a2, a3, a4, 0);
}

uint64_t _newrpclib_pmap_rmtcall(uint64_t a1)
{
  int v6 = -1;
  *(_WORD *)(a1 + 2) = 28416;
  uint64_t v2 = _newrpclib_clntudp_create((unsigned __int8 *)a1, 0x186A0u, 2u, 3, 0, &v6);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (*(uint64_t (**)(void))v2[1])();
    (*(void (**)(void *))(v3[1] + 32))(v3);
  }
  else
  {
    uint64_t v4 = 16;
  }
  *(_WORD *)(a1 + 2) = 0;
  return v4;
}

uint64_t _newrpclib_xdr_rmtcall_args(uint64_t a1, uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
  if (result)
  {
    uint64_t result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
    if (result)
    {
      uint64_t result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
      if (result)
      {
        uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 8) + 32))(a1);
        int v6 = (_DWORD *)(a2 + 12);
        uint64_t result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
        if (result)
        {
          int v7 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 8) + 32))(a1);
          uint64_t result = (*(uint64_t (**)(uint64_t, void))(a2 + 24))(a1, *(void *)(a2 + 16));
          if (result)
          {
            uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 8) + 32))(a1);
            *int v6 = v8 - v7;
            (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 40))(a1, v5);
            uint64_t result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
            if (result)
            {
              (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 40))(a1, v8);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_rmtcallres(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t v5 = *(void **)a2;
  uint64_t result = _newrpclib_xdr_reference(a1, &v5, 4uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_u_long);
  if (result)
  {
    uint64_t result = _newrpclib_xdr_u_long(a1);
    if (result)
    {
      *(void *)a2 = v5;
      return (*(uint64_t (**)(uint64_t (***)(void), void))(a2 + 24))(a1, *(void *)(a2 + 16));
    }
  }
  return result;
}

uint64_t _newrpclib_pmap_wakeup()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v4 = 0;
  sockaddr v5 = (sockaddr)0;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  memset(v10, 0, sizeof(v10));
  v5.unsigned int sa_family = 1;
  __strlcpy_chk();
  int v0 = socket(1, 1, 0);
  if (v0 == -1) {
    return 0xFFFFFFFFLL;
  }
  int v1 = v0;
  if (connect(v0, &v5, 0x6Au) == -1)
  {
    uint64_t v2 = 0xFFFFFFFFLL;
  }
  else
  {
    read(v1, &v4, 1uLL);
    uint64_t v2 = 0;
  }
  close(v1);
  return v2;
}

uint64_t _newrpclib_rpcb_callit()
{
  int v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unsigned int v12 = v11;
  int v14 = v13;
  int v15 = v0;
  uint64_t v25 = *MEMORY[0x263EF8340];
  size_t v16 = _newrpclib_authunix_create_default();
  bzero(v24, 0x578uLL);
  bzero(v23, 0x2260uLL);
  int v21 = 0;
  v22[0] = v6;
  v22[1] = 0;
  v22[2] = v4;
  v22[3] = v2;
  uint64_t v17 = (int *)reply_addr_cache_create(0);
  if (build_callit_rpc(v15, v14, v12, 3, v10, v8, (uint64_t)v24, v16, &v21))
  {
LABEL_2:
    uint64_t v18 = 1;
    goto LABEL_3;
  }
  uint64_t v20 = _newrpclib_clnt_multicasts_buf_timeout((uint64_t)&rpcb_addrs, 2uLL, (unsigned int (*)(uint64_t, timeval *, _DWORD *, unint64_t))rpcb_mcastrecv, (uint64_t)v22, v24, v21, v23, 0x2260uLL, v17, 2u, 0xAu, 2);
  if (v20 == 5 || (uint64_t v18 = v20, !v20))
  {
    if (!build_callit_rpc(v15, v14, v12, 2, v10, v8, (uint64_t)v24, v16, &v21))
    {
      uint64_t v18 = _newrpclib_clnt_multicasts_buf_timeout((uint64_t)&pmap_addrs, 1uLL, (unsigned int (*)(uint64_t, timeval *, _DWORD *, unint64_t))pmap_mcastrecv, (uint64_t)v22, v24, v21, v23, 0x2260uLL, v17, 2u, 0xAu, 2);
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:
  (*(void (**)(long long *))(*((void *)v16 + 7) + 32))(v16);
  reply_addr_cache_destroy((void **)v17);
  return v18;
}

uint64_t build_callit_rpc(int a1, int a2, unsigned int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, long long *a8, _DWORD *a9)
{
  memset(v16, 0, sizeof(v16));
  v17[0] = 0;
  v17[1] = 0x186A000000002;
  int v18 = a4;
  int v19 = 5;
  long long v20 = *a8;
  uint64_t v21 = *((void *)a8 + 2);
  long long v22 = *(long long *)((char *)a8 + 24);
  uint64_t v23 = *((void *)a8 + 5);
  v12[0] = a1;
  v12[1] = a2;
  uint64_t v14 = a6;
  uint64_t v13 = a3;
  uint64_t v15 = a5;
  *a9 = 0;
  _newrpclib_xdrmem_create((uint64_t)v16, a7, 1400, 0);
  if (_newrpclib_xdr_callmsg((uint64_t)v16, (uint64_t)v17)
    && xdr_callit_args((uint64_t (***)(void))v16, (uint64_t)v12))
  {
    uint64_t v9 = 0;
    *a9 = (*(uint64_t (**)(_OWORD *))(*((void *)&v16[0] + 1) + 32))(v16);
    uint64_t v10 = *(void (**)(_OWORD *))(*((void *)&v16[0] + 1) + 56);
    if (!v10) {
      return v9;
    }
    goto LABEL_6;
  }
  uint64_t v10 = *(void (**)(_OWORD *))(*((void *)&v16[0] + 1) + 56);
  uint64_t v9 = 1;
  if (v10) {
LABEL_6:
  }
    v10(v16);
  return v9;
}

uint64_t rpcb_mcastrecv(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  memset(v14, 0, sizeof(v14));
  uint64_t v13 = 0;
  if (_newrpclib_socparms2netid(*(unsigned __int8 *)(a2 + 1), 2, 17, &v13)) {
    return 0;
  }
  uint64_t v20 = 0;
  v16[0] = 0u;
  v16[1] = _newrpclib__null_auth;
  long long v17 = (unint64_t)qword_268B95F98;
  int v18 = v15;
  int v19 = xdr_rmt3callres;
  v15[0] = 0;
  v15[1] = 0;
  uint64_t v9 = *(void **)a1;
  v15[2] = *(void **)(a1 + 16);
  v15[3] = v9;
  _newrpclib_xdrmem_create((uint64_t)v14, a3, a4, 1);
  if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))v14, (uint64_t)v16) || DWORD2(v16[0]) | DWORD2(v17))
  {
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  uint64_t v21 = (char *)v15[0];
  memset(v22, 0, 128);
  LOBYTE(v22[0]) = 0x80;
  if (!_newrpclib_uaddr2sa((const char *)v15[0], "udp", (unsigned __int8 *)v22))
  {
    if (BYTE1(v22[0]) == 2)
    {
      unsigned int v12 = v22[1];
      if (v22[1] >> 28 == 14) {
        goto LABEL_21;
      }
    }
    else
    {
      if (BYTE1(v22[0]) == 30)
      {
        if (LOBYTE(v22[2]) != 255) {
          goto LABEL_6;
        }
LABEL_21:
        *(_WORD *)(a2 + 2) = HIWORD(v22[0]);
        if (!_newrpclib_sa2uaddr((char *)a2, &v21))
        {
          free(v15[0]);
          v15[0] = v21;
        }
        goto LABEL_6;
      }
      unsigned int v12 = v22[1];
    }
    if (BYTE1(v22[0]) != 2 || HIBYTE(v12) != 255) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_6:
  uint64_t v8 = (*(uint64_t (**)(void, const char *, void *))(a1 + 24))(*(void *)(a1 + 16), v13, v15[0]);
LABEL_8:
  uint64_t v10 = *(void (**)(_OWORD *))(*((void *)&v14[0] + 1) + 56);
  if (v10) {
    v10(v14);
  }
  _newrpclib_xdr_free((uint64_t (*)(_OWORD *))_newrpclib_xdr_replymsg);
  return v8;
}

uint64_t pmap_mcastrecv(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  memset(v14, 0, sizeof(v14));
  unsigned int v12 = 0;
  uint64_t v13 = 0;
  if (_newrpclib_socparms2netid(*(unsigned __int8 *)(a2 + 1), 2, 17, &v12)) {
    return 0;
  }
  uint64_t v20 = 0;
  v16[0] = 0u;
  v16[1] = _newrpclib__null_auth;
  long long v17 = (unint64_t)qword_268B95F98;
  int v18 = v15;
  int v19 = xdr_pmapcallres;
  uint64_t v9 = *(void *)(a1 + 16);
  v15[0] = 0;
  v15[1] = v9;
  v15[2] = *(void *)a1;
  _newrpclib_xdrmem_create((uint64_t)v14, a3, a4, 1);
  if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))v14, (uint64_t)v16)
    || DWORD2(v16[0]) | DWORD2(v17)
    || (*(_WORD *)(a2 + 2) = bswap32(LOWORD(v15[0])) >> 16, _newrpclib_sa2uaddr((char *)a2, (char **)&v13)))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = (*(uint64_t (**)(void, const char *, void *))(a1 + 24))(*(void *)(a1 + 16), v12, v13);
    free(v13);
  }
  uint64_t v10 = *(void (**)(_OWORD *))(*((void *)&v14[0] + 1) + 56);
  if (v10) {
    v10(v14);
  }
  _newrpclib_xdr_free((uint64_t (*)(_OWORD *))_newrpclib_xdr_replymsg);
  return v8;
}

uint64_t _newrpclib_pmap_callit()
{
  int v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unsigned int v12 = v11;
  int v14 = v13;
  int v15 = v0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  size_t v16 = _newrpclib_authunix_create_default();
  bzero(v23, 0x578uLL);
  bzero(v22, 0x2260uLL);
  int v20 = 0;
  long long v17 = (int *)reply_addr_cache_create(0);
  v21[0] = v6;
  v21[1] = v4;
  v21[2] = v2;
  if (build_callit_rpc(v15, v14, v12, 2, v10, v8, (uint64_t)v23, v16, &v20)) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = _newrpclib_clnt_multicasts_buf_timeout((uint64_t)&pmap_addrs, 1uLL, (unsigned int (*)(uint64_t, timeval *, _DWORD *, unint64_t))pmap_bcastrecv, (uint64_t)v21, v23, v20, v22, 0x2260uLL, v17, 2u, 0xAu, 2);
  }
  (*(void (**)(long long *))(*((void *)v16 + 7) + 32))(v16);
  reply_addr_cache_destroy((void **)v17);
  return v18;
}

uint64_t pmap_bcastrecv(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  memset(v9, 0, sizeof(v9));
  uint64_t v16 = 0;
  v12[0] = 0u;
  v12[1] = _newrpclib__null_auth;
  long long v13 = (unint64_t)qword_268B95F98;
  int v14 = &v10;
  int v15 = xdr_pmapcallres;
  uint64_t v10 = 0;
  int8x16_t v11 = vextq_s8(*(int8x16_t *)a1, *(int8x16_t *)a1, 8uLL);
  _newrpclib_xdrmem_create((uint64_t)v9, a3, a4, 1);
  if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))v9, (uint64_t)v12) || DWORD2(v12[0]) | DWORD2(v13))
  {
    uint64_t v6 = 0;
  }
  else
  {
    *(_WORD *)(a2 + 2) = bswap32((unsigned __int16)v10) >> 16;
    uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(a1 + 16))(*(void *)(a1 + 8), a2);
  }
  uint64_t v7 = *(void (**)(_OWORD *))(*((void *)&v9[0] + 1) + 56);
  if (v7) {
    v7(v9);
  }
  _newrpclib_xdr_free((uint64_t (*)(_OWORD *))_newrpclib_xdr_replymsg);
  return v6;
}

uint64_t _newrpclib_rpcb_indirect(char *a1, char *__s2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, long long *a10, void *a11)
{
  timeout = _newrpclib_clnt_create_timeout(a1, 100000, 4u, __s2, a10);
  if (!timeout) {
    return 16;
  }
  unsigned int v12 = timeout;
  uint64_t v13 = (*(uint64_t (**)(void))timeout[1])();
  *a11 = 0;
  (*(void (**)(void *))(v12[1] + 32))(v12);
  return v13;
}

uint64_t xdr_callit_args(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_u_long(a1);
  if (result)
  {
    uint64_t result = _newrpclib_xdr_u_long(a1);
    if (result)
    {
      uint64_t result = _newrpclib_xdr_u_long(a1);
      if (result)
      {
        *(_DWORD *)(a2 + 12) = _newrpclib_xdr_sizeof(*(uint64_t (**)(void *))(a2 + 24));
        uint64_t result = _newrpclib_xdr_u_long(a1);
        if (result) {
          return (*(unsigned int (**)(uint64_t (***)(void), void))(a2 + 24))(a1, *(void *)(a2 + 16)) != 0;
        }
      }
    }
  }
  return result;
}

uint64_t xdr_rmt3callres(uint64_t (***a1)(void), uint64_t a2)
{
  if (!_newrpclib_xdr_wrapstring(a1, (char **)a2)
    || !_newrpclib_xdr_uint32_t(a1, (int *)(a2 + 8)))
  {
    return 0;
  }
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(uint64_t (**)(uint64_t (***)(void), uint64_t))(a2 + 24);
  return v5(a1, v4);
}

uint64_t _newrpclib_pmap_indirect(char *a1, char *__s2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, long long *a10, _DWORD *a11)
{
  timeout = _newrpclib_clnt_create_timeout(a1, 100000, 2u, __s2, a10);
  if (!timeout) {
    return 16;
  }
  unsigned int v12 = timeout;
  uint64_t v13 = (*(uint64_t (**)(void))timeout[1])();
  *a11 = 0;
  (*(void (**)(void *))(v12[1] + 32))(v12);
  return v13;
}

uint64_t xdr_pmapcallres(uint64_t (***a1)(void), uint64_t a2)
{
  if (!_newrpclib_xdr_uint32_t(a1, (int *)a2)
    || !_newrpclib_xdr_uint32_t(a1, (int *)(a2 + 4)))
  {
    return 0;
  }
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(uint64_t (**)(uint64_t (***)(void), uint64_t))(a2 + 16);
  return v5(a1, v4);
}

uint64_t _newrpclib_xdr_callmsg(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    unsigned int v13 = *(_DWORD *)(a2 + 40);
    if (v13 > 0x190) {
      return 0;
    }
    unsigned int v14 = *(_DWORD *)(a2 + 64);
    if (v14 > 0x190) {
      return 0;
    }
    int v15 = (_DWORD *)(*(uint64_t (**)(uint64_t, void))(*(void *)(a1 + 8) + 48))(a1, ((v13 + 3) & 0xFFFFFFFC) + ((v14 + 3) & 0xFFFFFFFC) + 40);
    if (v15)
    {
      unsigned int v16 = *(_DWORD *)(a2 + 4);
      *int v15 = bswap32(*(_DWORD *)a2);
      v15[1] = bswap32(v16);
      if (v16) {
        return 0;
      }
      v15[2] = bswap32(*(_DWORD *)(a2 + 8));
      if (*(_DWORD *)(a2 + 8) != 2) {
        return 0;
      }
      void v15[3] = bswap32(*(_DWORD *)(a2 + 12));
      v15[4] = bswap32(*(_DWORD *)(a2 + 16));
      v15[5] = bswap32(*(_DWORD *)(a2 + 20));
      v15[6] = bswap32(*(_DWORD *)(a2 + 24));
      long long v17 = v15 + 8;
      v15[7] = bswap32(*(_DWORD *)(a2 + 40));
      size_t v18 = *(unsigned int *)(a2 + 40);
      if (v18)
      {
        memmove(v15 + 8, *(const void **)(a2 + 32), v18);
        long long v17 = (_DWORD *)((char *)v17 + ((*(_DWORD *)(a2 + 40) + 3) & 0xFFFFFFFC));
      }
      *long long v17 = bswap32(*(_DWORD *)(a2 + 48));
      v17[1] = bswap32(*(_DWORD *)(a2 + 64));
      size_t v19 = *(unsigned int *)(a2 + 64);
      if (v19)
      {
        int v20 = v17 + 2;
        uint64_t v21 = *(const void **)(a2 + 56);
LABEL_48:
        memmove(v20, v21, v19);
      }
      return 1;
    }
    int v4 = *(_DWORD *)a1;
  }
  if (v4 == 1
    && (uint64_t v5 = (unsigned int *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 48))(a1, 32)) != 0)
  {
    *(_DWORD *)a2 = bswap32(*v5);
    unsigned int v6 = v5[1];
    *(_DWORD *)(a2 + 4) = bswap32(v6);
    if (v6) {
      return 0;
    }
    unsigned int v7 = v5[2];
    *(_DWORD *)(a2 + 8) = bswap32(v7);
    if (v7 != 0x2000000) {
      return 0;
    }
    *(_DWORD *)(a2 + 12) = bswap32(v5[3]);
    *(_DWORD *)(a2 + 16) = bswap32(v5[4]);
    *(_DWORD *)(a2 + 20) = bswap32(v5[5]);
    *(_DWORD *)(a2 + 24) = bswap32(v5[6]);
    unsigned int v8 = v5[7];
    unsigned int v9 = bswap32(v8);
    *(_DWORD *)(a2 + 40) = v9;
    if (v8)
    {
      if (v9 > 0x190) {
        return 0;
      }
      if (!*(void *)(a2 + 32))
      {
        *(void *)(a2 + 32) = calloc(1uLL, (v9 + 3) & 0xFFFFFFFC);
        unsigned int v9 = *(_DWORD *)(a2 + 40);
      }
      uint64_t v10 = (const void *)(*(uint64_t (**)(uint64_t, void))(*(void *)(a1 + 8) + 48))(a1, (v9 + 3) & 0xFFFFFFFC);
      size_t v11 = *(unsigned int *)(a2 + 40);
      if (v10)
      {
        memmove(*(void **)(a2 + 32), v10, v11);
      }
      else
      {
        uint64_t result = _newrpclib_xdr_opaque((int *)a1, *(void *)(a2 + 32), v11);
        if (!result) {
          return result;
        }
      }
    }
    long long v22 = (unsigned int *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 8) + 48))(a1, 8);
    if (v22)
    {
      *(_DWORD *)(a2 + 48) = bswap32(*v22);
      unsigned int v23 = bswap32(v22[1]);
      *(_DWORD *)(a2 + 64) = v23;
      if (!v23) {
        return 1;
      }
      goto LABEL_37;
    }
    uint64_t result = _newrpclib_xdr_enum(a1, a2 + 48);
    if (result)
    {
      uint64_t result = _newrpclib_xdr_u_int((uint64_t (***)(void))a1, (int *)(a2 + 64));
      if (result)
      {
        unsigned int v23 = *(_DWORD *)(a2 + 64);
        if (!v23) {
          return 1;
        }
LABEL_37:
        if (v23 > 0x190) {
          return 0;
        }
        if (!*(void *)(a2 + 56))
        {
          *(void *)(a2 + 56) = calloc(1uLL, (v23 + 3) & 0xFFFFFFFC);
          unsigned int v23 = *(_DWORD *)(a2 + 64);
        }
        uint64_t v24 = (*(uint64_t (**)(uint64_t, void))(*(void *)(a1 + 8) + 48))(a1, (v23 + 3) & 0xFFFFFFFC);
        size_t v19 = *(unsigned int *)(a2 + 64);
        if (v24)
        {
          uint64_t v25 = (const void *)v24;
          int v20 = *(void **)(a2 + 56);
          uint64_t v21 = v25;
          goto LABEL_48;
        }
        uint64_t result = _newrpclib_xdr_opaque((int *)a1, *(void *)(a2 + 56), v19);
        if (!result) {
          return result;
        }
        return 1;
      }
    }
  }
  else
  {
    uint64_t result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
    if (result)
    {
      uint64_t result = _newrpclib_xdr_enum(a1, a2 + 4);
      if (result)
      {
        if (*(_DWORD *)(a2 + 4)) {
          return 0;
        }
        uint64_t result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
        if (!result) {
          return result;
        }
        if (*(_DWORD *)(a2 + 8) != 2) {
          return 0;
        }
        uint64_t result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
        if (result)
        {
          uint64_t result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
          if (result)
          {
            uint64_t result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
            if (result)
            {
              uint64_t result = _newrpclib_xdr_opaque_auth((uint64_t (***)(void))a1, a2 + 24);
              if (result)
              {
                return _newrpclib_xdr_opaque_auth((uint64_t (***)(void))a1, a2 + 48);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL _newrpclib_rpc_control(int a1, char *__s2)
{
  int v2 = (int)__s2;
  switch(a1)
  {
    case 1:
      if ((__s2 - 2049) < 0xFFFFF800) {
        return 0;
      }
      svc_min_threads = (int)__s2;
      if (svc_max_threads < __s2) {
        svc_max_threads = (int)__s2;
      }
      return 1;
    case 2:
      int v5 = svc_min_threads;
      goto LABEL_43;
    case 3:
      if ((int)__s2 >= 2048) {
        unsigned int v6 = 2048;
      }
      else {
        unsigned int v6 = __s2;
      }
      svc_max_threads = v6;
      if (v6 < svc_min_threads) {
        svc_min_threads = v6;
      }
      return 1;
    case 4:
      int v5 = svc_max_threads;
      goto LABEL_43;
    case 5:
      if (geteuid()) {
        return 0;
      }
      if (v2)
      {
        pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
        BOOL result = 1;
        svc_cred_switch = 1;
        return result;
      }
      svc_cred_switch = 0;
      return 1;
    case 6:
      int v5 = svc_cred_switch;
      goto LABEL_43;
    case 7:
      if (__s2 > 0x8000) {
        return 0;
      }
      svc_listen_backlog = (int)__s2;
      return 1;
    case 8:
      int v5 = svc_listen_backlog;
      goto LABEL_43;
    case 9:
      svc_nreq = (int)__s2;
      return 1;
    case 10:
      int v5 = svc_nreq;
      goto LABEL_43;
    case 11:
      svc_stack_size = (uint64_t)__s2;
      return 1;
    case 12:
      unsigned int v7 = (char *)svc_stack_size;
      goto LABEL_35;
    case 13:
      _newrpclib_rpc_ipmode = (int)__s2;
      return 1;
    case 14:
      unsigned int v8 = &_newrpclib_rpc_ipmode;
      goto LABEL_29;
    case 15:
      _newrpclib_rpc_v4mapped_ok = __s2 != 0;
      return 1;
    case 16:
      unsigned int v8 = &_newrpclib_rpc_v4mapped_ok;
LABEL_29:
      int v5 = *v8;
      goto LABEL_43;
    case 17:
      int v14 = 0;
      int v12 = 0;
      int v13 = 0;
      size_t v11 = 0;
      if (__s2)
      {
        int v9 = _newrpclib_netid2socparms(__s2, &v14, &v13, &v12, 0);
        BOOL result = 0;
        if (v9) {
          return result;
        }
        if (_newrpclib_socparms2netid(v14, v13, v12, (const char **)&v11)) {
          return 0;
        }
        uint64_t v10 = v11;
      }
      else
      {
        uint64_t v10 = 0;
      }
      portmap_netid = v10;
      return 1;
    case 18:
      unsigned int v7 = portmap_netid;
LABEL_35:
      *(void *)timeval __s2 = v7;
      return 1;
    case 19:
      BOOL result = 0;
      if (__s2 > 0x21 || ((1 << (char)__s2) & 0x202220201) == 0) {
        return result;
      }
      svc_thread_qos_class = (int)__s2;
      return 1;
    case 20:
      int v5 = svc_thread_qos_class;
      goto LABEL_43;
    case 21:
      if ((__s2 - 1) < 0xFFFFFFF0) {
        return 0;
      }
      svc_thread_relative_priority = (int)__s2;
      return 1;
    case 22:
      int v5 = svc_thread_relative_priority;
LABEL_43:
      *(_DWORD *)timeval __s2 = v5;
      return 1;
    default:
      BOOL result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      _newrpclib_rpc_control_cold_1(a1);
      return 0;
  }
}

uint64_t _newrpclib_xdr_opaque_auth(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_enum();
  if (result)
  {
    return _newrpclib_xdr_bytes(a1, (void **)(a2 + 8), (int *)(a2 + 16), 0x190u);
  }
  return result;
}

uint64_t _newrpclib_xdr_des_block(int *a1, uint64_t a2)
{
  return _newrpclib_xdr_opaque(a1, a2, 8);
}

uint64_t _newrpclib_xdr_replymsg(uint64_t (***a1)(void), uint64_t a2)
{
  if (!_newrpclib_xdr_u_long(a1)
    || !_newrpclib_xdr_enum(a1, a2 + 4)
    || *(_DWORD *)(a2 + 4) != 1)
  {
    return 0;
  }
  return _newrpclib_xdr_union(a1, (_DWORD *)(a2 + 8), a2 + 16, (uint64_t)&reply_dscrm, 0);
}

uint64_t _newrpclib_xdr_callhdr(uint64_t (***a1)(void), uint64_t a2)
{
  *(void *)(a2 + 4) = 0x200000000;
  uint64_t v2 = a2 + 4;
  if (*(_DWORD *)a1
    || !_newrpclib_xdr_u_long(a1)
    || !_newrpclib_xdr_enum(a1, v2)
    || !_newrpclib_xdr_u_long(a1)
    || !_newrpclib_xdr_u_long(a1))
  {
    return 0;
  }
  return _newrpclib_xdr_u_long(a1);
}

_DWORD *_newrpclib__seterr_reply(_DWORD *result, int *a2)
{
  int v2 = result[2];
  if (v2 == 1)
  {
    int v4 = result[4];
    if (v4)
    {
      if (v4 == 1)
      {
        *a2 = 7;
        int v5 = result[5];
LABEL_9:
        a2[1] = v5;
        return result;
      }
      *(void *)a2 = 0x100000010;
    }
    else
    {
      *a2 = 6;
      a2[1] = result[5];
      int v4 = result[6];
    }
LABEL_15:
    a2[2] = v4;
    return result;
  }
  if (v2)
  {
    *a2 = 16;
    int v5 = result[2];
    goto LABEL_9;
  }
  int v3 = result[10];
  switch(v3)
  {
    case 0:
      *a2 = 0;
      return result;
    case 1:
      int v6 = 8;
      goto LABEL_19;
    case 2:
      *a2 = 9;
      a2[1] = result[12];
      int v4 = result[13];
      goto LABEL_15;
    case 3:
      int v6 = 10;
      goto LABEL_19;
    case 4:
      int v6 = 11;
      goto LABEL_19;
    case 5:
      int v6 = 12;
LABEL_19:
      *a2 = v6;
      break;
    default:
      *(void *)a2 = 16;
      a2[2] = v3;
      break;
  }
  return result;
}

uint64_t xdr_accepted_reply(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_opaque_auth(a1, a2);
  if (result)
  {
    uint64_t result = _newrpclib_xdr_enum(a1, a2 + 24);
    if (result)
    {
      int v5 = *(_DWORD *)(a2 + 24);
      if (v5 == 2)
      {
        uint64_t result = _newrpclib_xdr_u_long(a1);
        if (result)
        {
          return _newrpclib_xdr_u_long(a1);
        }
      }
      else if (v5)
      {
        return 1;
      }
      else
      {
        uint64_t v6 = *(void *)(a2 + 32);
        unsigned int v7 = *(uint64_t (**)(uint64_t (***)(void), uint64_t))(a2 + 40);
        return v7(a1, v6);
      }
    }
  }
  return result;
}

uint64_t xdr_rejected_reply(uint64_t (***a1)(void), _DWORD *a2)
{
  if (!_newrpclib_xdr_enum(a1, a2)) {
    return 0;
  }
  if (*a2 != 1)
  {
    if (!*a2 && _newrpclib_xdr_u_long(a1))
    {
      return _newrpclib_xdr_u_long(a1);
    }
    return 0;
  }
  return _newrpclib_xdr_enum(a1, a2 + 1);
}

uint64_t _svcauth_unix(uint64_t a1, uint64_t a2)
{
  memset(v18, 0, sizeof(v18));
  uint64_t v3 = *(void *)(a1 + 40);
  *(void *)(v3 + 8) = v3 + 40;
  *(void *)(v3 + 32) = v3 + 296;
  uint64_t v4 = *(unsigned int *)(a2 + 40);
  _newrpclib_xdrmem_create((uint64_t)v18, *(void *)(a2 + 32), v4, 1);
  int v5 = (unsigned int *)(*(uint64_t (**)(_OWORD *, uint64_t))(*((void *)&v18[0] + 1) + 48))(v18, v4);
  if (v5)
  {
    *(_DWORD *)uint64_t v3 = bswap32(*v5);
    size_t v6 = bswap32(v5[1]);
    if (v6 > 0xFF) {
      goto LABEL_14;
    }
    unsigned int v7 = v5 + 2;
    memmove(*(void **)(v3 + 8), v5 + 2, v6);
    *(unsigned char *)(*(void *)(v3 + 8) + v6) = 0;
    uint64_t v8 = (v6 + 3) & 0xFFFFFFFC;
    *(_DWORD *)(v3 + 16) = bswap32(*(unsigned int *)((char *)v7 + v8));
    *(_DWORD *)(v3 + 20) = bswap32(*(unsigned int *)((char *)v7 + v8 + 4));
    unsigned int v9 = *(unsigned int *)((char *)v7 + v8 + 8);
    int v10 = bswap32(v9);
    if (v10 > 0x10) {
      goto LABEL_14;
    }
    *(_DWORD *)(v3 + 24) = v10;
    if (v9)
    {
      size_t v11 = (unsigned int *)((char *)v7 + v8 + 12);
      int v12 = *(_DWORD **)(v3 + 32);
      if (v10 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v10;
      }
      do
      {
        unsigned int v14 = *v11++;
        *v12++ = bswap32(v14);
        --v13;
      }
      while (v13);
    }
    if ((int)v8 + 4 * v10 + 20 > v4) {
      goto LABEL_14;
    }
LABEL_12:
    uint64_t v15 = 0;
    *(_DWORD *)(a1 + 720) = 0;
    *(_DWORD *)(a1 + 736) = 0;
    goto LABEL_15;
  }
  if (_newrpclib_xdr_authunix_parms((uint64_t (***)(void))v18, v3)) {
    goto LABEL_12;
  }
  *(void *)(v3 + 8) = 0;
  LODWORD(v18[0]) = 2;
  _newrpclib_xdr_authunix_parms((uint64_t (***)(void))v18, v3);
LABEL_14:
  uint64_t v15 = 1;
LABEL_15:
  unsigned int v16 = *(void (**)(_OWORD *))(*((void *)&v18[0] + 1) + 56);
  if (v16) {
    v16(v18);
  }
  return v15;
}

uint64_t _svcauth_short()
{
  return 2;
}

uint64_t _newrpclib__authenticate(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 32) = v2;
  *(_DWORD *)(a1 + 720) = _newrpclib__null_auth;
  *(_DWORD *)(a1 + 736) = 0;
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  if (v3 > 2) {
    return 2;
  }
  uint64_t result = svcauthsw[v3]();
  if (result) {
    return result;
  }
  if (!svc_cred_switch) {
    return 0;
  }
  *(void *)size_t v11 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  uid_t v7 = *(_DWORD *)(v6 + 16);
  gid_t v8 = *(_DWORD *)(v6 + 20);
  if (pthread_getugid_np(&v11[1], v11))
  {
    if (*__error() != 3)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _newrpclib__authenticate_cold_3();
      }
      return 7;
    }
    v11[1] = geteuid();
    gid_t v9 = getegid();
    v11[0] = v9;
  }
  else
  {
    gid_t v9 = v11[0];
  }
  if (!v7)
  {
    uid_t v7 = -2;
    gid_t v8 = -2;
  }
  if (v11[1] == v7 && v9 == v8) {
    return 0;
  }
  if (v11[1]) {
    pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  }
  if (!pthread_setugid_np(v7, v8)) {
    return 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    _newrpclib__authenticate_cold_2();
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    _newrpclib__authenticate_cold_1();
  }
  return 7;
}

uint64_t _svcauth_null(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  *(void *)(v1 + 32) = 0;
  *(_OWORD *)uint64_t v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(void *)(*(void *)(a1 + 40) + 16) = 0x100000001;
  return 0;
}

char *_newrpclib_svcraw_create()
{
  int v0 = calloc(1uLL, 0x22E0uLL);
  if (!v0) {
    return 0;
  }
  uint64_t v1 = (char *)(v0 + 2200);
  v0[2200] = 0;
  *((_WORD *)v0 + 4402) = 0;
  *((void *)v0 + 1101) = &server_ops;
  _newrpclib_xdrmem_create((uint64_t)(v0 + 2220), (uint64_t)v0, 8800, 2);
  return v1;
}

uint64_t svcraw_recv()
{
  return 0;
}

uint64_t svcraw_stat()
{
  return 2;
}

uint64_t svcraw_getargs()
{
  return 0;
}

uint64_t svcraw_reply()
{
  return 0;
}

uint64_t svcraw_freeargs()
{
  return 0;
}

uint64_t _newrpclib_svc_run()
{
  pthread_mutex_lock(&svc_thread_lock);
  if (svc_active_threads)
  {
    pthread_mutex_unlock(&svc_thread_lock);
    svc_start_threads(0);
    pthread_mutex_lock(&svc_thread_lock);
    while (svc_exit_flag != 1 || svc_active_threads != 0)
      pthread_cond_wait(&svc_exit_cond, &svc_thread_lock);
    return pthread_mutex_unlock(&svc_thread_lock);
  }
  else
  {
    svc_active_threads = 1;
    pthread_mutex_unlock(&svc_thread_lock);
    if (svc_thread_qos_class) {
      pthread_set_qos_class_self_np((qos_class_t)svc_thread_qos_class, svc_thread_relative_priority);
    }
    return svc_thread();
  }
}

uint64_t svc_thread()
{
  while (!svc_complete())
  {
    int v0 = _newrpclib_svc_pollnext(0);
    if (v0)
    {
      uint64_t v1 = (uint64_t)v0;
      if (svc_complete()) {
        return 0;
      }
      if ((svc_polling & 1) == 0) {
        svc_start_threads(1);
      }
      _newrpclib_svc_getsomerequests(v1, svc_nreq);
    }
  }
  return 0;
}

uint64_t svc_start_threads(uint64_t result)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (svc_max_threads != 1)
  {
    int v1 = result;
    pthread_t v13 = 0;
    memset(&__attr, 0, sizeof(__attr));
    pthread_attr_init(&__attr);
    pthread_attr_setdetachstate(&__attr, 2);
    pthread_attr_setstacksize(&__attr, svc_stack_size);
    if (svc_thread_qos_class) {
      pthread_attr_set_qos_class_np(&__attr, (qos_class_t)svc_thread_qos_class, svc_thread_relative_priority);
    }
    pthread_mutex_lock(&svc_thread_lock);
    unsigned int v2 = svc_active_threads;
    int v3 = svc_min_threads - svc_active_threads;
    unsigned int v4 = svc_max_threads;
    if (svc_min_threads - svc_active_threads >= 1 && svc_active_threads < svc_max_threads)
    {
      uint64_t v6 = MEMORY[0x263EF8438];
      int v7 = 1;
      do
      {
        if (pthread_create(&v13, &__attr, (void *(__cdecl *)(void *))svc_thread, 0))
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            int v8 = *__error();
            *(_DWORD *)buf = 136316418;
            uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
            __int16 v16 = 1024;
            int v17 = 358;
            __int16 v18 = 2080;
            size_t v19 = "svc_start_threads";
            __int16 v20 = 2080;
            uint64_t v21 = "Could not create thread";
            int v22 = 67108960;
            int v23 = v8;
            _os_log_error_impl(&dword_23C096000, v6, OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", buf, 0x2Eu);
          }
        }
        else
        {
          ++svc_active_threads;
          --v1;
        }
        unsigned int v2 = svc_active_threads;
        unsigned int v4 = svc_max_threads;
        if (v7 >= v3) {
          break;
        }
        ++v7;
      }
      while (svc_active_threads < svc_max_threads);
    }
    if (v1 >= 1 && v2 < v4 && (svc_polling & 1) == 0)
    {
      gid_t v9 = MEMORY[0x263EF8438];
      int v10 = 1;
      do
      {
        if (pthread_create(&v13, &__attr, (void *(__cdecl *)(void *))svc_thread, 0))
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            int v11 = *__error();
            *(_DWORD *)buf = 136316418;
            uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
            __int16 v16 = 1024;
            int v17 = 374;
            __int16 v18 = 2080;
            size_t v19 = "svc_start_threads";
            __int16 v20 = 2080;
            uint64_t v21 = "Could not create thread";
            int v22 = 67108960;
            int v23 = v11;
            _os_log_error_impl(&dword_23C096000, v9, OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", buf, 0x2Eu);
          }
        }
        else
        {
          ++svc_active_threads;
        }
        if (v10 >= v1) {
          break;
        }
        ++v10;
      }
      while (svc_active_threads < svc_max_threads && svc_polling == 0);
    }
    return pthread_mutex_unlock(&svc_thread_lock);
  }
  return result;
}

uint64_t add_working_xprt(uint64_t a1)
{
  int v1 = *(void ***)(a1 + 64);
  pthread_mutex_lock(&svc_workq_lock);
  if (v1[122])
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      add_working_xprt_cold_2((uint64_t)v1);
    }
    warnx("xprt %p is already on workq\n", v1);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      add_working_xprt_cold_1();
    }
    abort();
  }
  v1[122] = 0;
  *off_268B95C08 = v1;
  off_268B95C08 = (_UNKNOWN **)(v1 + 122);
  return pthread_mutex_unlock(&svc_workq_lock);
}

void *_newrpclib_svc_pollnext(const timespec *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  pthread_mutex_lock(&svc_poll_lock);
  if (svc_polling == 1)
  {
    for (int i = pthread_cond_timedwait_relative_np(&svc_poll_cond, &svc_poll_lock, &poll_timeout);
          (svc_exit_flag & 1) == 0;
          int i = pthread_cond_timedwait_relative_np(&svc_poll_cond, &svc_poll_lock, &poll_timeout))
    {
      if (svc_polling == 1 && i == 60)
      {
        pthread_mutex_lock(&svc_thread_lock);
        if (svc_active_threads > svc_min_threads)
        {
          --svc_active_threads;
          pthread_mutex_unlock(&svc_thread_lock);
          unsigned int v4 = &svc_poll_lock;
          goto LABEL_35;
        }
        pthread_mutex_unlock(&svc_thread_lock);
        if ((svc_polling & 1) == 0) {
          goto LABEL_14;
        }
      }
      else if (!svc_polling)
      {
        goto LABEL_14;
      }
    }
    pthread_mutex_unlock(&svc_poll_lock);
    pthread_mutex_lock(&svc_thread_lock);
    int v3 = --svc_active_threads;
    if (svc_exit_flag == 1 && !v3) {
      pthread_cond_broadcast(&svc_exit_cond);
    }
    unsigned int v4 = &svc_thread_lock;
LABEL_35:
    pthread_mutex_unlock(v4);
    pthread_exit(0);
  }
LABEL_14:
  unsigned int v5 = 1;
  svc_polling = 1;
  pthread_mutex_unlock(&svc_poll_lock);
  uint64_t v6 = MEMORY[0x263EF8438];
  while (1)
  {
    while (1)
    {
      while (1)
      {
        memset(&eventlist, 0, sizeof(eventlist));
        int v7 = kevent64(kq, 0, 0, &eventlist, 1, v5, a1);
        if (v7 != -1) {
          break;
        }
        int v9 = *__error();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
          __int16 v16 = 1024;
          int v17 = 206;
          __int16 v18 = 2080;
          size_t v19 = "_newrpclib_svc_pollnext";
          __int16 v20 = 1024;
          int v21 = v9;
          _os_log_error_impl(&dword_23C096000, v6, OS_LOG_TYPE_ERROR, "%s:%d in %s, KEVENT ERRNO %d\n", buf, 0x22u);
        }
        warnx("KEVENT ERRNO %d\n", v9);
      }
      if (!v7) {
        break;
      }
      udata = (void *)eventlist.udata;
      if (eventlist.udata)
      {
        if (eventlist.filter == -1)
        {
          xprt_ref(eventlist.udata);
          svc_unarmxprt(udata);
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t ident = eventlist.ident;
        if (ident != (int)svc_kq_control())
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            _newrpclib_svc_pollnext_cold_1();
          }
          abort();
        }
        svc_clear_kq_control();
        unsigned int v5 = 1;
      }
    }
    if (!v5) {
      break;
    }
    pthread_mutex_lock(&svc_workq_lock);
    int v10 = workq;
    if (workq)
    {
      workq = (_UNKNOWN *)*((void *)workq + 122);
      if (!workq) {
        off_268B95C08 = &workq;
      }
      v10[122] = 0;
      pthread_mutex_unlock(&svc_workq_lock);
      unsigned int v5 = 0;
      udata = (void *)v10[123];
      if (udata) {
        goto LABEL_32;
      }
    }
    else
    {
      pthread_mutex_unlock(&svc_workq_lock);
      unsigned int v5 = 0;
    }
  }
  udata = 0;
LABEL_32:
  pthread_mutex_lock(&svc_poll_lock);
  svc_polling = 0;
  pthread_mutex_unlock(&svc_poll_lock);
  pthread_cond_signal(&svc_poll_cond);
  return udata;
}

uint64_t _newrpclib_svc_exit()
{
  pthread_mutex_lock(&svc_thread_lock);
  svc_exit_flag = 1;
  pthread_cond_broadcast(&svc_poll_cond);
  return pthread_mutex_unlock(&svc_thread_lock);
}

uint64_t svc_complete()
{
  pthread_mutex_lock(&svc_thread_lock);
  int v0 = svc_active_threads;
  if ((svc_exit_flag & 1) != 0 || svc_active_threads > svc_max_threads)
  {
    --svc_active_threads;
    if (v0 == 1) {
      pthread_cond_broadcast(&svc_exit_cond);
    }
    uint64_t v1 = 1;
  }
  else
  {
    uint64_t v1 = 0;
  }
  pthread_mutex_unlock(&svc_thread_lock);
  return v1;
}

uint64_t _newrpclib_registerrpc(unsigned int a1, unsigned int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a3)
  {
    if (_newrpclib_registerrpc_transp || (_newrpclib_registerrpc_transp = (uint64_t)_newrpclib_svcudp_create(-1)) != 0)
    {
      _newrpclib_pmap_unset(a1, a2);
      if (_newrpclib_svc_register(_newrpclib_registerrpc_transp, a1, a2, (uint64_t)universal, 17))
      {
        int v12 = calloc(1uLL, 0x28uLL);
        if (v12)
        {
          uint64_t v13 = (uint64_t)v12;
          uint64_t result = 0;
          *(void *)uint64_t v13 = a4;
          *(_DWORD *)(v13 + 8) = a1;
          *(_DWORD *)(v13 + 12) = a3;
          *(void *)(v13 + 16) = a5;
          *(void *)(v13 + 24) = a6;
          *(void *)(v13 + 32) = proglst;
          proglst = v13;
          return result;
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          _newrpclib_registerrpc_cold_4();
        }
      }
      else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        _newrpclib_registerrpc_cold_3(a1, a2);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      _newrpclib_registerrpc_cold_2();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    _newrpclib_registerrpc_cold_1();
  }
  return 0xFFFFFFFFLL;
}

_DWORD *universal()
{
  int v0 = (_DWORD *)MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = v0[2];
  if (v3)
  {
    uint64_t v4 = proglst;
    if (!proglst)
    {
LABEL_6:
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        universal_cold_2();
      }
      goto LABEL_8;
    }
    while (*(_DWORD *)(v4 + 8) != *v0 || *(_DWORD *)(v4 + 12) != v3)
    {
      uint64_t v4 = *(void *)(v4 + 32);
      if (!v4) {
        goto LABEL_6;
      }
    }
    bzero(v7, 0x2260uLL);
    if ((*(unsigned int (**)(uint64_t, void, unsigned char *))(*(void *)(v2 + 8) + 16))(v2, *(void *)(v4 + 16), v7))
    {
      uint64_t result = (_DWORD *)(*(uint64_t (**)(unsigned char *))v4)(v7);
      uint64_t v6 = *(uint64_t (**)())(v4 + 24);
      if (result)
      {
LABEL_11:
        if (_newrpclib_svc_sendreply(v2, (uint64_t)v6, (uint64_t)result)) {
          return (_DWORD *)(*(uint64_t (**)(uint64_t, void, unsigned char *))(*(void *)(v2 + 8) + 32))(v2, *(void *)(v4 + 16), v7);
        }
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          universal_cold_3((int *)(v4 + 8));
        }
LABEL_8:
        exit(1);
      }
      if (v6 == _newrpclib_xdr_void)
      {
        uint64_t v6 = _newrpclib_xdr_void;
        goto LABEL_11;
      }
    }
    else
    {
      return _newrpclib_svcerr_decode();
    }
  }
  else
  {
    uint64_t result = _newrpclib_svc_sendreply(v1, (uint64_t)_newrpclib_xdr_void, 0);
    if (!result)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        universal_cold_1();
      }
      goto LABEL_8;
    }
  }
  return result;
}

int *_newrpclib_svctcp_create(int a1, int a2, int a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v12 = 1;
  socklen_t v13 = 16;
  socklen_t v11 = 4;
  sockaddr v14 = (sockaddr)0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  if (a1 == -1)
  {
    int v6 = open_socket(6);
    if (v6 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _newrpclib_svctcp_create_cold_1();
      }
      return 0;
    }
LABEL_6:
    if (bindresvport_sa(v6, &v14))
    {
      *(_WORD *)v14.sa_data = 0;
      if (bind(v6, &v14, v13))
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          _newrpclib_svctcp_create_cold_3();
        }
        return 0;
      }
    }
    goto LABEL_15;
  }
  socklen_t v9 = 4;
  int v10 = 1;
  if (getsockopt(a1, 0xFFFF, 4104, &v10, &v9))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_svctcp_create_cold_7();
    }
    return 0;
  }
  if (v10 != 1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_svctcp_create_cold_6();
    }
    return 0;
  }
  if (getsockname(a1, &v14, &v13) == -1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_svctcp_create_cold_4();
    }
    return 0;
  }
  if (v14.sa_family != 2 && v14.sa_family != 30)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_svctcp_create_cold_5();
    }
    return 0;
  }
  int v6 = a1;
  if (!*(_WORD *)v14.sa_data) {
    goto LABEL_6;
  }
LABEL_15:
  if (getsockopt(v6, 41, 27, &v12, &v11)) {
    int v7 = 2;
  }
  else {
    int v7 = 30;
  }
  uint64_t result = svcstrm_domain_create(v6, v7, 6, a2, a3);
  if (!result)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_svctcp_create_cold_2();
    }
    if (a1 == -1) {
      close(v6);
    }
    return 0;
  }
  return result;
}

int *svcstrm_domain_create(int a1, int a2, int a3, int a4, int a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  sockaddr v17 = (sockaddr)0;
  long long v18 = 0u;
  int v15 = 0;
  socklen_t v16 = 128;
  setsockopt(a1, 0xFFFF, 4130, &v15, 4u);
  if (getsockname(a1, &v17, &v16) || listen(a1, svc_listen_backlog))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      svcstrm_domain_create_cold_3();
    }
  }
  else
  {
    int v12 = calloc(1uLL, 8uLL);
    if (v12)
    {
      socklen_t v13 = v12;
      _DWORD *v12 = a4;
      v12[1] = a5;
      sockaddr v14 = svc_xprt_create(a1, &v17.sa_len, (uint64_t)&svcstrm_rendezvous_op, 0, (uint64_t)v12);
      if (v14)
      {
        int v10 = v14;
        _newrpclib_socparms2netid(a2, 1, a3, *((const char ***)v14 + 8));
        _newrpclib_xprt_register(v10);
        return v10;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        svcstrm_domain_create_cold_2();
      }
      free(v13);
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      svcstrm_domain_create_cold_1();
    }
  }
  return 0;
}

int *svcticotsord_create(int a1, int a2, int a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(v11, 0, 106);
  socklen_t v10 = 106;
  if (a1 == -1)
  {
    *(void *)v11[6].sa_data = 0;
    *(_OWORD *)v11[5].sa_data = 0uLL;
    *(_OWORD *)v11[4].sa_data = 0uLL;
    *(_OWORD *)v11[3].sa_data = 0uLL;
    *(_OWORD *)v11[2].sa_data = 0uLL;
    *(_OWORD *)v11[1].sa_data = 0uLL;
    *(_OWORD *)v11[0].sa_data = 0uLL;
    *(_WORD *)&v11[0].sa_len = 362;
    int v6 = socket(1, 1, 0);
    if (v6 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        svcticotsord_create_cold_1();
      }
      return 0;
    }
  }
  else
  {
    socklen_t v8 = 4;
    int v9 = 1;
    if (getsockopt(a1, 0xFFFF, 4104, &v9, &v8))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        svcticotsord_create_cold_9();
      }
      return 0;
    }
    if (v9 != 1)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        svcticotsord_create_cold_8();
      }
      return 0;
    }
    memset(v11, 0, 106);
    if (getsockname(a1, v11, &v10) == -1)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        svcticotsord_create_cold_6();
      }
      return 0;
    }
    if (v11[0].sa_family != 1)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        svcticotsord_create_cold_7();
      }
      return 0;
    }
    int v6 = a1;
    if (v11[0].sa_data[0]) {
      goto LABEL_30;
    }
  }
  if (set_local_ephemeral_sockname((uint64_t)v11, "ticotsord"))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      svcticotsord_create_cold_5();
    }
LABEL_19:
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      svcticotsord_create_cold_4();
    }
    if (a1 != -1) {
      return 0;
    }
    goto LABEL_22;
  }
  if (bind(v6, v11, 0x6Au)) {
    goto LABEL_19;
  }
  if (chmod(v11[0].sa_data, 0x1FFu) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    svcticotsord_create_cold_3();
  }
LABEL_30:
  uint64_t result = svcstrm_domain_create(v6, 1, 0, a2, a3);
  if (result) {
    return result;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    svcticotsord_create_cold_2();
  }
  if (a1 == -1)
  {
    unlink(v11[0].sa_data);
LABEL_22:
    close(v6);
  }
  return 0;
}

uint64_t _newrpclib_svcfd_create(int a1, unsigned int a2, unsigned int a3)
{
  return makefd_xprt(a1, a2, a3, 0, 0);
}

uint64_t makefd_xprt(int a1, unsigned int a2, unsigned int a3, unsigned __int8 *a4, int a5)
{
  int v17 = 1;
  setsockopt(a1, 0xFFFF, 4130, &v17, 4u);
  socklen_t v10 = calloc(1uLL, 0x18uLL);
  if (v10)
  {
    socklen_t v11 = v10;
    void *v10 = 0;
    v10[1] = 0;
    uint64_t v12 = svc_xprt_create(a1, 0, (uint64_t)&svcstrm_op, a5 | 0xAu, (uint64_t)v10);
    if (v12)
    {
      uint64_t v13 = (uint64_t)v12;
      gid_t v11[2] = v12;
      _newrpclib_xdrrec_create(*((void *)v12 + 8) + 344, 0, a3, (uint64_t)v12, (uint64_t)readstrm_0, 0);
      _newrpclib_xdrrec_create(*(void *)(v13 + 64) + 456, a2, 0, v13, 0, (uint64_t)writestrm_0);
      if (!a4 || !*a4)
      {
        if (_newrpclib_socparms2netid(1, 1, 0, *(const char ***)(v13 + 64))
          && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
          makefd_xprt_cold_3();
        }
        goto LABEL_24;
      }
      memcpy((void *)(*(void *)(v13 + 64) + 8), a4, *a4);
      int v14 = a4[1];
      switch(v14)
      {
        case 1:
          *(_DWORD *)(v13 + 16) = 0;
          memcpy((void *)(*(void *)(v13 + 64) + 136), a4, *a4);
          int v15 = 0;
LABEL_21:
          if (_newrpclib_socparms2netid(a4[1], 1, v15, *(const char ***)(v13 + 64))
            && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            makefd_xprt_cold_5();
          }
LABEL_24:
          _newrpclib_xprt_register((int *)v13);
          return v13;
        case 30:
          *(void *)(v13 + 20) = 0;
          *(void *)(v13 + 28) = 0;
          cvt6to4((uint64_t)a4, v13 + 20);
          goto LABEL_20;
        case 2:
          memcpy((void *)(v13 + 20), a4, *a4);
          *(_DWORD *)(v13 + 16) = *(unsigned __int8 *)(v13 + 20);
LABEL_20:
          int v15 = 6;
          goto LABEL_21;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        makefd_xprt_cold_4();
      }
      svc_xprt_destroy((void **)v13);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        makefd_xprt_cold_2();
      }
      free(v11);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    makefd_xprt_cold_1();
  }
  return 0;
}

uint64_t rendezvous_request(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  thread_req = svc_get_thread_req();
  uint64_t v3 = *(void *)(a1 + 64);
  if ((*(unsigned char *)(v3 + 328) & 4) != 0) {
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 392));
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  sockaddr v11 = (sockaddr)0;
  long long v12 = 0u;
  uint64_t v4 = *(unsigned int **)(a1 + 72);
  while (1)
  {
    socklen_t v10 = 128;
    int v5 = accept(*(_DWORD *)a1, &v11, &v10);
    if ((v5 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4)
    {
      uint64_t v6 = *(void *)(a1 + 64);
      if ((*(unsigned char *)(v6 + 328) & 4) != 0) {
        pthread_mutex_unlock((pthread_mutex_t *)(v6 + 392));
      }
      if (*__error() != 35 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        rendezvous_request_cold_1();
      }
      return 0;
    }
  }
  int v7 = v5;
  atomic_fetch_add_explicit(&conncount, 1u, memory_order_relaxed);
  uint64_t v8 = *(void *)(a1 + 64);
  if ((*(unsigned char *)(v8 + 328) & 4) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)(v8 + 392));
  }
  if (thread_req)
  {
    thread_req[187] |= 1u;
    thread_req[186] = 0;
  }
  svc_rearmxprt((int *)a1, 0);
  makefd_xprt(v7, *v4, v4[1], &v11.sa_len, *(_DWORD *)(*(void *)(a1 + 64) + 328) & 0x10);
  return 0;
}

uint64_t rendezvous_stat()
{
  return 2;
}

uint64_t rendezvous_abort_getargs()
{
  return 0;
}

uint64_t rendezvous_abort_reply()
{
  return 0;
}

uint64_t rendezvous_abort_freeargs()
{
  return 0;
}

void rendezvous_destroy(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (*(unsigned char *)(v2 + 137) == 1)
  {
    int v4 = *(unsigned __int8 *)(v2 + 138);
    uint64_t v3 = (const char *)(v2 + 138);
    if (v4) {
      unlink(v3);
    }
  }
  svcstrm_destroy(a1);
}

void svcstrm_destroy(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 72);
  _newrpclib_xprt_unregister();
  free(v2);
  atomic_fetch_add_explicit(&conncount, 0xFFFFFFFF, memory_order_relaxed);
  if (close(*(_DWORD *)a1) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    svcstrm_destroy_cold_1();
  }
  svc_xprt_destroy((void **)a1);
}

ssize_t readstrm_0(uint64_t a1, void *a2, size_t a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v6 = *(_DWORD *)a1;
  *(_DWORD *)&v13.events = 64;
  int v7 = MEMORY[0x263EF8438];
  v13.fd = v6;
  while (1)
  {
    int v8 = poll(&v13, 1u, 12000);
    int v9 = v8;
    if (v8 < 0)
    {
      if (*__error() != 4 && *__error() != 35) {
        goto LABEL_15;
      }
    }
    else if (!v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        readstrm_cold_2();
      }
      goto LABEL_19;
    }
    if ((v13.revents & 0x40) != 0)
    {
      ssize_t result = read(v6, a2, a3);
      if (result > 0) {
        return result;
      }
      if ((result & 0x8000000000000000) == 0) {
        break;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v11 = *__error();
        *(_DWORD *)buf = 136316418;
        long long v15 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_strm.c";
        __int16 v16 = 1024;
        int v17 = 698;
        __int16 v18 = 2080;
        uint64_t v19 = "readstrm";
        __int16 v20 = 2080;
        long long v21 = "strm read";
        int v22 = 67108960;
        int v23 = v11;
        _os_log_error_impl(&dword_23C096000, v7, OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", buf, 0x2Eu);
      }
      if (*__error() != 4 && *__error() != 35) {
        break;
      }
    }
  }
  if ((v9 & 0x80000000) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    readstrm_cold_1();
  }
LABEL_19:
  *(_DWORD *)(*(void *)(a1 + 64) + 336) = 0;
  return -1;
}

size_t writestrm_0(uint64_t a1, char *__buf, size_t __nbyte)
{
  size_t v3 = __nbyte;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (__nbyte)
  {
    int v6 = MEMORY[0x263EF8438];
    size_t v7 = __nbyte;
    do
    {
      while (1)
      {
        ssize_t v8 = write(*(_DWORD *)a1, __buf, v7);
        if (v8 < 0) {
          break;
        }
        __buf += v8;
        v7 -= v8;
        if (!v7) {
          return v3;
        }
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v9 = *__error();
        *(_DWORD *)buf = 136316418;
        pollfd v13 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_strm.c";
        __int16 v14 = 1024;
        int v15 = 729;
        __int16 v16 = 2080;
        int v17 = "writestrm";
        __int16 v18 = 2080;
        uint64_t v19 = "strm write";
        int v20 = 67108960;
        int v21 = v9;
        _os_log_error_impl(&dword_23C096000, v6, OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", buf, 0x2Eu);
      }
    }
    while (*__error() == 35 || *__error() == 4);
    *(_DWORD *)(*(void *)(a1 + 64) + 336) = 0;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      writestrm_cold_1();
    }
    return -1;
  }
  return v3;
}

uint64_t svcstrm_recv(uint64_t a1, uint64_t a2)
{
  int v4 = (_DWORD *)(*(void *)(a1 + 64) + 344);
  thread_req = svc_get_thread_req();
  uint64_t v6 = *(void *)(a1 + 64);
  if ((*(unsigned char *)(v6 + 328) & 4) != 0) {
    pthread_mutex_lock((pthread_mutex_t *)(v6 + 392));
  }
  *int v4 = 1;
  if (!xdrrec_isrecordstart((uint64_t)v4) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    svcstrm_recv_cold_3();
  }
  if (_newrpclib_xdrrec_skiprecord((uint64_t)v4))
  {
    if (_newrpclib_xdr_callmsg((uint64_t)v4, a2))
    {
      uint64_t v7 = *(void *)(a1 + 64);
      if ((*(unsigned char *)(v7 + 328) & 0x10) != 0)
      {
        int v9 = *(unsigned __int8 *)(v7 + 136);
        ssize_t v8 = (sockaddr *)(v7 + 136);
        if (!v9)
        {
          socklen_t v12 = 128;
          if (getsockname(*(_DWORD *)a1, v8, &v12))
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              svcstrm_recv_cold_2();
            }
          }
        }
      }
      return 1;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    svcstrm_recv_cold_1();
  }
  uint64_t v11 = *(void *)(a1 + 64);
  if ((*(unsigned char *)(v11 + 328) & 4) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)(v11 + 392));
  }
  uint64_t result = svcstrm_stat(a1);
  if (thread_req)
  {
    thread_req[186] = 0;
    thread_req[187] |= 1u;
  }
  if (result)
  {
    svc_rearmxprt((int *)a1, result == 1);
    return 0;
  }
  return result;
}

uint64_t svcstrm_stat(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  if (*(_DWORD *)(v1 + 336))
  {
    if (_newrpclib_xdrrec_eof(v1 + 344)) {
      uint64_t result = 2;
    }
    else {
      uint64_t result = 1;
    }
    *(_DWORD *)(*(void *)(a1 + 64) + 336) = result;
  }
  else
  {
    uint64_t result = 0;
    *(_DWORD *)(v1 + 328) |= 0x8000u;
  }
  return result;
}

uint64_t svcstrm_getargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  thread_req = svc_get_thread_req();
  uint64_t v7 = a2(*(void *)(a1 + 64) + 344, a3);
  int v8 = svcstrm_stat(a1);
  if (thread_req)
  {
    thread_req[186] = v8;
    int v9 = thread_req[187];
    thread_req[187] = v9 | 1;
    if (v8)
    {
      if ((v9 & 2) != 0)
      {
        svc_rearmxprt((int *)a1, v8 == 1);
        thread_req[187] &= ~2u;
      }
    }
  }
  uint64_t v10 = *(void *)(a1 + 64);
  if ((*(unsigned char *)(v10 + 328) & 4) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)(v10 + 392));
  }
  return v7;
}

uint64_t svcstrm_reply(uint64_t a1, uint64_t a2)
{
  int v4 = (uint64_t (***)(void))(*(void *)(a1 + 64) + 456);
  thread_req = svc_get_thread_req();
  if (!thread_req || (int v6 = thread_req[187], (v6 & 1) == 0) && (thread_req[187] = v6 | 1, (v6 & 2) != 0)) {
    svc_rearmxprt((int *)a1, 0);
  }
  *(_DWORD *)int v4 = 0;
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 64) + 504));
  uint64_t v7 = _newrpclib_xdr_replymsg(v4, a2);
  if (!_newrpclib_xdrrec_endofrecord((uint64_t)v4, 1)
    && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    svcstrm_reply_cold_1();
  }
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 64) + 504));
  return v7;
}

uint64_t svcstrm_freeargs(uint64_t a1, uint64_t (*a2)(_OWORD *, uint64_t), uint64_t a3)
{
  memset(v4, 0, sizeof(v4));
  LODWORD(v4[0]) = 2;
  return a2(v4, a3);
}

_DWORD *_newrpclib_svcudp_bufcreate(int a1, int a2, int a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  sockaddr v20 = (sockaddr)0;
  long long v21 = 0u;
  int v18 = 1;
  socklen_t v19 = 128;
  socklen_t v16 = 4;
  int v17 = 0;
  int v6 = a1;
  if (a1 == -1)
  {
    int v6 = open_socket(17);
    if (v6 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _newrpclib_svcudp_bufcreate_cold_1();
      }
      return 0;
    }
  }
  ioctl(v6, 0x8004667EuLL, &v18);
  if (getsockname(v6, &v20, &v19))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_svcudp_bufcreate_cold_6();
    }
LABEL_11:
    if (a1 == -1) {
      close(v6);
    }
    return 0;
  }
  if (bindresvport_sa(v6, &v20))
  {
    *(_WORD *)v20.sa_data = 0;
    bind(v6, &v20, v19);
  }
  if (getsockname(v6, &v20, &v19))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_svcudp_bufcreate_cold_5();
    }
    goto LABEL_11;
  }
  uint64_t v7 = calloc(1uLL, 0x28uLL);
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_svcudp_bufcreate_cold_2();
    }
    goto LABEL_11;
  }
  int v8 = v7;
  size_t v9 = (a3 + 3) & 0xFFFFFFFC;
  *uint64_t v7 = v9;
  uint64_t v10 = calloc(1uLL, v9);
  *((void *)v8 + 1) = v10;
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_svcudp_bufcreate_cold_3();
    }
    if (a1 == -1) {
      close(v6);
    }
    goto LABEL_33;
  }
  size_t v11 = (a2 + 3) & 0xFFFFFFFC;
  v8[4] = v11;
  socklen_t v12 = calloc(1uLL, v11);
  *((void *)v8 + 3) = v12;
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_svcudp_bufcreate_cold_4();
    }
    if (a1 == -1) {
      close(v6);
    }
    free(*((void **)v8 + 1));
LABEL_33:
    free(v8);
    return 0;
  }
  pollfd v13 = svc_xprt_create(v6, &v20.sa_len, (uint64_t)&svcudp_op, 1, (uint64_t)v8);
  _newrpclib_xdrmem_create(*((void *)v13 + 8) + 344, *((void *)v8 + 1), *v8, 1);
  _newrpclib_xdrmem_create(*((void *)v13 + 8) + 456, *((void *)v8 + 3), v8[4], 0);
  if (getsockopt(v6, 41, 27, &v17, &v16)) {
    int v14 = 2;
  }
  else {
    int v14 = 30;
  }
  _newrpclib_socparms2netid(v14, 2, 17, *((const char ***)v13 + 8));
  *((void *)v8 + 4) = 0;
  _newrpclib_xprt_register(v13);
  return v13;
}

_DWORD *_newrpclib_svcudp_create(int a1)
{
  return _newrpclib_svcudp_bufcreate(a1, 8800, 8800);
}

uint64_t svcudp_recv(uint64_t a1, unsigned int *a2)
{
  uint64_t v5 = *(void *)(a1 + 64);
  int v4 = *(unsigned int **)(a1 + 72);
  thread_req = svc_get_thread_req();
  uint64_t v7 = *(void *)(a1 + 64);
  if ((*(unsigned char *)(v7 + 328) & 4) != 0) {
    pthread_mutex_lock((pthread_mutex_t *)(v7 + 392));
  }
  int v8 = (_OWORD *)(a1 + 20);
  while (1)
  {
    uint64_t v9 = *(void *)(a1 + 64);
    if ((*(unsigned char *)(v9 + 328) & 0x10) != 0)
    {
      *(unsigned char *)(v9 + 8) = 0x80;
      size_t v11 = (unsigned __int8 *)(v9 + 8);
      v11[128] = 0x80;
      unint64_t v10 = (int)recvfrom_and_to(*(_DWORD *)a1, *(void *)(*(void *)(a1 + 72) + 8), *v4, 0, v11, v11 + 128);
    }
    else
    {
      socklen_t v26 = 128;
      unint64_t v10 = recvfrom(*(_DWORD *)a1, *(void **)(*(void *)(a1 + 72) + 8), *v4, 0, (sockaddr *)(v9 + 8), &v26);
    }
    uint64_t v12 = *(void *)(a1 + 64);
    if (*(unsigned char *)(v12 + 9) == 2)
    {
      *int v8 = *(_OWORD *)(v12 + 8);
    }
    else
    {
      *(void *)int v8 = 0;
      *(void *)(a1 + 28) = 0;
      cvt6to4(v12 + 8, a1 + 20);
    }
    *(_DWORD *)(a1 + 16) = *(unsigned __int8 *)(a1 + 20);
    if (v10 != -1) {
      break;
    }
    if (*__error() != 4) {
      goto LABEL_27;
    }
  }
  if ((v10 & 0x8000000000000000) != 0)
  {
LABEL_27:
    if (*__error() != 35 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      svcudp_recv_cold_1();
      if (!thread_req)
      {
LABEL_31:
        svc_rearmxprt((int *)a1, 0);
        uint64_t result = 0;
        uint64_t v24 = *(void *)(a1 + 64);
        if ((*(unsigned char *)(v24 + 328) & 4) != 0)
        {
          pthread_mutex_unlock((pthread_mutex_t *)(v24 + 392));
          return 0;
        }
        return result;
      }
LABEL_30:
      thread_req[187] |= 1u;
      goto LABEL_31;
    }
LABEL_29:
    if (!thread_req) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v10 < 0x10) {
    goto LABEL_29;
  }
  *(_DWORD *)(v5 + 344) = 1;
  (*(void (**)(uint64_t, void))(*(void *)(v5 + 352) + 40))(v5 + 344, 0);
  if (!_newrpclib_xdr_callmsg(v5 + 344, (uint64_t)a2)) {
    goto LABEL_29;
  }
  unsigned int v13 = *a2;
  uint64_t v14 = *(void *)(a1 + 64);
  *(_DWORD *)(v14 + 568) = *a2;
  if (*((void *)v4 + 4))
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 32);
    uint64_t v16 = *(void *)(*(void *)(v15 + 8) + 8 * (v13 % (4 * *(_DWORD *)v15)));
    if (v16)
    {
      while (*(_DWORD *)v16 != *(_DWORD *)(*(void *)(a1 + 64) + 568)
           || *(_DWORD *)(v16 + 4) != *(_DWORD *)(v15 + 36)
           || *(_DWORD *)(v16 + 8) != *(_DWORD *)(v15 + 32)
           || *(_DWORD *)(v16 + 12) != *(_DWORD *)(v15 + 28)
           || memcmp((const void *)(v16 + 16), (const void *)(v15 + 40), 0x80uLL))
      {
        uint64_t v16 = *(void *)(v16 + 160);
        if (!v16)
        {
          uint64_t v14 = *(void *)(a1 + 64);
          goto LABEL_25;
        }
      }
      size_t v25 = *(unsigned int *)(v16 + 152);
      if (sendto(*(_DWORD *)a1, *(const void **)(v16 + 144), v25, 0, (const sockaddr *)(*(void *)(a1 + 64) + 8), *(unsigned __int8 *)(*(void *)(a1 + 64) + 8)) != v25&& os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
      {
        svcudp_recv_cold_2();
      }
    }
    else
    {
LABEL_25:
      *(_DWORD *)(v15 + 36) = a2[5];
      *(_DWORD *)(v15 + 32) = a2[4];
      *(_DWORD *)(v15 + 28) = a2[3];
      long long v17 = *(_OWORD *)(v14 + 8);
      long long v18 = *(_OWORD *)(v14 + 24);
      long long v19 = *(_OWORD *)(v14 + 40);
      *(_OWORD *)(v15 + 88) = *(_OWORD *)(v14 + 56);
      *(_OWORD *)(v15 + 72) = v19;
      *(_OWORD *)(v15 + 56) = v18;
      *(_OWORD *)(v15 + 40) = v17;
      long long v20 = *(_OWORD *)(v14 + 72);
      long long v21 = *(_OWORD *)(v14 + 88);
      long long v22 = *(_OWORD *)(v14 + 104);
      *(_OWORD *)(v15 + 152) = *(_OWORD *)(v14 + 120);
      *(_OWORD *)(v15 + 136) = v22;
      *(_OWORD *)(v15 + 120) = v21;
      *(_OWORD *)(v15 + 104) = v20;
    }
  }
  return 1;
}

uint64_t svcudp_stat()
{
  return 2;
}

uint64_t svcudp_getargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  thread_req = svc_get_thread_req();
  uint64_t v7 = a2(*(void *)(a1 + 64) + 344, a3);
  if (thread_req)
  {
    int v8 = thread_req[187];
    thread_req[187] = v8 | 1;
    if ((v8 & 2) != 0)
    {
      svc_rearmxprt((int *)a1, 0);
      thread_req[187] &= ~2u;
    }
  }
  uint64_t v9 = *(void *)(a1 + 64);
  if ((*(unsigned char *)(v9 + 328) & 4) != 0) {
    pthread_mutex_unlock((pthread_mutex_t *)(v9 + 392));
  }
  return v7;
}

uint64_t svcudp_reply(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  thread_req = svc_get_thread_req();
  if (thread_req)
  {
    uint64_t v7 = thread_req;
    int v8 = thread_req[187];
    if ((v8 & 1) == 0)
    {
      thread_req[187] = v8 | 1;
      if ((v8 & 2) != 0) {
        svc_rearmxprt((int *)a1, 0);
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 64) + 504));
    uint64_t v9 = (const sockaddr *)(v7 + 14);
  }
  else
  {
    svc_rearmxprt((int *)a1, 0);
    pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 64) + 504));
    uint64_t v9 = (const sockaddr *)(*(void *)(a1 + 64) + 8);
  }
  socklen_t sa_len = v9->sa_len;
  *(_DWORD *)(v5 + 456) = 0;
  (*(void (**)(uint64_t, void))(*(void *)(v5 + 464) + 40))(v5 + 456, 0);
  if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))(v5 + 456), a2)) {
    goto LABEL_22;
  }
  unsigned int v11 = (*(uint64_t (**)(uint64_t))(*(void *)(v5 + 464) + 32))(v5 + 456);
  if (sendto(*(_DWORD *)a1, *(const void **)(*(void *)(a1 + 72) + 24), v11, 0, v9, sa_len) != v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      svcudp_reply_cold_4();
    }
LABEL_22:
    uint64_t v12 = 0;
    goto LABEL_23;
  }
  uint64_t v12 = 1;
  if ((v11 & 0x80000000) == 0 && *(void *)(v4 + 32))
  {
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v14 = *(void *)(v13 + 32);
    uint64_t v15 = *(char **)(*(void *)(v14 + 16) + 8 * *(unsigned int *)(v14 + 24));
    if (v15)
    {
      uint64_t v16 = (void *)(*(void *)(v14 + 8) + 8 * (*(_DWORD *)v15 % (4 * *(_DWORD *)v14)));
      do
      {
        long long v17 = v16;
        long long v18 = (char *)*v16;
        uint64_t v16 = (void *)(*v16 + 160);
        if (v18) {
          BOOL v19 = v18 == v15;
        }
        else {
          BOOL v19 = 1;
        }
      }
      while (!v19);
      if (!v18)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          svcudp_reply_cold_3();
        }
        goto LABEL_34;
      }
      *long long v17 = *((void *)v15 + 20);
      uint64_t v20 = *((void *)v15 + 18);
    }
    else
    {
      long long v22 = (char *)calloc(1uLL, 0xA8uLL);
      if (!v22)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          svcudp_reply_cold_1();
        }
        goto LABEL_34;
      }
      uint64_t v15 = v22;
      long long v23 = calloc(1uLL, *(unsigned int *)(v13 + 16));
      if (!v23)
      {
        free(v15);
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          svcudp_reply_cold_2();
        }
        goto LABEL_34;
      }
      uint64_t v20 = (uint64_t)v23;
    }
    *((_DWORD *)v15 + 38) = v11;
    uint64_t v25 = *(void *)(a1 + 64);
    uint64_t v24 = *(void *)(a1 + 72);
    *((void *)v15 + 18) = *(void *)(v24 + 24);
    *(void *)(v24 + 24) = v20;
    _newrpclib_xdrmem_create(v25 + 456, v20, *(_DWORD *)(v13 + 16), 0);
    unsigned int v26 = *(_DWORD *)(*(void *)(a1 + 64) + 568);
    *(_DWORD *)uint64_t v15 = v26;
    *(int32x2_t *)(v15 + 4) = vrev64_s32(*(int32x2_t *)(v14 + 32));
    *((_DWORD *)v15 + 3) = *(_DWORD *)(v14 + 28);
    long long v27 = *(_OWORD *)(v14 + 40);
    long long v28 = *(_OWORD *)(v14 + 56);
    long long v29 = *(_OWORD *)(v14 + 88);
    *((_OWORD *)v15 + 3) = *(_OWORD *)(v14 + 72);
    *((_OWORD *)v15 + 4) = v29;
    *((_OWORD *)v15 + 1) = v27;
    *((_OWORD *)v15 + 2) = v28;
    long long v30 = *(_OWORD *)(v14 + 152);
    long long v31 = *(_OWORD *)(v14 + 120);
    long long v32 = *(_OWORD *)(v14 + 136);
    *((_OWORD *)v15 + 5) = *(_OWORD *)(v14 + 104);
    *((_OWORD *)v15 + 6) = v31;
    *((_OWORD *)v15 + 7) = v32;
    *((_OWORD *)v15 + 8) = v30;
    unsigned int v33 = v26 % (4 * **(_DWORD **)(*(void *)(a1 + 72) + 32));
    uint64_t v34 = *(void *)(v14 + 8);
    *((void *)v15 + 20) = *(void *)(v34 + 8 * v33);
    *(void *)(v34 + 8 * v33) = v15;
    uint64_t v35 = *(unsigned int *)(v14 + 24);
    *(void *)(*(void *)(v14 + 16) + 8 * v35) = v15;
    *(_DWORD *)(v14 + 24) = (v35 + 1) % *(_DWORD *)v14;
LABEL_34:
    uint64_t v12 = 1;
  }
LABEL_23:
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 64) + 504));
  return v12;
}

uint64_t svcudp_freeargs(uint64_t a1, uint64_t (*a2)(_OWORD *, uint64_t), uint64_t a3)
{
  memset(v4, 0, sizeof(v4));
  LODWORD(v4[0]) = 2;
  return a2(v4, a3);
}

void svcudp_destroy(uint64_t a1)
{
  if (close(*(_DWORD *)a1) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    svcudp_destroy_cold_1();
  }
  free(*(void **)(*(void *)(a1 + 72) + 8));
  free(*(void **)(*(void *)(a1 + 72) + 24));
  svc_xprt_destroy((void **)a1);
}

_DWORD *svc_xprt_create(int a1, unsigned __int8 *a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v18.__sig = 0;
  *(void *)v18.__opaque = 0;
  unint64_t v10 = calloc(1uLL, 0x50uLL);
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      svc_xprt_create_cold_1();
    }
    return 0;
  }
  unsigned int v11 = v10;
  uint64_t v12 = (char *)calloc(1uLL, 0x3E0uLL);
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      svc_xprt_create_cold_2();
    }
    free(v11);
    return 0;
  }
  uint64_t v13 = v12;
  _DWORD *v11 = a1;
  *((void *)v11 + 5) = 0;
  *((void *)v11 + 6) = 0;
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 3) = 0;
  *((void *)v11 + 1) = a3;
  v11[8] = 0;
  *((void *)v11 + 7) = 0;
  *((void *)v11 + 8) = v12;
  *((void *)v11 + 9) = a5;
  *(_OWORD *)(v12 + 120) = 0u;
  *(_OWORD *)(v12 + 104) = 0u;
  *(_OWORD *)(v12 + 88) = 0u;
  *(_OWORD *)(v12 + 72) = 0u;
  *(_OWORD *)(v12 + 56) = 0u;
  *(_OWORD *)(v12 + 40) = 0u;
  *(_OWORD *)(v12 + 24) = 0u;
  *(_OWORD *)(v12 + 8) = 0u;
  uint64_t v14 = *((void *)v11 + 8);
  *(_OWORD *)(v14 + 248) = 0u;
  *(_OWORD *)(v14 + 232) = 0u;
  *(_OWORD *)(v14 + 216) = 0u;
  *(_OWORD *)(v14 + 200) = 0u;
  *(_OWORD *)(v14 + 184) = 0u;
  *(_OWORD *)(v14 + 168) = 0u;
  *(_OWORD *)(v14 + 152) = 0u;
  *(_OWORD *)(v14 + 136) = 0u;
  if (a2 && ((memcpy((void *)(*((void *)v11 + 8) + 136), a2, *a2), int v15 = a2[1], v15 == 30) || v15 == 2)) {
    unsigned int v16 = bswap32(*((unsigned __int16 *)a2 + 1)) >> 16;
  }
  else {
    LOWORD(v16) = 0;
  }
  *((_WORD *)v11 + 2) = v16;
  pthread_mutexattr_init(&v18);
  pthread_mutexattr_settype(&v18, 1);
  pthread_mutex_init((pthread_mutex_t *)(v13 + 264), &v18);
  *((_DWORD *)v13 + 82) = a4;
  atomic_store(0, (unsigned __int8 *)v13 + 572);
  *(void *)(v13 + 332) = 0x200000000;
  pthread_mutex_init((pthread_mutex_t *)(v13 + 504), &v18);
  pthread_mutex_init((pthread_mutex_t *)(v13 + 392), &v18);
  pthread_mutexattr_destroy(&v18);
  *((void *)v13 + 44) = 0;
  *((void *)v13 + 58) = 0;
  *((_DWORD *)v13 + 142) = 0;
  *((void *)v13 + 122) = 0;
  *((void *)v13 + 123) = v11;
  return v11;
}

void svc_xprt_destroy(void **a1)
{
  uint64_t v2 = (char *)a1[8];
  pthread_mutex_destroy((pthread_mutex_t *)(v2 + 264));
  pthread_mutex_destroy((pthread_mutex_t *)(v2 + 504));
  pthread_mutex_destroy((pthread_mutex_t *)(v2 + 392));
  uint64_t v3 = *((void *)v2 + 44);
  if (v3)
  {
    uint64_t v4 = *(void (**)(char *))(v3 + 56);
    if (v4) {
      v4(v2 + 344);
    }
  }
  uint64_t v5 = *((void *)v2 + 58);
  if (v5)
  {
    int v6 = *(void (**)(char *))(v5 + 56);
    if (v6) {
      v6(v2 + 456);
    }
  }
  free(a1[8]);
  free(a1);
}

uint64_t xprt_ref(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 64) + 264));
  uint64_t v2 = *(void *)(a1 + 64);
  if ((*(unsigned char *)(v2 + 329) & 0x80) != 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    ++*(_DWORD *)(v2 + 332);
    uint64_t v3 = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v2 + 264));
  return v3;
}

uint64_t xprt_unref(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 64) + 264));
  uint64_t v2 = *(void *)(a1 + 64);
  unsigned int v3 = *(_DWORD *)(v2 + 328) & 0x8000;
  int v4 = *(_DWORD *)(v2 + 332) - 1;
  *(_DWORD *)(v2 + 332) = v4;
  pthread_mutex_unlock((pthread_mutex_t *)(v2 + 264));
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5) {
    (*(void (**)(uint64_t))(*(void *)(a1 + 8) + 40))(a1);
  }
  return (v3 >> 15) ^ 1;
}

void _newrpclib_xprt_register(int *a1)
{
  pthread_once(&oncrpc_xprt_init, svc_oncrpc_start);
  svc_armxprt(a1);
}

void svc_oncrpc_start()
{
  kq = kqueue();
  if (kq == -1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      svc_oncrpc_start_cold_1();
    }
    exit(1);
  }
  if (kq_control_fd == -1)
  {
    if (pipe(&kq_control_fd))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        svc_oncrpc_start_cold_3();
      }
      abort();
    }
    fcntl(kq_control_fd, 4, 4);
    fcntl(dword_268B95CB4, 4, 4);
    changelist.uint64_t ident = kq_control_fd;
    *(_DWORD *)&changelist.filter = 0x1FFFF;
    memset(&changelist.fflags, 0, 36);
    while (kevent64(kq, &changelist, 1, 0, 0, 0, 0))
    {
      if (*__error() != 4)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          svc_oncrpc_start_cold_2();
        }
        return;
      }
    }
  }
}

void svc_armxprt(int *a1)
{
  char v1 = 0;
  uint64_t v2 = *((void *)a1 + 8);
  changelist.uint64_t ident = *a1;
  *(void *)&changelist.filter = 0x10081FFFFLL;
  changelist.data = 1;
  changelist.udata = (uint64_t)a1;
  changelist.ext[0] = 0;
  changelist.ext[1] = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(v2 + 572), (unsigned __int8 *)&v1, 1u);
  if (v1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      svc_armxprt_cold_3();
    }
    warnx("** OOPS ** fd = %d, xprt = %p ** ALREADY ARMED **\n", *a1, a1);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      svc_armxprt_cold_2();
    }
    abort();
  }
  while (kevent64(kq, &changelist, 1, 0, 0, 0, 0))
  {
    if (*__error() != 4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        svc_armxprt_cold_1();
      }
      break;
    }
  }
  wakeup_kq();
}

void svc_rmxprt(int *a1)
{
  uint64_t v1 = *((void *)a1 + 8);
  v2.uint64_t ident = *a1;
  *(void *)&v2.filter = 196607;
  v2.data = 0;
  v2.udata = (uint64_t)a1;
  v2.ext[0] = 0;
  v2.ext[1] = 0;
  atomic_store(0, (unsigned __int8 *)(v1 + 572));
  while (kevent64(kq, &v2, 1, 0, 0, 0, 0))
  {
    if (*__error() != 4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        svc_rmxprt_cold_1();
      }
      break;
    }
  }
  wakeup_kq();
}

uint64_t svc_kq_control()
{
  return kq_control_fd;
}

ssize_t svc_clear_kq_control()
{
  int v1 = 0;
  do
    ssize_t result = read(kq_control_fd, &v1, 4uLL);
  while ((int)result > 0);
  return result;
}

void wakeup_kq()
{
  int __buf = 0;
  int v0 = write(dword_268B95CB4, &__buf, 4uLL);
  if (v0 != 4 && (v0 != -1 || *__error() != 35) && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    wakeup_kq_cold_1();
  }
}

void svc_rearmxprt(int *a1, int a2)
{
  if (a2)
  {
    add_working_xprt((uint64_t)a1);
    wakeup_kq();
  }
  else
  {
    char v2 = 0;
    uint64_t v3 = *((void *)a1 + 8);
    memset(&changelist, 0, sizeof(changelist));
    atomic_compare_exchange_strong((atomic_uchar *volatile)(v3 + 572), (unsigned __int8 *)&v2, 1u);
    if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        svc_rearmxprt_cold_3();
      }
      warnx("** OOPS ** fd = %d, xprt = %p ** ALREADY ARMED **\n");
    }
    else if (*(_DWORD *)(*((void *)a1 + 8) + 336))
    {
      changelist.uint64_t ident = *a1;
      *(void *)&changelist.filter = 327679;
      changelist.data = 0;
      changelist.udata = (uint64_t)a1;
      changelist.ext[0] = 0;
      changelist.ext[1] = 0;
      while (kevent64(kq, &changelist, 1, 0, 0, 0, 0))
      {
        if (*__error() != 4)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            svc_rearmxprt_cold_2();
          }
          break;
        }
      }
      wakeup_kq();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        svc_rearmxprt_cold_1();
      }
      warnx("Trying to re-arm a dead export %p (%d)\n");
    }
  }
}

void svc_unarmxprt(void *a1)
{
  int v1 = 1;
  atomic_compare_exchange_strong((atomic_uchar *volatile)(a1[8] + 572), (unsigned __int8 *)&v1, 0);
  if (v1 != 1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      svc_unarmxprt_cold_2();
    }
    warnx("** OOPS ** fd = %d, xprt = %p ** ALREADY DIS-ARMED **\n", *(_DWORD *)a1, a1);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      svc_unarmxprt_cold_1();
    }
    abort();
  }
}

uint64_t _newrpclib_svc_register(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, int a5)
{
  pthread_rwlock_wrlock(&svc_register_lock);
  unint64_t v10 = (void *)svc_head;
  if (!svc_head)
  {
LABEL_5:
    unsigned int v11 = calloc(1uLL, 0x18uLL);
    if (!v11) {
      goto LABEL_19;
    }
    unint64_t v10 = v11;
    *((_DWORD *)v11 + 2) = a2;
    *((_DWORD *)v11 + 3) = a3;
    uint64_t v12 = 1;
    gid_t v11[2] = a4;
    if (!a5)
    {
LABEL_8:
      if (v12)
      {
        void *v10 = svc_head;
        svc_head = (uint64_t)v10;
      }
      uint64_t v12 = 1;
      goto LABEL_20;
    }
LABEL_7:
    if (!_newrpclib_rpcb_set(**(char ***)(a1 + 64), a2, a3, (char *)(*(void *)(a1 + 64) + 136))
      && (a5 != 17 && a5 != 6 || !_newrpclib_pmap_set(a2, a3, a5, *(unsigned __int16 *)(a1 + 4))))
    {
      if (!v12) {
        goto LABEL_20;
      }
      free(v10);
LABEL_19:
      uint64_t v12 = 0;
      goto LABEL_20;
    }
    goto LABEL_8;
  }
  while (*((_DWORD *)v10 + 2) != a2 || *((_DWORD *)v10 + 3) != a3)
  {
    unint64_t v10 = (void *)*v10;
    if (!v10) {
      goto LABEL_5;
    }
  }
  uint64_t v12 = 0;
  if (v10[2] == a4)
  {
    uint64_t v12 = 0;
    if (!a5) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_20:
  pthread_rwlock_unlock(&svc_register_lock);
  return v12;
}

uint64_t _newrpclib_svc_unregister(int a1, int a2)
{
  pthread_rwlock_wrlock(&svc_register_lock);
  int v4 = (uint64_t *)svc_head;
  if (svc_head)
  {
    BOOL v5 = 0;
    while (1)
    {
      int v6 = v4;
      if (*((_DWORD *)v4 + 2) == a1 && *((_DWORD *)v4 + 3) == a2) {
        break;
      }
      int v4 = (uint64_t *)*v4;
      BOOL v5 = v6;
      if (!*v6) {
        goto LABEL_10;
      }
    }
    if (!v5) {
      BOOL v5 = &svc_head;
    }
    *BOOL v5 = *v4;
    free(v4);
    _newrpclib_pmap_unset(a1, a2);
  }
LABEL_10:
  return pthread_rwlock_unlock(&svc_register_lock);
}

void *svc_get_thread_req()
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_key_t v0 = SVC_REQ_KEY;
  return pthread_getspecific(v0);
}

uint64_t create_svc_req_key()
{
  return pthread_key_create((pthread_key_t *)&SVC_REQ_KEY, 0);
}

void *svc_req_clone(void *a1)
{
  char v2 = calloc(1uLL, 0x2F0uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    memcpy(v2, a1, 0x2F0uLL);
    int v4 = calloc(1uLL, 0x28uLL);
    v3[5] = v4;
    if (!v4)
    {
LABEL_15:
      free(v3);
      return 0;
    }
    BOOL v5 = (long long *)a1[5];
    long long v6 = *v5;
    long long v7 = v5[1];
    v4[4] = *((void *)v5 + 4);
    *(_OWORD *)int v4 = v6;
    *((_OWORD *)v4 + 1) = v7;
    uint64_t v8 = v3[5];
    *(void *)(v8 + 8) = 0;
    *(void *)(v8 + 32) = 0;
    uint64_t v9 = a1[5];
    uint64_t v10 = *(unsigned int *)(v9 + 24);
    if (v10)
    {
      unsigned int v11 = calloc(1uLL, 4 * v10);
      uint64_t v12 = v3[5];
      *(void *)(v12 + 32) = v11;
      if (!v11)
      {
LABEL_10:
        if (*(void *)(v12 + 8))
        {
          free(*(void **)(v12 + 8));
          uint64_t v12 = v3[5];
        }
        if (*(_DWORD *)(v12 + 24))
        {
          free(*(void **)(v12 + 32));
          uint64_t v12 = v3[5];
        }
        free((void *)v12);
        goto LABEL_15;
      }
      memcpy(v11, *(const void **)(a1[5] + 32), 4 * *(unsigned int *)(a1[5] + 24));
      uint64_t v9 = a1[5];
    }
    uint64_t v13 = *(const char **)(v9 + 8);
    if (!v13)
    {
LABEL_9:
      xprt_ref(v3[6]);
      return v3;
    }
    size_t v14 = strlen(v13) + 1;
    int v15 = calloc(1uLL, v14);
    uint64_t v12 = v3[5];
    *(void *)(v12 + 8) = v15;
    if (v15)
    {
      memcpy(v15, *(const void **)(a1[5] + 8), v14);
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  return v3;
}

void svc_req_destroy(void *a1)
{
  xprt_unref(a1[6]);
  uint64_t v2 = a1[5];
  if (v2)
  {
    if (*(void *)(v2 + 8))
    {
      free(*(void **)(v2 + 8));
      uint64_t v2 = a1[5];
    }
    if (*(_DWORD *)(v2 + 24))
    {
      free(*(void **)(v2 + 32));
      uint64_t v2 = a1[5];
    }
    free((void *)v2);
  }
  free(a1);
}

_DWORD *_newrpclib_svc_sendreply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  ssize_t result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v8, 0, sizeof(v8));
    long long v9 = 0u;
    long long v10 = 0u;
    int v6 = result[78];
    int v7 = 1;
    *(_OWORD *)((char *)v8 + 8) = *((_OWORD *)result + 45);
    *((void *)&v8[1] + 1) = *((void *)result + 92);
    *((void *)&v9 + 1) = a3;
    *(void *)&long long v10 = a2;
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)(*((void *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svc_reqsendreply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v10, 0, sizeof(v10));
  long long v11 = 0u;
  long long v12 = 0u;
  int v8 = *(_DWORD *)(a1 + 312);
  int v9 = 1;
  *(_OWORD *)((char *)v10 + 8) = *(_OWORD *)(a1 + 720);
  *((void *)&v10[1] + 1) = *(void *)(a1 + 736);
  *((void *)&v11 + 1) = a3;
  *(void *)&long long v12 = a2;
  uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, 0);
  return v6;
}

_DWORD *_newrpclib_svcerr_noproc()
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  ssize_t result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v3, 0, sizeof(v3));
    long long v4 = 0u;
    long long v5 = 0u;
    int v1 = result[78];
    int v2 = 1;
    *(_OWORD *)((char *)v3 + 8) = *((_OWORD *)result + 45);
    *((void *)&v3[1] + 1) = *((void *)result + 92);
    LODWORD(v4) = 3;
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)(*((void *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqnoproc(uint64_t a1)
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v5, 0, sizeof(v5));
  long long v6 = 0u;
  long long v7 = 0u;
  int v3 = *(_DWORD *)(a1 + 312);
  int v4 = 1;
  *(_OWORD *)((char *)v5 + 8) = *(_OWORD *)(a1 + 720);
  *((void *)&v5[1] + 1) = *(void *)(a1 + 736);
  LODWORD(v6) = 3;
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

_DWORD *_newrpclib_svcerr_decode()
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  ssize_t result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v3, 0, sizeof(v3));
    long long v4 = 0u;
    long long v5 = 0u;
    int v1 = result[78];
    int v2 = 1;
    *(_OWORD *)((char *)v3 + 8) = *((_OWORD *)result + 45);
    *((void *)&v3[1] + 1) = *((void *)result + 92);
    LODWORD(v4) = 4;
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)(*((void *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqdecode(uint64_t a1)
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v5, 0, sizeof(v5));
  long long v6 = 0u;
  long long v7 = 0u;
  int v3 = *(_DWORD *)(a1 + 312);
  int v4 = 1;
  *(_OWORD *)((char *)v5 + 8) = *(_OWORD *)(a1 + 720);
  *((void *)&v5[1] + 1) = *(void *)(a1 + 736);
  LODWORD(v6) = 4;
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

_DWORD *_newrpclib_svcerr_systemerr()
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  ssize_t result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v3, 0, sizeof(v3));
    long long v4 = 0u;
    long long v5 = 0u;
    int v1 = result[78];
    int v2 = 1;
    *(_OWORD *)((char *)v3 + 8) = *((_OWORD *)result + 45);
    *((void *)&v3[1] + 1) = *((void *)result + 92);
    LODWORD(v4) = 5;
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)(*((void *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqsystemerr(uint64_t a1)
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v5, 0, sizeof(v5));
  long long v6 = 0u;
  long long v7 = 0u;
  int v3 = *(_DWORD *)(a1 + 312);
  int v4 = 1;
  *(_OWORD *)((char *)v5 + 8) = *(_OWORD *)(a1 + 720);
  *((void *)&v5[1] + 1) = *(void *)(a1 + 736);
  LODWORD(v6) = 5;
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

_DWORD *_newrpclib_svcerr_auth(uint64_t a1, int a2)
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  ssize_t result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    *(_OWORD *)&_OWORD v5[4] = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    int v4 = result[78];
    *(void *)long long v5 = 0x100000001;
    *(_DWORD *)&v5[12] = 1;
    *(_DWORD *)&v5[16] = a2;
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)(*((void *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqauth(uint64_t a1, int a2)
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  *(_OWORD *)&v6[4] = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  int v5 = *(_DWORD *)(a1 + 312);
  *(void *)long long v6 = 0x100000001;
  *(_DWORD *)&v6[12] = 1;
  *(_DWORD *)&char v6[16] = a2;
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

_DWORD *_newrpclib_svcerr_weakauth(uint64_t a1)
{
  return _newrpclib_svcerr_auth(a1, 5);
}

uint64_t _newrpclib_svcerr_reqweakauth(uint64_t a1)
{
  return _newrpclib_svcerr_reqauth(a1, 5);
}

_DWORD *_newrpclib_svcerr_noprog()
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  ssize_t result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v3, 0, sizeof(v3));
    long long v4 = 0u;
    long long v5 = 0u;
    int v1 = result[78];
    int v2 = 1;
    *(_OWORD *)((char *)v3 + 8) = *((_OWORD *)result + 45);
    *((void *)&v3[1] + 1) = *((void *)result + 92);
    LODWORD(v4) = 1;
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)(*((void *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqnoprog(uint64_t a1)
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v5, 0, sizeof(v5));
  long long v6 = 0u;
  long long v7 = 0u;
  int v3 = *(_DWORD *)(a1 + 312);
  int v4 = 1;
  *(_OWORD *)((char *)v5 + 8) = *(_OWORD *)(a1 + 720);
  *((void *)&v5[1] + 1) = *(void *)(a1 + 736);
  LODWORD(v6) = 3;
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

_DWORD *_newrpclib_svcerr_progvers(uint64_t a1, unsigned int a2, unsigned int a3)
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  ssize_t result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v8, 0, sizeof(v8));
    long long v9 = 0u;
    long long v10 = 0u;
    int v6 = result[78];
    int v7 = 1;
    *(_OWORD *)((char *)v8 + 8) = *((_OWORD *)result + 45);
    *((void *)&v8[1] + 1) = *((void *)result + 92);
    LODWORD(v9) = 2;
    *((void *)&v9 + 1) = __PAIR64__(a3, a2);
    return (_DWORD *)(*(uint64_t (**)(void))(*(void *)(*((void *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqprogvers(uint64_t a1, unsigned int a2, unsigned int a3)
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v9, 0, sizeof(v9));
  long long v10 = 0u;
  long long v11 = 0u;
  int v7 = *(_DWORD *)(a1 + 312);
  int v8 = 1;
  *(_OWORD *)((char *)v9 + 8) = *(_OWORD *)(a1 + 720);
  *((void *)&v9[1] + 1) = *(void *)(a1 + 736);
  LODWORD(v10) = 2;
  *((void *)&v10 + 1) = __PAIR64__(a3, a2);
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

uint64_t _newrpclib_svc_getsomerequests(uint64_t a1, int a2)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  bzero(v38, 0x4B0uLL);
  unint64_t v4 = 0x268B95000uLL;
  while (1)
  {
    bzero(&v41, 0x2F0uLL);
    uint64_t v35 = 0;
    uint64_t v36 = &v39;
    uint64_t v37 = 0;
    memset(v34, 0, 32);
    *(_OWORD *)&v34[32] = (unint64_t)v38;
    long long v45 = &v40;
    pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
    pthread_setspecific(*(void *)(v4 + 3712), &v41);
    if (!(**(unsigned int (***)(uint64_t, unsigned char *))(a1 + 8))(a1, v34)) {
      goto LABEL_26;
    }
    uint64_t v41 = *(void *)&v34[12];
    int v42 = *(_DWORD *)&v34[20];
    uint64_t v44 = *(void *)&v34[40];
    long long v43 = *(_OWORD *)&v34[24];
    int v63 = *(_DWORD *)v34;
    uint64_t v46 = a1;
    uint64_t v5 = *(void *)(a1 + 64);
    long long v6 = *(_OWORD *)(v5 + 72);
    long long v7 = *(_OWORD *)(v5 + 88);
    long long v8 = *(_OWORD *)(v5 + 120);
    long long v53 = *(_OWORD *)(v5 + 104);
    long long v54 = v8;
    long long v52 = v7;
    long long v9 = *(_OWORD *)(v5 + 24);
    long long v10 = *(_OWORD *)(v5 + 8);
    long long v11 = *(_OWORD *)(v5 + 56);
    long long v49 = *(_OWORD *)(v5 + 40);
    long long v50 = v11;
    long long v47 = v10;
    long long v48 = v9;
    long long v51 = v6;
    long long v12 = *(_OWORD *)(v5 + 136);
    long long v13 = *(_OWORD *)(v5 + 152);
    long long v14 = *(_OWORD *)(v5 + 184);
    long long v57 = *(_OWORD *)(v5 + 168);
    long long v58 = v14;
    long long v55 = v12;
    long long v56 = v13;
    long long v15 = *(_OWORD *)(v5 + 200);
    long long v16 = *(_OWORD *)(v5 + 216);
    long long v17 = *(_OWORD *)(v5 + 248);
    long long v61 = *(_OWORD *)(v5 + 232);
    long long v62 = v17;
    long long v59 = v15;
    long long v60 = v16;
    unsigned int v64 = 2;
    int v65 = 2 * (a2 == 1);
    uint64_t v18 = _newrpclib__authenticate((uint64_t)&v41, (uint64_t)v34);
    if (v18)
    {
      int v19 = v18;
      uint64_t v20 = *(void *)(a1 + 64);
      if ((*(unsigned char *)(v20 + 328) & 4) != 0) {
        uint64_t v18 = pthread_mutex_unlock((pthread_mutex_t *)(v20 + 392));
      }
      _newrpclib_svcerr_auth(v18, v19);
      goto LABEL_26;
    }
    int v21 = v41;
    int v22 = HIDWORD(v41);
    pthread_rwlock_rdlock(&svc_register_lock);
    uint64_t v23 = svc_head;
    if (!svc_head)
    {
      int v24 = 0;
      unsigned int v25 = 0;
      unsigned int v26 = -1;
LABEL_19:
      pthread_rwlock_unlock(&svc_register_lock);
      goto LABEL_20;
    }
    int v24 = 0;
    unsigned int v25 = 0;
    unsigned int v26 = -1;
    while (*(_DWORD *)(v23 + 8) != v21)
    {
LABEL_16:
      uint64_t v23 = *(void *)v23;
      if (!v23) {
        goto LABEL_19;
      }
    }
    unsigned int v27 = *(_DWORD *)(v23 + 12);
    if (v27 != v22)
    {
      if (v27 < v26) {
        unsigned int v26 = *(_DWORD *)(v23 + 12);
      }
      if (v27 > v25) {
        unsigned int v25 = *(_DWORD *)(v23 + 12);
      }
      int v24 = 1;
      goto LABEL_16;
    }
    long long v31 = *(void (**)(uint64_t *, uint64_t))(v23 + 16);
    pthread_rwlock_unlock(&svc_register_lock);
    if (!v31)
    {
      int v24 = 1;
LABEL_20:
      uint64_t v28 = *(void *)(a1 + 64);
      if ((*(unsigned char *)(v28 + 328) & 4) != 0) {
        pthread_mutex_unlock((pthread_mutex_t *)(v28 + 392));
      }
      if (v24) {
        _newrpclib_svcerr_reqprogvers((uint64_t)&v41, v26, v25);
      }
      else {
        _newrpclib_svcerr_reqnoprog((uint64_t)&v41);
      }
      unint64_t v4 = 0x268B95000uLL;
      goto LABEL_26;
    }
    v31(&v41, a1);
    uint64_t v32 = *(void *)(a1 + 64);
    unint64_t v4 = 0x268B95000;
    if ((*(unsigned char *)(v32 + 328) & 4) != 0 && (v65 & 1) == 0) {
      pthread_mutex_unlock((pthread_mutex_t *)(v32 + 392));
    }
LABEL_26:
    uint64_t v29 = v64;
    if (!v64) {
      break;
    }
    char v30 = v65;
    if ((v65 & 1) == 0)
    {
      v65 |= 1u;
      if ((v30 & 2) != 0) {
        svc_rearmxprt((int *)a1, v64 == 1);
      }
    }
    if (!--a2 || v29 != 1)
    {
      if (a2) {
        svc_rearmxprt((int *)a1, v29 == 1);
      }
      break;
    }
  }
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(*(void *)(v4 + 3712), 0);
  xprt_unref(a1);
  return v29;
}

void _newrpclib_svc_enable_localaddr(uint64_t a1)
{
  int v7 = 0;
  int v8 = 1;
  uint64_t v2 = a1 + 64;
  int v3 = **(char ***)(a1 + 64);
  int v6 = 0;
  if (_newrpclib_netid2socparms(v3, &v7, 0, &v6, 0))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      _newrpclib_svc_enable_localaddr_cold_3();
    }
    return;
  }
  if (v7 == 2)
  {
    int v5 = 0;
    int v4 = 26;
    goto LABEL_8;
  }
  if (v7 == 30)
  {
    int v4 = 61;
    int v5 = 41;
LABEL_8:
    if (v6 == 17 && setsockopt(*(_DWORD *)a1, v5, v4, &v8, 4u))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _newrpclib_svc_enable_localaddr_cold_2();
      }
    }
    else
    {
      *(_DWORD *)(*(void *)v2 + 328) |= 0x10u;
    }
    return;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    _newrpclib_svc_enable_localaddr_cold_1();
  }
}

uint64_t _newrpclib_svc_getnetid(uint64_t a1)
{
  return **(void **)(a1 + 64);
}

uint64_t _newrpclib_svc_getcaller_sa(uint64_t a1)
{
  return *(void *)(a1 + 64) + 8;
}

uint64_t _newrpclib_svc_getcallee_sa(uint64_t a1)
{
  return *(void *)(a1 + 64) + 136;
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Cu);
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t _newrpclib_xdr_array(uint64_t (***a1)(void), void **a2, int *a3, unsigned int a4, unsigned int a5, uint64_t (*a6)(uint64_t (***)(void), char *))
{
  long long v12 = (char *)*a2;
  if (!_newrpclib_xdr_u_int(a1, a3)) {
    return 0;
  }
  unsigned int v13 = *a3;
  if ((v13 > a4 || ((a5 * (unint64_t)v13) & 0xFFFFFFFF00000000) != 0) && *(_DWORD *)a1 != 2) {
    return 0;
  }
  if (v12) {
    goto LABEL_6;
  }
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (*(_DWORD *)a1 == 1)
  {
    if (v13)
    {
      uint64_t v18 = (char *)calloc(1uLL, v13 * a5);
      *a2 = v18;
      if (v18)
      {
        long long v12 = v18;
        bzero(v18, v13 * a5);
LABEL_7:
        uint64_t v14 = a5;
        unsigned int v15 = 1;
        do
        {
          uint64_t v16 = a6(a1, v12);
          uint64_t v17 = v16;
          if (v15 >= v13) {
            break;
          }
          v12 += v14;
          ++v15;
        }
        while (v16);
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _newrpclib_xdr_array_cold_1();
      }
      return 0;
    }
    return 1;
  }
LABEL_6:
  if (v13) {
    goto LABEL_7;
  }
  uint64_t v17 = 1;
LABEL_17:
  if (*(_DWORD *)a1 == 2)
  {
    free(*a2);
    *a2 = 0;
  }
  return v17;
}

uint64_t _newrpclib_xdr_vector(uint64_t a1, uint64_t a2, int a3, unsigned int a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  if (!a3) {
    return 1;
  }
  int v6 = a3;
  uint64_t v9 = a4;
  while (1)
  {
    uint64_t result = a5(a1, a2);
    if (!result) {
      break;
    }
    a2 += v9;
    if (!--v6) {
      return 1;
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_float(uint64_t (***a1)(void), int *a2)
{
  int v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v2 == 1)
  {
    int v6 = 0;
    uint64_t result = (*a1[1])();
    if (!result) {
      return result;
    }
    *a2 = v6;
    return 1;
  }
  if (v2) {
    return 0;
  }
  int v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_double(int *a1, int *a2)
{
  int v2 = *a1;
  if (*a1 == 2) {
    return 1;
  }
  if (v2 != 1)
  {
    if (v2) {
      return 0;
    }
    int v6 = a2[1];
    uint64_t result = (*(uint64_t (**)(int *, int *))(*((void *)a1 + 1) + 8))(a1, &v6);
    if (result)
    {
      int v6 = *a2;
      return (*(uint64_t (**)(int *, int *))(*((void *)a1 + 1) + 8))(a1, &v6);
    }
    return result;
  }
  int v6 = 0;
  uint64_t result = (**((uint64_t (***)(int *, int *))a1 + 1))(a1, &v6);
  if (result)
  {
    a2[1] = v6;
    int v6 = 0;
    uint64_t result = (**((uint64_t (***)(int *, int *))a1 + 1))(a1, &v6);
    if (result)
    {
      *a2 = v6;
      return 1;
    }
  }
  return result;
}

uint64_t _newrpclib_xdrmem_create(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(_DWORD *)uint64_t result = a4;
  int v4 = xdrmem_ops_unaligned;
  if ((a2 & 3) == 0) {
    int v4 = xdrmem_ops_aligned;
  }
  *(void *)(result + 8) = v4;
  *(void *)(result + 24) = a2;
  *(void *)(result + 32) = a2;
  *(_DWORD *)(result + 40) = a3;
  return result;
}

uint64_t xdrmem_getrecord(int *a1, uint64_t *a2, int *a3)
{
  *a2 = 0;
  *a3 = 0;
  size_t v4 = a1[10];
  if (!v4) {
    return 1;
  }
  uint64_t result = (uint64_t)calloc(1uLL, v4);
  *a2 = result;
  if (result)
  {
    int v8 = a1[10];
    *a3 = v8;
    return _newrpclib_xdr_opaque(a1, result, v8);
  }
  return result;
}

BOOL xdr_is_memstream(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (***)())(a1 + 8);
  return v1 == xdrmem_ops_aligned || v1 == xdrmem_ops_unaligned;
}

uint64_t xdrmem_getlong_unaligned(uint64_t a1, _DWORD *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = v2 >= 4;
  unsigned int v4 = v2 - 4;
  if (!v3) {
    return 0;
  }
  *(_DWORD *)(a1 + 40) = v4;
  int v6 = *(unsigned int **)(a1 + 24);
  *a2 = bswap32(*v6);
  *(void *)(a1 + 24) = v6 + 1;
  return 1;
}

uint64_t xdrmem_putlong_unaligned(uint64_t a1, unsigned int *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = v2 >= 4;
  unsigned int v4 = v2 - 4;
  if (!v3) {
    return 0;
  }
  *(_DWORD *)(a1 + 40) = v4;
  **(_DWORD **)(a1 + 24) = bswap32(*a2);
  *(void *)(a1 + 24) += 4;
  return 1;
}

uint64_t xdrmem_getbytes(uint64_t a1, void *__dst, size_t __len)
{
  unsigned int v3 = *(_DWORD *)(a1 + 40);
  BOOL v4 = v3 >= __len;
  int v5 = v3 - __len;
  if (!v4) {
    return 0;
  }
  unsigned int v7 = __len;
  *(_DWORD *)(a1 + 40) = v5;
  memmove(__dst, *(const void **)(a1 + 24), __len);
  *(void *)(a1 + 24) += v7;
  return 1;
}

uint64_t xdrmem_putbytes(uint64_t a1, const void *a2, size_t __len)
{
  unsigned int v3 = *(_DWORD *)(a1 + 40);
  BOOL v4 = v3 >= __len;
  int v5 = v3 - __len;
  if (!v4) {
    return 0;
  }
  unsigned int v7 = __len;
  *(_DWORD *)(a1 + 40) = v5;
  memmove(*(void **)(a1 + 24), a2, __len);
  *(void *)(a1 + 24) += v7;
  return 1;
}

uint64_t xdrmem_getpos(uint64_t a1)
{
  if ((uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 32)) >= 0xFFFFFFFFLL) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *(void *)(a1 + 24) - *(void *)(a1 + 32);
  }
}

uint64_t xdrmem_setpos(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 32) + a2;
  unint64_t v3 = *(void *)(a1 + 24) + *(unsigned int *)(a1 + 40);
  if (v2 > v3) {
    return 0;
  }
  *(void *)(a1 + 24) = v2;
  uint64_t v4 = v3 - v2;
  if (v4 > 0xFFFFFFFFLL) {
    return 0;
  }
  *(_DWORD *)(a1 + 40) = v4;
  return 1;
}

uint64_t xdrmem_inline_unaligned()
{
  return 0;
}

uint64_t xdrmem_getlong_aligned(uint64_t a1, _DWORD *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = v2 >= 4;
  unsigned int v4 = v2 - 4;
  if (!v3) {
    return 0;
  }
  *(_DWORD *)(a1 + 40) = v4;
  int v6 = *(unsigned int **)(a1 + 24);
  *a2 = bswap32(*v6);
  *(void *)(a1 + 24) = v6 + 1;
  return 1;
}

uint64_t xdrmem_putlong_aligned(uint64_t a1, unsigned int *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = v2 >= 4;
  unsigned int v4 = v2 - 4;
  if (!v3) {
    return 0;
  }
  *(_DWORD *)(a1 + 40) = v4;
  int v6 = *(_DWORD **)(a1 + 24);
  *int v6 = bswap32(*a2);
  *(void *)(a1 + 24) = v6 + 1;
  return 1;
}

uint64_t xdrmem_inline_aligned(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = v2 >= a2;
  unsigned int v4 = v2 - a2;
  if (!v3) {
    return 0;
  }
  *(_DWORD *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v5 + a2;
  return v5;
}

uint64_t xdrrec_getlong(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  unsigned int v4 = *(unsigned int **)(v3 + 80);
  unsigned int __dst = 0;
  if (*(_DWORD *)(v3 + 96) < 4u || (uint64_t)(*(void *)(v3 + 88) - (void)v4) < 4)
  {
    uint64_t result = xdrrec_getbytes(a1, (char *)&__dst, 4u);
    if (!result) {
      return result;
    }
    *a2 = bswap32(__dst);
  }
  else
  {
    *a2 = bswap32(*v4);
    *(_DWORD *)(v3 + 96) -= 4;
    *(void *)(v3 + 80) = v4 + 1;
  }
  return 1;
}

uint64_t xdrrec_putlong(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  unsigned int v4 = *(_DWORD **)(v3 + 24);
  unint64_t v5 = *(void *)(v3 + 32);
  *(void *)(v3 + 24) = v4 + 1;
  if ((unint64_t)(v4 + 1) > v5)
  {
    *(void *)(v3 + 24) = v4;
    *(_DWORD *)(v3 + 48) = 1;
    uint64_t result = flush_out(v3, 0);
    if (!result) {
      return result;
    }
    unsigned int v4 = *(_DWORD **)(v3 + 24);
    *(void *)(v3 + 24) = v4 + 1;
  }
  *unsigned int v4 = bswap32(*a2);
  return 1;
}

uint64_t xdrrec_getbytes(uint64_t a1, char *__dst, unsigned int a3)
{
  if (!a3) {
    return 1;
  }
  unsigned int v3 = a3;
  unint64_t v5 = *(_DWORD **)(a1 + 24);
  while (1)
  {
    while (1)
    {
      unsigned int v6 = v5[24];
      if (!v6) {
        break;
      }
      if (v3 >= v6) {
        size_t v8 = v6;
      }
      else {
        size_t v8 = v3;
      }
      uint64_t result = get_input_bytes((uint64_t)v5, __dst, v8);
      if (result)
      {
        __dst += v8;
        v5[24] -= v8;
        uint64_t result = 1;
        v3 -= v8;
        if (v3) {
          continue;
        }
      }
      return result;
    }
    if (v5[25]) {
      break;
    }
    uint64_t result = set_input_fragment(v5);
    if (!result) {
      return result;
    }
  }
  return 0;
}

uint64_t xdrrec_putbytes(uint64_t a1, char *__src, unsigned int a3)
{
  uint64_t v3 = 1;
  if (a3)
  {
    unsigned int v4 = a3;
    uint64_t v6 = *(void *)(a1 + 24);
    while (1)
    {
      unsigned int v7 = *(void **)(v6 + 24);
      size_t v8 = *(void *)(v6 + 32) - (void)v7 >= (unint64_t)v4 ? v4 : *(void *)(v6 + 32) - (void)v7;
      memmove(v7, __src, v8);
      uint64_t v9 = *(void *)(v6 + 32);
      size_t v10 = *(void *)(v6 + 24) + v8;
      *(void *)(v6 + 24) = v10;
      if (v10 == v9)
      {
        *(_DWORD *)(v6 + 48) = 1;
        if (!flush_out(v6, 0)) {
          break;
        }
      }
      __src += v8;
      v4 -= v8;
      if (!v4) {
        return 1;
      }
    }
    return 0;
  }
  return v3;
}

off_t xdrrec_getpos(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  off_t result = lseek(**(_DWORD **)v2, 0, 1);
  if (result != -1)
  {
    if (*(_DWORD *)a1 == 1)
    {
      return result - *(void *)(v2 + 88) + *(void *)(v2 + 80);
    }
    else if (*(_DWORD *)a1)
    {
      return -1;
    }
    else
    {
      return result + *(void *)(v2 + 24) - *(void *)(v2 + 16);
    }
  }
  return result;
}

uint64_t xdrrec_setpos(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  int v5 = xdrrec_getpos(a1);
  if (v5 == -1) {
    return 0;
  }
  int v6 = v5 - a2;
  if (*(_DWORD *)a1 == 1)
  {
    int v8 = *(_DWORD *)(v4 + 96);
    BOOL v9 = __OFSUB__(v8, v6);
    int v10 = v8 - v6;
    if (!((v10 < 0) ^ v9 | (v10 == 0)))
    {
      unint64_t v11 = *(void *)(v4 + 80) - v6;
      if (v11 <= *(void *)(v4 + 88) && v11 >= *(void *)(v4 + 72))
      {
        *(void *)(v4 + 80) = v11;
        *(_DWORD *)(v4 + 96) = v10;
        return 1;
      }
    }
    return 0;
  }
  if (*(_DWORD *)a1) {
    return 0;
  }
  unint64_t v7 = *(void *)(v4 + 24) - v6;
  if (v7 <= *(void *)(v4 + 40) || v7 >= *(void *)(v4 + 32)) {
    return 0;
  }
  *(void *)(v4 + 24) = v7;
  return 1;
}

uint64_t xdrrec_inline(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (*(_DWORD *)a1 != 1)
  {
    if (!*(_DWORD *)a1)
    {
      uint64_t result = *(void *)(v2 + 24);
      unint64_t v4 = result + a2;
      if (v4 <= *(void *)(v2 + 32))
      {
        *(void *)(v2 + 24) = v4;
        return result;
      }
    }
    return 0;
  }
  unsigned int v5 = *(_DWORD *)(v2 + 96);
  BOOL v6 = v5 >= a2;
  unsigned int v7 = v5 - a2;
  if (!v6) {
    return 0;
  }
  uint64_t result = *(void *)(v2 + 80);
  unint64_t v8 = result + a2;
  if (v8 > *(void *)(v2 + 88)) {
    return 0;
  }
  *(_DWORD *)(v2 + 96) = v7;
  *(void *)(v2 + 80) = v8;
  return result;
}

void xdrrec_destroy(uint64_t a1)
{
  uint64_t v1 = *(void ***)(a1 + 24);
  free(v1[2]);
  free(v1[9]);
  free(v1);
}

void _newrpclib_xdrrec_create(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  long long v12 = (char *)calloc(1uLL, 0x98uLL);
  if (v12)
  {
    unsigned int v13 = v12;
    if (a2 >= 0x64) {
      size_t v14 = (a2 + 3) & 0xFFFFFFFC;
    }
    else {
      size_t v14 = 4000;
    }
    *((_DWORD *)v12 + 26) = v14;
    unsigned int v15 = calloc(1uLL, v14);
    *((void *)v13 + 2) = v15;
    if (v15)
    {
      if (a3 >= 0x64) {
        size_t v16 = (a3 + 3) & 0xFFFFFFFC;
      }
      else {
        size_t v16 = 4000;
      }
      *((_DWORD *)v13 + 27) = v16;
      uint64_t v17 = (char *)calloc(1uLL, v16);
      *((void *)v13 + 9) = v17;
      if (v17)
      {
        *(void *)(a1 + 8) = xdrrec_ops;
        *(void *)(a1 + 24) = v13;
        *(void *)unsigned int v13 = a4;
        *((void *)v13 + 1) = a6;
        uint64_t v18 = *((void *)v13 + 2);
        *((void *)v13 + 5) = v18;
        *((void *)v13 + 3) = v18 + 4;
        *((void *)v13 + 4) = v18 + v14;
        *((_DWORD *)v13 + 12) = 0;
        *((void *)v13 + 7) = a5;
        *((void *)v13 + 8) = v16;
        *((void *)v13 + 10) = &v17[v16];
        *((void *)v13 + 11) = &v17[v16];
        *((void *)v13 + 12) = 0x100000000;
        *((void *)v13 + 16) = v13 + 120;
        *((void *)v13 + 14) = 0;
        *((void *)v13 + 17) = 0;
        *((_DWORD *)v13 + 36) = 0;
        return;
      }
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _newrpclib_xdrrec_create_cold_3();
      }
      free(*((void **)v13 + 2));
    }
    else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      _newrpclib_xdrrec_create_cold_2();
    }
    free(v13);
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    _newrpclib_xdrrec_create_cold_1();
  }
}

BOOL xdrrec_isrecordstart(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 24);
  int v2 = *(_DWORD *)(v1 + 96);
  if (!v2 && *(_DWORD *)(v1 + 100)) {
    return *(_DWORD *)(v1 + 100) != 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    if (*(_DWORD *)(v1 + 100)) {
      unint64_t v4 = "true";
    }
    else {
      unint64_t v4 = "false";
    }
    *(_DWORD *)buf = 136316162;
    unsigned int v7 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/xdr_rec.c";
    __int16 v8 = 1024;
    int v9 = 457;
    __int16 v10 = 2080;
    unint64_t v11 = "xdrrec_isrecordstart";
    __int16 v12 = 1024;
    int v13 = v2;
    __int16 v14 = 2080;
    unsigned int v15 = v4;
    _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, Exptected to be at record start. Fbtbc = %d last fragment = %s\n\n", buf, 0x2Cu);
    int v2 = *(_DWORD *)(v1 + 96);
  }
  unsigned int v5 = *(_DWORD *)(v1 + 100) ? "true" : "false";
  warnx("Exptected to be at record start. Fbtbc = %d last fragment = %s\n\n", v2, v5);
  return !*(_DWORD *)(v1 + 96) && *(_DWORD *)(v1 + 100) != 0;
}

uint64_t _newrpclib_xdrrec_skiprecord(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 24);
  if (!*((_DWORD *)v1 + 28))
  {
    while (1)
    {
      unsigned int v7 = *((_DWORD *)v1 + 24);
      if (!v7)
      {
        if (*((_DWORD *)v1 + 25)) {
          break;
        }
      }
      uint64_t result = skip_input_bytes((uint64_t)v1, v7);
      if (result)
      {
        *((_DWORD *)v1 + 24) = 0;
        if (*((_DWORD *)v1 + 25)) {
          continue;
        }
        uint64_t result = set_input_fragment(v1);
        if (result) {
          continue;
        }
      }
      return result;
    }
    *((_DWORD *)v1 + 25) = 0;
    return 1;
  }
  if (*((_DWORD *)v1 + 29)) {
    goto LABEL_3;
  }
  uint64_t v8 = ((uint64_t (*)(void, void, uint64_t))v1[7])(*v1, v1[16], 4 - *((unsigned int *)v1 + 34));
  if (v8 < 1) {
    return 0;
  }
  v1[16] += v8;
  unsigned int v9 = *((_DWORD *)v1 + 34) + v8;
  *((_DWORD *)v1 + 34) = v9;
  if (v9 < 4) {
    goto LABEL_15;
  }
  unsigned int v10 = bswap32(*((_DWORD *)v1 + 30));
  *((_DWORD *)v1 + 30) = v10;
  unsigned int v11 = v10 & 0x7FFFFFFF;
  if ((v10 & 0x7FFFFFFF) == 0) {
    return 0;
  }
  unsigned int v12 = *((_DWORD *)v1 + 37);
  if (v11 > v12) {
    return 0;
  }
  size_t v13 = *((_DWORD *)v1 + 35) + v11;
  if (v13 > v12) {
    return 0;
  }
  *((_DWORD *)v1 + 35) = v13;
  if (v13 <= *((_DWORD *)v1 + 27))
  {
LABEL_27:
    if ((v10 & 0x80000000) != 0)
    {
      *((_DWORD *)v1 + 30) = v10 & 0x7FFFFFFF;
      *((_DWORD *)v1 + 25) = 1;
    }
LABEL_3:
    uint64_t v2 = ((uint64_t (*)(void, void, void))v1[7])(*v1, v1[9] + *((unsigned int *)v1 + 36), (*((_DWORD *)v1 + 35) - *((_DWORD *)v1 + 36)));
    if (v2 < 1) {
      return 0;
    }
    int v3 = *((_DWORD *)v1 + 35);
    unsigned int v4 = *((_DWORD *)v1 + 36) + v2;
    *((_DWORD *)v1 + 36) = v4;
    if (v4 == v3)
    {
      *((_DWORD *)v1 + 29) = 0;
      v1[16] = v1 + 15;
      *((_DWORD *)v1 + 34) = 0;
      if (*((_DWORD *)v1 + 25))
      {
        uint64_t v5 = v1[9];
        v1[10] = v5;
        v1[11] = v5 + v4;
        *((_DWORD *)v1 + 35) = 0;
        *((_DWORD *)v1 + 36) = 0;
LABEL_17:
        *((_DWORD *)v1 + 24) = 0;
        return 1;
      }
    }
LABEL_15:
    if (v1[10] == v1[11]) {
      goto LABEL_17;
    }
    return 0;
  }
  uint64_t result = realloc_stream((uint64_t)v1, v13);
  if (result)
  {
    unsigned int v10 = *((_DWORD *)v1 + 30);
    goto LABEL_27;
  }
  return result;
}

uint64_t skip_input_bytes(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 1;
  }
  unsigned int v2 = a2;
  do
  {
    while (1)
    {
      uint64_t v4 = *(void *)(a1 + 80);
      LODWORD(v5) = *(_DWORD *)(a1 + 88) - v4;
      if (v5) {
        break;
      }
      uint64_t result = fill_input_buf(a1);
      if (!result) {
        return result;
      }
    }
    if (v2 >= v5) {
      uint64_t v5 = v5;
    }
    else {
      uint64_t v5 = v2;
    }
    *(void *)(a1 + 80) = v4 + v5;
    v2 -= v5;
  }
  while (v2);
  return 1;
}

uint64_t set_input_fragment(_DWORD *a1)
{
  if (a1[28]) {
    return 0;
  }
  unsigned int __dst = 0;
  uint64_t result = get_input_bytes((uint64_t)a1, (char *)&__dst, 4uLL);
  if (result)
  {
    unsigned int v3 = __dst;
    unsigned int v4 = bswap32(__dst);
    a1[25] = v4 >> 31;
    if (v3)
    {
      a1[24] = v4 & 0x7FFFFFFF;
      return 1;
    }
    return 0;
  }
  return result;
}

BOOL _newrpclib_xdrrec_eof(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  while (1)
  {
    unsigned int v2 = *(_DWORD *)(v1 + 96);
    if (!v2)
    {
      if (*(_DWORD *)(v1 + 100)) {
        break;
      }
    }
    if (skip_input_bytes(v1, v2))
    {
      *(_DWORD *)(v1 + 96) = 0;
      if (*(_DWORD *)(v1 + 100) || set_input_fragment((_DWORD *)v1)) {
        continue;
      }
    }
    return 1;
  }
  return *(void *)(v1 + 80) == *(void *)(v1 + 88);
}

uint64_t _newrpclib_xdrrec_endofrecord(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (a2 || *(_DWORD *)(v2 + 48) || (uint64_t v3 = *(void *)(v2 + 24), (unint64_t)(v3 + 4) >= *(void *)(v2 + 32)))
  {
    *(_DWORD *)(v2 + 48) = 0;
    return flush_out(v2, 1);
  }
  else
  {
    **(_DWORD **)(v2 + 40) = bswap32((v3 - *(void *)(v2 + 40) + 2147483644) | 0x80000000);
    *(void *)(v2 + 40) = v3;
    *(void *)(v2 + 24) = v3 + 4;
    return 1;
  }
}

uint64_t flush_out(uint64_t a1, int a2)
{
  int v3 = a2 == 1;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 24);
  **(_DWORD **)(a1 + 40) = bswap32((v5 - *(void *)(a1 + 40) - 4) | (v3 << 31));
  if ((*(uint64_t (**)(void))(a1 + 8))(*(void *)a1) != v5 - v4) {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 24) = v6 + 4;
  return 1;
}

uint64_t xdrrec_getrecord(uint64_t a1, void **a2, unsigned int *a3)
{
  uint64_t result = 0;
  uint64_t v5 = *(_DWORD **)(a1 + 24);
  *a2 = 0;
  *a3 = 0;
  if (*(uint64_t (***)())(a1 + 8) == xdrrec_ops)
  {
    while (1)
    {
      while (1)
      {
        int v8 = v5[24];
        if (!v8) {
          break;
        }
        if (__CFADD__(*a3, v8)) {
          return 0;
        }
        uint64_t result = (uint64_t)reallocf(*a2, *a3 + v8);
        *a2 = (void *)result;
        if (!result) {
          return result;
        }
        if (!get_input_bytes((uint64_t)v5, (char *)(result + *a3), v5[24]))
        {
          free(*a2);
          uint64_t result = 0;
          *a2 = 0;
          return result;
        }
        *a3 += v5[24];
        v5[24] = 0;
      }
      if (v5[25]) {
        break;
      }
      uint64_t result = set_input_fragment(v5);
      if (!result) {
        return result;
      }
    }
    return 1;
  }
  return result;
}

uint64_t get_input_bytes(uint64_t a1, char *__dst, size_t __n)
{
  unsigned int v3 = __n;
  if (*(_DWORD *)(a1 + 112))
  {
    uint64_t v6 = *(const void **)(a1 + 80);
    if (*(void *)(a1 + 88) - (void)v6 < (uint64_t)__n) {
      return 0;
    }
    unsigned int v11 = __n;
    memcpy(__dst, v6, __n);
    *(void *)(a1 + 80) += v11;
    return 1;
  }
  if (!__n) {
    return 1;
  }
  do
  {
    while (1)
    {
      int v8 = *(const void **)(a1 + 80);
      unint64_t v9 = *(void *)(a1 + 88) - (void)v8;
      if (v9) {
        break;
      }
      uint64_t result = fill_input_buf(a1);
      if (!result) {
        return result;
      }
    }
    if (v9 >= v3) {
      size_t v10 = v3;
    }
    else {
      size_t v10 = *(void *)(a1 + 88) - (void)v8;
    }
    memmove(__dst, v8, v10);
    *(void *)(a1 + 80) += v10;
    __dst += v10;
    uint64_t result = 1;
    v3 -= v10;
  }
  while (v3);
  return result;
}

BOOL xdr_is_recstream(uint64_t a1)
{
  return *(void *)(a1 + 8) == (void)xdrrec_ops;
}

uint64_t realloc_stream(uint64_t a1, size_t __size)
{
  if (*(_DWORD *)(a1 + 108) < __size)
  {
    int v2 = __size;
    uint64_t v4 = __size;
    uint64_t result = (uint64_t)realloc(*(void **)(a1 + 72), __size);
    if (!result) {
      return result;
    }
    *(void *)(a1 + 80) += result - *(void *)(a1 + 72);
    *(void *)(a1 + 88) = result + v4;
    *(_DWORD *)(a1 + 108) = v2;
    *(void *)(a1 + 64) = v4;
    *(void *)(a1 + 72) = result;
  }
  return 1;
}

uint64_t fill_input_buf(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112)) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 88) & 3;
  uint64_t v3 = *(void *)(a1 + 72) + v2;
  int v4 = (*(uint64_t (**)(void, uint64_t, void))(a1 + 56))(*(void *)a1, v3, *(_DWORD *)(a1 + 64) - (int)v2);
  if (v4 == -1) {
    return 0;
  }
  *(void *)(a1 + 80) = v3;
  *(void *)(a1 + 88) = v3 + v4;
  return 1;
}

uint64_t _newrpclib_xdr_reference(_DWORD *a1, void **a2, size_t __size, uint64_t (*a4)(_DWORD *, void *, size_t))
{
  unsigned int v7 = *a2;
  if (*a2)
  {
LABEL_2:
    uint64_t v8 = a4(a1, v7, __size);
    if (*a1 == 2)
    {
      free(v7);
      *a2 = 0;
    }
    return v8;
  }
  if (*a1 == 2) {
    return 1;
  }
  if (*a1 != 1)
  {
    unsigned int v7 = 0;
    goto LABEL_2;
  }
  size_t v9 = __size;
  size_t v10 = calloc(1uLL, __size);
  *a2 = v10;
  if (v10)
  {
    unsigned int v7 = v10;
    bzero(v10, v9);
    goto LABEL_2;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    _newrpclib_xdr_reference_cold_1();
  }
  return 0;
}

uint64_t _newrpclib_xdr_pointer(uint64_t (***a1)(void), void **a2, size_t a3, uint64_t (*a4)(_DWORD *, void *, size_t))
{
  BOOL v9 = *a2 != 0;
  uint64_t result = _newrpclib_xdr_BOOL(a1, &v9);
  if (result)
  {
    if (v9)
    {
      return _newrpclib_xdr_reference(a1, a2, a3, a4);
    }
    else
    {
      *a2 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_sizeof(uint64_t (*a1)(void *))
{
  long long v5 = 0uLL;
  long long v6 = 0u;
  v4[0] = 0;
  v3[1] = x_putlong;
  v3[3] = x_putbytes;
  v3[6] = x_inline;
  v3[4] = x_getpostn;
  v3[5] = x_setpostn;
  v3[7] = x_destroy;
  v3[8] = 0;
  v3[0] = harmless;
  _OWORD v3[2] = harmless;
  v4[1] = v3;
  *(void *)&long long v6 = 0;
  DWORD2(v6) = 0;
  int v1 = a1(v4);
  if (*((void *)&v5 + 1)) {
    free(*((void **)&v5 + 1));
  }
  if (v1 == 1) {
    return DWORD2(v6);
  }
  else {
    return 0;
  }
}

uint64_t x_putlong(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) += 4;
  return 1;
}

uint64_t x_putbytes(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(a1 + 40) += a3;
  return 1;
}

void *x_inline(uint64_t a1, size_t __size)
{
  if (!__size) {
    return 0;
  }
  if (*(_DWORD *)a1) {
    return 0;
  }
  unsigned int v4 = __size;
  if (*(_DWORD *)(a1 + 32) <= __size)
  {
    long long v5 = *(void **)(a1 + 24);
    if (v5) {
      free(v5);
    }
    uint64_t result = calloc(1uLL, v4);
    *(void *)(a1 + 24) = result;
    if (result)
    {
      *(void *)(a1 + 32) = v4;
      *(_DWORD *)(a1 + 40) += v4;
    }
    else
    {
      *(void *)(a1 + 32) = 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 40) += __size;
    return *(void **)(a1 + 24);
  }
  return result;
}

uint64_t x_getpostn(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t x_setpostn()
{
  return 0;
}

void x_destroy(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) = 0;
  *(void *)(a1 + 32) = 0;
  uint64_t v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 24) = 0;
  }
}

uint64_t harmless()
{
  return 0;
}

uint64_t _newrpclib_xdrstdio_create(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)uint64_t result = a3;
  *(void *)(result + 8) = xdrstdio_ops;
  *(_DWORD *)(result + 40) = 0;
  *(void *)(result + 24) = a2;
  *(void *)(result + 32) = 0;
  return result;
}

uint64_t xdrstdio_getlong(uint64_t a1, _DWORD *a2)
{
  unsigned int __ptr = 0;
  size_t v3 = fread(&__ptr, 4uLL, 1uLL, *(FILE **)(a1 + 24));
  uint64_t result = 0;
  if (v3 == 1)
  {
    *a2 = bswap32(__ptr);
    return 1;
  }
  return result;
}

BOOL xdrstdio_putlong(uint64_t a1, unsigned int *a2)
{
  unsigned int __ptr = bswap32(*a2);
  return fwrite(&__ptr, 4uLL, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

BOOL xdrstdio_getbytes(uint64_t a1, void *__ptr, size_t __size)
{
  return !__size || fread(__ptr, __size, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

BOOL xdrstdio_putbytes(uint64_t a1, void *__ptr, size_t __size)
{
  return !__size || fwrite(__ptr, __size, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

uint64_t xdrstdio_getpos(uint64_t a1)
{
  uint64_t result = MEMORY[0x23ECDA890](*(void *)(a1 + 24));
  if (result >= 0xFFFFFFFFLL) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

BOOL xdrstdio_setpos(uint64_t a1, unsigned int a2)
{
  return fseek(*(FILE **)(a1 + 24), a2, 0) >= 0;
}

uint64_t xdrstdio_inline()
{
  return 0;
}

uint64_t xdrstdio_destroy(uint64_t a1)
{
  return fflush(*(FILE **)(a1 + 24));
}

uint64_t _newrpclib_xdr_free(uint64_t (*a1)(_OWORD *))
{
  memset(v2, 0, sizeof(v2));
  LODWORD(v2[0]) = 2;
  return a1(v2);
}

uint64_t _newrpclib_xdr_void()
{
  return 1;
}

uint64_t _newrpclib_xdr_int(uint64_t (***a1)(void), int *a2)
{
  int v5 = 0;
  int v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v2 == 1)
  {
    uint64_t result = (*a1[1])();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }
  if (v2) {
    return 0;
  }
  int v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_u_int(uint64_t (***a1)(void), int *a2)
{
  int v5 = 0;
  int v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v2 == 1)
  {
    uint64_t result = (*a1[1])();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }
  if (v2) {
    return 0;
  }
  int v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_long(uint64_t (***a1)(void))
{
  int v1 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v1 == 1) {
    return (*a1[1])();
  }
  if (v1) {
    return 0;
  }
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_u_long(uint64_t (***a1)(void))
{
  int v1 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v1 == 1) {
    return (*a1[1])();
  }
  if (v1) {
    return 0;
  }
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_int32_t(uint64_t (***a1)(void), int *a2)
{
  int v5 = 0;
  int v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v2 == 1)
  {
    uint64_t result = (*a1[1])();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }
  if (v2) {
    return 0;
  }
  int v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_uint32_t(uint64_t (***a1)(void), int *a2)
{
  int v5 = 0;
  int v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v2 == 1)
  {
    uint64_t result = (*a1[1])();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }
  if (v2) {
    return 0;
  }
  int v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_short(uint64_t (***a1)(void), __int16 *a2)
{
  int v5 = 0;
  int v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v2 == 1)
  {
    uint64_t result = (*a1[1])();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }
  if (v2) {
    return 0;
  }
  int v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_u_short(uint64_t (***a1)(void), _WORD *a2)
{
  int v5 = 0;
  int v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v2 == 1)
  {
    uint64_t result = (*a1[1])();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }
  if (v2) {
    return 0;
  }
  int v5 = (unsigned __int16)*a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_int16_t(uint64_t (***a1)(void), __int16 *a2)
{
  int v5 = 0;
  int v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v2 == 1)
  {
    uint64_t result = (*a1[1])();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }
  if (v2) {
    return 0;
  }
  int v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_uint16_t(uint64_t (***a1)(void), _WORD *a2)
{
  int v5 = 0;
  int v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v2 == 1)
  {
    uint64_t result = (*a1[1])();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }
  if (v2) {
    return 0;
  }
  int v5 = (unsigned __int16)*a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_char(uint64_t (***a1)(void), unsigned char *a2)
{
  int v4 = (char)*a2;
  uint64_t result = _newrpclib_xdr_int(a1, &v4);
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t _newrpclib_xdr_u_char(uint64_t (***a1)(void), unsigned char *a2)
{
  int v4 = *a2;
  uint64_t result = _newrpclib_xdr_uint32_t(a1, &v4);
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t _newrpclib_xdr_BOOL(uint64_t (***a1)(void), BOOL *a2)
{
  BOOL v5 = 0;
  int v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2) {
    return 1;
  }
  if (v2 == 1)
  {
    uint64_t result = (*a1[1])();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }
  if (v2) {
    return 0;
  }
  BOOL v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_opaque(int *a1, uint64_t a2, int a3)
{
  if (!a3) {
    return 1;
  }
  int v4 = a3 & 3;
  int v5 = *a1;
  if (!*a1)
  {
    int v10 = (*(uint64_t (**)(int *))(*((void *)a1 + 1) + 24))(a1);
    uint64_t result = v10 != 0;
    if (!v4 || !v10) {
      return result;
    }
    uint64_t v8 = *(uint64_t (**)(int *, void *, void))(*((void *)a1 + 1) + 24);
    BOOL v9 = &xdr_zero;
    goto LABEL_12;
  }
  if (v5 == 2) {
    return 1;
  }
  if (v5 != 1) {
    return 0;
  }
  int v6 = (*(uint64_t (**)(int *))(*((void *)a1 + 1) + 16))(a1);
  uint64_t result = v6 != 0;
  if (v4 && v6)
  {
    uint64_t v8 = *(uint64_t (**)(int *, void *, void))(*((void *)a1 + 1) + 16);
    BOOL v9 = &_newrpclib_xdr_opaque_crud;
LABEL_12:
    return v8(a1, v9, (4 - v4));
  }
  return result;
}

uint64_t _newrpclib_xdr_bytes(uint64_t (***a1)(void), void **a2, int *a3, unsigned int a4)
{
  uint64_t v8 = *a2;
  uint64_t result = _newrpclib_xdr_uint32_t(a1, a3);
  if (result)
  {
    size_t v10 = *a3;
    int v11 = *(_DWORD *)a1;
    if (v10 > a4)
    {
      if (v11 != 2) {
        return 0;
      }
      goto LABEL_14;
    }
    if (v11)
    {
      if (v11 == 2)
      {
LABEL_14:
        if (v8)
        {
          free(v8);
          *a2 = 0;
        }
        return 1;
      }
      if (v11 != 1) {
        return 0;
      }
      if (!v10) {
        return 1;
      }
      if (!v8)
      {
        uint64_t v8 = calloc(1uLL, v10);
        *a2 = v8;
        if (!v8)
        {
          uint64_t result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (!result) {
            return result;
          }
          _newrpclib_xdr_bytes_cold_1();
          return 0;
        }
      }
    }
    return _newrpclib_xdr_opaque((int *)a1, (uint64_t)v8, v10);
  }
  return result;
}

uint64_t xdr_vmbytes(uint64_t (***a1)(void), vm_address_t *a2, int *a3, unsigned int a4)
{
  uint64_t v8 = *a2;
  vm_address_t address = *a2;
  uint64_t result = _newrpclib_xdr_uint32_t(a1, a3);
  if (result)
  {
    vm_size_t v10 = *a3;
    int v11 = *(_DWORD *)a1;
    if (v10 > a4)
    {
      if (v11 != 2) {
        return 0;
      }
      goto LABEL_11;
    }
    if (v11)
    {
      if (v11 == 2)
      {
LABEL_11:
        if (v8)
        {
          MEMORY[0x23ECDADC0](*MEMORY[0x263EF8960], v8, v10);
          *a2 = 0;
        }
        return 1;
      }
      if (v11 != 1) {
        return 0;
      }
      if (!v10) {
        return 1;
      }
      if (!v8)
      {
        if (vm_allocate(*MEMORY[0x263EF8960], &address, v10, 1))
        {
          uint64_t result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (!result) {
            return result;
          }
          xdr_vmbytes_cold_1();
          return 0;
        }
        uint64_t v8 = address;
        *a2 = address;
      }
    }
    return _newrpclib_xdr_opaque((int *)a1, v8, v10);
  }
  return result;
}

uint64_t _newrpclib_xdr_netobj(uint64_t (***a1)(void), uint64_t a2)
{
  return _newrpclib_xdr_bytes(a1, (void **)(a2 + 8), (int *)a2, 0x400u);
}

uint64_t _newrpclib_xdr_union(uint64_t (***a1)(void), _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t (***)(void), uint64_t))
{
  if (!_newrpclib_xdr_long(a1)) {
    return 0;
  }
  vm_size_t v10 = *(uint64_t (**)(uint64_t (***)(void), uint64_t))(a4 + 8);
  if (!v10)
  {
LABEL_8:
    vm_size_t v10 = a5;
    if (a5) {
      goto LABEL_9;
    }
    return 0;
  }
  if (*(_DWORD *)a4 != *a2)
  {
    int v11 = (_DWORD *)(a4 + 24);
    do
    {
      vm_size_t v10 = *(uint64_t (**)(uint64_t (***)(void), uint64_t))v11;
      if (!*(void *)v11) {
        goto LABEL_8;
      }
      int v12 = *(v11 - 2);
      v11 += 4;
    }
    while (v12 != *a2);
  }
LABEL_9:
  return v10(a1, a3);
}

uint64_t _newrpclib_xdr_string(uint64_t (***a1)(void), char **a2, unsigned int a3)
{
  int v6 = *a2;
  unsigned int v11 = 0;
  if (*(_DWORD *)a1)
  {
    if (*(_DWORD *)a1 != 2) {
      goto LABEL_6;
    }
    if (!v6) {
      return 1;
    }
  }
  size_t v7 = strlen(v6);
  if (HIDWORD(v7)) {
    return 0;
  }
  unsigned int v11 = v7;
LABEL_6:
  uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)&v11);
  if (!result) {
    return result;
  }
  uint64_t v9 = v11;
  if (v11 > a3) {
    return 0;
  }
  int v10 = *(_DWORD *)a1;
  if (*(_DWORD *)a1)
  {
    if (v10 != 2)
    {
      if (v10 == 1)
      {
        if (v6 || (int v6 = (char *)calloc(1uLL, v11 + 1), (*a2 = v6) != 0))
        {
          v6[v9] = 0;
          goto LABEL_14;
        }
        uint64_t result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
        if (!result) {
          return result;
        }
        _newrpclib_xdr_string_cold_1();
      }
      return 0;
    }
    free(v6);
    *a2 = 0;
    return 1;
  }
LABEL_14:
  return _newrpclib_xdr_opaque((int *)a1, (uint64_t)v6, v9);
}

uint64_t _newrpclib_xdr_wrapstring(uint64_t (***a1)(void), char **a2)
{
  return _newrpclib_xdr_string(a1, a2, 0xFFFFFFFF);
}

uint64_t _newrpclib_xdr_int64_t(int *a1, unint64_t *a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = 0;
  int v2 = *a1;
  if (*a1 == 2) {
    return 1;
  }
  if (v2 != 1)
  {
    if (v2) {
      return 0;
    }
    v6[0] = __ROR8__(*a2, 32);
    uint64_t result = (*(uint64_t (**)(int *, void *))(*((void *)a1 + 1) + 8))(a1, v6);
    if (result) {
      return (*(uint64_t (**)(int *, char *))(*((void *)a1 + 1) + 8))(a1, (char *)v6 + 4);
    }
    return result;
  }
  uint64_t result = (**((uint64_t (***)(int *, void *))a1 + 1))(a1, v6);
  if (result)
  {
    uint64_t result = (**((uint64_t (***)(int *, char *))a1 + 1))(a1, (char *)v6 + 4);
    if (result)
    {
      *a2 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
      return 1;
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_uint64_t(int *a1, unint64_t *a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  v6[0] = 0;
  int v2 = *a1;
  if (*a1 == 2) {
    return 1;
  }
  if (v2 != 1)
  {
    if (v2) {
      return 0;
    }
    v6[0] = __ROR8__(*a2, 32);
    uint64_t result = (*(uint64_t (**)(int *, void *))(*((void *)a1 + 1) + 8))(a1, v6);
    if (result) {
      return (*(uint64_t (**)(int *, char *))(*((void *)a1 + 1) + 8))(a1, (char *)v6 + 4);
    }
    return result;
  }
  uint64_t result = (**((uint64_t (***)(int *, void *))a1 + 1))(a1, v6);
  if (result)
  {
    uint64_t result = (**((uint64_t (***)(int *, char *))a1 + 1))(a1, (char *)v6 + 4);
    if (result)
    {
      *a2 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
      return 1;
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_getrecord(int *a1, uint64_t *a2, int *a3)
{
  if (*a1 != 1) {
    return 0;
  }
  if (xdr_is_memstream((uint64_t)a1))
  {
    return xdrmem_getrecord(a1, a2, a3);
  }
  if (!xdr_is_recstream((uint64_t)a1)) {
    return 0;
  }
  return xdrrec_getrecord((uint64_t)a1, (void **)a2, (unsigned int *)a3);
}

uint64_t cvt6to4(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 1) != 30) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 8)) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 12)) {
    return 0;
  }
  int v3 = *(_DWORD *)(a1 + 16);
  if (v3 != -65536 && (v3 || (*(_DWORD *)(a1 + 20) | 0x1000000) == 0x1000000)) {
    return 0;
  }
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)a2 = 528;
  *(_WORD *)(a2 + 2) = *(_WORD *)(a1 + 2);
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 20);
  return 1;
}

uint64_t cvt4to6(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 1) != 2) {
    return 0;
  }
  *(_DWORD *)(a2 + 24) = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  *(_WORD *)a2 = 7708;
  *(_WORD *)(a2 + 2) = *(_WORD *)(a1 + 2);
  *(_DWORD *)(a2 + 16) = -65536;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)(a1 + 4);
  return 1;
}

uint64_t gethostaddr(char *a1, int a2, void *a3)
{
  unsigned int v15 = 0;
  switch(a2)
  {
    case 30:
      uint64_t v5 = 3;
      goto LABEL_7;
    case 2:
      uint64_t v5 = 0;
      while (1)
      {
        while (1)
        {
LABEL_7:
          memset(&v16, 0, sizeof(v16));
          int v6 = 2;
          uint64_t v7 = v5;
          switch((int)v5)
          {
            case 0:
              goto LABEL_14;
            case 1:
              uint64_t v7 = 3;
              goto LABEL_14;
            case 2:
              uint64_t v7 = 0;
              goto LABEL_10;
            case 3:
LABEL_10:
              if (_newrpclib_rpc_v4mapped_ok)
              {
                v16.ai_flags = 2048;
                uint64_t v7 = 4;
              }
              int v6 = 30;
              goto LABEL_14;
            case 4:
              int v6 = 0;
              uint64_t v7 = 4;
LABEL_14:
              v16.ai_family = v6;
              break;
            default:
              break;
          }
          uint64_t result = getaddrinfo(a1, 0, &v16, &v15);
          if (result != 2) {
            break;
          }
          sleep(1u);
        }
        if (!result) {
          break;
        }
        BOOL v9 = v5 == v7;
        uint64_t v5 = v7;
        if (v9) {
          return result;
        }
      }
      if (v5 == 4)
      {
        memset(v13, 0, sizeof(v13));
        int v14 = 0;
        int v10 = v15;
        if (!cvt4to6((uint64_t)v15->ai_addr, (uint64_t)v13)) {
          return 11;
        }
        size_t ai_addrlen = LOBYTE(v13[0]);
        ai_addr = (sockaddr *)v13;
      }
      else
      {
        int v10 = v15;
        ai_addr = v15->ai_addr;
        size_t ai_addrlen = v15->ai_addrlen;
      }
      memcpy(a3, ai_addr, ai_addrlen);
      freeaddrinfo(v10);
      return 0;
    case 0:
      uint64_t v5 = _newrpclib_rpc_ipmode;
      goto LABEL_7;
  }
  *__error() = 47;
  return 0xFFFFFFFFLL;
}

uint64_t open_socket(int a1)
{
  uint64_t v2 = _newrpclib_rpc_ipmode;
  if (a1 == 17)
  {
    int v3 = 2;
  }
  else
  {
    if (a1 != 6)
    {
      *__error() = 43;
      return 0xFFFFFFFFLL;
    }
    int v3 = 1;
  }
  do
  {
    if (v2 > 4)
    {
      int v5 = 0;
      uint64_t v4 = v2;
    }
    else
    {
      uint64_t v4 = dword_23C0AD0DC[(int)v2];
      int v5 = 2;
    }
    uint64_t result = socket(v5, v3, a1);
    if (result != -1) {
      break;
    }
    uint64_t v7 = __error();
    uint64_t result = 0xFFFFFFFFLL;
    if (v4 == v2) {
      break;
    }
    uint64_t v2 = v4;
  }
  while (*v7 == 47);
  return result;
}

ssize_t recvfrom_and_to(int a1, uint64_t a2, uint64_t a3, int a4, unsigned __int8 *a5, unsigned __int8 *a6)
{
  v30[2] = *MEMORY[0x263EF8340];
  size_t v10 = *a5;
  size_t v11 = *a6;
  socklen_t v29 = *a6;
  memset(v27, 0, sizeof(v27));
  v30[0] = a2;
  v30[1] = a3;
  bzero(a5, v10);
  memset(&v28.msg_namelen, 0, 40);
  if (getsockname(a1, (sockaddr *)a6, &v29))
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      recvfrom_and_to_cold_1();
    }
    return 0xFFFFFFFFLL;
  }
  if (v11 < 0x10) {
    __int16 v14 = 0;
  }
  else {
    __int16 v14 = *((_WORD *)a6 + 1);
  }
  v28.msg_name = a5;
  v28.msg_namelen = v10;
  v28.msg_iov = (iovec *)v30;
  v28.msg_iovlen = 1;
  v28.msg_control = v27;
  v28.msg_controllen = 32;
  ssize_t v15 = recvmsg(a1, &v28, a4);
  if (v15 == -1) {
    return 0xFFFFFFFFLL;
  }
  ssize_t v12 = v15;
  bzero(a6, v11);
  if (v28.msg_controllen < 0xC) {
    return v12;
  }
  msg_control = (unsigned int *)v28.msg_control;
  if (!v28.msg_control) {
    return v12;
  }
  while (1)
  {
    unsigned int v17 = msg_control[1];
    if (v17)
    {
      if (v17 == 41)
      {
        uint64_t v18 = *msg_control;
        if (msg_control[2] == 46 && v18 == 32)
        {
          if (v11 < 0x1C) {
            return v12;
          }
          unsigned int v22 = msg_control[6];
          unsigned int v21 = msg_control[7];
          uint64_t v23 = *((void *)msg_control + 2);
          unsigned int v24 = msg_control[3];
          *(_WORD *)a6 = 7708;
          *((_WORD *)a6 + 1) = v14;
          *((_DWORD *)a6 + 2) = v24;
          *(void *)(a6 + 12) = v23;
          *((_DWORD *)a6 + 5) = v22;
LABEL_34:
          search_local_ifaddr_cache(v21, a6, a5);
          return v12;
        }
      }
      else
      {
        uint64_t v18 = *msg_control;
      }
      goto LABEL_26;
    }
    unsigned int v19 = msg_control[2];
    uint64_t v18 = *msg_control;
    if (v19 != 26) {
      break;
    }
    if (v18 == 24)
    {
      if (v11 < 0xC) {
        return v12;
      }
      unsigned int v26 = msg_control[5];
      unsigned int v21 = msg_control[3];
      *(_WORD *)a6 = 528;
      *((_WORD *)a6 + 1) = v14;
      *((_DWORD *)a6 + 1) = v26;
      goto LABEL_34;
    }
LABEL_26:
    msg_control = (unsigned int *)((char *)msg_control + ((v18 + 3) & 0x1FFFFFFFCLL));
    if ((char *)(msg_control + 3) > (char *)v28.msg_control + v28.msg_controllen) {
      return v12;
    }
  }
  if (v19 != 7 || v18 != 16) {
    goto LABEL_26;
  }
  if (v11 >= 0x10)
  {
    unsigned int v25 = msg_control[3];
    *(_WORD *)a6 = 528;
    *((_WORD *)a6 + 1) = v14;
    *((_DWORD *)a6 + 1) = v25;
  }
  return v12;
}

unsigned __int8 *search_local_ifaddr_cache(unsigned int a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (pthread_once(&cache_control_init, (void (*)(void))cache_init)) {
    return a2;
  }
  v35.int tv_sec = 0;
  *(void *)&v35.__darwin_suseconds_t tv_usec = 0;
  gettimeofday(&v35, 0);
  if (v35.tv_sec > (uint64_t)if_addr_cache || qword_268B95EB8 == 0 || qword_268B95EA8 <= (unint64_t)a1)
  {
    pthread_rwlock_wrlock(&cache_rwlock);
    gettimeofday(&v35, 0);
    if (v35.tv_sec <= (uint64_t)if_addr_cache && qword_268B95EB8 && qword_268B95EA8 > (unint64_t)a1) {
      goto LABEL_12;
    }
    reset_if_addr_cache();
    if (getifaddrs((ifaddrs **)&qword_268B95EB8)) {
      goto LABEL_54;
    }
    uint64_t v21 = qword_268B95EB8;
    if (qword_268B95EB8)
    {
      unsigned int v22 = 0;
      do
      {
        unsigned int v23 = if_nametoindex(*(const char **)(v21 + 8));
        if (v23 > v22) {
          unsigned int v22 = v23;
        }
        uint64_t v21 = *(void *)v21;
      }
      while (v21);
    }
    else
    {
      unsigned int v22 = 0;
    }
    size_t v25 = v22 + 1;
    unsigned int v26 = calloc(v25, 0x10uLL);
    qword_268B95EB0 = (uint64_t)v26;
    if (!v26)
    {
LABEL_72:
      reset_if_addr_cache();
      goto LABEL_54;
    }
    qword_268B95EA8 = v22 + 1;
    if (v22 != -1)
    {
      do
      {
        void *v26 = 0;
        v26[1] = v26;
        v26 += 2;
        --v25;
      }
      while (v25);
    }
    uint64_t v27 = qword_268B95EB8;
    if (qword_268B95EB8)
    {
      int v28 = 0;
      do
      {
        unsigned int v29 = if_nametoindex(*(const char **)(v27 + 8));
        if (*(unsigned char *)(*(void *)(v27 + 24) + 1) == 2)
        {
          uint64_t v30 = *(void *)(v27 + 40);
          if (v30)
          {
            if ((~*(_DWORD *)(v27 + 16) & 3) == 0)
            {
              unsigned int v31 = v29;
              int v32 = *(_DWORD *)(v30 + 4);
              unsigned int v33 = calloc(1uLL, 0x18uLL);
              if (!v33) {
                goto LABEL_72;
              }
              if (v32 == -343) {
                int v28 = 1;
              }
              void *v33 = *(void *)(v27 + 40);
              v33[1] = *(void *)(v27 + 24);
              v33[2] = 0;
              **(void **)(qword_268B95EB0 + 16 * v31 + 8) = v33;
              *(void *)(qword_268B95EB0 + 16 * v31 + 8) = v33 + 2;
            }
          }
        }
        uint64_t v27 = *(void *)v27;
      }
      while (v27);
      if_addr_cache = (__int128)v35;
      if (v28)
      {
        uint64_t v34 = 3;
LABEL_75:
        *(void *)&if_addr_cache = if_addr_cache + v34;
LABEL_12:
        pthread_rwlock_unlock(&cache_rwlock);
        goto LABEL_13;
      }
    }
    else
    {
      if_addr_cache = (__int128)v35;
    }
    uint64_t v34 = 30;
    goto LABEL_75;
  }
LABEL_13:
  pthread_rwlock_rdlock(&cache_rwlock);
  int v8 = a2[1];
  if (v8 == 30)
  {
    if (a2[8] == 255)
    {
LABEL_16:
      uint64_t v9 = qword_268B95EB8;
      if (!qword_268B95EB8) {
        goto LABEL_54;
      }
      size_t v10 = 0;
      int v11 = 0;
      int v36 = 0;
      while (1)
      {
        if (if_nametoindex(*(const char **)(v9 + 8)) == a1)
        {
          ssize_t v12 = *(unsigned __int8 **)(v9 + 24);
          int v13 = v12[1];
          if (v13 == a2[1])
          {
            unsigned int v14 = *v12;
            if (v14 == *a2)
            {
              if (v13 == 30)
              {
                if (a2[8] != 255) {
                  goto LABEL_29;
                }
              }
              else if (v13 != 2 || *((_DWORD *)a2 + 1) >> 28 != 14)
              {
LABEL_29:
                if ((*(unsigned char *)(v9 + 16) & 2) != 0)
                {
                  ssize_t v15 = *(unsigned __int8 **)(v9 + 40);
                  BOOL v16 = v13 != 2 || v15 == 0;
                  if (!v16 && compare_sa(v15, a2, 0, 0)) {
                    goto LABEL_38;
                  }
                }
                goto LABEL_35;
              }
              if (compare_sa(a3, *(unsigned __int8 **)(v9 + 24), *(void *)(v9 + 32), &v36) && v36 > v11)
              {
                int v11 = v36;
                size_t v10 = v12;
              }
            }
          }
        }
LABEL_35:
        uint64_t v9 = *(void *)v9;
        if (!v9)
        {
          if (!v10) {
            goto LABEL_54;
          }
          unsigned int v14 = *a2;
          ssize_t v12 = v10;
LABEL_38:
          size_t v17 = v14;
          uint64_t v18 = a2;
          unsigned int v19 = v12;
LABEL_53:
          memcpy(v18, v19, v17);
          goto LABEL_54;
        }
      }
    }
  }
  else if (v8 == 2 && *((_DWORD *)a2 + 1) >> 28 == 14)
  {
    goto LABEL_16;
  }
  if (qword_268B95EA8 > (unint64_t)a1)
  {
    for (uint64_t i = *(void *)(qword_268B95EB0 + 16 * a1); i; uint64_t i = *(void *)(i + 16))
    {
      if (compare_sa(a2, *(unsigned __int8 **)i, 0, 0))
      {
        unsigned int v19 = *(const void **)(i + 8);
        size_t v17 = *a2;
        uint64_t v18 = a2;
        goto LABEL_53;
      }
    }
  }
LABEL_54:
  pthread_rwlock_unlock(&cache_rwlock);
  return a2;
}

uint64_t _newrpclib_socparms2netid(int a1, int a2, int a3, const char **a4)
{
  int v4 = 0;
  *a4 = 0;
  int v5 = "udp";
  int v6 = &dword_264E2C1D4;
  do
  {
    if (*(v6 - 1) == a1)
    {
      if (a1 == 1)
      {
        if (a3)
        {
          int v8 = __error();
          goto LABEL_23;
        }
        if (*v6 == a2) {
          goto LABEL_21;
        }
      }
      else
      {
        if (a1 != 30 && a1 != 2) {
          goto LABEL_20;
        }
        if (!a2 || *v6 == a2)
        {
          if (a3)
          {
            if (v6[1] == a3) {
              goto LABEL_21;
            }
          }
          else if (a2)
          {
LABEL_21:
            uint64_t result = 0;
            *a4 = v5;
            return result;
          }
        }
      }
      int v4 = 1;
    }
    int v5 = *(const char **)(v6 + 3);
    v6 += 6;
  }
  while (v5);
  if (!v4)
  {
LABEL_20:
    int v8 = __error();
    int v9 = 46;
    goto LABEL_24;
  }
  unsigned int v7 = a2 - 3;
  int v8 = __error();
  if (v7 <= 0xFFFFFFFD)
  {
    int v9 = 41;
    goto LABEL_24;
  }
LABEL_23:
  int v9 = 43;
LABEL_24:
  *int v8 = v9;
  return 0xFFFFFFFFLL;
}

uint64_t _newrpclib_netid2socparms(char *__s2, _DWORD *a2, _DWORD *a3, _DWORD *a4, int a5)
{
  if (!__s2)
  {
    int v15 = 22;
LABEL_19:
    *__error() = v15;
    return 0xFFFFFFFFLL;
  }
  size_t v10 = &netids;
  int v11 = "udp";
  while (1)
  {
    uint64_t result = strncmp(v11, __s2, 0x80uLL);
    if (!result) {
      break;
    }
    int v13 = v10[3];
    v10 += 3;
    int v11 = v13;
    if (!v13)
    {
      size_t v10 = (char **)&unk_264E2C2A0;
      break;
    }
  }
  if (a2)
  {
    if (a5 && *((_DWORD *)v10 + 5)) {
      int v14 = 0;
    }
    else {
      int v14 = *((_DWORD *)v10 + 2);
    }
    *a2 = v14;
  }
  if (a3) {
    *a3 = *((_DWORD *)v10 + 3);
  }
  if (a4) {
    *a4 = *((_DWORD *)v10 + 4);
  }
  if (result)
  {
    int v15 = 2;
    goto LABEL_19;
  }
  return result;
}

uint64_t _newrpclib_uaddr2sa(const char *a1, char *__s2, unsigned __int8 *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  memset(v16, 0, sizeof(v16));
  *(_OWORD *)int v14 = 0u;
  uint64_t v13 = 0;
  int v12 = 0;
  if (!a1) {
    goto LABEL_4;
  }
  if (!__s2) {
    goto LABEL_4;
  }
  unsigned int v5 = *a3;
  if (_newrpclib_netid2socparms(__s2, (_DWORD *)&v13 + 1, &v13, &v12, 0)) {
    goto LABEL_4;
  }
  if (HIDWORD(v13) == 30)
  {
    if (v5 < 0x1C) {
      goto LABEL_4;
    }
    if (strlen(a1) > 0x36) {
      goto LABEL_4;
    }
    unsigned int v11 = ugetport(a1, v14);
    if ((v11 & 0x80000000) != 0) {
      goto LABEL_4;
    }
    unsigned int v8 = v11;
    *(void *)a3 = 0;
    *((_DWORD *)a3 + 6) = 0;
    *((void *)a3 + 2) = 0;
    *((void *)a3 + 1) = 0;
    int v9 = inet_pton(30, v14, a3 + 8);
    if (v9 == 1)
    {
      uint64_t result = 0;
      __int16 v10 = 7708;
      goto LABEL_22;
    }
LABEL_23:
    if (v9) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_4;
  }
  if (HIDWORD(v13) != 2)
  {
    if (HIDWORD(v13) == 1 && v5 >= 0x6A)
    {
      *(_OWORD *)(a3 + 90) = 0u;
      *((_OWORD *)a3 + 4) = 0u;
      *((_OWORD *)a3 + 5) = 0u;
      *((_OWORD *)a3 + 2) = 0u;
      *((_OWORD *)a3 + 3) = 0u;
      *(_OWORD *)a3 = 0u;
      *((_OWORD *)a3 + 1) = 0u;
      if (strnlen(a1, 0x68uLL) <= 0x67)
      {
        *(_WORD *)a3 = 362;
        strlcpy((char *)a3 + 2, a1, 0x68uLL);
        return 0;
      }
    }
LABEL_4:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  if (v5 < 0x10) {
    goto LABEL_4;
  }
  if (strlen(a1) > 0x36) {
    goto LABEL_4;
  }
  unsigned int v7 = ugetport(a1, v14);
  if ((v7 & 0x80000000) != 0) {
    goto LABEL_4;
  }
  unsigned int v8 = v7;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  int v9 = inet_pton(2, v14, a3 + 4);
  if (v9 != 1) {
    goto LABEL_23;
  }
  uint64_t result = 0;
  __int16 v10 = 528;
LABEL_22:
  *(_WORD *)a3 = v10;
  *((_WORD *)a3 + 1) = bswap32(v8) >> 16;
  return result;
}

uint64_t ugetport(const char *a1, char *a2)
{
  __endptr = 0;
  int v4 = &a1[strnlen(a1, 0x400uLL)];
  if (!*v4)
  {
    char v7 = 0;
    LODWORD(v5) = 0;
    char v8 = 1;
    while (1)
    {
      if (v4 == a1) {
        return 0xFFFFFFFFLL;
      }
      char v9 = v8;
      __int16 v10 = v4;
      while (*v10 != 46)
      {
        if (--v10 == a1) {
          return 0xFFFFFFFFLL;
        }
      }
      unint64_t v11 = strtol(v10 + 1, &__endptr, 10);
      if (v11 > 0xFF) {
        return 0xFFFFFFFFLL;
      }
      int v12 = *__endptr;
      if (v12 != 46 && v12 != 0) {
        return 0xFFFFFFFFLL;
      }
      if (v7) {
        break;
      }
      char v8 = 0;
      int v14 = *(unsigned __int8 *)v10;
      int v4 = &v10[-(v14 == 46)];
      uint64_t v5 = v5 | v11;
      char v7 = 1;
      if ((v9 & 1) == 0)
      {
        v10 -= v14 == 46;
LABEL_20:
        strlcpy(a2, a1, v10 - a1 + 1);
        return v5;
      }
    }
    uint64_t v5 = v5 | (v11 << 8);
    goto LABEL_20;
  }
  return 0xFFFFFFFFLL;
}

uint64_t _newrpclib_sa2uaddr(char *__s1, char **a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  memset(v14, 0, sizeof(v14));
  *(_OWORD *)int v12 = 0u;
  *a2 = 0;
  if (!__s1) {
    goto LABEL_8;
  }
  int v4 = __s1[1];
  if (v4 != 1)
  {
    if (v4 == 30)
    {
      uint64_t v5 = __s1 + 8;
LABEL_11:
      if (inet_ntop(v4, v5, v12, 0x2Eu))
      {
        unsigned int v9 = bswap32(*((unsigned __int16 *)__s1 + 1));
        BOOL v10 = asprintf(a2, "%s.%d.%d", v12, HIBYTE(v9), BYTE2(v9)) == -1;
        goto LABEL_13;
      }
      return 0xFFFFFFFFLL;
    }
    if (v4 == 2)
    {
      uint64_t v5 = __s1 + 4;
      goto LABEL_11;
    }
LABEL_8:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  int v7 = __s1[2];
  int v6 = __s1 + 2;
  if (!v7 || strnlen(v6, 0x68uLL) == 104) {
    goto LABEL_8;
  }
  unint64_t v11 = strdup(v6);
  *a2 = v11;
  BOOL v10 = v11 == 0;
LABEL_13:
  if (v10) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

void freenetconfigent(void **a1)
{
  if (a1)
  {
    free(*a1);
    free(a1[2]);
    free(a1[3]);
    free(a1);
  }
}

_DWORD *getnetconfigent(char *__s2)
{
  uint64_t v2 = "udp";
  int v3 = off_264E2C2D0;
  while (strncmp(v2, __s2, 0x80uLL))
  {
    uint64_t v2 = v3[2];
    v3 += 5;
    if (!v2)
    {
      int v4 = 0;
      *__error() = 2;
      return v4;
    }
  }
  int v4 = calloc(1uLL, 0x20uLL);
  if (v4)
  {
    uint64_t v5 = strdup(*(v3 - 2));
    *(void *)int v4 = v5;
    void v4[2] = *((_DWORD *)v3 - 2);
    int v6 = strdup(*v3);
    *((void *)v4 + 2) = v6;
    int v7 = strdup(v3[1]);
    *((void *)v4 + 3) = v7;
    if (!v5 || !v6 || !v7)
    {
      freenetconfigent((void **)v4);
      return 0;
    }
  }
  return v4;
}

uint64_t set_local_ephemeral_sockname(uint64_t a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = getenv("TMPDIR");
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)__str = 0u;
  long long v9 = 0u;
  if (!v4 || !*v4) {
    int v4 = "/tmp";
  }
  if (snprintf(__str, 0x68uLL, "%s/rpc.XXXXXXXX.%s", v4, a2) < 0x69)
  {
    int v6 = strlen(a2);
    int v7 = mkstemps(__str, v6 + 1);
    unlink(__str);
    close(v7);
    strlcpy((char *)(a1 + 2), __str, 0x68uLL);
    return 0;
  }
  else
  {
    *__error() = 63;
    return 0xFFFFFFFFLL;
  }
}

uint64_t cache_init()
{
  uint64_t result = pthread_rwlock_init(&cache_rwlock, 0);
  if (result)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      cache_init_cold_1();
    }
    abort();
  }
  return result;
}

double reset_if_addr_cache()
{
  unint64_t v1 = qword_268B95EA8;
  pthread_key_t v0 = (void *)qword_268B95EB0;
  if (qword_268B95EA8)
  {
    uint64_t v2 = 0;
    unsigned int v3 = 0;
    do
    {
      int v4 = (void **)&v0[2 * v2];
      uint64_t v5 = *v4;
      if (*v4)
      {
        do
        {
          int v6 = (void *)v5[2];
          *int v4 = v6;
          if (!v6) {
            v0[2 * v2 + 1] = v4;
          }
          free(v5);
          pthread_key_t v0 = (void *)qword_268B95EB0;
          int v4 = (void **)(qword_268B95EB0 + 16 * v2);
          uint64_t v5 = *v4;
        }
        while (*v4);
        unint64_t v1 = qword_268B95EA8;
      }
      uint64_t v2 = ++v3;
    }
    while (v1 > v3);
  }
  free(v0);
  if (qword_268B95EB8) {
    MEMORY[0x23ECDA870]();
  }
  qword_268B95EB8 = 0;
  double result = 0.0;
  if_addr_cache = 0u;
  *(_OWORD *)&qword_268B95EA8 = 0u;
  return result;
}

BOOL compare_sa(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, int *a4)
{
  size_t v4 = *a1;
  if (v4 != *a2) {
    return 0;
  }
  int v5 = a1[1];
  if (v5 != a2[1]) {
    return 0;
  }
  if (v5 != 30)
  {
    if (v5 != 2)
    {
      if (a4) {
        *a4 = 8 * v4;
      }
      return memcmp(a1, a2, v4) == 0;
    }
    int v6 = *((_DWORD *)a1 + 1);
    int v7 = *((_DWORD *)a2 + 1);
    if (a3)
    {
      unsigned int v8 = *(_DWORD *)(a3 + 4);
      if (a4)
      {
        if (v8 != -1)
        {
          int v9 = 0;
          while (((v8 >> (v9 + 31)) & 1) != 0)
          {
            if (--v9 == -32) {
              goto LABEL_36;
            }
          }
          int v22 = -v9;
          goto LABEL_37;
        }
LABEL_36:
        int v22 = 32;
LABEL_37:
        *a4 = v22;
      }
    }
    else
    {
      unsigned int v8 = -1;
      if (a4) {
        goto LABEL_36;
      }
    }
    return (v8 & (v7 ^ v6)) == 0;
  }
  long long v11 = (_DWORD *)(a3 + 8);
  if (!a3) {
    long long v11 = &compare_sa_allones;
  }
  if (a4)
  {
    int v12 = 0;
    uint64_t v13 = 0;
    while (1)
    {
      unsigned int v14 = v11[v13];
      if (v14 != -1) {
        break;
      }
LABEL_21:
      v12 += 32;
      if (++v13 == 4)
      {
        int v16 = 128;
        goto LABEL_27;
      }
    }
    int v15 = 0;
    while (((v14 >> (v15 + 31)) & 1) != 0)
    {
      if (--v15 == -32) {
        goto LABEL_21;
      }
    }
    int v16 = v12 - v15;
LABEL_27:
    *a4 = v16;
  }
  uint64_t v18 = 0;
  unsigned int v19 = a1 + 8;
  do
  {
    int v20 = (*(_DWORD *)&a2[v18 * 4 + 8] ^ *(_DWORD *)&v19[v18 * 4]) & v11[v18];
    BOOL result = v20 == 0;
    if (v20) {
      BOOL v21 = 1;
    }
    else {
      BOOL v21 = v18 == 3;
    }
    ++v18;
  }
  while (!v21);
  return result;
}

uint64_t _newrpclib_xdr_pmap(uint64_t (***a1)(void), int *a2)
{
  uint64_t result = _newrpclib_xdr_uint32_t(a1, a2);
  if (result)
  {
    uint64_t result = _newrpclib_xdr_uint32_t(a1, a2 + 1);
    if (result)
    {
      uint64_t result = _newrpclib_xdr_uint32_t(a1, a2 + 2);
      if (result) {
        return _newrpclib_xdr_uint32_t(a1, a2 + 3) != 0;
      }
    }
  }
  return result;
}

BOOL _newrpclib_xdr_pmaplist_ptr(uint64_t (***a1)(void), void **a2)
{
  return _newrpclib_xdr_pointer(a1, a2, 0x18uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_pmaplist) != 0;
}

BOOL _newrpclib_xdr_pmaplist(uint64_t (***a1)(void), void *a2)
{
  uint64_t v2 = a2;
  BOOL v11 = 0;
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
  {
    if (a2)
    {
      LOBYTE(v6) = 0;
      while (_newrpclib_xdr_pmap(a1, (int *)v2))
      {
        int v9 = (void *)v2[2];
        if (v6) {
          free(v2);
        }
        uint64_t v6 = 1;
        uint64_t v2 = v9;
        if (!v9) {
          return v6;
        }
      }
      return 0;
    }
    return 1;
  }
  if (v4 == 1)
  {
    while (_newrpclib_xdr_pmap(a1, (int *)v2) && _newrpclib_xdr_int32_t(a1, (int *)&v11))
    {
      if (!v11)
      {
        v2[2] = 0;
        return 1;
      }
      if (v2[2])
      {
        int v7 = 1;
        uint64_t v2 = (void *)v2[2];
      }
      else
      {
        unsigned int v8 = calloc(1uLL, 0x18uLL);
        v2[2] = v8;
        if (!v8) {
          return 0;
        }
        int v7 = v11;
        uint64_t v2 = v8;
      }
      if (!v7) {
        return 1;
      }
    }
    return 0;
  }
  if (v4) {
    return 1;
  }
  while (_newrpclib_xdr_pmap(a1, (int *)v2))
  {
    uint64_t v2 = (void *)v2[2];
    BOOL v11 = v2 != 0;
    int v5 = _newrpclib_xdr_int32_t(a1, (int *)&v11);
    if (!v5 || !v2) {
      return v5 != 0;
    }
  }
  return 0;
}

uint64_t _newrpclib_xdr_pmap_call_args(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)a2);
  if (result)
  {
    uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 4));
    if (result)
    {
      uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 8));
      if (result) {
        return _newrpclib_xdr_bytes(a1, (void **)(a2 + 24), (int *)(a2 + 16), 0x10000u) != 0;
      }
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_pmap_call_result(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)a2);
  if (result) {
    return _newrpclib_xdr_bytes(a1, (void **)(a2 + 16), (int *)(a2 + 8), 0x10000u) != 0;
  }
  return result;
}

void *_newrpclib_pmap_set(int a1, int a2, int a3, int a4)
{
  v14[2] = *MEMORY[0x263EF8340];
  int v13 = -1;
  if (_newrpclib_pmap_wakeup()) {
    return 0;
  }
  unsigned int v11 = 0;
  v14[0] = 0x100007F6F000210;
  v14[1] = 0;
  uint64_t result = _newrpclib_clntudp_bufcreate_timeout((unsigned __int8 *)v14, 0x186A0u, 2u, &v13, 400, 400, &set_retry_timeout, &set_total_timeout);
  if (result)
  {
    int v9 = result;
    v12[0] = a1;
    v12[1] = a2;
    _OWORD v12[2] = a3;
    v12[3] = a4;
    int v10 = _newrpclib_pmapproc_set_2((uint64_t)v12, &v11, (uint64_t)result);
    (*(void (**)(void *))(v9[1] + 32))(v9);
    if (v10) {
      return 0;
    }
    else {
      return (void *)v11;
    }
  }
  return result;
}

void *_newrpclib_pmap_unset(int a1, int a2)
{
  _OWORD v10[2] = *MEMORY[0x263EF8340];
  int v9 = -1;
  if (_newrpclib_pmap_wakeup()) {
    return 0;
  }
  unsigned int v7 = 0;
  v10[0] = 0x100007F6F000210;
  v10[1] = 0;
  uint64_t result = _newrpclib_clntudp_bufcreate_timeout((unsigned __int8 *)v10, 0x186A0u, 2u, &v9, 400, 400, &unset_retry_timeout, &unset_total_timeout);
  if (result)
  {
    int v5 = result;
    v8[0] = a1;
    v8[1] = a2;
    _OWORD v8[2] = 0;
    void v8[3] = 0;
    int v6 = _newrpclib_pmapproc_unset_2((uint64_t)v8, &v7, (uint64_t)result);
    (*(void (**)(void *))(v5[1] + 32))(v5);
    if (v6) {
      return 0;
    }
    else {
      return (void *)v7;
    }
  }
  return result;
}

uint64_t _newrpclib_pmapproc_null_2(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 8))();
}

uint64_t _newrpclib_pmapproc_set_2(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), int *), uint64_t, uint64_t (*)(uint64_t (***)(void), BOOL *), _DWORD *, uint64_t, void))(a3 + 8))(a3, 1, _newrpclib_xdr_pmap, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_pmapproc_unset_2(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), int *), uint64_t, uint64_t (*)(uint64_t (***)(void), BOOL *), _DWORD *, uint64_t, void))(a3 + 8))(a3, 2, _newrpclib_xdr_pmap, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_pmapproc_getport_2(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), int *), uint64_t, uint64_t (*)(uint64_t (***)(void), int *), _DWORD *, uint64_t, void))(a3 + 8))(a3, 3, _newrpclib_xdr_pmap, a1, _newrpclib_xdr_uint32_t, a2, 25, 0);
}

uint64_t _newrpclib_pmapproc_dump_2(void *a1, uint64_t a2)
{
  *a1 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), void, BOOL (*)(uint64_t (***)(void), void **), void *, uint64_t, void))(a2 + 8))(a2, 4, _newrpclib_xdr_void, 0, _newrpclib_xdr_pmaplist_ptr, a1, 25, 0);
}

uint64_t _newrpclib_pmapproc_callit_2(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), void *, uint64_t, void))(a3 + 8))(a3, 5, _newrpclib_xdr_pmap_call_args, a1, _newrpclib_xdr_pmap_call_result, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_set_3(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), BOOL *), _DWORD *, uint64_t, void))(a3 + 8))(a3, 1, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_unset_3(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), BOOL *), _DWORD *, uint64_t, void))(a3 + 8))(a3, 2, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_getaddr_3(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), char **), void *, uint64_t, void))(a3 + 8))(a3, 3, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_wrapstring, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_dump_3(void *a1, uint64_t a2)
{
  *a1 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), void, BOOL (*)(uint64_t (***)(void), void **), void *, uint64_t, void))(a2 + 8))(a2, 4, _newrpclib_xdr_void, 0, _newrpclib_xdr_rpcblist_ptr, a1, 25, 0);
}

uint64_t _newrpclib_rpcbproc_callit_3(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), void *, uint64_t, void))(a3 + 8))(a3, 5, _newrpclib_xdr_rpcb_rmtcallargs, a1, _newrpclib_xdr_rpcb_rmtcallres, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_gettime_3(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), void, uint64_t (*)(uint64_t (***)(void), int *), _DWORD *, uint64_t, void))(a2 + 8))(a2, 6, _newrpclib_xdr_void, 0, _newrpclib_xdr_uint32_t, a1, 25, 0);
}

uint64_t _newrpclib_rpcbproc_uaddr2taddr_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), char **), uint64_t *, uint64_t (*)(uint64_t (***)(void), uint64_t), void *, uint64_t, void))(a3 + 8))(a3, 7, _newrpclib_xdr_wrapstring, &v4, _newrpclib_xdr_netbuf, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_taddr2uaddr_3(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), char **), void *, uint64_t, void))(a3 + 8))(a3, 8, _newrpclib_xdr_netbuf, a1, _newrpclib_xdr_wrapstring, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_set_4(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), BOOL *), _DWORD *, uint64_t, void))(a3 + 8))(a3, 1, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_unset_4(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), BOOL *), _DWORD *, uint64_t, void))(a3 + 8))(a3, 2, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_getaddr_4(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), char **), void *, uint64_t, void))(a3 + 8))(a3, 3, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_wrapstring, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_dump_4(void *a1, uint64_t a2)
{
  *a1 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), void, BOOL (*)(uint64_t (***)(void), void **), void *, uint64_t, void))(a2 + 8))(a2, 4, _newrpclib_xdr_void, 0, _newrpclib_xdr_rpcblist_ptr, a1, 25, 0);
}

uint64_t _newrpclib_rpcbproc_bcast_4(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), void *, uint64_t, void))(a3 + 8))(a3, 5, _newrpclib_xdr_rpcb_rmtcallargs, a1, _newrpclib_xdr_rpcb_rmtcallres, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_gettime_4(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), void, uint64_t (*)(uint64_t (***)(void), int *), _DWORD *, uint64_t, void))(a2 + 8))(a2, 6, _newrpclib_xdr_void, 0, _newrpclib_xdr_uint32_t, a1, 25, 0);
}

uint64_t _newrpclib_rpcbproc_uaddr2taddr_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), char **), uint64_t *, uint64_t (*)(uint64_t (***)(void), uint64_t), void *, uint64_t, void))(a3 + 8))(a3, 7, _newrpclib_xdr_wrapstring, &v4, _newrpclib_xdr_netbuf, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_taddr2uaddr_4(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), char **), void *, uint64_t, void))(a3 + 8))(a3, 8, _newrpclib_xdr_netbuf, a1, _newrpclib_xdr_wrapstring, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_getversaddr_4(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), char **), void *, uint64_t, void))(a3 + 8))(a3, 9, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_wrapstring, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_indirect_4(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), void *, uint64_t, void))(a3 + 8))(a3, 10, _newrpclib_xdr_rpcb_rmtcallargs, a1, _newrpclib_xdr_rpcb_rmtcallres, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_getaddrlist_4(uint64_t a1, void *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, BOOL (*)(uint64_t (***)(void), void **), void *, uint64_t, void))(a3 + 8))(a3, 11, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_rpcb_entry_list_ptr, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_getstat_4(_OWORD *a1, uint64_t a2)
{
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), void, BOOL (*)(uint64_t, uint64_t), _OWORD *, uint64_t, void))(a2 + 8))(a2, 12, _newrpclib_xdr_void, 0, _newrpclib_xdr_rpcb_stat_byvers, a1, 25, 0);
}

uint64_t _newrpclib_xdr_rpcb(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)a2);
  if (result)
  {
    uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 4));
    if (result)
    {
      uint64_t result = _newrpclib_xdr_string(a1, (char **)(a2 + 8), 0x10000u);
      if (result)
      {
        uint64_t result = _newrpclib_xdr_string(a1, (char **)(a2 + 16), 0x10000u);
        if (result) {
          return _newrpclib_xdr_string(a1, (char **)(a2 + 24), 0x10000u) != 0;
        }
      }
    }
  }
  return result;
}

BOOL _newrpclib_xdr_rp__list(uint64_t (***a1)(void), void *a2)
{
  uint64_t v2 = a2;
  BOOL v11 = 0;
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
  {
    if (a2)
    {
      LOBYTE(v6) = 0;
      while (_newrpclib_xdr_rpcb(a1, (uint64_t)v2))
      {
        int v9 = (void *)v2[4];
        if (v6) {
          free(v2);
        }
        uint64_t v6 = 1;
        uint64_t v2 = v9;
        if (!v9) {
          return v6;
        }
      }
      return 0;
    }
    return 1;
  }
  if (v4 == 1)
  {
    while (_newrpclib_xdr_rpcb(a1, (uint64_t)v2) && _newrpclib_xdr_int32_t(a1, (int *)&v11))
    {
      if (!v11)
      {
        v2[4] = 0;
        return 1;
      }
      if (v2[4])
      {
        int v7 = 1;
        uint64_t v2 = (void *)v2[4];
      }
      else
      {
        unsigned int v8 = calloc(1uLL, 0x28uLL);
        v2[4] = v8;
        if (!v8) {
          return 0;
        }
        int v7 = v11;
        uint64_t v2 = v8;
      }
      if (!v7) {
        return 1;
      }
    }
    return 0;
  }
  if (v4) {
    return 1;
  }
  while (_newrpclib_xdr_rpcb(a1, (uint64_t)v2))
  {
    uint64_t v2 = (void *)v2[4];
    BOOL v11 = v2 != 0;
    int v5 = _newrpclib_xdr_int32_t(a1, (int *)&v11);
    if (!v5 || !v2) {
      return v5 != 0;
    }
  }
  return 0;
}

BOOL _newrpclib_xdr_rpcblist_ptr(uint64_t (***a1)(void), void **a2)
{
  return _newrpclib_xdr_pointer(a1, a2, 0x28uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rp__list) != 0;
}

uint64_t _newrpclib_xdr_rpcb_rmtcallargs(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)a2);
  if (result)
  {
    uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 4));
    if (result)
    {
      uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 8));
      if (result) {
        return _newrpclib_xdr_bytes(a1, (void **)(a2 + 24), (int *)(a2 + 16), 0x10000u) != 0;
      }
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_rpcb_rmtcallres(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_string(a1, (char **)a2, 0x10000u);
  if (result) {
    return _newrpclib_xdr_bytes(a1, (void **)(a2 + 16), (int *)(a2 + 8), 0x10000u) != 0;
  }
  return result;
}

uint64_t _newrpclib_xdr_rpcb_entry(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_string(a1, (char **)a2, 0x10000u);
  if (result)
  {
    uint64_t result = _newrpclib_xdr_string(a1, (char **)(a2 + 8), 0x10000u);
    if (result)
    {
      uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 16));
      if (result)
      {
        uint64_t result = _newrpclib_xdr_string(a1, (char **)(a2 + 24), 0x10000u);
        if (result) {
          return _newrpclib_xdr_string(a1, (char **)(a2 + 32), 0x10000u) != 0;
        }
      }
    }
  }
  return result;
}

BOOL _newrpclib_xdr_rpcb_entry_list(uint64_t (***a1)(void), void *a2)
{
  uint64_t v2 = a2;
  BOOL v11 = 0;
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
  {
    if (a2)
    {
      LOBYTE(v6) = 0;
      while (_newrpclib_xdr_rpcb_entry(a1, (uint64_t)v2))
      {
        int v9 = (void *)v2[5];
        if (v6) {
          free(v2);
        }
        uint64_t v6 = 1;
        uint64_t v2 = v9;
        if (!v9) {
          return v6;
        }
      }
      return 0;
    }
    return 1;
  }
  if (v4 == 1)
  {
    while (_newrpclib_xdr_rpcb_entry(a1, (uint64_t)v2)
         && _newrpclib_xdr_int32_t(a1, (int *)&v11))
    {
      if (!v11)
      {
        v2[5] = 0;
        return 1;
      }
      if (v2[5])
      {
        int v7 = 1;
        uint64_t v2 = (void *)v2[5];
      }
      else
      {
        unsigned int v8 = calloc(1uLL, 0x30uLL);
        v2[5] = v8;
        if (!v8) {
          return 0;
        }
        int v7 = v11;
        uint64_t v2 = v8;
      }
      if (!v7) {
        return 1;
      }
    }
    return 0;
  }
  if (v4) {
    return 1;
  }
  while (_newrpclib_xdr_rpcb_entry(a1, (uint64_t)v2))
  {
    uint64_t v2 = (void *)v2[5];
    BOOL v11 = v2 != 0;
    int v5 = _newrpclib_xdr_int32_t(a1, (int *)&v11);
    if (!v5 || !v2) {
      return v5 != 0;
    }
  }
  return 0;
}

BOOL _newrpclib_xdr_rpcb_entry_list_ptr(uint64_t (***a1)(void), void **a2)
{
  return _newrpclib_xdr_pointer(a1, a2, 0x30uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rpcb_entry_list) != 0;
}

BOOL _newrpclib_xdr_rpcbs_addrlist(uint64_t (***a1)(void), void *a2)
{
  uint64_t v2 = a2;
  BOOL v11 = 0;
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
  {
    if (a2)
    {
      LOBYTE(v6) = 0;
      while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
           && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
           && _newrpclib_xdr_int32_t(a1, (int *)v2 + 2)
           && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
           && _newrpclib_xdr_string(a1, (char **)v2 + 2, 0x10000u))
      {
        int v9 = (void *)*((void *)v2 + 3);
        if (v6) {
          free(v2);
        }
        uint64_t v6 = 1;
        uint64_t v2 = v9;
        if (!v9) {
          return v6;
        }
      }
      return 0;
    }
    return 1;
  }
  if (v4 == 1)
  {
    while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
         && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
         && _newrpclib_xdr_int32_t(a1, (int *)v2 + 2)
         && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
         && _newrpclib_xdr_string(a1, (char **)v2 + 2, 0x10000u)
         && _newrpclib_xdr_int32_t(a1, (int *)&v11))
    {
      if (!v11)
      {
        *((void *)v2 + 3) = 0;
        return 1;
      }
      if (*((void *)v2 + 3))
      {
        int v7 = 1;
        uint64_t v2 = (void *)*((void *)v2 + 3);
      }
      else
      {
        unsigned int v8 = calloc(1uLL, 0x20uLL);
        *((void *)v2 + 3) = v8;
        if (!v8) {
          return 0;
        }
        int v7 = v11;
        uint64_t v2 = v8;
      }
      if (!v7) {
        return 1;
      }
    }
    return 0;
  }
  if (v4) {
    return 1;
  }
  while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
       && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
       && _newrpclib_xdr_int32_t(a1, (int *)v2 + 2)
       && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
       && _newrpclib_xdr_string(a1, (char **)v2 + 2, 0x10000u))
  {
    uint64_t v2 = (void *)*((void *)v2 + 3);
    BOOL v11 = v2 != 0;
    int v5 = _newrpclib_xdr_int32_t(a1, (int *)&v11);
    if (!v5 || !v2) {
      return v5 != 0;
    }
  }
  return 0;
}

BOOL _newrpclib_xdr_rpcbs_rmtcalllist(uint64_t (***a1)(void), void *a2)
{
  uint64_t v2 = a2;
  BOOL v11 = 0;
  int v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
  {
    if (a2)
    {
      LOBYTE(v6) = 0;
      while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
           && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
           && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 2)
           && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
           && _newrpclib_xdr_int32_t(a1, (int *)v2 + 4)
           && _newrpclib_xdr_int32_t(a1, (int *)v2 + 5)
           && _newrpclib_xdr_string(a1, (char **)v2 + 3, 0x10000u))
      {
        int v7 = (void *)*((void *)v2 + 4);
        if (v6) {
          free(v2);
        }
        uint64_t v6 = 1;
        uint64_t v2 = v7;
        if (!v7) {
          return v6;
        }
      }
      return 0;
    }
    return 1;
  }
  if (v4 == 1)
  {
    uint64_t v6 = 1;
    while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
         && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
         && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 2)
         && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
         && _newrpclib_xdr_int32_t(a1, (int *)v2 + 4)
         && _newrpclib_xdr_int32_t(a1, (int *)v2 + 5)
         && _newrpclib_xdr_string(a1, (char **)v2 + 3, 0x10000u)
         && _newrpclib_xdr_int32_t(a1, (int *)&v11))
    {
      if (!v11)
      {
        *((void *)v2 + 4) = 0;
        return 1;
      }
      if (*((void *)v2 + 4))
      {
        int v8 = 1;
        uint64_t v2 = (void *)*((void *)v2 + 4);
      }
      else
      {
        int v9 = calloc(1uLL, 0x28uLL);
        *((void *)v2 + 4) = v9;
        if (!v9) {
          return 0;
        }
        int v8 = v11;
        uint64_t v2 = v9;
      }
      if (!v8) {
        return v6;
      }
    }
    return 0;
  }
  if (v4) {
    return 1;
  }
  while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
       && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
       && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 2)
       && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
       && _newrpclib_xdr_int32_t(a1, (int *)v2 + 4)
       && _newrpclib_xdr_int32_t(a1, (int *)v2 + 5)
       && _newrpclib_xdr_string(a1, (char **)v2 + 3, 0x10000u))
  {
    uint64_t v2 = (void *)*((void *)v2 + 4);
    BOOL v11 = v2 != 0;
    int v5 = _newrpclib_xdr_int32_t(a1, (int *)&v11);
    if (!v5 || !v2) {
      return v5 != 0;
    }
  }
  return 0;
}

BOOL _newrpclib_xdr_rpcbs_proc(uint64_t a1, uint64_t a2)
{
  return _newrpclib_xdr_vector(a1, a2, 13, 4u, (uint64_t (*)(uint64_t, uint64_t))_newrpclib_xdr_int32_t) != 0;
}

BOOL _newrpclib_xdr_rpcbs_addrlist_ptr(uint64_t (***a1)(void), void **a2)
{
  return _newrpclib_xdr_pointer(a1, a2, 0x20uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rpcbs_addrlist) != 0;
}

BOOL _newrpclib_xdr_rpcbs_rmtcalllist_ptr(uint64_t (***a1)(void), void **a2)
{
  return _newrpclib_xdr_pointer(a1, a2, 0x28uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rpcbs_rmtcalllist) != 0;
}

uint64_t _newrpclib_xdr_rpcb_stat(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_vector((uint64_t)a1, a2, 13, 4u, (uint64_t (*)(uint64_t, uint64_t))_newrpclib_xdr_int32_t);
  if (result)
  {
    uint64_t result = _newrpclib_xdr_int32_t(a1, (int *)(a2 + 52));
    if (result)
    {
      uint64_t result = _newrpclib_xdr_int32_t(a1, (int *)(a2 + 56));
      if (result)
      {
        uint64_t result = _newrpclib_xdr_pointer(a1, (void **)(a2 + 64), 0x20uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rpcbs_addrlist);
        if (result) {
          return _newrpclib_xdr_pointer(a1, (void **)(a2 + 72), 0x28uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rpcbs_rmtcalllist) != 0;
        }
      }
    }
  }
  return result;
}

BOOL _newrpclib_xdr_rpcb_stat_byvers(uint64_t a1, uint64_t a2)
{
  return _newrpclib_xdr_vector(a1, a2, 3, 0x50u, (uint64_t (*)(uint64_t, uint64_t))_newrpclib_xdr_rpcb_stat) != 0;
}

uint64_t _newrpclib_xdr_netbuf(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result = _newrpclib_xdr_uint32_t(a1, (int *)a2);
  if (result) {
    return _newrpclib_xdr_bytes(a1, (void **)(a2 + 16), (int *)(a2 + 8), 0x10000u) != 0;
  }
  return result;
}

BOOL _newrpclib_rpcb_getaddr_timeout(unsigned __int8 *a1, char *a2, unsigned int a3, unsigned int a4, uint64_t a5, long long *a6)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unsigned int v21 = 2;
  unsigned int v22 = 4;
  memset(__src, 0, sizeof(__src));
  unsigned int v6 = a1[1];
  if (v6 > 0x1E || ((1 << v6) & 0x40000006) == 0)
  {
    BOOL result = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    _newrpclib_rpcb_getaddr_timeout_cold_1(v6);
    return 0;
  }
  if (v6 == 2) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 3;
  }
  __memcpy_chk();
  unsigned int v14 = getrpcbind_handle(a2, (uint64_t)__src, v13, a5, a6);
  if (!v14)
  {
    uint64_t i = 4;
    goto LABEL_14;
  }
  uint64_t v15 = (uint64_t)v14;
  int v16 = rpcbind_getaddr_generic((uint64_t)v14, v13, a2, a3, a4, (uint64_t)__src);
  if (!handle_callerror(v15, (int *)&v21, &v22))
  {
    (*(void (**)(uint64_t))(*(void *)(v15 + 8) + 32))(v15);
    for (uint64_t i = v22; i >= v21; uint64_t i = (i - 1))
    {
LABEL_14:
      if (v13 != i)
      {
        unsigned int v19 = getrpcbind_handle(a2, (uint64_t)__src, i, a5, a6);
        if (v19)
        {
          uint64_t v15 = (uint64_t)v19;
          int v16 = rpcbind_getaddr_generic((uint64_t)v19, i, a2, a3, a4, (uint64_t)__src);
          if (handle_callerror(v15, (int *)&v21, &v22)) {
            goto LABEL_21;
          }
          (*(void (**)(uint64_t))(*(void *)(v15 + 8) + 32))(v15);
        }
      }
    }
    return 0;
  }
LABEL_21:
  (*(void (**)(uint64_t))(*(void *)(v15 + 8) + 32))(v15);
  if (!v16 || LOBYTE(__src[0]) > *a1) {
    return 0;
  }
  if (a1[1] == 30) {
    int v20 = *((_DWORD *)a1 + 6);
  }
  else {
    int v20 = 0;
  }
  memcpy(a1, __src, LOBYTE(__src[0]));
  if (a1[1] == 30 && v20 != *((_DWORD *)a1 + 6)) {
    *((_DWORD *)a1 + 6) = v20;
  }
  return 1;
}

void *getrpcbind_handle(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5)
{
  uint64_t v13 = 0;
  int v11 = -1;
  int v12 = 0;
  if (a3 == 2 && portmap_netid)
  {
    if (_newrpclib_netid2socparms(portmap_netid, (_DWORD *)&v13 + 1, &v13, &v12, 0)) {
      int v12 = 17;
    }
  }
  else if (_newrpclib_netid2socparms(a1, (_DWORD *)&v13 + 1, &v13, &v12, 0))
  {
    goto LABEL_14;
  }
  if (HIDWORD(v13) == 1)
  {
    if (v13 == 1) {
      return clntstrm_create_timeout((const sockaddr *)a2, 100000, a3, &v11, 0x190u, 0x190u, a4, a5);
    }
    goto LABEL_14;
  }
  if (HIDWORD(v13) != 30 && HIDWORD(v13) != 2)
  {
LABEL_14:
    int v10 = _newrpclib___rpc_createerr();
    BOOL result = 0;
    _OWORD *v10 = xmmword_23C0AD0F0;
    return result;
  }
  if (v12 != 6)
  {
    if (v12 == 17)
    {
      *(_WORD *)(a2 + 2) = 28416;
      return (void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t, uint64_t, long long *))_newrpclib_clntudp_bufcreate_timeout)(a2, 100000, a3, &v11, 400, 400, a4, a5);
    }
    goto LABEL_14;
  }
  *(_WORD *)(a2 + 2) = 28416;
  return _newrpclib_clnttcp_create_timeout((const sockaddr *)a2, 100000, a3, &v11, 0x190u, 0x190u, a4, a5);
}

uint64_t rpcbind_getaddr_generic(uint64_t a1, int a2, char *a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  long long v30 = 0u;
  long long v31 = 0u;
  *(void *)unsigned int v29 = 0;
  *(_DWORD *)_newrpclib___rpc_createerr() = 0;
  if ((a2 - 3) < 2)
  {
    *(void *)&long long v30 = __PAIR64__(a5, a4);
    *((void *)&v30 + 1) = a3;
    *(void *)&long long v31 = &unk_23C0AEBAD;
    *((void *)&v31 + 1) = &unk_23C0AEBAD;
    if (a2 == 3) {
      int v12 = _newrpclib_rpcbproc_getaddr_3((uint64_t)&v30, v29, a1);
    }
    else {
      int v12 = _newrpclib_rpcbproc_getaddr_4((uint64_t)&v30, v29, a1);
    }
    int v15 = v12;
    int v16 = *(void (**)(uint64_t, char *))(*(void *)(a1 + 8) + 16);
    uint64_t v17 = (char *)_newrpclib___rpc_createerr();
    v16(a1, v17 + 4);
    if (v15)
    {
      if ((v15 & 0xFFFFFFFE) != 0xE) {
        return 0;
      }
      goto LABEL_18;
    }
    if (!**(unsigned char **)v29)
    {
      int v15 = 15;
      goto LABEL_18;
    }
    if (_newrpclib_uaddr2sa(*(const char **)v29, a3, (unsigned __int8 *)a6))
    {
      *((_DWORD *)_newrpclib___rpc_createerr() + 1) = 12;
      int v18 = *__error();
      goto LABEL_17;
    }
    return 1;
  }
  if (a2 == 2)
  {
    uint64_t v27 = 0;
    if (*(unsigned char *)(a6 + 1) == 30)
    {
      if (*(_DWORD *)(a6 + 8)
        || *(_DWORD *)(a6 + 12)
        || (int v20 = *(_DWORD *)(a6 + 16), v20 != -65536) && (v20 || (*(_DWORD *)(a6 + 20) | 0x1000000) == 0x1000000))
      {
        *(_DWORD *)_newrpclib___rpc_createerr() = 14;
        *((_DWORD *)_newrpclib___rpc_createerr() + 1) = 12;
        uint64_t v13 = _newrpclib___rpc_createerr();
        uint64_t result = 0;
        v13[2] = 22;
        return result;
      }
    }
    if (_newrpclib_netid2socparms(a3, 0, 0, &v27, 1))
    {
      *(_DWORD *)_newrpclib___rpc_createerr() = 14;
      *((_DWORD *)_newrpclib___rpc_createerr() + 1) = 12;
      int v21 = *__error();
      unsigned int v22 = _newrpclib___rpc_createerr();
      uint64_t result = 0;
      v22[2] = v21;
      return result;
    }
    v28[0] = a4;
    v28[1] = a5;
    v28[2] = v27;
    v28[3] = 0;
    int v23 = _newrpclib_pmapproc_getport_2((uint64_t)v28, (_DWORD *)&v27 + 1, a1);
    uint64_t v24 = *(void (**)(uint64_t, char *))(*(void *)(a1 + 8) + 16);
    size_t v25 = (char *)_newrpclib___rpc_createerr();
    v24(a1, v25 + 4);
    if (!v23)
    {
      if ((HIDWORD(v27) - 0x10000) <= 0xFFFF0000)
      {
        unsigned int v26 = _newrpclib___rpc_createerr();
        uint64_t result = 0;
        _DWORD *v26 = 15;
        return result;
      }
      *(_WORD *)(a6 + 2) = bswap32(HIDWORD(v27)) >> 16;
    }
    return 1;
  }
  *((_DWORD *)_newrpclib___rpc_createerr() + 1) = 12;
  int v18 = 22;
LABEL_17:
  *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v18;
  int v15 = 14;
LABEL_18:
  unsigned int v19 = _newrpclib___rpc_createerr();
  uint64_t result = 0;
  *unsigned int v19 = v15;
  return result;
}

uint64_t handle_callerror(uint64_t a1, int *a2, unsigned int *a3)
{
  unsigned int v10 = 0;
  uint64_t v9 = 0;
  if (*(_DWORD *)_newrpclib___rpc_createerr()) {
    return 1;
  }
  (*(void (**)(uint64_t, uint64_t *))(*(void *)(a1 + 8) + 16))(a1, &v9);
  if (!v9) {
    return 1;
  }
  if (v9 == 10) {
    return 0;
  }
  if (v9 != 9)
  {
    *(_DWORD *)_newrpclib___rpc_createerr() = 14;
    return 1;
  }
  if (a2)
  {
    int v7 = *a2;
    if (*a2 <= HIDWORD(v9)) {
      int v7 = HIDWORD(v9);
    }
    *a2 = v7;
  }
  if (!a3) {
    return 0;
  }
  uint64_t result = 0;
  unsigned int v8 = *a3;
  if (*a3 >= v10) {
    unsigned int v8 = v10;
  }
  *a3 = v8;
  return result;
}

void *_newrpclib_rpcb_getversaddr_timeout(unsigned __int8 *a1, char *a2, int a3, int a4, uint64_t a5, long long *a6)
{
  uint64_t result = getrpcbind_handle(a2, (uint64_t)a1, 4, a5, a6);
  if (result)
  {
    int v11 = result;
    *(void *)uint64_t v13 = 0;
    v14[0] = a3;
    v14[1] = a4;
    int v16 = &unk_23C0AEBAD;
    uint64_t v17 = &unk_23C0AEBAD;
    int v15 = a2;
    int v12 = _newrpclib_rpcbproc_getversaddr_4((uint64_t)v14, v13, (uint64_t)result);
    if (!v12)
    {
      if (_newrpclib_uaddr2sa(*(const char **)v13, a2, a1)) {
        int v12 = 12;
      }
      else {
        int v12 = 0;
      }
    }
    (*(void (**)(void *))(v11[1] + 32))(v11);
    return (void *)(v12 == 0);
  }
  return result;
}

BOOL _newrpclib_rpcb_getaddr(unsigned __int8 *a1, char *a2, unsigned int a3, unsigned int a4)
{
  return _newrpclib_rpcb_getaddr_timeout(a1, a2, a3, a4, 0, 0);
}

void *_newrpclib_rpcb_getversaddr(unsigned __int8 *a1, char *a2, int a3, int a4)
{
  return _newrpclib_rpcb_getversaddr_timeout(a1, a2, a3, a4, 0, 0);
}

BOOL _newrpclib_rpcb_getaddr_for_host(char *a1, char *__s2, unsigned int a3, unsigned int a4, unsigned __int8 *a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v13 = 0;
  int v10 = _newrpclib_netid2socparms(__s2, &v13, 0, 0, 0);
  BOOL result = 0;
  if (!v10)
  {
    memset(__src, 0, sizeof(__src));
    if (gethostaddr(a1, v13, __src))
    {
      return 0;
    }
    else
    {
      BOOL result = _newrpclib_rpcb_getaddr_timeout((unsigned __int8 *)__src, __s2, a3, a4, 0, 0);
      if (result)
      {
        if (*a5 >= LOBYTE(__src[0])) {
          size_t v12 = LOBYTE(__src[0]);
        }
        else {
          size_t v12 = *a5;
        }
        memcpy(a5, __src, v12);
        return 1;
      }
    }
  }
  return result;
}

void *_newrpclib_rpcb_set(char *a1, unsigned int a2, unsigned int a3, char *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  *(_OWORD *)int v21 = 0u;
  long long v22 = 0u;
  memset(&v19, 0, sizeof(v19));
  uint64_t v17 = 0;
  int v18 = 0;
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  int v8 = _newrpclib_netid2socparms(a1, &v16, 0, 0, 0);
  BOOL result = 0;
  if (!v8)
  {
    memset(v20, 0, sizeof(v20));
    switch(v16)
    {
      case 1:
        LOWORD(v20[0]) = 362;
        break;
      case 0x1E:
        LOWORD(v20[0]) = 7708;
        *(_OWORD *)((char *)v20 + 8) = *MEMORY[0x263EF88F8];
        break;
      case 2:
        LOWORD(v20[0]) = 528;
        DWORD1(v20[0]) = 16777343;
        break;
      default:
        return 0;
    }
    if (_newrpclib_pmap_wakeup()) {
      return 0;
    }
    BOOL result = getrpcbind_handle(a1, (uint64_t)v20, 3, (uint64_t)&set_retry_timeout_0, &set_total_timeout_0);
    if (result)
    {
      uint64_t v10 = (uint64_t)result;
      if (!_newrpclib_sa2uaddr(a4, (char **)&v17))
      {
        *(void *)&long long v14 = __PAIR64__(a3, a2);
        *((void *)&v14 + 1) = a1;
        *(void *)&long long v15 = v17;
        uid_t v11 = geteuid();
        int v12 = getpwuid_r(v11, &v19, v21, 0x100uLL, &v18);
        pw_name = (char *)&unk_23C0AEBAD;
        if (!v12 && v18) {
          pw_name = v18->pw_name;
        }
        *((void *)&v15 + 1) = pw_name;
        if (_newrpclib_rpcbproc_set_3((uint64_t)&v14, (_DWORD *)&v16 + 1, v10)) {
          HIDWORD(v16) = 0;
        }
      }
      (*(void (**)(uint64_t))(*(void *)(v10 + 8) + 32))(v10);
      if (v17) {
        free(v17);
      }
      return (void *)HIDWORD(v16);
    }
  }
  return result;
}

void *_newrpclib_rpcb_unset(char *a1, int a2, int a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unsigned int v21 = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  *(_OWORD *)long long v23 = 0u;
  long long v24 = 0u;
  memset(&v20, 0, sizeof(v20));
  unsigned int v6 = portmap_netid;
  passwd v19 = 0;
  if (!portmap_netid) {
    unsigned int v6 = "udp";
  }
  if (a1) {
    int v7 = a1;
  }
  else {
    int v7 = (char *)v6;
  }
  int v18 = 0;
  int v8 = _newrpclib_netid2socparms(v7, &v18, 0, 0, 0);
  BOOL result = 0;
  if (!v8)
  {
    memset(v22, 0, sizeof(v22));
    if (v18 == 30)
    {
      LOWORD(v22[0]) = 7708;
      *(_OWORD *)((char *)v22 + 8) = *MEMORY[0x263EF88F8];
    }
    else
    {
      if (v18 != 2) {
        return 0;
      }
      LOWORD(v22[0]) = 528;
      DWORD1(v22[0]) = 16777343;
    }
    if (_newrpclib_pmap_wakeup()) {
      return 0;
    }
    BOOL result = getrpcbind_handle(v7, (uint64_t)v22, 3, (uint64_t)&unset_retry_timeout_0, &unset_total_timeout_0);
    if (result)
    {
      uint64_t v10 = (uint64_t)result;
      v14[0] = a2;
      v14[1] = a3;
      pw_name = (char *)&unk_23C0AEBAD;
      if (a1) {
        int v12 = a1;
      }
      else {
        int v12 = (char *)&unk_23C0AEBAD;
      }
      long long v15 = v12;
      uint64_t v16 = &unk_23C0AEBAD;
      uid_t v13 = geteuid();
      if (!getpwuid_r(v13, &v20, v23, 0x100uLL, &v19) && v19) {
        pw_name = v19->pw_name;
      }
      uint64_t v17 = pw_name;
      if (_newrpclib_rpcbproc_unset_3((uint64_t)v14, &v21, v10)) {
        unsigned int v21 = 0;
      }
      (*(void (**)(uint64_t))(*(void *)(v10 + 8) + 32))(v10);
      return (void *)v21;
    }
  }
  return result;
}

void _newrpclib_authnone_create_cold_1(int a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v1 = 136316418;
  uint64_t v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/auth_none.c";
  __int16 v3 = 1024;
  int v4 = 125;
  __int16 v5 = 2080;
  unsigned int v6 = "_newrpclib_authnone_create";
  __int16 v7 = 2080;
  int v8 = "pthread_once";
  int v9 = 67108960;
  int v10 = a1;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void _newrpclib_authunix_create_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_authunix_create_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_authunix_create_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_authunix_create_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void marshal_new_auth_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_authunix_create_default_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_authunix_create_default_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib___rpc_createerr_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib___rpc_createerr_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void tsd_init_rpc_createerr_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _buf_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _buf_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void tsd_init_buf_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_clntraw_create_cold_1()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v0 = 136315906;
  uint64_t v1 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/clnt_raw.c";
  __int16 v2 = 1024;
  int v3 = 144;
  __int16 v4 = 2080;
  __int16 v5 = "_newrpclib_clntraw_create";
  __int16 v6 = 2080;
  __int16 v7 = "xdr_callhdr: Fatal header serialization error.";
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s\n", (uint8_t *)&v0, 0x26u);
}

void clntstrm_create_timeout_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void clntstrm_create_timeout_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, Unsupported protocol family %d\n", v1, v2, v3, v4, 2u);
}

void clntstrm_create_timeout_cold_3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136316162;
  uint64_t v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/clnt_strm.c";
  OUTLINED_FUNCTION_7_0();
  __int16 v3 = v0;
  OUTLINED_FUNCTION_5_0();
  __int16 v4 = 96;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, Could not create stream socket for %d protocol family: %m\n", (uint8_t *)&v1, 0x24u);
}

void clntstrm_create_timeout_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, Unsupported protocol family %d\n", v1, v2, v3, v4, 2u);
}

void clntstrm_create_timeout_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void clntstrm_create_timeout_cold_6()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  __error();
  *(_DWORD *)uint64_t v1 = 136316418;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v1[7] = 198;
  v1[9] = 2080;
  uint64_t v2 = "get_socket_and_domain";
  __int16 v3 = 2080;
  uint64_t v4 = "Stream socket could not get name";
  int v5 = 67108960;
  int v6 = v0;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)v1, 0x2Eu);
}

void clntstrm_create_timeout_cold_7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_0(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, Socket is of type %d, not SOCK_STREAM\n", v1, v2, v3, v4, 2u);
}

void clntticotsord_create_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void clntticots_create_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_clnttcp_create_sa_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_clnttcp_create_timeout_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_clnttcp_create_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void clntticotsord_create_timeout_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6_0(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, Remote address is not an AF_LOCAL domain address, Protocal is %d\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_rpc_control_cold_1(int a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v1 = 136315906;
  uint64_t v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/rpc_control.c";
  __int16 v3 = 1024;
  int v4 = 171;
  __int16 v5 = 2080;
  int v6 = "_newrpclib_rpc_control";
  __int16 v7 = 1024;
  int v8 = a1;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, Unknown rpc_control command (%d)\n\n", (uint8_t *)&v1, 0x22u);
}

void _newrpclib__authenticate_cold_1()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = 136316162;
  int v4 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_auth.c";
  OUTLINED_FUNCTION_0();
  __int16 v5 = v0;
  int v6 = "_newrpclib__authenticate";
  __int16 v7 = v0;
  int v8 = v1;
  __int16 v9 = v0;
  int v10 = v2;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, Could not change credentials for uid = %d gid = %d\n", (uint8_t *)&v3, 0x28u);
}

void _newrpclib__authenticate_cold_2()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  __error();
  int v2 = 136316418;
  int v3 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_auth.c";
  __int16 v4 = 1024;
  OUTLINED_FUNCTION_0();
  __int16 v5 = "_newrpclib__authenticate";
  __int16 v6 = v0;
  __int16 v7 = "pthread_setugid_np";
  int v8 = 67108960;
  int v9 = v1;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v2, 0x2Eu);
}

void _newrpclib__authenticate_cold_3()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  __error();
  int v2 = 136316418;
  int v3 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_auth.c";
  __int16 v4 = 1024;
  OUTLINED_FUNCTION_0();
  __int16 v5 = "_newrpclib__authenticate";
  __int16 v6 = v0;
  __int16 v7 = "pthread_getugid_np failed.";
  int v8 = 67108960;
  int v9 = v1;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v2, 0x2Eu);
}

void add_working_xprt_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v0 = 136315650;
  int v1 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
  __int16 v2 = 1024;
  int v3 = 138;
  __int16 v4 = 2080;
  __int16 v5 = "add_working_xprt";
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s aborted.\n", (uint8_t *)&v0, 0x1Cu);
}

void add_working_xprt_cold_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v1 = 136315906;
  __int16 v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
  __int16 v3 = 1024;
  int v4 = 137;
  __int16 v5 = 2080;
  uint64_t v6 = "add_working_xprt";
  __int16 v7 = 2048;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, xprt %p is already on workq\n", (uint8_t *)&v1, 0x26u);
}

void _newrpclib_svc_pollnext_cold_1()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  int v1 = 136316418;
  __int16 v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
  __int16 v3 = 1024;
  int v4 = 227;
  __int16 v5 = 2080;
  uint64_t v6 = "_newrpclib_svc_pollnext";
  __int16 v7 = 2080;
  uint64_t v8 = "EXPECTED CONTROL PIPE, BUT DIDN'T GET IT";
  int v9 = 67108960;
  int v10 = v0;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void _newrpclib_registerrpc_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_registerrpc_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_registerrpc_cold_3(int a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = 136316162;
  uint64_t v3 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_simple.c";
  __int16 v4 = 1024;
  int v5 = 105;
  __int16 v6 = 2080;
  __int16 v7 = "_newrpclib_registerrpc";
  __int16 v8 = 2048;
  uint64_t v9 = a1;
  __int16 v10 = 2048;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, couldn't register prog %ld vers %ld\n\n", (uint8_t *)&v2, 0x30u);
}

void _newrpclib_registerrpc_cold_4()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  int v1 = 136316418;
  int v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_simple.c";
  __int16 v3 = 1024;
  int v4 = 110;
  __int16 v5 = 2080;
  __int16 v6 = "_newrpclib_registerrpc";
  __int16 v7 = 2080;
  __int16 v8 = "mem_alloc failed";
  int v9 = 67108960;
  int v10 = v0;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void universal_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void universal_cold_2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v2 = 136315906;
  OUTLINED_FUNCTION_3();
  *(_DWORD *)&v2[7] = 165;
  v2[9] = 2080;
  uint64_t v3 = "universal";
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, never registered prog %d\n\n", (uint8_t *)v2, 0x22u);
}

void universal_cold_3(int *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v1 = *a1;
  int v2 = 136315906;
  uint64_t v3 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_simple.c";
  __int16 v4 = 1024;
  int v5 = 157;
  __int16 v6 = 2080;
  __int16 v7 = "universal";
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, trouble replying to prog %d\n\n", (uint8_t *)&v2, 0x22u);
}

void _newrpclib_svctcp_create_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svctcp_create_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svctcp_create_cold_3()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svctcp_create_cold_4()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svctcp_create_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svctcp_create_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svctcp_create_cold_7()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcstrm_domain_create_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcstrm_domain_create_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcstrm_domain_create_cold_3()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcticotsord_create_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcticotsord_create_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcticotsord_create_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, Could not change local socket path %s to 0777\n", v1, v2, v3, v4, 2u);
}

void svcticotsord_create_cold_4()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(_DWORD *)uint64_t v1 = 136316162;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)&v1[7] = 430;
  v1[9] = 2080;
  uint64_t v2 = "svcticotsord_create";
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  __int16 v5 = 96;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, Could not bind stream socket addr %s: %m\n", (uint8_t *)v1, 0x28u);
}

void svcticotsord_create_cold_5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void svcticotsord_create_cold_6()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcticotsord_create_cold_7()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcticotsord_create_cold_8()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcticotsord_create_cold_9()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void makefd_xprt_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void makefd_xprt_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void makefd_xprt_cold_3()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void makefd_xprt_cold_4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void makefd_xprt_cold_5()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void rendezvous_request_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcstrm_destroy_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void readstrm_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void readstrm_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void writestrm_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcstrm_recv_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void svcstrm_recv_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcstrm_recv_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void svcstrm_reply_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svcudp_bufcreate_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svcudp_bufcreate_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svcudp_bufcreate_cold_3()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svcudp_bufcreate_cold_4()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svcudp_bufcreate_cold_5()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svcudp_bufcreate_cold_6()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcudp_recv_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcudp_recv_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcudp_reply_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void svcudp_reply_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void svcudp_reply_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
}

void svcudp_reply_cold_4()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svcudp_destroy_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svc_xprt_create_cold_1()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  int v1 = 136316418;
  uint64_t v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_xprt.c";
  __int16 v3 = 1024;
  int v4 = 45;
  __int16 v5 = 2080;
  uint64_t v6 = "svc_xprt_create";
  __int16 v7 = 2080;
  __int16 v8 = "mem_alloc failed";
  int v9 = 67108960;
  int v10 = v0;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void svc_xprt_create_cold_2()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  int v1 = 136316418;
  uint64_t v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_xprt.c";
  __int16 v3 = 1024;
  int v4 = 50;
  __int16 v5 = 2080;
  uint64_t v6 = "svc_xprt_create";
  __int16 v7 = 2080;
  __int16 v8 = "mem_alloc failed";
  int v9 = 67108960;
  int v10 = v0;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void svc_oncrpc_start_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svc_oncrpc_start_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svc_oncrpc_start_cold_3()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svc_armxprt_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svc_armxprt_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v0[0] = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = "svc_armxprt";
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s aborted.\n", (uint8_t *)v0, 0x1Cu);
}

void svc_armxprt_cold_3()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, ** OOPS ** fd = %d, xprt = %p ** ALREADY ARMED **\n", v1, v2, v3, v4, 2u);
}

void svc_rmxprt_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void wakeup_kq_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svc_rearmxprt_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, Trying to re-arm a dead export %p (%d)\n", v1, v2, v3, v4, 2u);
}

void svc_rearmxprt_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svc_rearmxprt_cold_3()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_5_1(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, ** OOPS ** fd = %d, xprt = %p ** ALREADY ARMED **\n", v1, v2, v3, v4, 2u);
}

void svc_unarmxprt_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v0[0] = 136315650;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  uint64_t v1 = "svc_unarmxprt";
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s aborted.\n", (uint8_t *)v0, 0x1Cu);
}

void svc_unarmxprt_cold_2()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_5_1(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, ** OOPS ** fd = %d, xprt = %p ** ALREADY DIS-ARMED **\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svc_enable_localaddr_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  uint64_t v3 = "_newrpclib_svc_enable_localaddr";
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, Local address extraction not supported for netid \"%s\".\n", (uint8_t *)v2, 0x26u);
}

void _newrpclib_svc_enable_localaddr_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_svc_enable_localaddr_cold_3()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  uint64_t v3 = "_newrpclib_svc_enable_localaddr";
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, netid %s\n", (uint8_t *)v2, 0x26u);
}

void _newrpclib_xdr_array_cold_1()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  int v1 = 136316418;
  uint64_t v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/xdr_array.c";
  __int16 v3 = 1024;
  int v4 = 122;
  __int16 v5 = 2080;
  uint64_t v6 = "_newrpclib_xdr_array";
  __int16 v7 = 2080;
  __int16 v8 = "mem_alloc failed";
  int v9 = 67108960;
  int v10 = v0;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void _newrpclib_xdrrec_create_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_xdrrec_create_cold_2()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_xdrrec_create_cold_3()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_xdr_reference_cold_1()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  int v1 = 136316418;
  uint64_t v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/xdr_reference.c";
  __int16 v3 = 1024;
  int v4 = 104;
  __int16 v5 = 2080;
  uint64_t v6 = "_newrpclib_xdr_reference";
  __int16 v7 = 2080;
  __int16 v8 = "mem_alloc failed";
  int v9 = 67108960;
  int v10 = v0;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void _newrpclib_xdr_bytes_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void xdr_vmbytes_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib_xdr_string_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_23C096000, MEMORY[0x263EF8438], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void recvfrom_and_to_cold_1()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v0 = *__error();
  int v1 = 136316418;
  uint64_t v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/rpc_inet.c";
  __int16 v3 = 1024;
  int v4 = 557;
  __int16 v5 = 2080;
  uint64_t v6 = "recvfrom_and_to";
  __int16 v7 = 2080;
  __int16 v8 = "Could not get socket name";
  int v9 = 67108960;
  int v10 = v0;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void cache_init_cold_1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v0 = 136315650;
  int v1 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/rpc_inet.c";
  __int16 v2 = 1024;
  int v3 = 385;
  __int16 v4 = 2080;
  __int16 v5 = "cache_init";
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s aborted.\n", (uint8_t *)&v0, 0x1Cu);
}

void _newrpclib_rpcb_getaddr_timeout_cold_1(unsigned __int8 a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v1 = 136315906;
  __int16 v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/rpcbind.c";
  __int16 v3 = 1024;
  int v4 = 291;
  __int16 v5 = 2080;
  uint64_t v6 = "_newrpclib_rpcb_getaddr_timeout";
  __int16 v7 = 1024;
  int v8 = a1;
  _os_log_error_impl(&dword_23C096000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s:%d in %s, Unsupported address family %d\n", (uint8_t *)&v1, 0x22u);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x270ED7E40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED8478](*(void *)&a1, a2, a3);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270ED8688](a1, a2);
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return MEMORY[0x270ED8750](a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

int bindresvport_sa(int a1, sockaddr *a2)
{
  return MEMORY[0x270ED8760](*(void *)&a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freehostent(hostent *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x270ED9B98](a1, a2, a3, a4);
}

gid_t getegid(void)
{
  return MEMORY[0x270ED9BE0]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

int getgroups(int a1, gid_t a2[])
{
  return MEMORY[0x270ED9C38](*(void *)&a1, a2);
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return (hostent *)MEMORY[0x270ED9C48](a1);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x270ED9C58](a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

hostent *__cdecl getipnodebyname(const char *a1, int a2, int a3, int *a4)
{
  return (hostent *)MEMORY[0x270ED9C78](a1, *(void *)&a2, *(void *)&a3, a4);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x270ED9D40](*(void *)&a1, a2, a3, a4, a5);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9D88](*(void *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x270ED9D90](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x270ED9E80](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x270ED9EC8](*(void *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

int kevent64(int kq, const kevent64_s *changelist, int nchanges, kevent64_s *eventlist, int nevents, unsigned int flags, const timespec *timeout)
{
  return MEMORY[0x270ED9F68](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, *(void *)&flags, timeout);
}

int kqueue(void)
{
  return MEMORY[0x270ED9F90]();
}

int listen(int a1, int a2)
{
  return MEMORY[0x270EDA078](*(void *)&a1, *(void *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x270EDA570](a1, *(void *)&a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pipe(int a1[2])
{
  return MEMORY[0x270EDAC38](a1);
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return MEMORY[0x270EDAC40](a1, *(void *)&a2, *(void *)&a3);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x270EDAE18](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x270EDAE40](a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE80](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_getugid_np(uid_t *a1, gid_t *a2)
{
  return MEMORY[0x270EDAEF8](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
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

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x270EDB020](*(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return MEMORY[0x270EDB050](*(void *)&a1, *(void *)&a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB150](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x270EDB198](*(void *)&a1, a2, a3, *(void *)&a4, a5, a6);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x270EDB1A0](*(void *)&a1, a2, *(void *)&a3);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x270EDB3C0](*(void *)&a1, a2, a3, *(void *)&a4, a5, *(void *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

void warnx(const char *a1, ...)
{
}