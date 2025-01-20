uint64_t _tb_afk_common_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  char *v5;

  v5 = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v5) {
    goto LABEL_5;
  }
  *(void *)a3 = v5;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 48) = 0;
  *(unsigned char *)(a3 + 41) = 0;
  return 0;
}

uint64_t _tb_afk_common_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  free(*(void **)a1);
  *(void *)a1 = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  return _tb_afk_common_transport_construct_message_buffer(a3, v5, a1);
}

void _tb_afk_common_transport_destruct_message_buffer(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 41) = 1;
}

void *tb_afk_transport_create(uint64_t a1)
{
  uint64_t value = tb_endpoint_get_value(a1);
  if (!objc_opt_class()) {
    return 0;
  }
  v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v2) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  v3 = v2;
  v4 = (dispatch_queue_t *)malloc_type_calloc(1uLL, 0x10uLL, 0x80040803F642BuLL);
  if (!v4) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v5 = v4;
  v3[12] = v4;
  v3[3] = _tb_afk_common_transport_construct_message_buffer;
  v3[4] = _tb_afk_common_transport_destruct_message_buffer;
  v3[5] = _tb_afk_common_transport_message_buffer_reset;
  void *v3 = _tb_afk_user_transport_send_message;
  v3[1] = _tb_afk_user_transport_activate;
  v3[2] = _tb_afk_user_transport_activate;
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.tightbeam.afk_transport.q", 0);
  dispatch_queue_t v7 = *v5;
  *uint64_t v5 = v6;

  uint64_t v8 = [MEMORY[0x263F20838] withService:value];
  dispatch_queue_t v9 = v5[1];
  v5[1] = (dispatch_queue_t)v8;

  dispatch_queue_t v10 = v5[1];
  if (!v10) {
    tb_afk_transport_create_cold_3();
  }
  [v10 setDispatchQueue:*v5];
  dispatch_queue_t v11 = v5[1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __tb_afk_transport_create_block_invoke;
  v15[3] = &__block_descriptor_40_e50_i60__0__AFKEndpointInterface_8_v16I24Q28_v36Q44Q52l;
  v15[4] = v3;
  [v11 setCommandHandlerWithReturn:v15];
  dispatch_queue_t v12 = v5[1];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __tb_afk_transport_create_block_invoke_2;
  v14[3] = &__block_descriptor_40_e44_v44__0__AFKEndpointInterface_8I16Q20r_v28Q36l;
  v14[4] = v3;
  [v12 setReportHandler:v14];
  return v3;
}

uint64_t _tb_afk_user_transport_send_message(uint64_t a1, _DWORD *a2, void *a3, char a4)
{
  if (*a2 != 3) {
    _tb_afk_user_transport_send_message_cold_3();
  }
  uint64_t v7 = *(void *)(a1 + 96);
  transport_buffer = (void *)tb_message_get_transport_buffer((uint64_t)a2);
  if ((a4 & 2) == 0)
  {
    int v9 = [*(id *)(v7 + 8) enqueueReport:192 timestamp:mach_continuous_time() inputBuffer:*transport_buffer inputBufferSize:transport_buffer[3] options:0];
    goto LABEL_10;
  }
  size_t __n = 0x2000;
  uint64_t v16 = 0;
  dispatch_queue_t v10 = malloc_type_calloc(0x2000uLL, 1uLL, 0x100004077774924uLL);
  if (!v10) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  dispatch_queue_t v11 = v10;
  LODWORD(v14) = 0;
  int v9 = [*(id *)(v7 + 8) enqueueCommandSync:192 timestamp:mach_continuous_time() inputBuffer:*transport_buffer inputBufferSize:transport_buffer[3] responseTimestamp:&v16 outputBuffer:v10 inOutBufferSize:&__n options:v14];
  if (!v9)
  {
    tb_message_configure_received((uint64_t)a2, 2);
    uint64_t v12 = tb_message_get_transport_buffer((uint64_t)a2);
    if (_tb_afk_common_transport_message_buffer_reset(v12, 0, __n))
    {
      __break(1u);
    }
    else
    {
      memcpy(*(void **)v12, v11, __n);
      *(void *)(v12 + 16) = 0;
      if (a3)
      {
        *a3 = a2;
        goto LABEL_9;
      }
    }
    _tb_afk_user_transport_send_message_cold_2();
  }
LABEL_9:
  free(v11);
LABEL_10:
  if (v9) {
    return 5;
  }
  else {
    return 0;
  }
}

uint64_t _tb_afk_user_transport_activate(uint64_t a1)
{
  return 0;
}

uint64_t __tb_afk_transport_create_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, const void *a6, size_t a7)
{
  id v11 = a2;
  uint64_t v12 = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
  if (!v12) {
LABEL_15:
  }
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v13 = v12;
  uint64_t v14 = (void **)malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
  if (!v14) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  v15 = v14;
  if (_tb_afk_common_transport_construct_message_buffer(a7, 0, (uint64_t)v14)
    || tb_message_construct((uint64_t)v13, (uint64_t)v15, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  tb_message_configure_received((uint64_t)v13, 1);
  memcpy(*v15, a6, a7);
  uint64_t v26 = 0;
  int v16 = tb_transport_call_message_handler(*(void **)(a1 + 32), (uint64_t)v13, &v26);
  if (v16 || !v26)
  {
    if (v16) {
      uint64_t v24 = v16 | 0xE0C04000;
    }
    else {
      uint64_t v24 = 3758097095;
    }
    uint64_t v17 = mach_continuous_time();
    v21 = v11;
    uint64_t v22 = a3;
    uint64_t v23 = v24;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  else
  {
    if (*(_DWORD *)v26 != 2) {
      __tb_afk_transport_create_block_invoke_cold_3();
    }
    uint64_t v17 = mach_continuous_time();
    v18 = *(uint64_t **)(v26 + 80);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[3];
    v21 = v11;
    uint64_t v22 = a3;
    uint64_t v23 = 0;
  }
  [v21 enqueueResponseForContext:v22 status:v23 timestamp:v17 outputBuffer:v19 outputBufferSize:v20 options:0];
  _tb_afk_common_transport_destruct_message_buffer((uint64_t)v15);
  tb_message_destruct((uint64_t)v13);
  free(v15);
  free(v13);

  return 0;
}

void __tb_afk_transport_create_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const void *a5, size_t a6)
{
  id v9 = a2;
  dispatch_queue_t v10 = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
  if (!v10) {
LABEL_9:
  }
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  id v11 = v10;
  uint64_t v12 = (void **)malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
  if (!v12) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  v13 = v12;
  if (_tb_afk_common_transport_construct_message_buffer(a6, 0, (uint64_t)v12)
    || tb_message_construct((uint64_t)v11, (uint64_t)v13, 1)
    || (tb_message_configure_received((uint64_t)v11, 1),
        memcpy(*v13, a5, a6),
        uint64_t v14 = 0,
        tb_transport_call_message_handler(*(void **)(a1 + 32), (uint64_t)v11, &v14))
    || v14)
  {
    __break(1u);
    goto LABEL_9;
  }
  _tb_afk_common_transport_destruct_message_buffer((uint64_t)v13);
  tb_message_destruct((uint64_t)v11);
  free(v13);
  free(v11);
}

uint64_t _tb_null_transport_send_message(uint64_t a1, uint64_t a2, uint64_t *a3, int a4)
{
  uint64_t transport_buffer = tb_message_get_transport_buffer(a2);
  size_t v9 = *(void *)(transport_buffer + 24);
  dispatch_queue_t v10 = *(const void **)transport_buffer;
  id v11 = (char *)malloc_type_calloc(v9, 1uLL, 0x100004077774924uLL);
  if (v11 > &v11[v9]) {
    goto LABEL_15;
  }
  uint64_t v12 = v11;
  if (!v11) {
    goto LABEL_16;
  }
  memcpy(v11, v10, v9);
  v13 = (void **)malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
  if (!v13) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v14 = v13;
  void *v13 = v12;
  v13[2] = 0;
  v13[3] = (void *)v9;
  v13[4] = 0;
  v13[6] = 0;
  *((_WORD *)v13 + 21) = *(_WORD *)(transport_buffer + 42);
  v15 = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
  if (!v15) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  int v16 = v15;
  _DWORD *v15 = 4;
  *((unsigned char *)v15 + 4) = 1;
  *((void *)v15 + 10) = v14;
  *((void *)v15 + 3) = a1;
  tb_message_configure_received((uint64_t)v15, 1);
  uint64_t v17 = *(void *)(a1 + 72);
  uint64_t v18 = (uint64_t)v16;
  if (v17)
  {
    uint64_t v18 = (*(uint64_t (**)(uint64_t, void *))(v17 + 16))(v17, v16);
    if (!v18)
    {
      free(*v14);
      free(v14);
      free(v16);
      return (2 * a4) & 4;
    }
  }
  uint64_t v19 = tb_message_get_transport_buffer(v18);
  size_t v20 = *(void *)(v19 + 24);
  free(*(void **)transport_buffer);
  *(void *)uint64_t transport_buffer = 0;
  *(void *)(transport_buffer + 16) = 0;
  *(void *)(transport_buffer + 24) = 0;
  if (_tb_null_transport_construct_message_buffer(v20, v21, transport_buffer)) {
    _tb_null_transport_send_message_cold_4();
  }
  size_t v22 = *(void *)(v19 + 24);
  if (v22 > *(void *)(transport_buffer + 24))
  {
LABEL_15:
    __break(0x5519u);
LABEL_16:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  memcpy(*(void **)transport_buffer, *(const void **)v19, v22);
  *(_WORD *)(transport_buffer + 42) = *(_WORD *)(v19 + 42);
  *(void *)(a2 + 24) = *(void *)(v18 + 24);
  tb_message_configure_received(a2, 2);
  if (v14 != (void **)v19)
  {
    free(*(void **)v19);
    free((void *)v19);
  }
  free(*v14);
  free(v14);
  free(v16);
  uint64_t result = 0;
  if (a3) {
    *a3 = a2;
  }
  return result;
}

uint64_t _tb_null_client_transport_activate()
{
  return 0;
}

uint64_t _tb_null_service_transport_activate()
{
  return 0;
}

uint64_t _tb_null_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v5) {
    goto LABEL_5;
  }
  *(void *)a3 = v5;
  *(unsigned char *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 48) = 0;
  *(unsigned char *)(a3 + 41) = 0;
  return 0;
}

void _tb_null_transport_destruct_message_buffer(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 41) = 1;
}

uint64_t _tb_null_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  free(*(void **)a1);
  *(void *)a1 = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  return _tb_null_transport_construct_message_buffer(a3, v5, a1);
}

uint64_t _tb_null_transport_supports_multipart_messages()
{
  return 1;
}

uint64_t _tb_null_transport_get_tx_buffer_size()
{
  return tb_null_transport_max_send_size;
}

__n128 tb_null_transport_create_inplace_with_endpoint(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(void *)(a2 + 224) = 0;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)a2 = _tb_null_transport_vtable;
  long long v3 = xmmword_26B39B558;
  __n128 result = *(__n128 *)&off_26B39B568;
  long long v4 = xmmword_26B39B548;
  *(void *)(a2 + 64) = off_26B39B578;
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)(a2 + 48) = result;
  *(_OWORD *)(a2 + 16) = v4;
  *(void *)(a2 + 96) = 0;
  return result;
}

__n128 tb_null_transport_create()
{
  v0 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v0) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  *(_OWORD *)((char *)v0 + 216) = 0u;
  *(_OWORD *)((char *)v0 + 200) = 0u;
  *(_OWORD *)((char *)v0 + 184) = 0u;
  *(_OWORD *)((char *)v0 + 168) = 0u;
  *(_OWORD *)((char *)v0 + 152) = 0u;
  *(_OWORD *)((char *)v0 + 136) = 0u;
  *(_OWORD *)((char *)v0 + 120) = 0u;
  *(_OWORD *)((char *)v0 + 104) = 0u;
  *(_OWORD *)((char *)v0 + 88) = 0u;
  *(_OWORD *)((char *)v0 + 72) = 0u;
  long long v1 = *(_OWORD *)&off_26B39B568;
  v0[2] = xmmword_26B39B558;
  v0[3] = v1;
  *((void *)v0 + 8) = off_26B39B578;
  __n128 result = (__n128)xmmword_26B39B548;
  _OWORD *v0 = _tb_null_transport_vtable;
  v0[1] = result;
  return result;
}

uint64_t tb_conclave_start()
{
  uint64_t v3 = 0;
  long long v4 = &v3;
  uint64_t v5 = 0x2000000000;
  int v6 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __tb_conclave_start_block_invoke;
  block[3] = &unk_26553E070;
  block[4] = &v3;
  if (tb_conclave_start_onceToken[0] != -1) {
    dispatch_once(tb_conclave_start_onceToken, block);
  }
  uint64_t v0 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t __tb_conclave_start_block_invoke(uint64_t a1)
{
  uint64_t result = exclaves_launch_conclave();
  if (result) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 3;
  }
  return result;
}

uint64_t tb_conclave_identifier_for_service(uint64_t a1, void *a2)
{
  uint64_t result = tb_conclave_start();
  if (!result)
  {
    uint64_t result = exclaves_lookup_service();
    if (result) {
      return 10;
    }
    else {
      *a2 = 0;
    }
  }
  return result;
}

uint64_t tb_conclave_endpoint_for_service(uint64_t a1, void *a2)
{
  uint64_t v7 = 0;
  uint64_t v3 = tb_conclave_identifier_for_service(a1, &v7);
  if (!v3)
  {
    long long v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    if (!v4) {
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    }
    uint64_t v5 = v7;
    void *v4 = 0;
    v4[1] = v5;
    *a2 = tb_endpoint_create_with_data(8, (uint64_t)v4, 0, &__block_literal_global);
  }
  return v3;
}

void __tb_conclave_endpoint_for_service_block_invoke(int a1, void *a2)
{
}

void *tb_eve_client_transport_create(uint64_t a1)
{
  v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x108004074646765uLL);
  if (!v2) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v3 = v2;
  v2[12] = _tb_eve_transport_create(a1);
  v3[3] = _tb_eve_transport_construct_message_buffer;
  v3[4] = _tb_eve_transport_destruct_message_buffer;
  v3[5] = _tb_eve_transport_message_buffer_reset;
  void *v3 = _tb_eve_transport_send_message;
  v3[1] = _tb_eve_transport_activate;
  v3[8] = _tb_eve_transport_destruct;
  return v3;
}

char *tb_owned_buffer_allocate(size_t a1)
{
  uint64_t result = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (result > &result[a1]) {
    goto LABEL_4;
  }
  if (!result) {
    goto LABEL_5;
  }
  if (!a1)
  {
LABEL_4:
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  return result;
}

double tb_message_initialize(uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  *(unsigned char *)(a1 + 4) = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = -1;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  return result;
}

_DWORD *tb_message_set_state(_DWORD *result, int a2)
{
  *double result = a2;
  return result;
}

uint64_t tb_message_set_disposition(uint64_t result, char a2)
{
  *(unsigned char *)(result + 4) = a2;
  return result;
}

uint64_t tb_message_construct(uint64_t a1, uint64_t a2, char a3)
{
  if (*(_DWORD *)a1) {
    tb_message_construct_cold_1();
  }
  *(_DWORD *)a1 = 1;
  *(unsigned char *)(a1 + 4) = a3;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 32) = -1;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = a2;
  return 0;
}

uint64_t tb_message_clear_connection_identifier(uint64_t result)
{
  *(void *)(result + 8) = 0;
  return result;
}

uint64_t tb_message_set_transport_buffer(uint64_t result, uint64_t a2)
{
  *(void *)(result + 80) = a2;
  return result;
}

uint64_t tb_message_complete(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 4);
  if (v1 == 1) {
    goto LABEL_5;
  }
  if (v1 != 2)
  {
    if (!*(unsigned char *)(result + 4))
    {
      do
      {
LABEL_4:
        __break(1u);
LABEL_5:
        ;
      }
      while (*(_DWORD *)result != 1 && *(_DWORD *)result != 4);
    }
LABEL_10:
    *(_DWORD *)double result = 2;
    return result;
  }
  if ((*(_DWORD *)result - 3) >= 2)
  {
    if (*(_DWORD *)result != 1) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  return result;
}

uint64_t tb_message_reset(uint64_t a1, char a2)
{
  *(_DWORD *)a1 = 1;
  *(unsigned char *)(a1 + 4) = a2;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = 0;
  return 0;
}

uint64_t tb_message_destruct(uint64_t result)
{
  *(unsigned char *)(result + 4) = 0;
  *(void *)(result + 8) = 0;
  *(void *)(result + 32) = -1;
  *(void *)(result + 80) = 0;
  *(_DWORD *)double result = 5;
  return result;
}

uint64_t tb_message_configure_received(uint64_t result, int a2)
{
  if ((a2 - 1) >= 2) {
    tb_message_configure_received_cold_1();
  }
  *(_DWORD *)double result = 4;
  *(unsigned char *)(result + 4) = a2;
  return result;
}

uint64_t tb_message_configure_recieved(uint64_t result, int a2)
{
  if ((a2 - 1) >= 2) {
    tb_message_configure_received_cold_1();
  }
  *(_DWORD *)double result = 4;
  *(unsigned char *)(result + 4) = a2;
  return result;
}

uint64_t tb_message_get_transport_buffer(uint64_t a1)
{
  return *(void *)(a1 + 80);
}

uint64_t tb_message_get_state(unsigned int *a1)
{
  return *a1;
}

uint64_t tb_message_get_disposition(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4);
}

uint64_t tb_message_measure_subrange(uint64_t a1, unint64_t *a2, void *a3, uint64_t a4)
{
  *a2 = *(void *)(*(void *)(a1 + 80) + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  unint64_t v8 = *(void *)(*(void *)(a1 + 80) + 16);
  BOOL v9 = v8 >= *a2;
  *a3 = v8 - *a2;
  if (!v9) {
    tb_message_measure_subrange_cold_1();
  }
  return result;
}

uint64_t tb_message_subrange(void *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v4 = (unint64_t *)a1[10];
  unint64_t v5 = v4[3];
  if (v5 < a2) {
    tb_message_subrange_cold_1();
  }
  if (__CFADD__(a2, a3)) {
    tb_message_subrange_cold_2();
  }
  if (a2 + a3 > v5) {
    tb_message_subrange_cold_3();
  }
  uint64_t v26 = 0;
  long long v25 = 0u;
  long long v24 = 0u;
  unint64_t v6 = *v4;
  unint64_t v7 = *v4 + v5;
  unint64_t v8 = *v4 + a2;
  BOOL v11 = v7 >= v8;
  unint64_t v9 = v7 - v8;
  BOOL v11 = v11 && v6 <= v8 && v9 >= a3;
  if (!v11) {
    __break(0x5519u);
  }
  unint64_t v23 = v8;
  *((void *)&v24 + 1) = 0;
  long long v25 = a3;
  LODWORD(v26) = 0;
  long long v27 = 0uLL;
  long long v28 = 0uLL;
  long long v29 = 0uLL;
  uint64_t v30 = 0;
  int v15 = 0;
  int v13 = 4;
  uint64_t v14 = 2;
  uint64_t v16 = a1[2];
  uint64_t v17 = 0;
  uint64_t v18 = a1[4];
  long long v19 = 0uLL;
  long long v20 = 0uLL;
  uint64_t v21 = 0;
  size_t v22 = (uint64_t *)&v23;
  return (*(uint64_t (**)(uint64_t, int *))(a4 + 16))(a4, &v13);
}

uint64_t tb_message_get_client_identifier(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t tb_message_set_client_identifier(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  return result;
}

uint64_t tb_message_set_connection_identifier(uint64_t result, uint64_t a2)
{
  *(void *)(result + 8) = a2;
  return result;
}

BOOL tb_message_check_connection_identifier(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 8) == a2;
}

uint64_t tb_message_get_msg_identifier(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t tb_message_set_msg_identifier(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t tb_message_get_num_caps(uint64_t a1)
{
  return *(void *)(a1 + 72);
}

uint64_t tb_message_get_capability(uint64_t result, uint64_t a2)
{
  unint64_t v2 = result + 40 + 8 * a2;
  if (v2 < result + 72 && v2 >= result + 40) {
    return *(void *)v2;
  }
  __break(0x5519u);
  return result;
}

uint64_t tb_message_encode_capability(uint64_t result, uint64_t a2)
{
  unint64_t v2 = (void *)(result + 72);
  unint64_t v3 = *(void *)(result + 72);
  if (v3 > 3) {
    return 6;
  }
  long long v4 = (void *)(result + 40 + 8 * v3);
  if (v4 < v2 && (unint64_t)v4 >= result + 40)
  {
    uint64_t result = 0;
    void *v4 = a2;
    void *v2 = v3 + 1;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_capability(uint64_t result, void *a2)
{
  unint64_t v2 = (void *)(result + 72);
  uint64_t v3 = *(void *)(result + 72);
  if (!v3) {
    return 7;
  }
  unint64_t v4 = result + 40;
  *a2 = *(void *)(result + 40);
  uint64_t v5 = v3 - 1;
  if (v5)
  {
    unint64_t v6 = (void *)(result + 48);
    uint64_t v7 = v5;
    while (v6 < v2 && (unint64_t)v6 >= v4 && v6 - 1 < v2)
    {
      *(v6 - 1) = *v6;
      ++v6;
      if (!--v7) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    unint64_t v8 = (void *)(v4 + 8 * v5);
    if (v8 < v2 && (unint64_t)v8 >= v4)
    {
      uint64_t result = 0;
      *unint64_t v8 = 0;
      void *v2 = v5;
      return result;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t tb_message_size_BOOL()
{
  return 1;
}

uint64_t tb_message_size_u8()
{
  return 1;
}

uint64_t tb_message_size_u16()
{
  return 2;
}

uint64_t tb_message_size_u32()
{
  return 4;
}

uint64_t tb_message_size_u64()
{
  return 8;
}

uint64_t tb_message_size_s8()
{
  return 1;
}

uint64_t tb_message_size_s16()
{
  return 2;
}

uint64_t tb_message_size_s32()
{
  return 4;
}

uint64_t tb_message_size_s64()
{
  return 8;
}

uint64_t tb_message_size_f32()
{
  return 4;
}

uint64_t tb_message_size_f64()
{
  return 8;
}

uint64_t tb_message_size_capability()
{
  return 0;
}

uint64_t tb_message_precheck_encoding(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(void *)(result + 80);
  uint64_t v3 = *(void *)(v2 + 16);
  BOOL v4 = __CFADD__(v3, a2);
  unint64_t v5 = v3 + a2;
  if (v4) {
    tb_message_precheck_encoding_cold_1();
  }
  if (v5 > *(void *)(v2 + 24)) {
    tb_message_precheck_encoding_cold_2();
  }
  return result;
}

uint64_t tb_message_encode_BOOL(uint64_t result, char a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 == -1) {
    tb_message_encode_BOOL_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 1 > v4) {
    tb_message_encode_BOOL_cold_2();
  }
  unint64_t v5 = *v2;
  unint64_t v6 = (unsigned char *)(v5 + v3);
  if (v5 + v4 <= (unint64_t)v6 || v5 > (unint64_t)v6)
  {
    __break(0x5519u);
  }
  else
  {
    *unint64_t v6 = a2;
    ++*(void *)(*(void *)(result + 80) + 16);
  }
  return result;
}

uint64_t tb_message_raw_encode_BOOL(uint64_t result, char a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (unsigned char *)(*v2 + v2[2]);
  if (v4 <= (unint64_t)v5 || v3 > (unint64_t)v5)
  {
    __break(0x5519u);
  }
  else
  {
    *unint64_t v5 = a2;
    ++*(void *)(*(void *)(result + 80) + 16);
  }
  return result;
}

uint64_t tb_message_encode_u8(uint64_t result, char a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 == -1) {
    tb_message_encode_u8_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 1 > v4) {
    tb_message_encode_u8_cold_2();
  }
  unint64_t v5 = *v2;
  unint64_t v6 = (unsigned char *)(v5 + v3);
  if (v5 + v4 <= (unint64_t)v6 || v5 > (unint64_t)v6)
  {
    __break(0x5519u);
  }
  else
  {
    *unint64_t v6 = a2;
    ++*(void *)(*(void *)(result + 80) + 16);
  }
  return result;
}

uint64_t tb_message_raw_encode_u8(uint64_t result, char a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (unsigned char *)(*v2 + v2[2]);
  if (v4 <= (unint64_t)v5 || v3 > (unint64_t)v5)
  {
    __break(0x5519u);
  }
  else
  {
    *unint64_t v5 = a2;
    ++*(void *)(*(void *)(result + 80) + 16);
  }
  return result;
}

uint64_t tb_message_encode_u16(uint64_t result, __int16 a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFELL) {
    tb_message_encode_u16_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 2 > v4) {
    tb_message_encode_u16_cold_2();
  }
  unint64_t v5 = *v2;
  unint64_t v6 = (_WORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 1)
  {
    *unint64_t v6 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 2;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_encode_u16(uint64_t result, __int16 a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (_WORD *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 1)
  {
    *unint64_t v5 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 2;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_u32(uint64_t result, int a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFCLL) {
    tb_message_encode_u32_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 4 > v4) {
    tb_message_encode_u32_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (_DWORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 3)
  {
    *BOOL v6 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 4;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_encode_u32(uint64_t result, int a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (_DWORD *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 3)
  {
    *unint64_t v5 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 4;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_u64(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFF8) {
    tb_message_encode_u64_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 8 > v4) {
    tb_message_encode_u64_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (void *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 7)
  {
    *BOOL v6 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 8;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_encode_u64(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (void *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 7)
  {
    *unint64_t v5 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 8;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_s8(uint64_t result, char a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 == -1) {
    tb_message_encode_s8_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 1 > v4) {
    tb_message_encode_s8_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (unsigned char *)(v5 + v3);
  if (v5 + v4 <= (unint64_t)v6 || v5 > (unint64_t)v6)
  {
    __break(0x5519u);
  }
  else
  {
    *BOOL v6 = a2;
    ++*(void *)(*(void *)(result + 80) + 16);
  }
  return result;
}

uint64_t tb_message_raw_encode_s8(uint64_t result, char a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (unsigned char *)(*v2 + v2[2]);
  if (v4 <= (unint64_t)v5 || v3 > (unint64_t)v5)
  {
    __break(0x5519u);
  }
  else
  {
    *unint64_t v5 = a2;
    ++*(void *)(*(void *)(result + 80) + 16);
  }
  return result;
}

uint64_t tb_message_encode_s16(uint64_t result, __int16 a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFELL) {
    tb_message_encode_s16_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 2 > v4) {
    tb_message_encode_s16_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (_WORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 1)
  {
    *BOOL v6 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 2;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_encode_s16(uint64_t result, __int16 a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (_WORD *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 1)
  {
    *unint64_t v5 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 2;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_s32(uint64_t result, int a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFCLL) {
    tb_message_encode_s32_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 4 > v4) {
    tb_message_encode_s32_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (_DWORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 3)
  {
    *BOOL v6 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 4;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_encode_s32(uint64_t result, int a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (_DWORD *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 3)
  {
    *unint64_t v5 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 4;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_s64(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)result != 1) {
    tb_message_precheck_encoding_cold_3();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFF8) {
    tb_message_encode_s64_cold_1();
  }
  unint64_t v4 = v2[3];
  if (v3 + 8 > v4) {
    tb_message_encode_s64_cold_2();
  }
  unint64_t v5 = *v2;
  BOOL v6 = (void *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 7)
  {
    *BOOL v6 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 8;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_encode_s64(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = (void *)(*v2 + v2[2]);
  BOOL v6 = v4 >= (unint64_t)v5;
  unint64_t v7 = v4 - (void)v5;
  if (v6 && v3 <= (unint64_t)v5 && v7 > 7)
  {
    *unint64_t v5 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 8;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_f32_v2(uint64_t result, float a2)
{
  uint64_t v2 = 6;
  if (fabsf(a2) != INFINITY)
  {
    if (*(_DWORD *)result != 1) {
      tb_message_precheck_encoding_cold_3();
    }
    unint64_t v3 = *(unint64_t **)(result + 80);
    unint64_t v4 = v3[2];
    if (v4 >= 0xFFFFFFFFFFFFFFFCLL) {
      tb_message_encode_f32_v2_cold_1();
    }
    unint64_t v5 = v3[3];
    if (v4 + 4 > v5) {
      tb_message_encode_f32_v2_cold_2();
    }
    unint64_t v6 = *v3;
    unint64_t v7 = *v3 + v5;
    unint64_t v8 = (float *)(*v3 + v4);
    if (v7 < (unint64_t)v8 || v6 > (unint64_t)v8 || v7 - (unint64_t)v8 <= 3)
    {
      __break(0x5519u);
      return result;
    }
    uint64_t v2 = 0;
    *unint64_t v8 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 4;
  }
  return v2;
}

uint64_t tb_message_raw_encode_f32_v2(uint64_t result, float a2)
{
  uint64_t v2 = 6;
  if (fabsf(a2) != INFINITY)
  {
    uint64_t v3 = *(void *)(result + 80);
    long long v4 = *(_OWORD *)(v3 + 16);
    unint64_t v5 = *(float **)v3;
    unint64_t v6 = (float *)((char *)v5 + v4);
    unint64_t v7 = *((void *)&v4 + 1) - v4;
    if ((char *)v5 + *((void *)&v4 + 1) >= (char *)v5 + (unint64_t)v4)
    {
      BOOL v8 = v5 >= v6;
      BOOL v9 = v5 == v6;
    }
    else
    {
      BOOL v8 = 1;
      BOOL v9 = 0;
    }
    if (!v9 && v8)
    {
      BOOL v10 = 0;
      BOOL v11 = 0;
    }
    else
    {
      BOOL v10 = v7 >= 3;
      BOOL v11 = v7 == 3;
    }
    if (v11 || !v10)
    {
      __break(0x5519u);
      return result;
    }
    uint64_t v2 = 0;
    *unint64_t v6 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 4;
  }
  return v2;
}

uint64_t tb_message_encode_f64_v2(uint64_t result, double a2)
{
  uint64_t v2 = 6;
  if (fabs(a2) != INFINITY)
  {
    if (*(_DWORD *)result != 1) {
      tb_message_precheck_encoding_cold_3();
    }
    uint64_t v3 = *(unint64_t **)(result + 80);
    unint64_t v4 = v3[2];
    if (v4 >= 0xFFFFFFFFFFFFFFF8) {
      tb_message_encode_f64_v2_cold_1();
    }
    unint64_t v5 = v3[3];
    if (v4 + 8 > v5) {
      tb_message_encode_f64_v2_cold_2();
    }
    unint64_t v6 = *v3;
    unint64_t v7 = *v3 + v5;
    BOOL v8 = (double *)(*v3 + v4);
    if (v7 < (unint64_t)v8 || v6 > (unint64_t)v8 || v7 - (unint64_t)v8 <= 7)
    {
      __break(0x5519u);
      return result;
    }
    uint64_t v2 = 0;
    *BOOL v8 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 8;
  }
  return v2;
}

uint64_t tb_message_raw_encode_f64_v2(uint64_t result, double a2)
{
  uint64_t v2 = 6;
  if (fabs(a2) != INFINITY)
  {
    uint64_t v3 = *(void *)(result + 80);
    long long v4 = *(_OWORD *)(v3 + 16);
    unint64_t v5 = *(double **)v3;
    unint64_t v6 = (double *)((char *)v5 + v4);
    unint64_t v7 = *((void *)&v4 + 1) - v4;
    if ((char *)v5 + *((void *)&v4 + 1) >= (char *)v5 + (unint64_t)v4)
    {
      BOOL v8 = v5 >= v6;
      BOOL v9 = v5 == v6;
    }
    else
    {
      BOOL v8 = 1;
      BOOL v9 = 0;
    }
    if (!v9 && v8)
    {
      BOOL v10 = 0;
      BOOL v11 = 0;
    }
    else
    {
      BOOL v10 = v7 >= 7;
      BOOL v11 = v7 == 7;
    }
    if (v11 || !v10)
    {
      __break(0x5519u);
      return result;
    }
    uint64_t v2 = 0;
    *unint64_t v6 = a2;
    *(void *)(*(void *)(result + 80) + 16) += 8;
  }
  return v2;
}

uint64_t tb_message_encode_f32(uint64_t a1, float a2)
{
  uint64_t result = tb_message_encode_f32_v2(a1, a2);
  if (result) {
    tb_message_encode_f32_cold_1(result);
  }
  return result;
}

uint64_t tb_message_raw_encode_f32(uint64_t a1, float a2)
{
  uint64_t result = tb_message_raw_encode_f32_v2(a1, a2);
  if (result) {
    tb_message_raw_encode_f32_cold_1(result);
  }
  return result;
}

uint64_t tb_message_encode_f64(uint64_t a1, double a2)
{
  uint64_t result = tb_message_encode_f64_v2(a1, a2);
  if (result) {
    tb_message_encode_f64_cold_1(result);
  }
  return result;
}

uint64_t tb_message_raw_encode_f64(uint64_t a1, double a2)
{
  uint64_t result = tb_message_raw_encode_f64_v2(a1, a2);
  if (result) {
    tb_message_raw_encode_f64_cold_1(result);
  }
  return result;
}

void *tb_message_encode_buffer(uint64_t a1, const void *a2, size_t __n)
{
  uint64_t v3 = *(void **)(a1 + 80);
  uint64_t v4 = v3[2];
  if (__CFADD__(v4, __n)) {
    tb_message_encode_buffer_cold_1();
  }
  size_t v5 = v3[3];
  if (v4 + __n > v5) {
    tb_message_encode_buffer_cold_2();
  }
  unint64_t v7 = *v3 + v5;
  uint64_t result = (void *)(*v3 + v4);
  if (v7 >= (unint64_t)result && *v3 <= (unint64_t)result && v7 - (unint64_t)result >= __n)
  {
    uint64_t result = memcpy(result, a2, __n);
    v3[2] += __n;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_precheck_decoding(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(void *)(result + 80);
  unint64_t v3 = *(void *)(v2 + 24);
  if (!v3) {
    tb_message_precheck_decoding_cold_1();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  BOOL v5 = __CFADD__(v4, a2);
  unint64_t v6 = v4 + a2;
  if (v5) {
    tb_message_precheck_decoding_cold_2();
  }
  if (v6 > v3) {
    tb_message_precheck_decoding_cold_3();
  }
  return result;
}

uint64_t tb_message_decode_BOOL(uint64_t result, unsigned char *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_BOOL_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 1;
  if (v4 == -1) {
    tb_message_decode_BOOL_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_BOOL_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (unsigned char *)(*v2 + v4);
  v2[2] = v5;
  if (v7 <= (unint64_t)v8 || v6 > (unint64_t)v8) {
    __break(0x5519u);
  }
  else {
    *a2 = *v8 & 1;
  }
  return result;
}

uint64_t tb_message_raw_decode_BOOL(uint64_t result, unsigned char *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (unsigned char *)(*v2 + v5);
  v2[2] = v5 + 1;
  if (v4 <= (unint64_t)v6 || v3 > (unint64_t)v6) {
    __break(0x5519u);
  }
  else {
    *a2 = *v6 & 1;
  }
  return result;
}

uint64_t tb_message_decode_u8(uint64_t result, unsigned char *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_u8_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 1;
  if (v4 == -1) {
    tb_message_decode_u8_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_u8_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (unsigned char *)(*v2 + v4);
  v2[2] = v5;
  if (v7 <= (unint64_t)v8 || v6 > (unint64_t)v8) {
    __break(0x5519u);
  }
  else {
    *a2 = *v8;
  }
  return result;
}

uint64_t tb_message_raw_decode_u8(uint64_t result, unsigned char *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (unsigned char *)(*v2 + v5);
  v2[2] = v5 + 1;
  if (v4 <= (unint64_t)v6 || v3 > (unint64_t)v6) {
    __break(0x5519u);
  }
  else {
    *a2 = *v6;
  }
  return result;
}

uint64_t tb_message_decode_u16(uint64_t result, _WORD *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_u16_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 2;
  if (v4 >= 0xFFFFFFFFFFFFFFFELL) {
    tb_message_decode_u16_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_u16_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (_WORD *)(*v2 + v4);
  v2[2] = v5;
  if (v7 >= (unint64_t)v8 && v6 <= (unint64_t)v8 && v7 - (unint64_t)v8 > 1) {
    *a2 = *v8;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_u16(uint64_t result, _WORD *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (_WORD *)(*v2 + v5);
  v2[2] = v5 + 2;
  if (v4 >= (unint64_t)v6 && v3 <= (unint64_t)v6 && v4 - (unint64_t)v6 > 1) {
    *a2 = *v6;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_u32(uint64_t result, _DWORD *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(void **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_u32_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 4;
  if (v4 >= 0xFFFFFFFFFFFFFFFCLL) {
    tb_message_decode_u32_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_u32_cold_3();
  }
  unint64_t v6 = (_DWORD *)*v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (_DWORD *)(*v2 + v4);
  v2[2] = v5;
  unint64_t v9 = v7 - (void)v8;
  if (v7 >= (unint64_t)v8)
  {
    BOOL v10 = v6 >= v8;
    BOOL v11 = v6 == v8;
  }
  else
  {
    BOOL v10 = 1;
    BOOL v11 = 0;
  }
  if (!v11 && v10)
  {
    BOOL v12 = 0;
    BOOL v13 = 0;
  }
  else
  {
    BOOL v12 = v9 >= 3;
    BOOL v13 = v9 == 3;
  }
  if (!v13 && v12) {
    *a2 = *v8;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_u32(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (_DWORD *)(*v2 + v5);
  v2[2] = v5 + 4;
  if (v4 >= (unint64_t)v6 && v3 <= (unint64_t)v6 && v4 - (unint64_t)v6 > 3) {
    *a2 = *v6;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_u64(uint64_t result, void *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(void **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_u64_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 8;
  if (v4 >= 0xFFFFFFFFFFFFFFF8) {
    tb_message_decode_u64_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_u64_cold_3();
  }
  unint64_t v6 = (void *)*v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (void *)(*v2 + v4);
  v2[2] = v5;
  unint64_t v9 = v7 - (void)v8;
  if (v7 >= (unint64_t)v8)
  {
    BOOL v10 = v6 >= v8;
    BOOL v11 = v6 == v8;
  }
  else
  {
    BOOL v10 = 1;
    BOOL v11 = 0;
  }
  if (!v11 && v10)
  {
    BOOL v12 = 0;
    BOOL v13 = 0;
  }
  else
  {
    BOOL v12 = v9 >= 7;
    BOOL v13 = v9 == 7;
  }
  if (!v13 && v12) {
    *a2 = *v8;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_u64(uint64_t result, void *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (void *)(*v2 + v5);
  v2[2] = v5 + 8;
  if (v4 >= (unint64_t)v6 && v3 <= (unint64_t)v6 && v4 - (unint64_t)v6 > 7) {
    *a2 = *v6;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_s8(uint64_t result, unsigned char *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_s8_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 1;
  if (v4 == -1) {
    tb_message_decode_s8_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_s8_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (unsigned char *)(*v2 + v4);
  v2[2] = v5;
  if (v7 <= (unint64_t)v8 || v6 > (unint64_t)v8) {
    __break(0x5519u);
  }
  else {
    *a2 = *v8;
  }
  return result;
}

uint64_t tb_message_raw_decode_s8(uint64_t result, unsigned char *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (unsigned char *)(*v2 + v5);
  v2[2] = v5 + 1;
  if (v4 <= (unint64_t)v6 || v3 > (unint64_t)v6) {
    __break(0x5519u);
  }
  else {
    *a2 = *v6;
  }
  return result;
}

uint64_t tb_message_decode_s16(uint64_t result, _WORD *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_s16_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 2;
  if (v4 >= 0xFFFFFFFFFFFFFFFELL) {
    tb_message_decode_s16_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_s16_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (_WORD *)(*v2 + v4);
  v2[2] = v5;
  if (v7 >= (unint64_t)v8 && v6 <= (unint64_t)v8 && v7 - (unint64_t)v8 > 1) {
    *a2 = *v8;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_s16(uint64_t result, _WORD *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (_WORD *)(*v2 + v5);
  v2[2] = v5 + 2;
  if (v4 >= (unint64_t)v6 && v3 <= (unint64_t)v6 && v4 - (unint64_t)v6 > 1) {
    *a2 = *v6;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_s32(uint64_t result, _DWORD *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(void **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_s32_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 4;
  if (v4 >= 0xFFFFFFFFFFFFFFFCLL) {
    tb_message_decode_s32_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_s32_cold_3();
  }
  unint64_t v6 = (_DWORD *)*v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (_DWORD *)(*v2 + v4);
  v2[2] = v5;
  unint64_t v9 = v7 - (void)v8;
  if (v7 >= (unint64_t)v8)
  {
    BOOL v10 = v6 >= v8;
    BOOL v11 = v6 == v8;
  }
  else
  {
    BOOL v10 = 1;
    BOOL v11 = 0;
  }
  if (!v11 && v10)
  {
    BOOL v12 = 0;
    BOOL v13 = 0;
  }
  else
  {
    BOOL v12 = v9 >= 3;
    BOOL v13 = v9 == 3;
  }
  if (!v13 && v12) {
    *a2 = *v8;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_s32(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (_DWORD *)(*v2 + v5);
  v2[2] = v5 + 4;
  if (v4 >= (unint64_t)v6 && v3 <= (unint64_t)v6 && v4 - (unint64_t)v6 > 3) {
    *a2 = *v6;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_s64(uint64_t result, void *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(void **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_s64_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 8;
  if (v4 >= 0xFFFFFFFFFFFFFFF8) {
    tb_message_decode_s64_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_s64_cold_3();
  }
  unint64_t v6 = (void *)*v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (void *)(*v2 + v4);
  v2[2] = v5;
  unint64_t v9 = v7 - (void)v8;
  if (v7 >= (unint64_t)v8)
  {
    BOOL v10 = v6 >= v8;
    BOOL v11 = v6 == v8;
  }
  else
  {
    BOOL v10 = 1;
    BOOL v11 = 0;
  }
  if (!v11 && v10)
  {
    BOOL v12 = 0;
    BOOL v13 = 0;
  }
  else
  {
    BOOL v12 = v9 >= 7;
    BOOL v13 = v9 == 7;
  }
  if (!v13 && v12) {
    *a2 = *v8;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_s64(uint64_t result, void *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (void *)(*v2 + v5);
  v2[2] = v5 + 8;
  if (v4 >= (unint64_t)v6 && v3 <= (unint64_t)v6 && v4 - (unint64_t)v6 > 7) {
    *a2 = *v6;
  }
  else {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_f32_v2(uint64_t result, _DWORD *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_f32_v2_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 4;
  if (v4 >= 0xFFFFFFFFFFFFFFFCLL) {
    tb_message_decode_f32_v2_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_f32_v2_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (float *)(*v2 + v4);
  v2[2] = v5;
  if (v7 >= (unint64_t)v8 && v6 <= (unint64_t)v8 && v7 - (unint64_t)v8 > 3)
  {
    float v11 = *v8;
    *a2 = *(_DWORD *)v8;
    float v12 = fabsf(v11);
    if (v12 >= INFINITY) {
      unsigned int v13 = 7;
    }
    else {
      unsigned int v13 = 0;
    }
    if (v12 <= INFINITY) {
      return v13;
    }
    else {
      return 0;
    }
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_f32_v2(uint64_t result, _DWORD *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (float *)(*v2 + v5);
  v2[2] = v5 + 4;
  if (v4 >= (unint64_t)v6 && v3 <= (unint64_t)v6 && v4 - (unint64_t)v6 > 3)
  {
    float v9 = *v6;
    *a2 = *(_DWORD *)v6;
    float v10 = fabsf(v9);
    if (v10 >= INFINITY) {
      unsigned int v11 = 7;
    }
    else {
      unsigned int v11 = 0;
    }
    if (v10 <= INFINITY) {
      return v11;
    }
    else {
      return 0;
    }
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_f64_v2(uint64_t result, void *a2)
{
  if (*(_DWORD *)result != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = v2[3];
  if (!v3) {
    tb_message_decode_f64_v2_cold_1();
  }
  unint64_t v4 = v2[2];
  unint64_t v5 = v4 + 8;
  if (v4 >= 0xFFFFFFFFFFFFFFF8) {
    tb_message_decode_f64_v2_cold_2();
  }
  if (v5 > v3) {
    tb_message_decode_f64_v2_cold_3();
  }
  unint64_t v6 = *v2;
  unint64_t v7 = *v2 + v3;
  BOOL v8 = (double *)(*v2 + v4);
  v2[2] = v5;
  if (v7 >= (unint64_t)v8 && v6 <= (unint64_t)v8 && v7 - (unint64_t)v8 > 7)
  {
    double v11 = *v8;
    *a2 = *(void *)v8;
    double v12 = fabs(v11);
    if (v12 >= INFINITY) {
      unsigned int v13 = 7;
    }
    else {
      unsigned int v13 = 0;
    }
    if (v12 <= INFINITY) {
      return v13;
    }
    else {
      return 0;
    }
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_raw_decode_f64_v2(uint64_t result, void *a2)
{
  uint64_t v2 = *(unint64_t **)(result + 80);
  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + v2[3];
  unint64_t v5 = v2[2];
  unint64_t v6 = (double *)(*v2 + v5);
  v2[2] = v5 + 8;
  if (v4 >= (unint64_t)v6 && v3 <= (unint64_t)v6 && v4 - (unint64_t)v6 > 7)
  {
    double v9 = *v6;
    *a2 = *(void *)v6;
    double v10 = fabs(v9);
    if (v10 >= INFINITY) {
      unsigned int v11 = 7;
    }
    else {
      unsigned int v11 = 0;
    }
    if (v10 <= INFINITY) {
      return v11;
    }
    else {
      return 0;
    }
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_f32(uint64_t a1, _DWORD *a2)
{
  uint64_t result = tb_message_decode_f32_v2(a1, a2);
  if (result) {
    tb_message_decode_f32_cold_1(result);
  }
  return result;
}

uint64_t tb_message_raw_decode_f32(uint64_t a1, _DWORD *a2)
{
  uint64_t result = tb_message_raw_decode_f32_v2(a1, a2);
  if (result) {
    tb_message_raw_decode_f32_cold_1(result);
  }
  return result;
}

uint64_t tb_message_decode_f64(uint64_t a1, void *a2)
{
  uint64_t result = tb_message_decode_f64_v2(a1, a2);
  if (result) {
    tb_message_decode_f64_cold_1(result);
  }
  return result;
}

uint64_t tb_message_raw_decode_f64(uint64_t a1, void *a2)
{
  uint64_t result = tb_message_raw_decode_f64_v2(a1, a2);
  if (result) {
    tb_message_raw_decode_f64_cold_1(result);
  }
  return result;
}

_DWORD *tb_endpoint_create(int a1, int a2)
{
  uint64_t result = malloc_type_calloc(1uLL, 0x60uLL, 0x1082040FACA7F44uLL);
  if (!result) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  *uint64_t result = a1;
  result[1] = a2;
  *((unsigned char *)result + 40) = 1;
  return result;
}

_DWORD *tb_endpoint_create_with_data(int a1, uint64_t a2, int a3, const void *a4)
{
  BOOL v8 = malloc_type_calloc(1uLL, 0x60uLL, 0x1082040FACA7F44uLL);
  if (!v8) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  double v9 = v8;
  *BOOL v8 = a1;
  v8[1] = a3;
  *((unsigned char *)v8 + 40) = 1;
  *((void *)v8 + 4) = a2;
  if (a4)
  {
    *((void *)v8 + 2) = _tb_endpoint_block_destructor;
    *((void *)v8 + 3) = _Block_copy(a4);
  }
  return v9;
}

void _tb_endpoint_block_destructor(void (**a1)(void))
{
  if (a1)
  {
    a1[2]();
    _Block_release(a1);
  }
}

_DWORD *tb_endpoint_create_with_value(int a1, uint64_t a2, int a3)
{
  uint64_t result = malloc_type_calloc(1uLL, 0x60uLL, 0x1082040FACA7F44uLL);
  if (!result) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  *uint64_t result = a1;
  result[1] = a3;
  *((void *)result + 4) = a2;
  *((unsigned char *)result + 40) = 1;
  return result;
}

uint64_t tb_endpoint_create_with_value_static(uint64_t a1, int a2, uint64_t a3, int a4)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a4;
  *(unsigned char *)(a1 + 40) = 0;
  *(void *)(a1 + 32) = a3;
  return 0;
}

void tb_endpoint_destruct(void *a1)
{
  uint64_t v2 = (void (*)(void, void))a1[2];
  if (v2) {
    v2(a1[3], a1[4]);
  }
  if (*((unsigned char *)a1 + 40))
  {
    free(a1);
  }
}

uint64_t tb_endpoint_get_data(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t tb_endpoint_get_value(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t tb_endpoint_get_type(unsigned int *a1)
{
  return *a1;
}

uint64_t tb_endpoint_get_options(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t tb_endpoint_get_interface_identifier(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t tb_endpoint_set_interface_identifier(uint64_t result, uint64_t a2)
{
  *(void *)(result + 8) = a2;
  return result;
}

uint64_t tb_connection_get_transport(uint64_t a1)
{
  return *(void *)a1;
}

void _tb_connection_create_transport_for_endpoint(unsigned int *a1, int a2)
{
  int type = tb_endpoint_get_type(a1);
  switch(type)
  {
    case 1:
      tb_null_transport_create();
      goto LABEL_23;
    case 2:
      if (a2 == 1)
      {
        unint64_t v5 = tb_mach_service_transport_create((uint64_t)a1);
        goto LABEL_23;
      }
      if (!a2)
      {
        unint64_t v5 = tb_mach_client_transport_create((uint64_t)a1);
        goto LABEL_23;
      }
      goto LABEL_24;
    case 0:
      goto LABEL_24;
  }
  if (!a2 && (type & 0xFFFFFFFE) == 4)
  {
    unint64_t v5 = tb_eve_client_transport_create((uint64_t)a1);
    goto LABEL_23;
  }
  switch(type)
  {
    case 8:
      unint64_t v5 = tb_darwin_client_transport_create((uint64_t)a1);
      goto LABEL_23;
    case 9:
      if (a2)
      {
        if (a2 == 1)
        {
          unint64_t v5 = tb_unix_service_transport_create_with_endpoint((uint64_t)a1);
          goto LABEL_23;
        }
LABEL_24:
        __break(1u);
        JUMPOUT(0x25F61B14CLL);
      }
      unint64_t v5 = tb_unix_client_transport_create_with_endpoint((uint64_t)a1);
LABEL_23:
      if (!v5) {
        goto LABEL_24;
      }
      return;
    case 10:
      if (a2)
      {
        if (a2 != 1) {
          goto LABEL_24;
        }
        unint64_t v5 = tb_delegated_service_transport_create((uint64_t)a1);
      }
      else
      {
        unint64_t v5 = tb_delegated_client_transport_create((uint64_t)a1);
      }
      goto LABEL_23;
    case 11:
      unint64_t v5 = tb_afk_transport_create((uint64_t)a1);
      goto LABEL_23;
    default:
      goto LABEL_24;
  }
}

void *_tb_connection_create(uint64_t a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0x28uLL, 0x1082040A37E9E02uLL);
  if (!v2) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  unint64_t v3 = v2;
  void *v2 = a1;
  v2[4] = tb_list_create();
  return v3;
}

void _tb_connection_destruct(uint64_t a1)
{
  tb_transport_destruct(*(void *)a1);
  tb_list_free(*(pthread_mutex_t **)(a1 + 32));
  free((void *)a1);
}

void *tb_service_connection_create(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = _tb_connection_create(a1);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = __tb_service_connection_create_block_invoke;
  aBlock[3] = &unk_26553E0B8;
  aBlock[6] = v4 + 5;
  aBlock[7] = v4;
  aBlock[8] = a1;
  aBlock[4] = a2;
  aBlock[5] = v4;
  tb_transport_set_message_handler(a1, aBlock);
  return v4;
}

unint64_t __tb_service_connection_create_block_invoke(void *a1, unsigned int *a2)
{
  uint64_t v17 = a2;
  uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  if (tb_message_get_state(a2) != 4) {
    __tb_service_connection_create_block_invoke_cold_4();
  }
  if (tb_message_get_disposition((uint64_t)a2) != 1) {
    __tb_service_connection_create_block_invoke_cold_3();
  }
  if (!transport_buffer) {
    __tb_service_connection_create_block_invoke_cold_1();
  }
  if (!*(void *)transport_buffer) {
    __tb_service_connection_create_block_invoke_cold_2();
  }
  __int16 v5 = *(_WORD *)(transport_buffer + 42);
  if ((v5 & 4) != 0)
  {
    unint64_t result = a1[5];
    if (!result || result < a1[6] && result >= a1[7])
    {
      int message = tb_reply_splitter_next_message((uint64_t *)result, (uint64_t)a2, (uint64_t)&v17, a1[8]);
      uint64_t v15 = (uint64_t)v17;
LABEL_25:
      if (message) {
        return 0;
      }
      else {
        return v15;
      }
    }
  }
  else
  {
    if (v5)
    {
      unint64_t result = a1[5];
      if (result && (result >= a1[6] || result < a1[7])) {
        goto LABEL_34;
      }
      accumulator_list = (pthread_mutex_t *)_get_accumulator_list(result);
      BOOL v8 = tb_message_accumulator_accumulate(accumulator_list, (uint64_t)a2);
      if (!v8) {
        return 0;
      }
      tb_message_set_transport_buffer((uint64_t)a2, (uint64_t)v8);
    }
    unint64_t result = a1[4];
    unint64_t v9 = a1[5];
    if (!v9 || v9 < a1[6] && v9 >= a1[7])
    {
      uint64_t v10 = (*(uint64_t (**)(void))(result + 16))();
      uint64_t v11 = v10;
      uint64_t v16 = v10;
      if (!v10) {
        return v11;
      }
      uint64_t v12 = tb_message_get_transport_buffer(v10);
      unint64_t result = tb_message_splitter_split_required(a1[8], *(void *)(v12 + 24));
      if (!result) {
        return v11;
      }
      unsigned int v13 = (uint64_t *)a1[5];
      if (!v13 || (unint64_t)v13 < a1[6] && (unint64_t)v13 >= a1[7])
      {
        int message = tb_reply_splitter_add_reply(v11, &v16, v13);
        uint64_t v15 = v16;
        goto LABEL_25;
      }
    }
  }
LABEL_34:
  __break(0x5519u);
  return result;
}

uint64_t _get_accumulator_list(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!result) {
    _get_accumulator_list_cold_1();
  }
  return result;
}

void *tb_service_connection_create_with_endpoint(unsigned int *a1, uint64_t a2)
{
  _tb_connection_create_transport_for_endpoint(a1, 1);
  __int16 v5 = tb_service_connection_create(v4, a2);
  tb_endpoint_destruct(a1);
  return v5;
}

double _tb_connection_transport_for_endpoint_inplace(unsigned int *a1, uint64_t a2)
{
  int type = tb_endpoint_get_type(a1);
  if (type)
  {
    if (type != 1) {
      _tb_connection_transport_for_endpoint_inplace_cold_1();
    }
    *(void *)&double result = tb_null_transport_create_inplace_with_endpoint((uint64_t)a1, a2).n128_u64[0];
  }
  return result;
}

uint64_t tb_service_connection_activate(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (v1)
  {
    uint64_t v3 = *(void *)(v1 + 16);
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
    }
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 16);
  return v4(v2);
}

uint64_t _tb_connection_observe_activate_service(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  if (v1)
  {
    double result = *(void *)(v1 + 16);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

void *tb_client_connection_create_with_endpoint(unsigned int *a1)
{
  _tb_connection_create_transport_for_endpoint(a1, 0);
  uint64_t v3 = _tb_connection_create(v2);
  tb_endpoint_destruct(a1);
  return v3;
}

uint64_t tb_client_connection_create_with_endpoint_static(uint64_t *a1, uint64_t a2, unsigned int *a3)
{
  *(void *)(a2 + 224) = 0;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  _tb_connection_transport_for_endpoint_inplace(a3, a2);
  *a1 = a2;
  return 0;
}

uint64_t tb_client_connection_activate(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (v1)
  {
    uint64_t v3 = *(void *)(v1 + 8);
    if (v3) {
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
    }
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t))(v2 + 8);
  return v4(v2);
}

uint64_t _tb_connection_observe_activate_client(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  if (v1)
  {
    double result = *(void *)(v1 + 8);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t tb_connection_send_query(uint64_t *a1, uint64_t a2, uint64_t *a3, unint64_t a4)
{
  if (*(_DWORD *)a2 != 2) {
    tb_connection_send_query_cold_4();
  }
  if (*(unsigned char *)(a2 + 4) != 1) {
    tb_connection_send_query_cold_3();
  }
  if (!tb_message_check_connection_identifier(a2, (uint64_t)a1)) {
    return 1;
  }
  tb_message_set_state((_DWORD *)a2, 3);
  uint64_t v8 = *a1;
  uint64_t transport_buffer = tb_message_get_transport_buffer(a2);
  uint64_t v10 = transport_buffer;
  if ((a4 & 2) == 0) {
    *(_WORD *)(transport_buffer + 42) |= 0x10u;
  }
  if (tb_message_splitter_split_required(v8, *(void *)(transport_buffer + 24)))
  {
    uint64_t v11 = tb_message_splitter_send((uint64_t)a1, v8, a2, a3, a4);
  }
  else
  {
    unsigned int v13 = (void *)a1[1];
    if (v13 && *v13) {
      (*(void (**)(void, uint64_t, uint64_t, uint64_t *, unint64_t))(*v13 + 16))(*v13, v8, a2, a3, a4);
    }
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, unint64_t))v8)(v8, a2, a3, a4);
  }
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v12 = (*(_WORD *)(v10 + 42) & 8) >> 1;
    if ((a4 & 2) != 0 && (*(_WORD *)(v10 + 42) & 8) == 0)
    {
      if (!a3 || !*a3) {
        return 4;
      }
      tb_message_set_state((_DWORD *)*a3, 4);
      tb_message_set_disposition(*a3, 2);
      if (*(_WORD *)(tb_message_get_transport_buffer(*a3) + 42))
      {
        uint64_t msg_identifier = tb_message_get_msg_identifier(*a3);
        if (!msg_identifier)
        {
          uint64_t msg_identifier = mach_absolute_time();
          tb_message_set_msg_identifier(*a3, msg_identifier);
        }
        accumulator_list = (pthread_mutex_t *)_get_accumulator_list((uint64_t)a1);
        uint64_t v16 = tb_message_accumulator_accumulate(accumulator_list, *a3);
        uint64_t v17 = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
        if (!v17) {
          _tb_afk_common_transport_construct_message_buffer_cold_1();
        }
        uint64_t v18 = v17;
        long long v29 = v17;
        long long v19 = malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
        if (!v19) {
          _tb_afk_common_transport_construct_message_buffer_cold_1();
        }
        long long v20 = v19;
        uint64_t v21 = _tb_connection_message_construct(a1, 0, (uint64_t)v18, (uint64_t)v19, 0, 0);
        if (v21)
        {
          uint64_t v12 = v21;
          free(v20);
          size_t v22 = v18;
LABEL_26:
          free(v22);
          return v12;
        }
        if (!v16)
        {
          while (1)
          {
            tb_message_complete((uint64_t)v29);
            v20[21] |= 4u;
            tb_message_set_state(v29, 3);
            long long v24 = (void *)a1[1];
            if (v24 && *v24) {
              (*(void (**)(void, uint64_t, uint64_t, uint64_t *, unint64_t))(*v24 + 16))(*v24, v8, a2, a3, a4);
            }
            uint64_t v25 = (*(uint64_t (**)(uint64_t, void *, void **, uint64_t))v8)(v8, v29, &v29, 2);
            if (v25)
            {
              uint64_t v12 = v25;
              _tb_connection_message_destruct(a1, (uint64_t)v29);
              free(v20);
              size_t v22 = v29;
              goto LABEL_26;
            }
            tb_message_set_msg_identifier((uint64_t)v29, msg_identifier);
            unint64_t v23 = tb_message_accumulator_accumulate(accumulator_list, (uint64_t)v29);
            uint64_t v18 = v29;
            if (v23) {
              break;
            }
            _tb_message_reset(a1, v29, 0, 0, 0);
          }
          uint64_t v16 = v23;
        }
        _tb_connection_message_destruct(a1, (uint64_t)v18);
        free(v20);
        free(v29);
        uint64_t v26 = tb_message_get_transport_buffer(*a3);
        (*(void (**)(void))(v8 + 32))();
        tb_transport_initialize_message_buffer(v26);
        long long v27 = v16[3];
        *(void *)uint64_t v26 = *v16;
        *(void *)(v26 + 24) = v27;
        *(unsigned char *)(v26 + 40) = 1;
        *(_WORD *)(v26 + 42) = *((_WORD *)v16 + 21);
        free(v16);
      }
      return 0;
    }
  }
  return v12;
}

uint64_t _tb_connection_observe_send_message(uint64_t result)
{
  uint64_t v1 = *(uint64_t **)(result + 8);
  if (v1)
  {
    double result = *v1;
    if (*v1) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t tb_client_connection_message_construct(uint64_t *a1, uint64_t a2, uint64_t a3, size_t a4, uint64_t a5)
{
  return _tb_connection_message_construct(a1, 0, a2, a3, a4, a5);
}

uint64_t tb_client_connection_message_destruct(uint64_t *a1, uint64_t a2)
{
  return 0;
}

uint64_t tb_client_connection_message_reset(uint64_t *a1, _DWORD *a2, unint64_t a3, uint64_t a4)
{
  return _tb_message_reset(a1, a2, 0, a3, a4);
}

uint64_t tb_connection_alloc_init_owned_transport_message_buffer(uint64_t a1, size_t a2)
{
  tb_transport_initialize_message_buffer(a1);
  uint64_t v4 = (char *)malloc_type_calloc(a2, 1uLL, 0x100004077774924uLL);
  if (v4 > &v4[a2])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v4) {
    goto LABEL_5;
  }
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 40) = 1;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = a2;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 48) = 0;
  return 0;
}

void tb_connection_dealloc_destruct_owned_transport_message_buffer(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40)) {
    tb_connection_dealloc_destruct_owned_transport_message_buffer_cold_1();
  }
  free(*(void **)a1);
  *(void *)a1 = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 40) = 256;
}

uint64_t _tb_message_buffer_reset(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  if (tb_transport_supports_multipart_messages(a2)) {
    tb_transport_get_tx_buffer_size(a2);
  }
  BOOL v10 = tb_message_splitter_split_required(a2, a4);
  BOOL v11 = v10;
  if (*(unsigned char *)(a3 + 40))
  {
    tb_connection_dealloc_destruct_owned_transport_message_buffer(a3);
    if (!v11)
    {
      uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(a2 + 24))(a4, a5, a3);
      goto LABEL_13;
    }
  }
  else
  {
    if (!v10)
    {
      tb_transport_reset_message_buffer(a3);
      uint64_t v13 = *(void *)(a1 + 8);
      if (v13)
      {
        uint64_t v14 = *(void *)(v13 + 24);
        if (v14) {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v14 + 16))(v14, a2, a3, a5, a4);
        }
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a2 + 40))(a3, a5, a4);
LABEL_13:
      if (result) {
        return result;
      }
      return 0;
    }
    (*(void (**)(uint64_t))(a2 + 32))(a3);
  }
  tb_connection_alloc_init_owned_transport_message_buffer(a3, a4);
  return 0;
}

uint64_t _tb_connection_observe_reset_message(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  if (v1)
  {
    uint64_t result = *(void *)(v1 + 24);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t _tb_message_reset(uint64_t *a1, _DWORD *a2, int a3, unint64_t a4, uint64_t a5)
{
  tb_message_set_state(a2, 1);
  if (a3 == 1) {
    char v10 = 2;
  }
  else {
    char v10 = 1;
  }
  tb_message_set_disposition((uint64_t)a2, v10);
  uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  uint64_t v12 = *a1;
  return _tb_message_buffer_reset((uint64_t)a1, v12, transport_buffer, a4, a5);
}

uint64_t tb_transport_get_context(uint64_t a1)
{
  return *(void *)(a1 + 96);
}

__n128 tb_transport_message_buffer_copy(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[1];
  a1->n128_u64[0] = a2->n128_u64[0];
  a1[1] = result;
  a1[2].n128_u64[0] = a2[2].n128_u64[0];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  return result;
}

uint64_t tb_service_connection_message_construct(uint64_t *a1, uint64_t a2, uint64_t a3, size_t a4, uint64_t a5)
{
  return _tb_connection_message_construct(a1, 1, a2, a3, a4, a5);
}

uint64_t _tb_connection_message_construct(uint64_t *a1, int a2, uint64_t a3, uint64_t a4, size_t a5, uint64_t a6)
{
  tb_message_initialize(a3);
  uint64_t v12 = *a1;
  if (!tb_transport_supports_multipart_messages(*a1))
  {
    if (!*(unsigned char *)(a4 + 8))
    {
LABEL_6:
      uint64_t result = (*(uint64_t (**)(size_t, uint64_t, uint64_t))(v12 + 24))(a5, a6, a4);
      if (result) {
        return result;
      }
      goto LABEL_7;
    }
LABEL_13:
    _tb_connection_message_construct_cold_1();
  }
  unint64_t tx_buffer_size = tb_transport_get_tx_buffer_size(v12);
  if (*(unsigned char *)(a4 + 8)) {
    goto LABEL_13;
  }
  if (tx_buffer_size >= a5) {
    goto LABEL_6;
  }
  tb_connection_alloc_init_owned_transport_message_buffer(a4, a5);
LABEL_7:
  if (a2 == 1) {
    char v15 = 2;
  }
  else {
    char v15 = 1;
  }
  uint64_t result = tb_message_construct(a3, a4, v15);
  if (!result)
  {
    tb_message_set_connection_identifier(a3, (uint64_t)a1);
    return 0;
  }
  return result;
}

uint64_t tb_service_connection_message_destruct(uint64_t *a1, uint64_t a2)
{
  return 0;
}

uint64_t _tb_connection_message_destruct(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t transport_buffer = tb_message_get_transport_buffer(a2);
  if (*(unsigned char *)(transport_buffer + 8)) {
    _tb_connection_message_destruct_cold_1();
  }
  if (*(unsigned char *)(transport_buffer + 40)) {
    tb_connection_dealloc_destruct_owned_transport_message_buffer(transport_buffer);
  }
  else {
    (*(void (**)(void))(v3 + 32))();
  }
  return tb_message_destruct(a2);
}

uint64_t tb_service_connection_message_configure_reply(uint64_t *a1, _DWORD *a2, unint64_t a3, uint64_t a4)
{
  return _tb_message_reset(a1, a2, 1, a3, a4);
}

void *_tb_connection_init_observers(void *result)
{
  if (!result[1])
  {
    uint64_t v1 = result;
    uint64_t result = malloc_type_calloc(1uLL, 0x20uLL, 0x8004018A671A6uLL);
    if (!result) {
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    }
    v1[1] = result;
  }
  return result;
}

uint64_t _tb_connection_get_observers(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

double _tb_connection_clear_observers(uint64_t a1)
{
  uint64_t v1 = *(_OWORD **)(a1 + 8);
  if (v1)
  {
    double result = 0.0;
    *uint64_t v1 = 0u;
    v1[1] = 0u;
  }
  return result;
}

uint64_t tb_mach_transport_get_tx_buffer_size()
{
  return 15360;
}

uint64_t (**tb_mach_service_transport_create(uint64_t a1))(uint64_t a1)
{
  uint64_t v1 = (task_inspect_t *)a1;
  uint64_t v7 = *MEMORY[0x263EF8340];
  mach_port_name_t name = 0;
  switch(tb_endpoint_get_options(a1))
  {
    case 0u:
    case 3u:
      goto LABEL_6;
    case 1u:
      data = (const char *)tb_endpoint_get_data((uint64_t)v1);
      strncpy(__dst, data, 0x7FuLL);
      __dst[127] = 0;
      uint64_t v1 = (task_inspect_t *)MEMORY[0x263EF8960];
      if (!mach_port_allocate(*MEMORY[0x263EF8960], 1u, &name) && !mach_port_insert_right(*v1, name, name, 0x14u))
      {
        mach_port_t v4 = 0;
        if (!task_get_special_port(*v1, 4, &v4) && !bootstrap_register(v4, __dst, name)) {
          goto LABEL_8;
        }
      }
LABEL_6:
      __break(1u);
LABEL_7:
      mach_port_name_t name = tb_endpoint_get_value((uint64_t)v1);
LABEL_8:
      double result = _tb_mach_transport_create();
      *((_DWORD *)result[12] + 4) = name;
      return result;
    case 2u:
      goto LABEL_7;
    default:
      goto LABEL_8;
  }
}

uint64_t (**_tb_mach_transport_create())(uint64_t a1)
{
  uint64_t v0 = (uint64_t (**)(uint64_t))malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v0) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v1 = v0;
  uint64_t v2 = malloc_type_calloc(1uLL, 0x18uLL, 0x102004062D53EE8uLL);
  if (!v2) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v3 = v2;
  v1[12] = (uint64_t (*)(uint64_t))v2;
  v1[3] = (uint64_t (*)(uint64_t))_tb_mach_transport_construct_message_buffer;
  v1[4] = (uint64_t (*)(uint64_t))_tb_mach_transport_destruct_message_buffer;
  v1[5] = (uint64_t (*)(uint64_t))_tb_mach_transport_message_buffer_reset;
  *uint64_t v1 = _tb_mach_transport_send_message;
  v1[1] = (uint64_t (*)(uint64_t))_tb_mach_transport_activate;
  v1[2] = (uint64_t (*)(uint64_t))_tb_mach_transport_activate;
  v1[8] = (uint64_t (*)(uint64_t))_tb_mach_transport_destruct;
  v1[6] = (uint64_t (*)(uint64_t))_tb_mach_transport_supports_multipart_messages;
  v1[7] = (uint64_t (*)(uint64_t))tb_mach_transport_get_tx_buffer_size;
  v2[2] = 0;
  void *v2 = dispatch_queue_create("com.apple.tightbeam.mach_transport.q", 0);
  v3[1] = dispatch_mach_create();
  return v1;
}

uint64_t (**tb_mach_client_transport_create(uint64_t a1))(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  mach_port_t sp = 0;
  switch(tb_endpoint_get_options(a1))
  {
    case 0u:
    case 2u:
      goto LABEL_4;
    case 1u:
      data = (const char *)tb_endpoint_get_data(a1);
      strncpy(__dst, data, 0x7FuLL);
      __dst[127] = 0;
      mach_port_t bp = 0;
      if (!task_get_special_port(*MEMORY[0x263EF8960], 4, &bp) && !bootstrap_look_up(bp, __dst, &sp)) {
        goto LABEL_6;
      }
LABEL_4:
      __break(1u);
LABEL_5:
      mach_port_t sp = tb_endpoint_get_value(a1);
LABEL_6:
      double result = _tb_mach_transport_create();
      *((_DWORD *)result[12] + 5) = sp;
      return result;
    case 3u:
      goto LABEL_5;
    default:
      goto LABEL_6;
  }
}

uint64_t _tb_mach_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  __int16 v5 = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v5) {
    goto LABEL_5;
  }
  *(void *)a3 = v5;
  *(unsigned char *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 48) = 0;
  return 0;
}

void _tb_mach_transport_destruct_message_buffer(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 41) = 1;
}

uint64_t _tb_mach_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  free(*(void **)a1);
  *(void *)a1 = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  return _tb_mach_transport_construct_message_buffer(a3, v5, a1);
}

uint64_t _tb_mach_transport_send_message(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*v1 != 3) {
    _tb_afk_user_transport_send_message_cold_3();
  }
  char v4 = v3;
  uint64_t v5 = v2;
  uint64_t v6 = (uint64_t)v1;
  bzero(v12, 0x3C18uLL);
  uint64_t transport_buffer = tb_message_get_transport_buffer(v6);
  v12[3] = *(unsigned __int16 *)(transport_buffer + 42);
  unint64_t v13 = *(void *)(transport_buffer + 24);
  if (v13 >= 0x3C01) {
    __break(0x5519u);
  }
  __memcpy_chk();
  uint64_t v8 = dispatch_mach_msg_create();
  if ((v4 & 2) != 0)
  {
    uint64_t v9 = dispatch_mach_send_and_wait_for_reply();
    char v10 = v9;
    if (v5 && v9)
    {
      _tb_unpack_dispatch_mach_msg_to_tb_message();
      *uint64_t v5 = v6;
      dispatch_release(v10);
    }
    else if (v5 && !v9)
    {
      return 4;
    }
  }
  else
  {
    dispatch_mach_send();
  }
  dispatch_release(v8);
  return 0;
}

uint64_t _tb_mach_transport_activate()
{
  return 0;
}

void _tb_mach_transport_destruct(void *a1)
{
  uint64_t context = tb_transport_get_context((uint64_t)a1);
  mach_port_name_t v3 = *(_DWORD *)(context + 16);
  char v4 = (ipc_space_t *)MEMORY[0x263EF8960];
  if (v3)
  {
    mach_port_deallocate(*MEMORY[0x263EF8960], v3);
    *(_DWORD *)(context + 16) = 0;
  }
  mach_port_name_t v5 = *(_DWORD *)(context + 20);
  if (v5)
  {
    mach_port_deallocate(*v4, v5);
    *(_DWORD *)(context + 20) = 0;
  }
  dispatch_mach_cancel();
  dispatch_release(*(dispatch_object_t *)context);
  free((void *)context);
  free(a1);
}

uint64_t _tb_mach_transport_supports_multipart_messages()
{
  return 1;
}

void ___tb_mach_transport_create_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    mach_port_name_t v3 = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
    if (!v3) {
      goto LABEL_20;
    }
    char v4 = v3;
    mach_port_name_t v5 = malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
    if (!v5) {
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    }
    uint64_t v6 = (uint64_t)v5;
    uint64_t msg = dispatch_mach_msg_get_msg();
    if (_tb_mach_transport_construct_message_buffer(*(void *)(msg + 24), v8, v6)
      || tb_message_construct((uint64_t)v4, v6, 1))
    {
LABEL_19:
      __break(1u);
LABEL_20:
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    }
    _tb_unpack_dispatch_mach_msg_to_tb_message();
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 72);
    if (v9)
    {
      char v10 = (_DWORD *)(*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v4);
      if (v10)
      {
        BOOL v11 = v10;
        if (*v10 != 2) {
          __tb_afk_transport_create_block_invoke_cold_3();
        }
        uint64_t v12 = dispatch_mach_msg_get_msg();
        uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)v11);
        unint64_t v14 = *(void *)(transport_buffer + 24);
        if (v14 >= 0x3C01) {
          goto LABEL_19;
        }
        uint64_t v15 = transport_buffer;
        *(_DWORD *)uint64_t v12 = 18;
        *(_DWORD *)(v12 + 12) = 0;
        *(void *)(v12 + 24) = v14;
        bzero((void *)(v12 + 32), 0x3C00uLL);
        size_t v16 = *(void *)(v15 + 24);
        if (v16 > 0x3C00)
        {
          __break(0x5519u);
          return;
        }
        memcpy((void *)(v12 + 32), *(const void **)v15, v16);
        *(_DWORD *)(v12 + 20) = *(unsigned __int16 *)(v15 + 42);
        dispatch_mach_send();
        *BOOL v11 = 3;
        tb_message_complete((uint64_t)v11);
      }
      free(*(void **)v6);
      *(void *)uint64_t v6 = 0;
      *(void *)(v6 + 48) = 0;
      *(void *)(v6 + 24) = 0;
      *(void *)(v6 + 32) = 0;
      *(void *)(v6 + 16) = 0;
      *(unsigned char *)(v6 + 41) = 1;
      tb_message_destruct((uint64_t)v4);
      free((void *)v6);
      free(v4);
    }
    else
    {
      tb_message_destruct((uint64_t)v4);
      free((void *)v6);
      free(v4);
    }
  }
  else if (a2 == 4)
  {
    goto LABEL_19;
  }
}

uint64_t _tb_unpack_dispatch_mach_msg_to_tb_message()
{
  uint64_t result = dispatch_mach_msg_get_msg();
  __break(1u);
  __break(0x5519u);
  return result;
}

void *tb_darwin_client_transport_create(uint64_t a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x108004074646765uLL);
  if (!v2) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  mach_port_name_t v3 = v2;
  char v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  if (!v4) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  mach_port_name_t v5 = v4;
  v3[12] = v4;
  v3[3] = _tb_darwin_transport_construct_message_buffer;
  v3[4] = _tb_darwin_transport_destruct_message_buffer;
  v3[5] = _tb_darwin_transport_message_buffer_reset;
  void *v3 = _tb_darwin_transport_send_message;
  v3[1] = _tb_darwin_client_transport_activate;
  v3[2] = _tb_darwin_service_transport_activate;
  v3[6] = _tb_darwin_transport_supports_multipart_messages;
  v3[7] = _tb_darwin_transport_get_tx_buffer_size;
  v3[8] = _tb_darwin_transport_destruct;
  data = (_OWORD *)tb_endpoint_get_data(a1);
  if (data) {
    *mach_port_name_t v5 = *data;
  }
  return v3;
}

uint64_t _tb_darwin_transport_construct_message_buffer(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 > 0x1F0) {
    return 12;
  }
  uint64_t result = (uint64_t)malloc_type_calloc(1uLL, 0x200uLL, 0x10000407EBBDD04uLL);
  if (!result) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v6 = result;
  *(void *)(a3 + 48) = result;
  if (a1 >= 0x1B1)
  {
    __break(0x5519u);
  }
  else
  {
    uint64_t result = 0;
    *(void *)a3 = v6 + 16;
    *(unsigned char *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = a1;
    *(void *)(a3 + 32) = 0;
    *(unsigned char *)(a3 + 41) = 0;
  }
  return result;
}

void _tb_darwin_transport_destruct_message_buffer(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 41) = 1;
}

uint64_t _tb_darwin_transport_message_buffer_reset(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (a3 > 0x1F0) {
    return 12;
  }
  *(void *)(result + 16) = 0;
  if (*(void *)result <= *(void *)result + a3)
  {
    uint64_t v3 = 0;
    *(void *)(result + 24) = a3;
    return v3;
  }
  __break(0x5519u);
  return result;
}

uint64_t _tb_darwin_transport_send_message(uint64_t a1, _DWORD *a2, void *a3, char a4)
{
  if (*a2 != 3) {
    _tb_afk_user_transport_send_message_cold_3();
  }
  unint64_t v8 = (*(_DWORD *)(tb_message_get_transport_buffer((uint64_t)a2) + 24) + 7);
  unint64_t v11 = (v8 >> 3) & 0x3F | ((unint64_t)*(unsigned __int16 *)(tb_message_get_transport_buffer((uint64_t)a2) + 42) << 16);
  tb_transport_get_context(a1);
  if (exclaves_endpoint_call()) {
    return 1;
  }
  if ((a4 & 2) == 0) {
    return 0;
  }
  tb_message_configure_received((uint64_t)a2, 2);
  uint64_t result = tb_message_get_transport_buffer((uint64_t)a2);
  if (!result) {
    return 4;
  }
  unint64_t v10 = 8 * (v11 & 0x3F);
  if (v10 > 0x1F0) {
    return 4;
  }
  *(void *)(result + 16) = 0;
  if (*(void *)result > *(void *)result + v10)
  {
    __break(0x5519u);
  }
  else
  {
    *(void *)(result + 24) = v10;
    *(_WORD *)(result + 42) = WORD1(v11);
    if (!a3) {
      return 0;
    }
    uint64_t result = 0;
    *a3 = a2;
  }
  return result;
}

uint64_t _tb_darwin_client_transport_activate()
{
  return 0;
}

uint64_t _tb_darwin_service_transport_activate()
{
  return 0;
}

uint64_t _tb_darwin_transport_supports_multipart_messages()
{
  return _config_supports_multipart;
}

uint64_t _tb_darwin_transport_get_tx_buffer_size()
{
  return 400;
}

void _tb_darwin_transport_destruct(void *a1)
{
  uint64_t context = (void *)tb_transport_get_context((uint64_t)a1);
  free(context);
  free(a1);
}

uint64_t tb_delegated_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  mach_port_name_t v5 = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v5) {
    goto LABEL_5;
  }
  *(void *)a3 = v5;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 48) = 0;
  *(unsigned char *)(a3 + 41) = 0;
  return 0;
}

void tb_delegated_transport_destruct_message_buffer(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 41) = 1;
}

uint64_t tb_delegated_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  free(*(void **)a1);
  *(void *)a1 = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  return tb_delegated_transport_construct_message_buffer(a3, v5, a1);
}

_OWORD *tb_delegated_service_transport_create(uint64_t a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v2) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v3 = v2;
  long long v4 = *(_OWORD *)&off_26B39B500;
  _OWORD *v2 = _tb_delegated_transport_vtable;
  v2[1] = v4;
  long long v5 = unk_26B39B520;
  v2[2] = xmmword_26B39B510;
  v2[3] = v5;
  *((void *)v2 + 8) = _tb_delegated_service_transport_destruct;
  *((void *)v2 + 12) = _tb_delegated_service_transport_create(a1);
  return v3;
}

_OWORD *tb_delegated_client_transport_create(uint64_t a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v2) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v3 = v2;
  long long v4 = *(_OWORD *)&off_26B39B500;
  _OWORD *v2 = _tb_delegated_transport_vtable;
  v2[1] = v4;
  long long v5 = unk_26B39B520;
  v2[2] = xmmword_26B39B510;
  v2[3] = v5;
  *((void *)v2 + 8) = _tb_delegated_client_transport_destruct;
  *((void *)v2 + 12) = _tb_delegated_client_transport_create(a1);
  return v3;
}

unint64_t tb_exclave_notification_create(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  if (exclaves_notification_create()) {
    return 12;
  }
  unint64_t result = (unint64_t)malloc_type_calloc(1uLL, 0x20uLL, 0x1020040AB73632BuLL);
  if (!result) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  *(void *)unint64_t result = -1;
  *(void *)(result + 8) = a2;
  if (result < result + 32)
  {
    uint64_t v5 = 0;
    *a3 = result;
    return v5;
  }
  __break(0x5519u);
  return result;
}

uint64_t tb_exclave_notification_register(uint64_t a1, dispatch_object_t object, void *a3)
{
  dispatch_retain(object);
  *(void *)(a1 + 24) = object;
  uint64_t v6 = dispatch_source_create(MEMORY[0x263EF83C0], *(void *)a1, *(void *)(a1 + 8), object);
  if (!v6) {
    return 12;
  }
  uint64_t v7 = v6;
  dispatch_retain(v6);
  *(void *)(a1 + 16) = v7;
  dispatch_source_set_event_handler(v7, a3);
  dispatch_activate(*(dispatch_object_t *)(a1 + 16));
  return 0;
}

void tb_exclave_notification_unregister(uint64_t a1, void *a2)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 16));
  dispatch_release(*(dispatch_object_t *)(a1 + 16));
  dispatch_async(*(dispatch_queue_t *)(a1 + 24), a2);
  long long v4 = *(NSObject **)(a1 + 24);
  dispatch_release(v4);
}

uint64_t _add_accumulator(pthread_mutex_t *a1, uint64_t *a2)
{
  uint64_t result = tb_list_add(a1, *a2, (uint64_t)a2, &__block_literal_global_0);
  if ((result & 1) == 0) {
    _add_accumulator_cold_1();
  }
  return result;
}

void ___add_accumulator_block_invoke(uint64_t a1, void **a2)
{
  free(a2[3]);
  free(a2);
}

void **tb_message_accumulator_accumulate(pthread_mutex_t *a1, uint64_t a2)
{
  uint64_t transport_buffer = tb_message_get_transport_buffer(a2);
  uint64_t v5 = tb_list_find(a1, *(void *)(a2 + 24));
  if (v5)
  {
    uint64_t v6 = (uint64_t *)v5;
    unint64_t v7 = v5 + 32;
  }
  else
  {
    unint64_t v8 = (uint64_t *)malloc_type_calloc(1uLL, 0x20uLL, 0x1010040313BCFEBuLL);
    if (!v8) {
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    }
    uint64_t v6 = v8;
    *unint64_t v8 = *(void *)(a2 + 24);
    unint64_t v7 = (unint64_t)(v8 + 4);
    uint64_t v9 = *(void *)(transport_buffer + 24);
    if (v9 < 0) {
      tb_message_accumulator_accumulate_cold_2();
    }
    uint64_t v10 = 2 * v9;
    unint64_t v11 = (char *)malloc_type_calloc(2 * v9, 1uLL, 0x100004077774924uLL);
    if (v11 > &v11[v10]) {
      goto LABEL_32;
    }
    if (!v11) {
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    }
    v6[2] = v10;
    v6[3] = (uint64_t)v11;
    if ((unint64_t)v6 >= v7) {
      goto LABEL_32;
    }
    _add_accumulator(a1, v6);
  }
  uint64_t v12 = tb_message_get_transport_buffer(a2);
  uint64_t v13 = v6[1];
  uint64_t v14 = *(void *)(v12 + 24);
  size_t v15 = v13 + v14;
  if (__CFADD__(v13, v14)) {
    goto LABEL_33;
  }
  size_t v16 = v6[2];
  if (v15 > v16)
  {
    uint64_t v17 = (char *)malloc_type_realloc((void *)v6[3], v15, 0x1DB45407uLL);
    if (v17 > &v17[v15])
    {
LABEL_32:
      __break(0x5519u);
LABEL_33:
      tb_message_accumulator_accumulate_cold_4();
    }
    if (!v17) {
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    }
    v6[2] = v15;
    v6[3] = (uint64_t)v17;
    size_t v16 = v15;
  }
  if ((unint64_t)(v6 + 4) > v7) {
    goto LABEL_32;
  }
  uint64_t v18 = v6[1];
  size_t v19 = *(void *)(transport_buffer + 24);
  if (__CFADD__(v18, v19)) {
    tb_message_accumulator_accumulate_cold_6();
  }
  if (v16 < v18 + v19) {
    tb_message_accumulator_accumulate_cold_7();
  }
  unint64_t v20 = v6[3];
  unint64_t v21 = v20 + v16;
  size_t v22 = (void *)(v20 + v18);
  BOOL v23 = v21 >= v20 + v18;
  size_t v24 = v21 - (v20 + v18);
  BOOL v25 = !v23 || v20 > (unint64_t)v22;
  if (v25 || v19 > v24) {
    goto LABEL_32;
  }
  memcpy(v22, *(const void **)transport_buffer, v19);
  v6[1] += *(void *)(transport_buffer + 24);
  if ((*(unsigned char *)(transport_buffer + 42) & 2) != 0)
  {
    long long v28 = (void **)malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
    if (!v28) {
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    }
    long long v27 = v28;
    if (tb_connection_alloc_init_owned_transport_message_buffer((uint64_t)v28, v6[1])) {
      tb_message_accumulator_accumulate_cold_9();
    }
    size_t v29 = v6[1];
    if (v29 <= v6[2] && v29 <= (unint64_t)v27[3])
    {
      memcpy(*v27, (const void *)v6[3], v29);
      tb_list_remove(a1, *v6);
      return v27;
    }
    goto LABEL_32;
  }
  return 0;
}

BOOL tb_message_splitter_split_required(uint64_t a1, unint64_t a2)
{
  return *(void *)(a1 + 56) && tb_transport_get_tx_buffer_size(a1) < a2;
}

uint64_t tb_message_splitter_send(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5)
{
  if (!tb_transport_supports_multipart_messages(a2)) {
    return 1;
  }
  size_t tx_buffer_size = tb_transport_get_tx_buffer_size(a2);
  uint64_t transport_buffer = (void *)tb_message_get_transport_buffer(a3);
  size_t v40 = transport_buffer[3];
  uint64_t v43 = 0;
  uint64_t v10 = malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
  if (!v10) {
    goto LABEL_57;
  }
  unint64_t v11 = v10;
  uint64_t v12 = (*(uint64_t (**)(size_t, void, void *))(a2 + 24))(tx_buffer_size, 0, v10);
  if (!v12)
  {
    v39 = a4;
    size_t v13 = v40;
    if (!v40)
    {
LABEL_42:
      (*(void (**)(void *))(a2 + 32))(v11);
      free(v11);
      if (v39 && v43) {
        uint64_t *v39 = a3;
      }
      tb_message_set_transport_buffer(a3, (uint64_t)transport_buffer);
      return 0;
    }
    unint64_t v14 = 0;
    while (1)
    {
      size_t v15 = v14 + tx_buffer_size;
      if (__CFADD__(v14, tx_buffer_size)) {
        tb_message_splitter_send_cold_2();
      }
      size_t v16 = tx_buffer_size;
      if (v15 >= v13) {
        size_t tx_buffer_size = v13 - v14;
      }
      uint64_t v17 = *(uint64_t (**)(void *, void, size_t))(a2 + 40);
      if (!v17) {
        break;
      }
      uint64_t v18 = v17(v11, 0, tx_buffer_size);
      if (v18)
      {
        uint64_t v12 = v18;
        goto LABEL_50;
      }
      unint64_t v19 = *v11 + v11[3];
      unint64_t v20 = (void *)(*v11 + v11[4]);
      unint64_t v21 = *transport_buffer + transport_buffer[3];
      size_t v22 = (const void *)(*transport_buffer + transport_buffer[4] + v14);
      BOOL v23 = v21 >= (unint64_t)v22;
      size_t v24 = v21 - (void)v22;
      if (!v23
        || *transport_buffer > (unint64_t)v22
        || tx_buffer_size > v24
        || (unint64_t)v20 > v19
        || *v11 > (unint64_t)v20
        || tx_buffer_size > v19 - (unint64_t)v20)
      {
        __break(0x5519u);
LABEL_57:
        _tb_afk_common_transport_construct_message_buffer_cold_1();
      }
      if (v15 < v13) {
        __int16 v30 = 1;
      }
      else {
        __int16 v30 = 3;
      }
      if (v15 >= v13 || (a5 & 2) == 0) {
        unint64_t v32 = a5;
      }
      else {
        unint64_t v32 = a5 & 0xFFFFFFFFFFFFFFFDLL;
      }
      memcpy(v20, v22, tx_buffer_size);
      *((_WORD *)v11 + 21) = v30;
      tb_message_set_transport_buffer(a3, (uint64_t)v11);
      _tb_connection_observe_send_message(a1);
      uint64_t v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, unint64_t))a2)(a2, a3, &v43, v32);
      if (v33)
      {
        uint64_t v12 = v33;
        (*(void (**)(void *))(a2 + 32))(v11);
        free(v11);
        uint64_t v37 = a3;
        uint64_t v38 = (uint64_t)transport_buffer;
        goto LABEL_54;
      }
      if (v43)
      {
        if (v15 < v40)
        {
          (*(void (**)(void *))(a2 + 32))(v11);
          free(v11);
          tb_message_set_transport_buffer(v43, (uint64_t)transport_buffer);
          return 4;
        }
        uint64_t v34 = tb_message_get_transport_buffer(v43);
        uint64_t v35 = _tb_message_buffer_reset(a1, a2, (uint64_t)transport_buffer, *(void *)(v34 + 24), 0);
        if (v35)
        {
          uint64_t v12 = v35;
          (*(void (**)(void *))(a2 + 32))(v11);
          free(v11);
          uint64_t v37 = v43;
          uint64_t v38 = (uint64_t)transport_buffer;
LABEL_54:
          tb_message_set_transport_buffer(v37, v38);
          return v12;
        }
        tb_transport_message_buffer_deep_copy(transport_buffer, v34);
      }
      tb_message_set_transport_buffer(a3, (uint64_t)transport_buffer);
      v14 += tx_buffer_size;
      size_t v13 = v40;
      size_t tx_buffer_size = v16;
      if (v14 >= v40) {
        goto LABEL_42;
      }
    }
    uint64_t v12 = 2;
LABEL_50:
    (*(void (**)(void *))(a2 + 32))(v11);
    free(v11);
  }
  return v12;
}

uint64_t tb_reply_splitter_add_reply(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t transport = tb_connection_get_transport((uint64_t)a3);
  if (!tb_transport_supports_multipart_messages(transport)) {
    return 5;
  }
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (!*(unsigned char *)(transport_buffer + 40)) {
    goto LABEL_20;
  }
  uint64_t v8 = transport_buffer;
  uint64_t v9 = *(void *)(a1 + 24);
  explicit = (pthread_mutex_t *)atomic_load_explicit(&reply_list, memory_order_acquire);
  if (!explicit)
  {
    unint64_t v11 = tb_list_create();
    explicit = v11;
    uint64_t v12 = 0;
    atomic_compare_exchange_strong_explicit(&reply_list, (unint64_t *)&v12, (unint64_t)v11, memory_order_release, memory_order_relaxed);
    if (v12)
    {
      free(v11);
      explicit = (pthread_mutex_t *)atomic_load_explicit(&reply_list, memory_order_acquire);
    }
  }
  size_t v13 = malloc_type_calloc(1uLL, 0x20uLL, 0x1010040BA4D407CuLL);
  if (!v13) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  unint64_t v14 = (unint64_t)v13;
  size_t v15 = *(void *)(v8 + 24);
  size_t v16 = (char *)malloc_type_calloc(v15, 1uLL, 0x100004077774924uLL);
  if (v16 > &v16[v15]) {
    goto LABEL_19;
  }
  uint64_t v17 = v16;
  if (!v16) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (v15 > *(void *)(v8 + 24)
    || (memcpy(v16, *(const void **)v8, v15),
        *(void *)(v14 + 16) = v15,
        *(void *)(v14 + 24) = 0,
        *(void *)unint64_t v14 = v9,
        *(void *)(v14 + 8) = v17,
        v14 >= v14 + 32))
  {
LABEL_19:
    __break(0x5519u);
LABEL_20:
    tb_reply_splitter_add_reply_cold_1();
  }
  tb_list_add(explicit, v9, v14, &__block_literal_global_9);
  unint64_t tx_buffer_size = tb_transport_get_tx_buffer_size(transport);
  uint64_t result = _tb_message_reset(a3, (_DWORD *)a1, 1, tx_buffer_size, 0);
  if (!result)
  {
    unint64_t v20 = (void *)tb_message_get_transport_buffer(a1);
    if (tx_buffer_size <= *(void *)(v14 + 16))
    {
      unint64_t v21 = v20;
      unint64_t v22 = *v20;
      unint64_t v23 = *v20 + v20[3];
      size_t v24 = (void *)(*v20 + v20[4]);
      if ((unint64_t)v24 <= v23 && v22 <= (unint64_t)v24 && tx_buffer_size <= v23 - (unint64_t)v24)
      {
        memcpy(v24, *(const void **)(v14 + 8), tx_buffer_size);
        v21[2] += tx_buffer_size;
        *(void *)(v14 + 24) += tx_buffer_size;
        *((_WORD *)v21 + 21) |= 1u;
        *a2 = a1;
        tb_message_complete(a1);
        return 0;
      }
    }
    goto LABEL_19;
  }
  return result;
}

uint64_t tb_reply_splitter_next_message(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(tb_message_get_transport_buffer(a2) + 40)) {
    return 2;
  }
  uint64_t v8 = *(void *)(a2 + 24);
  explicit = (pthread_mutex_t *)atomic_load_explicit(&reply_list, memory_order_acquire);
  if (!explicit) {
    return 14;
  }
  uint64_t v10 = tb_list_find(explicit, v8);
  if (!v10) {
    return 14;
  }
  unint64_t v11 = (void *)v10;
  uint64_t tx_buffer_size = tb_transport_get_tx_buffer_size(a4);
  uint64_t v13 = v11[3];
  unint64_t v14 = v13 + tx_buffer_size;
  if (__CFADD__(v13, tx_buffer_size)) {
    tb_reply_splitter_next_message_cold_1();
  }
  unint64_t v15 = v11[2];
  unint64_t v16 = v15 - v13;
  if (v14 >= v15) {
    unint64_t v17 = v16;
  }
  else {
    unint64_t v17 = tx_buffer_size;
  }
  uint64_t result = _tb_message_reset(a1, (_DWORD *)a2, 1, v17, 0);
  if (!result)
  {
    uint64_t result = tb_message_get_transport_buffer(a2);
    if (v14 < v15) {
      __int16 v18 = 1;
    }
    else {
      __int16 v18 = 3;
    }
    *(_WORD *)(result + 42) = v18;
    unint64_t v19 = (char *)(v11[1] + v11[3]);
    if (v19 > &v19[v17] || v17 > *(void *)(result + 24))
    {
      __break(0x5519u);
    }
    else
    {
      memcpy(*(void **)result, v19, v17);
      v11[3] += v17;
      tb_message_complete(a2);
      if (v14 < v15) {
        return 0;
      }
      uint64_t v21 = *(void *)(a2 + 24);
      uint64_t result = atomic_load_explicit(&reply_list, memory_order_acquire);
      if (result)
      {
        tb_list_remove((pthread_mutex_t *)result, v21);
        return 0;
      }
    }
  }
  return result;
}

void ___reply_list_add_block_invoke(uint64_t a1, void **a2)
{
  free(a2[1]);
  free(a2);
}

void *tb_transport_set_message_handler(uint64_t a1, void *aBlock)
{
  uint64_t result = _Block_copy(aBlock);
  *(void *)(a1 + 72) = result;
  return result;
}

uint64_t tb_transport_set_message_handler_f(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 80) = a2;
  *(void *)(result + 88) = a3;
  return result;
}

uint64_t tb_transport_call_message_handler(void *a1, uint64_t a2, uint64_t *a3)
{
  long long v4 = (uint64_t (*)(uint64_t, void))a1[10];
  if (v4)
  {
    uint64_t v5 = v4(a2, a1[11]);
LABEL_5:
    uint64_t v7 = v5;
    uint64_t result = 0;
    *a3 = v7;
    return result;
  }
  uint64_t v6 = a1[9];
  if (v6)
  {
    uint64_t v5 = (*(uint64_t (**)(void))(v6 + 16))();
    goto LABEL_5;
  }
  return 4;
}

void tb_transport_destruct(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 72);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 64);
  if (v3)
  {
    v3(a1);
  }
}

uint64_t tb_transport_message_buffer_wrap_buffer(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)uint64_t result = a2;
  *(unsigned char *)(result + 8) = 1;
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a3;
  *(void *)(result + 32) = 0;
  *(void *)(result + 48) = 0;
  return result;
}

uint64_t tb_transport_supports_multipart_messages(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 48);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

uint64_t tb_transport_get_tx_buffer_size(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 56);
  if (v1) {
    return v1();
  }
  else {
    return 0;
  }
}

double tb_transport_initialize_message_buffer(uint64_t a1)
{
  *(unsigned char *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 48) = 0;
  *(void *)a1 = 0;
  *(void *)(a1 + 16) = 0;
  return result;
}

uint64_t tb_transport_reset_message_buffer(uint64_t result)
{
  *(unsigned char *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  *(void *)(result + 32) = 0;
  *(_WORD *)(result + 42) = 0;
  *(unsigned char *)(result + 40) = 0;
  return result;
}

void *tb_transport_message_buffer_deep_copy(void *result, uint64_t a2)
{
  size_t v2 = *(void *)(a2 + 24);
  if (v2 > result[3]
    || (v4 = result, result = memcpy((void *)*result, *(const void **)a2, v2), unint64_t v5 = *(void *)(a2 + 24), v5 > v4[3]))
  {
    __break(0x5519u);
  }
  else
  {
    *((unsigned char *)v4 + 8) = *(unsigned char *)(a2 + 8);
    v4[2] = *(void *)(a2 + 16);
    v4[3] = v5;
    v4[4] = *(void *)(a2 + 32);
    *((_DWORD *)v4 + 10) = *(_DWORD *)(a2 + 40);
  }
  return result;
}

uint64_t tb_component_capability(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 >= a2 || a1 == 0) {
    return 0;
  }
  else {
    return a1 + a3;
  }
}

BOOL tb_component_admission_search_multiple(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  BOOL result = 1;
  if (a1 && a2)
  {
    if (tb_component_admission_search(*a1, a3))
    {
      return 1;
    }
    else
    {
      uint64_t v7 = 1;
      do
      {
        unint64_t v8 = v7;
        if (a2 == v7) {
          break;
        }
        int v9 = tb_component_admission_search(a1[v7], a3);
        uint64_t v7 = v8 + 1;
      }
      while (!v9);
      return v8 < a2;
    }
  }
  return result;
}

unsigned char *tb_forwarding_connection_create_with_endpoint_options(unsigned int *a1, unsigned int *a2, char a3, const void *a4)
{
  _tb_connection_create_transport_for_endpoint(a1, 1);
  uint64_t v9 = v8;
  _tb_connection_create_transport_for_endpoint(a2, 0);
  unint64_t v11 = _tb_forwarding_connection_create(v9, v10, a3, a4);
  tb_endpoint_destruct(a1);
  tb_endpoint_destruct(a2);
  return v11;
}

unsigned char *_tb_forwarding_connection_create(uint64_t a1, uint64_t a2, char a3, const void *a4)
{
  BOOL result = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040984C81BBuLL);
  if (!result) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v9 = result;
  if (a3) {
    *BOOL result = 1;
  }
  if (result >= result + 24)
  {
    __break(0x5519u);
  }
  else
  {
    uint64_t v10 = _tb_connection_create(a1);
    unint64_t v11 = _Block_copy(a4);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 0x40000000;
    v12[2] = ___tb_service_connection_create_forward_block_invoke;
    v12[3] = &unk_26553E140;
    _DWORD v12[4] = v11;
    v12[5] = v9;
    tb_transport_set_message_handler(a1, v12);
    *((void *)v9 + 1) = v10;
    *((void *)v9 + 2) = tb_client_connection_create(a2);
    return v9;
  }
  return result;
}

unsigned char *tb_forwarding_connection_create(uint64_t a1, uint64_t a2, const void *a3)
{
  return _tb_forwarding_connection_create(a1, a2, 0, a3);
}

unsigned char *tb_forwarding_connection_create_with_endpoint(unsigned int *a1, unsigned int *a2, const void *a3)
{
  return tb_forwarding_connection_create_with_endpoint_options(a1, a2, 0, a3);
}

uint64_t tb_forwarding_connection_activate(uint64_t a1)
{
  uint64_t result = tb_client_connection_activate(*(uint64_t **)(a1 + 16));
  if (!result)
  {
    uint64_t v3 = *(uint64_t **)(a1 + 8);
    return tb_service_connection_activate(v3);
  }
  return result;
}

void tb_forwarding_connection_destruct(uint64_t a1)
{
  _tb_connection_destruct(*(void *)(a1 + 8));
  uint64_t v2 = *(void *)(a1 + 16);
  _tb_connection_destruct(v2);
}

_DWORD *___tb_service_connection_create_forward_block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, _DWORD *, uint64_t))(v4 + 16))(v4, v3, a2, 1))
  {
    tb_message_complete((uint64_t)a2);
    return 0;
  }
  uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  *(void *)(transport_buffer + 16) = *(void *)(transport_buffer + 24);
  uint64_t transport = tb_connection_get_transport(*(void *)(v3 + 16));
  if (transport == tb_connection_get_transport(*(void *)(v3 + 8)))
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v7 = (void *)tb_message_get_transport_buffer((uint64_t)a2);
    uint64_t v8 = malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
    if (!v8) {
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    }
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    if ((*(unsigned int (**)(void, void, void *))(transport + 24))(v7[2] - v7[4], 0, v8)) {
      goto LABEL_18;
    }
  }
  if (_tb_forwarding_connection_message_forward(v3, a2, v9, 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)v3 || !(*(unsigned int (**)(uint64_t, uint64_t, _DWORD *, void))(v4 + 16))(v4, v3, a2, 0))
  {
    tb_message_set_transport_buffer((uint64_t)a2, (uint64_t)v7);
LABEL_15:
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  uint64_t v11 = tb_message_get_transport_buffer((uint64_t)a2);
  *(void *)(v11 + 16) = *(void *)(v11 + 24);
  if (_tb_forwarding_connection_message_forward(v3, a2, v7, 0)) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = a2;
  }
LABEL_16:
  if (v9)
  {
    (*(void (**)(void *))(transport + 32))(v9);
LABEL_18:
    free(v9);
  }
  return v10;
}

void *_tb_forwarding_connection_message_forward(uint64_t a1, _DWORD *a2, void *a3, int a4)
{
  uint64_t v26 = a2;
  uint64_t v8 = 16;
  if (a4) {
    uint64_t v8 = 8;
  }
  uint64_t transport = tb_connection_get_transport(*(void *)(a1 + v8));
  if (*a2 != 4) {
    tb_message_precheck_decoding_cold_4();
  }
  uint64_t v10 = (void *)transport;
  uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  uint64_t v12 = (void *)transport_buffer;
  if (a3 && a3[2] < a3[4]) {
    _tb_forwarding_connection_message_forward_cold_3();
  }
  uint64_t v13 = (uint64_t *)(a1 + 16);
  uint64_t v14 = *(void *)(transport_buffer + 16);
  uint64_t v15 = *(void *)(transport_buffer + 32);
  if (!a4) {
    uint64_t v13 = (uint64_t *)(a1 + 8);
  }
  uint64_t result = (void *)tb_connection_get_transport(*v13);
  uint64_t v17 = 9;
  if (!a3) {
    return (void *)v17;
  }
  if (v10 == result) {
    return (void *)v17;
  }
  unint64_t v18 = v14 - v15;
  if ((a4 & 1) == 0)
  {
    uint64_t v19 = tb_connection_get_transport(*(void *)(a1 + 8));
    tb_transport_reset_message_buffer((uint64_t)a3);
    uint64_t result = (void *)(*(uint64_t (**)(void *, void, uint64_t))(v19 + 40))(a3, 0, v14 - v15);
    uint64_t v17 = (uint64_t)result;
    if (result) {
      return (void *)v17;
    }
  }
  uint64_t v20 = a3[2];
  if (__CFADD__(v20, v18)) {
    _tb_forwarding_connection_message_forward_cold_1();
  }
  unint64_t v21 = a3[3];
  if (v20 + v18 > v21) {
    _tb_forwarding_connection_message_forward_cold_2();
  }
  unint64_t v22 = *v12 + v12[3];
  unint64_t v23 = (const void *)(*v12 + v12[4]);
  if (v22 >= (unint64_t)v23 && *v12 <= (unint64_t)v23 && v18 <= v22 - (unint64_t)v23)
  {
    unint64_t v24 = *a3 + v21;
    uint64_t result = (void *)(*a3 + v20);
    if ((unint64_t)result <= v24 && *a3 <= (unint64_t)result && v18 <= v24 - (unint64_t)result)
    {
      memcpy(result, v23, v14 - v15);
      a3[2] += v18;
      tb_message_set_transport_buffer((uint64_t)a2, (uint64_t)a3);
      tb_message_complete((uint64_t)a2);
      tb_message_set_state(a2, 2);
      if (a4) {
        char v25 = 1;
      }
      else {
        char v25 = 2;
      }
      tb_message_set_disposition((uint64_t)a2, v25);
      tb_message_set_connection_identifier((uint64_t)a2, *(void *)(a1 + 16));
      if (!a4) {
        return 0;
      }
      uint64_t v17 = tb_connection_send_query(*(uint64_t **)(a1 + 16), (uint64_t)a2, (uint64_t *)&v26, 2 * (*(unsigned char *)a1 == 0));
      if (v17) {
        tb_message_set_transport_buffer((uint64_t)v26, (uint64_t)v12);
      }
      return (void *)v17;
    }
  }
  __break(0x5519u);
  return result;
}

void *tb_alloc_message()
{
  uint64_t result = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
  if (!result) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  return result;
}

void *tb_alloc_transport_message_buffer()
{
  uint64_t result = malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
  if (!result) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  return result;
}

uint64_t tb_unix_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v5) {
    goto LABEL_5;
  }
  *(void *)a3 = v5;
  *(unsigned char *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 48) = 0;
  *(unsigned char *)(a3 + 41) = 0;
  return 0;
}

void tb_unix_transport_destruct_message_buffer(uint64_t a1)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 41) = 1;
}

uint64_t tb_unix_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  free(*(void **)a1);
  *(void *)a1 = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  return tb_unix_transport_construct_message_buffer(a3, v5, a1);
}

_OWORD *tb_unix_client_transport_create_with_endpoint(uint64_t a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v2) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v3 = v2;
  long long v4 = unk_26B39B5B0;
  v2[2] = xmmword_26B39B5A0;
  v2[3] = v4;
  *((void *)v2 + 8) = off_26B39B5C0;
  long long v5 = *(_OWORD *)&off_26B39B590;
  _OWORD *v2 = _tb_unix_client_transport_vtable;
  v2[1] = v5;
  *((void *)v2 + 12) = _tb_unix_client_transport_create_with_endpoint(a1);
  return v3;
}

_OWORD *tb_unix_service_transport_create_with_endpoint(uint64_t a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v2) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v3 = v2;
  long long v4 = unk_26B39B5F8;
  v2[2] = xmmword_26B39B5E8;
  v2[3] = v4;
  *((void *)v2 + 8) = off_26B39B608;
  long long v5 = *(_OWORD *)&off_26B39B5D8;
  _OWORD *v2 = _tb_unix_service_transport_vtable;
  v2[1] = v5;
  *((void *)v2 + 12) = _tb_unix_service_transport_create_with_endpoint(a1);
  return v3;
}

char *_make_node(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t v6 = (char *)malloc_type_calloc(1uLL, 0x20uLL, 0x10A004062D90B2CuLL);
  if (!v6) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v7 = v6;
  uint64_t v8 = v6 + 32;
  *((void *)v6 + 1) = a1;
  *((void *)v6 + 2) = a2;
  uint64_t result = (char *)_Block_copy(a3);
  *((void *)v7 + 3) = result;
  if (v7 < v8) {
    return v7;
  }
  __break(0x5519u);
  return result;
}

uint64_t _iterate_list(pthread_mutex_t *a1, uint64_t a2)
{
  pthread_mutex_lock(a1);
  sig = (void *)a1[1].__sig;
  if (sig)
  {
    char v6 = 0;
    do
    {
      (*(void (**)(uint64_t, void *, char *))(a2 + 16))(a2, sig, &v6);
      if (v6) {
        break;
      }
      sig = (void *)*sig;
    }
    while (sig);
  }
  return pthread_mutex_unlock(a1);
}

uint64_t tb_list_clear(pthread_mutex_t *a1)
{
  pthread_mutex_lock(a1);
  sig = (void *)a1[1].__sig;
  if (sig)
  {
    do
    {
      uint64_t v3 = (void *)*sig;
      (*(void (**)(void))(sig[3] + 16))();
      free(sig);
      sig = v3;
    }
    while (v3);
    a1[1].__sig = 0;
  }
  return pthread_mutex_unlock(a1);
}

pthread_mutex_t *tb_list_create()
{
  uint64_t v0 = (pthread_mutex_t *)malloc_type_calloc(1uLL, 0x48uLL, 0x1020040C6685353uLL);
  if (!v0) {
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  uint64_t v1 = v0;
  pthread_mutex_init(v0, 0);
  return v1;
}

void tb_list_free(pthread_mutex_t *a1)
{
  pthread_mutex_destroy(a1);
  free(a1);
}

uint64_t tb_list_add(pthread_mutex_t *a1, uint64_t a2, uint64_t a3, const void *a4)
{
  node = _make_node(a2, a3, a4);
  pthread_mutex_lock(a1);
  sig = (char *)a1[1].__sig;
  if (sig)
  {
    while (1)
    {
      uint64_t v8 = (char **)sig;
      if (*((void *)sig + 1) == a2) {
        break;
      }
      sig = *(char **)sig;
      if (!*v8)
      {
        *uint64_t v8 = node;
        goto LABEL_6;
      }
    }
    free(node);
    uint64_t v9 = 0;
  }
  else
  {
    a1[1].__sig = (uint64_t)node;
LABEL_6:
    uint64_t v9 = 1;
  }
  pthread_mutex_unlock(a1);
  return v9;
}

uint64_t tb_list_remove(pthread_mutex_t *a1, uint64_t a2)
{
  pthread_mutex_lock(a1);
  long long v4 = a1 + 1;
  sig = (pthread_mutex_t *)a1[1].__sig;
  while (*(void *)sig->__opaque != a2)
  {
    long long v4 = sig;
    sig = (pthread_mutex_t *)sig->__sig;
    if (!sig) {
      goto LABEL_6;
    }
  }
  v4->__sig = sig->__sig;
  (*(void (**)(void))(*(void *)&sig->__opaque[16] + 16))();
  free(sig);
LABEL_6:
  return pthread_mutex_unlock(a1);
}

uint64_t tb_list_find(pthread_mutex_t *a1, uint64_t a2)
{
  pthread_mutex_lock(a1);
  sig = (void *)a1[1].__sig;
  if (!sig)
  {
    pthread_mutex_unlock(a1);
    return 0;
  }
  long long v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = 0;
  do
  {
    if (sig[1] == a2)
    {
      uint64_t v7 = sig;
      unint64_t v6 = (unint64_t)(sig + 4);
      long long v5 = sig;
    }
    sig = (void *)*sig;
  }
  while (sig);
  uint64_t result = pthread_mutex_unlock(a1);
  if (!v5) {
    return 0;
  }
  if ((unint64_t)(v5 + 4) <= v6 && v7 <= v5) {
    return v5[2];
  }
  __break(0x5519u);
  return result;
}

uint64_t tb_list_count(pthread_mutex_t *a1)
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2000000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = __tb_list_count_block_invoke;
  v3[3] = &unk_26553E168;
  v3[4] = &v4;
  _iterate_list(a1, (uint64_t)v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t __tb_list_count_block_invoke(uint64_t result)
{
  return result;
}

uint64_t static Conclave.service<A>(for:as:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (void *)((char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14[0] = 0;
  uint64_t v10 = sub_25F642B10();
  int v11 = tb_conclave_identifier_for_service(v10 + 32, v14);
  swift_release();
  if (v11)
  {
    type metadata accessor for TransportError(0);
    sub_25F61F188((unint64_t *)&qword_26A7AF730, type metadata accessor for TransportError);
    swift_allocError();
    *uint64_t v12 = v11;
    return swift_willThrow();
  }
  else if ((v14[0] & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_25F642D80();
    __break(1u);
  }
  else
  {
    *uint64_t v9 = v14[0];
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(void *, uint64_t, uint64_t))(a5 + 8))(v9, a4, a5);
  }
  return result;
}

void type metadata accessor for TransportError(uint64_t a1)
{
}

ValueMetadata *type metadata accessor for Conclave()
{
  return &type metadata for Conclave;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void type metadata accessor for tb_connection_s(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for BumpBuffer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t sub_25F61EB48(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 88)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25F61EB68(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 88) = v3;
  return result;
}

void type metadata accessor for tb_message_s(uint64_t a1)
{
}

__n128 __swift_memcpy232_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  long long v7 = a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  __n128 result = (__n128)a2[11];
  long long v11 = a2[12];
  long long v12 = a2[13];
  *(void *)(a1 + 2++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *((void *)a2 + 28);
  *(_OWORD *)(a1 + 192) = v11;
  *(_OWORD *)(a1 + 208) = v12;
  *(__n128 *)(a1 + 176) = result;
  return result;
}

void type metadata accessor for tb_transport_s(uint64_t a1)
{
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_25F61EC30(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[24]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_25F61EC84(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for tb_forwarding_connection_s(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EndpointTuple(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for EndpointTuple(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for tb_darwin_transport_endpoint_s(uint64_t a1)
{
}

_DWORD *sub_25F61ED58@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(unsigned char *)(a2 + 4) = 0;
  return result;
}

void sub_25F61ED68(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_25F61ED74(uint64_t a1, uint64_t a2)
{
  return sub_25F61EEE0(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_25F61ED8C(uint64_t a1, id *a2)
{
  uint64_t result = sub_25F642AD0();
  *a2 = 0;
  return result;
}

uint64_t sub_25F61EE04(uint64_t a1, id *a2)
{
  char v3 = sub_25F642AE0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_25F61EE84@<X0>(uint64_t *a1@<X8>)
{
  sub_25F642AF0();
  uint64_t v2 = sub_25F642AC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25F61EEC8(uint64_t a1, uint64_t a2)
{
  return sub_25F61EEE0(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_25F61EEE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_25F642AF0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_25F61EF24()
{
  sub_25F642AF0();
  sub_25F642B40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F61EF78()
{
  sub_25F642AF0();
  sub_25F642EA0();
  sub_25F642B40();
  uint64_t v0 = sub_25F642ED0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_25F61EFEC()
{
  return sub_25F642ED0();
}

uint64_t sub_25F61F050(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F61F188(&qword_26A7AF778, type metadata accessor for TransportError);
  return MEMORY[0x270EEEA70](a1, a2, v4);
}

uint64_t sub_25F61F0CC()
{
  return sub_25F642ED0();
}

BOOL sub_25F61F12C(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_25F61F140()
{
  return sub_25F61F188(&qword_26A7AF770, type metadata accessor for TransportError);
}

uint64_t sub_25F61F188(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25F61F1D0()
{
  uint64_t v0 = sub_25F642AF0();
  uint64_t v2 = v1;
  if (v0 == sub_25F642AF0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_25F642E10();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_25F61F25C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_25F642AC0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_25F61F2A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_25F642AF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_25F61F2D0(uint64_t a1)
{
  uint64_t v2 = sub_25F61F188(&qword_26A7AF7D0, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_25F61F188(&qword_26A7AF7D8, type metadata accessor for FileAttributeKey);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

uint64_t sub_25F61F3A0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25F61F3C0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 40) = v3;
  return result;
}

void type metadata accessor for tb_connection_s.__Unnamed_union___Anonymous_field0(uint64_t a1)
{
}

void type metadata accessor for MessageDisposition(uint64_t a1)
{
}

void type metadata accessor for MessageState(uint64_t a1)
{
}

uint64_t sub_25F61F430(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 232)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_25F61F450(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 232) = v3;
  return result;
}

void type metadata accessor for tb_transport_s.__Unnamed_union___Anonymous_field0(uint64_t a1)
{
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t sub_25F61F4F4(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 104)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_25F61F548(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 104) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 104) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for tb_transport_message_buffer_s(uint64_t a1)
{
}

uint64_t sub_25F61F5B8(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25F61F600(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for tb_component_handler_vtable_s(uint64_t a1)
{
}

uint64_t sub_25F61F65C(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t sub_25F61F6A0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

void type metadata accessor for tb_component_admission_table_s(uint64_t a1)
{
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_25F61F708(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_25F61F750(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for tb_component_vtable_s(uint64_t a1)
{
}

uint64_t sub_25F61F7B0()
{
  return sub_25F61F188(&qword_26A7AF7C0, type metadata accessor for FileAttributeKey);
}

uint64_t sub_25F61F7F8()
{
  return sub_25F61F188(&qword_26A7AF7C8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_25F61F840()
{
  return sub_25F61F188(qword_26B39A388, type metadata accessor for FileAttributeKey);
}

uint64_t getEnumTagSinglePayload for BumpBuffer(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BumpBuffer(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for tb_transport_message_buffer_opaque_data_s(uint64_t a1)
{
}

void type metadata accessor for tb_transport_flags_t(uint64_t a1)
{
}

uint64_t sub_25F61F908(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 8)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t sub_25F61F94C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = 0;
    }
  }
  return result;
}

void type metadata accessor for tb_component_admission_list_s(uint64_t a1)
{
}

void sub_25F61F99C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t dispatch thunk of TightbeamServiceInitProtocol.init(endpoint:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

const mach_header_64 *sub_25F61FA0C@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  v20[1] = *MEMORY[0x263EF8340];
  __n128 result = (const mach_header_64 *)_dyld_image_count();
  if (result)
  {
    int v7 = (int)result;
    uint32_t v8 = 0;
    while (1)
    {
      __n128 result = (const mach_header_64 *)_dyld_get_image_header(v8);
      if (result)
      {
        v20[0] = 0;
        __n128 result = (const mach_header_64 *)getsectiondata(result, "__DATA", "__TIGHTBEAM", v20);
        if (result)
        {
          if ((uint64_t)v20[0] >= 8) {
            break;
          }
        }
      }
LABEL_3:
      if (++v8 == v7) {
        goto LABEL_25;
      }
    }
    long long v9 = (const mach_header_64 *)((char *)result + (v20[0] & 0xFFFFFFFFFFFFFFF8));
    while (1)
    {
      uint64_t v10 = **(unsigned __int8 ***)&result->magic;
      int v11 = *v10;
      if (!*v10) {
        goto LABEL_8;
      }
      if (v10[1]) {
        break;
      }
      if (a2 == 1 && v11 == *a1)
      {
LABEL_24:
        *a3 = *(void *)&result->magic;
        return result;
      }
LABEL_9:
      __n128 result = (const mach_header_64 *)((char *)result + 8);
      if (result == v9) {
        goto LABEL_3;
      }
    }
    uint64_t v12 = 0;
    while (v12 != 1022)
    {
      if (!v10[v12++ + 2])
      {
        if (a2 - 1 != v12 || v11 != *a1 || v10[1] != a1[1]) {
          goto LABEL_9;
        }
        uint64_t v14 = v10 + 2;
        uint64_t v15 = a2 - 2;
        unint64_t v16 = a1 + 2;
        while (v15)
        {
          int v18 = *v14++;
          int v17 = v18;
          int v19 = *v16++;
          --v15;
          if (v17 != v19) {
            goto LABEL_9;
          }
        }
        goto LABEL_24;
      }
    }
LABEL_8:
    if (!a2) {
      goto LABEL_24;
    }
    goto LABEL_9;
  }
LABEL_25:
  *a3 = 0;
  return result;
}

uint64_t sub_25F61FBB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25F61FDE8(a1, a2, a3, a4, a5, sub_25F623920, sub_25F6238A0);
}

uint64_t sub_25F61FBE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F61FC14(a1, a2, a3, sub_25F623920, sub_25F6238A0);
}

uint64_t sub_25F61FC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void, uint64_t, uint64_t, uint64_t), uint64_t (*a5)(void, uint64_t, uint64_t, uint64_t))
{
  if (a1 < 0) {
    goto LABEL_20;
  }
  uint64_t v9 = a3 - a2;
  if (a2) {
    uint64_t v10 = a3 - a2;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = a4(0, v10, a2, a3);
  if (a1 && (v11 & 0x8000000000000000) == 0 && v11 < a1)
  {
    uint64_t result = v9;
    if (!a2) {
      return 0;
    }
LABEL_11:
    uint64_t v13 = v9;
    if (v9 >= result) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
  uint64_t result = a5(0, a1, a2, a3);
  if (a2) {
    goto LABEL_11;
  }
  uint64_t v13 = 0;
  if (result > 0)
  {
LABEL_19:
    sub_25F642D80();
    __break(1u);
LABEL_20:
    sub_25F642D80();
    __break(1u);
    goto LABEL_21;
  }
LABEL_12:
  if (result < 0) {
    goto LABEL_21;
  }
  if (a2)
  {
    if (v9 >= v13) {
      return result;
    }
LABEL_21:
    uint64_t result = sub_25F642DE0();
    __break(1u);
    return result;
  }
  if (v13 >= 1) {
    goto LABEL_21;
  }
  return result;
}

uint64_t sub_25F61FDE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    uint64_t v13 = a6(a2, a3, a4, a5);
    if (!a1 || (uint64_t v14 = v13, v13 < 0) || (result = a3, v14 >= a1))
    {
      uint64_t result = a7(a2, a1, a4, a5);
      if (result > a3) {
        goto LABEL_8;
      }
    }
    if (result >= a2) {
      return result;
    }
  }
  sub_25F642D80();
  __break(1u);
LABEL_8:
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t sub_25F61FF68(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    sub_25F642D80();
    __break(1u);
  }
  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    if ((uint64_t)v2 >= a1) {
      unint64_t v3 = a1;
    }
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (a1) {
      unint64_t v4 = v3;
    }
    else {
      unint64_t v4 = 0;
    }
    if (v2 >= v4) {
      return a2;
    }
  }
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t ComponentRuntime.Configuration.numEndpoints.getter()
{
  return *(void *)v0;
}

uint64_t ComponentRuntime.Configuration.numComponents.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t ComponentRuntime.Configuration.numClients.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t ComponentRuntime.Configuration.numTypes.getter()
{
  return *(void *)(v0 + 24);
}

Tightbeam::ComponentRuntime::Configuration __swiftcall ComponentRuntime.Configuration.init(numEndpoints:numComponents:numClients:numTypes:)(Swift::Int numEndpoints, Swift::Int numComponents, Swift::Int numClients, Swift::Int numTypes)
{
  Swift::Int *v4 = numEndpoints;
  v4[1] = numComponents;
  v4[2] = numClients;
  v4[3] = numTypes;
  result.numTypes = numTypes;
  result.numClients = numClients;
  result.numComponents = numComponents;
  result.numEndpoints = numEndpoints;
  return result;
}

uint64_t sub_25F620074(unsigned __int8 *a1, unint64_t a2)
{
  unint64_t v3 = *(uint64_t **)(*(void *)(v2 + 32) + 40);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = *v3;
  if (*v3 < 0)
  {
    __break(1u);
LABEL_32:
    uint64_t result = sub_25F642DE0();
    __break(1u);
    return result;
  }
  if (!v4) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v7 = v3[1];
  uint64_t v8 = 3;
  if (a2 > 3) {
    uint64_t v8 = a2;
  }
  uint64_t v9 = v8 - 3;
  while (1)
  {
    uint64_t v10 = **(unsigned __int8 ***)(v7 + 8 * result);
    int v11 = *v10;
    if (*v10)
    {
      if (!v10[1])
      {
        if (a2 == 1 && v11 == *a1) {
          return result;
        }
        goto LABEL_7;
      }
      uint64_t v12 = 2;
      while (v12 != 1024)
      {
        uint64_t v13 = v12 + 1;
        if (!v10[v12++])
        {
          if (v13 - 1 != a2) {
            goto LABEL_7;
          }
          goto LABEL_16;
        }
      }
    }
    if (a2) {
      goto LABEL_7;
    }
LABEL_16:
    if (!a2) {
      return result;
    }
    if (v11 == *a1 && v10[1] == a1[1])
    {
      if (a2 == 2) {
        return result;
      }
      if (v10[2] == a1[2]) {
        break;
      }
    }
LABEL_7:
    if (++result == v4) {
      return 0;
    }
  }
  uint64_t v15 = v10 + 3;
  unint64_t v16 = a2 - 3;
  int v17 = a1 + 3;
  uint64_t v18 = v9;
  while (v16)
  {
    if (!v18) {
      goto LABEL_32;
    }
    int v20 = *v15++;
    int v19 = v20;
    int v21 = *v17++;
    --v18;
    --v16;
    if (v19 != v21) {
      goto LABEL_7;
    }
  }
  return result;
}

unsigned __int8 **sub_25F620204(unsigned __int8 *a1, uint64_t a2, char a3)
{
  uint64_t v4 = *(void *)(v3 + 32);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v5 < 1)
  {
    while (1)
    {
LABEL_26:
      sub_25F642D90();
      __break(1u);
    }
  }
  uint64_t v6 = *(void *)(v4 + 32);
  if (a3) {
    return *(unsigned __int8 ***)v6;
  }
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = *(unsigned __int8 ***)(v6 + 8 * v7);
    uint64_t v9 = *v8;
    int v10 = **v8;
    if (!**v8)
    {
LABEL_4:
      if (!a2) {
        return v8;
      }
      goto LABEL_5;
    }
    if (!v9[1])
    {
      if (a2 == 1 && v10 == *a1) {
        return v8;
      }
      goto LABEL_5;
    }
    uint64_t v11 = 0;
    do
    {
      if (v11 == 1022) {
        goto LABEL_4;
      }
    }
    while (v9[v11++ + 2]);
    if (a2 - 1 == v11 && v10 == *a1 && v9[1] == a1[1])
    {
      if (a2 == 2) {
        return v8;
      }
      if (v9[2] == a1[2]) {
        break;
      }
    }
LABEL_5:
    if (++v7 == v5)
    {
      sub_25F642D20();
      swift_bridgeObjectRelease();
      sub_25F642B20();
      sub_25F642B50();
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
  }
  uint64_t v13 = v9 + 3;
  uint64_t v14 = a2 - 3;
  uint64_t v15 = a1 + 3;
  while (v14)
  {
    int v17 = *v13++;
    int v16 = v17;
    int v18 = *v15++;
    --v14;
    if (v16 != v18) {
      goto LABEL_5;
    }
  }
  return v8;
}

__n128 ComponentRuntime.init(allocatingFor:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[3];
  *(void *)&long long v14 = *a1;
  uint64_t v3 = v14;
  *((void *)&v14 + 1) = v4;
  v15.n128_u64[0] = v5;
  v15.n128_u64[1] = v6;
  uint64_t v7 = _s9Tightbeam16ComponentRuntimeV4size3forSiAC13ConfigurationV_tFZ_0((uint64_t *)&v14);
  uint64_t v8 = swift_slowAlloc();
  v13[0] = v3;
  v13[1] = v4;
  v13[2] = v5;
  v13[3] = v6;
  ComponentRuntime.init(for:into:)(v13, v8, (uint64_t)v7 + v8, (uint64_t *)&v14);
  long long v9 = v21;
  *(_OWORD *)(a2 + 96) = v20;
  *(_OWORD *)(a2 + 112) = v9;
  *(void *)(a2 + 128) = v22;
  long long v10 = v17;
  *(_OWORD *)(a2 + 32) = v16;
  *(_OWORD *)(a2 + 48) = v10;
  long long v11 = v19;
  *(_OWORD *)(a2 + 64) = v18;
  *(_OWORD *)(a2 + 80) = v11;
  __n128 result = v15;
  *(_OWORD *)a2 = v14;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t ComponentRuntime.init(for:into:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v9 = a1[2];
  uint64_t v10 = sub_25F61FC14(0, a2, a3, sub_25F623920, sub_25F6238A0);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  if (sub_25F623920(v10, v11, v13, v15) < 4)
  {
    sub_25F642D20();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    uint64_t v79 = v10;
    uint64_t v80 = v12;
    uint64_t v81 = v14;
LABEL_79:
    uint64_t v82 = v16;
    goto LABEL_81;
  }
  uint64_t v88 = sub_25F6239B4(v10, v12, v14);
  if (!v88) {
    goto LABEL_82;
  }
  if ((unint64_t)(v9 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  uint64_t v87 = a2;
  uint64_t v17 = sub_25F61FDE8(4 * v9, v10, v12, v14, v16, sub_25F623920, sub_25F6238A0);
  if (v9 < 0) {
    goto LABEL_82;
  }
  uint64_t v21 = v17;
  uint64_t v22 = v18;
  uint64_t v23 = v19;
  uint64_t v24 = v20;
  if (v9)
  {
    unint64_t v25 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= 0x2000000000000000) {
      unint64_t v25 = 0x2000000000000000;
    }
    if (v25 > 7)
    {
      unint64_t v27 = v25 + 1;
      uint64_t v28 = v27 & 7;
      if ((v27 & 7) == 0) {
        uint64_t v28 = 8;
      }
      unint64_t v26 = v27 - v28;
      size_t v29 = (_OWORD *)(v88 + 16);
      unint64_t v30 = v26;
      do
      {
        *(v29 - 1) = 0uLL;
        *size_t v29 = 0uLL;
        v29 += 2;
        v30 -= 8;
      }
      while (v30);
    }
    else
    {
      unint64_t v26 = 0;
    }
    unint64_t v31 = v26 - 0x2000000000000000;
    unint64_t v32 = v9 - v26;
    uint64_t v33 = (_DWORD *)(v88 + 4 * v26);
    while (v31)
    {
      *v33++ = 0;
      ++v31;
      if (!--v32) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_63;
  }
LABEL_17:
  if (sub_25F623920(v17, v18, v19, v20) < 1)
  {
    sub_25F642D20();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F623920(v21, v22, v23, v24);
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    goto LABEL_82;
  }
  uint64_t v85 = sub_25F6239B4(v21, v22, v23);
  if (!v85) {
    goto LABEL_82;
  }
  uint64_t v34 = v22;
  if (sub_25F623920(v21, v22, v23, v24))
  {
    uint64_t v34 = sub_25F6238A0(v21, 1, v23, v24);
    if (v22 < v34) {
      goto LABEL_83;
    }
  }
  if (v34 < v21)
  {
    sub_25F642D80();
    __break(1u);
    goto LABEL_77;
  }
  if (sub_25F623920(v34, v22, v23, v24) < 24)
  {
LABEL_77:
    sub_25F642D20();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    uint64_t v79 = v34;
    uint64_t v80 = v22;
    uint64_t v81 = v23;
    uint64_t v82 = v24;
LABEL_81:
    sub_25F623920(v79, v80, v81, v82);
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    goto LABEL_82;
  }
  uint64_t v35 = sub_25F6239B4(v34, v22, v23);
  if (!v35) {
    goto LABEL_82;
  }
  v36 = (void *)v35;
  if ((unsigned __int128)(v7 * (__int128)24) >> 64 != (24 * v7) >> 63)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  uint64_t v86 = a3;
  uint64_t v37 = sub_25F61FDE8(24 * v7, v34, v22, v23, v24, sub_25F623920, sub_25F6238A0);
  if (v7 < 0) {
    goto LABEL_82;
  }
  uint64_t v41 = v37;
  uint64_t v42 = v38;
  uint64_t v43 = v39;
  uint64_t v16 = v40;
  if (v7)
  {
    uint64_t v44 = 0x555555555555556;
    uint64_t v45 = v7;
    v46 = v36;
    while (v44)
    {
      void *v46 = 0;
      v46[1] = 0;
      v46[2] = 0;
      v46 += 3;
      --v44;
      if (!--v45) {
        goto LABEL_30;
      }
    }
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
LABEL_30:
  if (sub_25F623920(v37, v38, v39, v40) < 48) {
    goto LABEL_78;
  }
  uint64_t v47 = sub_25F6239B4(v41, v42, v43);
  if (!v47) {
    goto LABEL_82;
  }
  v48 = (_OWORD *)v47;
  if ((unsigned __int128)(v8 * (__int128)48) >> 64 != (48 * v8) >> 63)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  uint64_t v49 = sub_25F61FDE8(48 * v8, v41, v42, v43, v16, sub_25F623920, sub_25F6238A0);
  if (v8 < 0) {
    goto LABEL_82;
  }
  uint64_t v41 = v49;
  uint64_t v42 = v50;
  uint64_t v43 = v51;
  uint64_t v16 = v52;
  if (v8)
  {
    uint64_t v53 = 0x2AAAAAAAAAAAAABLL;
    uint64_t v54 = v8;
    v55 = v48;
    while (v53)
    {
      v55[1] = 0uLL;
      v55[2] = 0uLL;
      _OWORD *v55 = 0uLL;
      v55 += 3;
      --v53;
      if (!--v54) {
        goto LABEL_38;
      }
    }
    goto LABEL_64;
  }
LABEL_38:
  uint64_t v84 = v7;
  if (sub_25F623920(v49, v50, v51, v52) < 64)
  {
LABEL_78:
    sub_25F642D20();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    uint64_t v79 = v41;
    uint64_t v80 = v42;
    uint64_t v81 = v43;
    goto LABEL_79;
  }
  uint64_t v56 = sub_25F6239B4(v41, v42, v43);
  if (!v56) {
    goto LABEL_82;
  }
  if ((unint64_t)(v9 - 0x200000000000000) >> 58 != 63)
  {
LABEL_70:
    __break(1u);
    goto LABEL_82;
  }
  uint64_t v57 = v56;
  uint64_t v58 = sub_25F61FDE8(v9 << 6, v41, v42, v43, v16, sub_25F623920, sub_25F6238A0);
  uint64_t v62 = v58;
  uint64_t v63 = v59;
  uint64_t v64 = v60;
  if (v9)
  {
    uint64_t v65 = v9 - 1;
    if (v9 <= 1) {
      uint64_t v66 = 1;
    }
    else {
      uint64_t v66 = v9;
    }
    uint64_t v67 = v57 + 8;
    uint64_t v68 = 0x200000000000000;
    while (v68)
    {
      *(void *)(v67 - 8) = 0x200000000;
      *(_OWORD *)uint64_t v67 = 0uLL;
      *(_OWORD *)(v67 + 16) = 0uLL;
      *(_OWORD *)(v67 + 32) = 0uLL;
      *(void *)(v67 + 48) = 0;
      if (!v65) {
        goto LABEL_50;
      }
      --v68;
      --v65;
      v67 += 64;
      if (!--v66)
      {
LABEL_60:
        uint64_t result = sub_25F642DE0();
        __break(1u);
        goto LABEL_61;
      }
    }
    goto LABEL_65;
  }
LABEL_50:
  uint64_t v43 = v8;
  uint64_t v83 = v61;
  if (sub_25F623920(v58, v59, v60, v61) < 16)
  {
    sub_25F642D20();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    uint64_t v79 = v62;
    uint64_t v80 = v63;
    uint64_t v81 = v64;
    uint64_t v82 = v83;
    goto LABEL_81;
  }
  uint64_t v69 = sub_25F6239B4(v62, v63, v64);
  if (v69)
  {
    uint64_t v8 = v69;
    uint64_t result = sub_25F61FDE8(16 * v9, v62, v63, v64, v83, sub_25F623920, sub_25F6238A0);
    uint64_t v74 = v86;
    if (!v9)
    {
LABEL_61:
      *a4 = v87;
      a4[1] = v74;
      a4[2] = result;
      a4[3] = v71;
      a4[4] = v72;
      a4[5] = v73;
      a4[6] = v85;
      a4[7] = (uint64_t)v36;
      a4[8] = v84;
      a4[9] = (uint64_t)v48;
      a4[10] = v43;
      a4[11] = v8;
      a4[12] = v9;
      a4[13] = v88;
      a4[14] = v9;
      a4[15] = v57;
      a4[16] = v9;
      return result;
    }
    uint64_t v75 = v9 - 1;
    if (v9 <= 1) {
      uint64_t v76 = 1;
    }
    else {
      uint64_t v76 = v9;
    }
    uint64_t v77 = 0x800000000000000;
    v78 = (void *)v8;
    while (v77)
    {
      void *v78 = 0;
      v78[1] = 0;
      if (!v75) {
        goto LABEL_61;
      }
      --v77;
      --v75;
      v78 += 2;
      if (!--v76) {
        goto LABEL_60;
      }
    }
    goto LABEL_66;
  }
LABEL_82:
  sub_25F642D90();
  __break(1u);
LABEL_83:
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t ComponentRuntime.initializeComponent(at:from:cnode:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  v35[12] = *MEMORY[0x263EF8340];
  unint64_t v9 = a2[1];
  uint64_t v32 = *a2;
  uint64_t v11 = (uint64_t *)v5[2];
  uint64_t v10 = v5[3];
  uint64_t v13 = v5[4];
  uint64_t v12 = v5[5];
  if (sub_25F623920((uint64_t)v11, v10, v13, v12) < 232) {
    goto LABEL_23;
  }
  uint64_t v31 = a4;
  uint64_t v14 = sub_25F6239B4((uint64_t)v11, v10, v13);
  if (!v14) {
    goto LABEL_29;
  }
  uint64_t v15 = v14;
  uint64_t v16 = v10;
  if ((unint64_t)sub_25F623920((uint64_t)v11, v10, v13, v12) >= 0xE8)
  {
    uint64_t v16 = sub_25F6238A0((uint64_t)v11, 232, v13, v12);
    if (v10 < v16) {
      goto LABEL_26;
    }
  }
  if (v16 < (uint64_t)v11)
  {
LABEL_22:
    sub_25F642D80();
    __break(1u);
LABEL_23:
    v35[0] = 0;
    v35[1] = 0xE000000000000000;
    sub_25F642D20();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    uint64_t v33 = sub_25F623920((uint64_t)v11, v10, v13, v12);
LABEL_25:
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    goto LABEL_29;
  }
  v5[2] = v16;
  v5[3] = v10;
  v5[4] = v13;
  v5[5] = v12;
  if (sub_25F623920(v16, v10, v13, v12) < 40)
  {
    v35[0] = 0;
    v35[1] = 0xE000000000000000;
    sub_25F642D20();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642D40();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    uint64_t v33 = sub_25F623920(v16, v10, v13, v12);
    goto LABEL_25;
  }
  uint64_t v17 = sub_25F6239B4(v16, v10, v13);
  if (!v17) {
    goto LABEL_29;
  }
  uint64_t v11 = (uint64_t *)v17;
  unint64_t v18 = sub_25F623920(v16, v10, v13, v12);
  uint64_t v19 = v10;
  if (v18 >= 0x28)
  {
    uint64_t v19 = sub_25F6238A0(v16, 40, v13, v12);
    if (v10 < v19)
    {
LABEL_26:
      sub_25F642D80();
      __break(1u);
      goto LABEL_29;
    }
  }
  if (v19 < v16) {
    goto LABEL_22;
  }
  v5[2] = v19;
  v5[3] = v10;
  v5[4] = v13;
  v5[5] = v12;
  uint64_t inited = ComponentInitDataReader.Component.dataBuffer()();
  uint64_t v22 = v21;
  LODWORD(v35[0]) = 1;
  *(_OWORD *)((char *)v35 + 4) = 0u;
  memset((char *)&v35[2] + 4, 0, 21);
  memset(&v35[6], 0, 48);
  if (!tb_client_connection_create_with_endpoint_static(v11, v15, (unsigned int *)v35))
  {
    uint64_t v33 = v32;
    unint64_t v34 = v9;
    uint64_t v23 = (unsigned __int8 *)ComponentInitDataReader.Component.identifier()();
    sub_25F61FA0C(v23, v24, &v33);
    uint64_t v25 = v33;
    if (v33)
    {
      if (inited)
      {
        if (!a3) {
          goto LABEL_20;
        }
        uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 8))(a3, v31 - a3, inited, v22 - inited);
        if ((a1 & 0x8000000000000000) == 0 && v5[10] > a1)
        {
          if ((unsigned __int128)(a1 * (__int128)48) >> 64 == (48 * a1) >> 63)
          {
            uint64_t v27 = v26;
            uint64_t v28 = (uint64_t *)(v5[9] + 48 * a1);
            uint64_t v33 = v32;
            unint64_t v34 = v9;
            uint64_t result = ComponentInitDataReader.Component.identifier()();
            *uint64_t v28 = result;
            v28[1] = v30;
            v28[2] = v15;
            v28[3] = (uint64_t)v11;
            v28[4] = v25;
            v28[5] = v27;
            return result;
          }
          __break(1u);
LABEL_20:
          __break(1u);
        }
      }
    }
    else
    {
      uint64_t v33 = 0;
      unint64_t v34 = 0xE000000000000000;
      sub_25F642D20();
      swift_bridgeObjectRelease();
      uint64_t v33 = 0xD000000000000025;
      unint64_t v34 = 0x800000025F645DE0;
      ComponentInitDataReader.Component.identifier()();
      sub_25F642B20();
      sub_25F642B50();
      swift_bridgeObjectRelease();
      sub_25F642B50();
    }
  }
LABEL_29:
  uint64_t result = sub_25F642D90();
  __break(1u);
  return result;
}

uint64_t ComponentRuntime.initializeClient(componentIndex:handlerIndex:client:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (a1 < 0) {
    goto LABEL_47;
  }
  uint64_t v4 = v3;
  uint64_t v5 = a1;
  if (v3[10] <= a1) {
    goto LABEL_47;
  }
  if ((unsigned __int128)(a1 * (__int128)48) >> 64 != (48 * a1) >> 63) {
    goto LABEL_40;
  }
  uint64_t v6 = (unint64_t *)(v3[9] + 48 * a1);
  unint64_t v7 = v6[2];
  if (!v7)
  {
    sub_25F642D20();
    swift_bridgeObjectRelease();
    unint64_t v90 = 0xD000000000000023;
    unint64_t v91 = 0x800000025F645ED0;
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    goto LABEL_47;
  }
  uint64_t v8 = *a3;
  uint64_t v9 = a3[1];
  unint64_t v10 = *v6;
  unint64_t v11 = v6[1];
  unint64_t v12 = v6[4];
  unint64_t v13 = v6[5];
  unint64_t v14 = v6[3];
  unint64_t v90 = v10;
  unint64_t v91 = v11;
  unint64_t v92 = v7;
  unint64_t v93 = v14;
  unint64_t v87 = v12;
  unint64_t v94 = v12;
  unint64_t v95 = v13;
  if (!v8 || v9 - v8 <= 36) {
    goto LABEL_47;
  }
  uint64_t v15 = *(void *)(v8 + 29);
  if ((v15 & 0x8000000000000000) == 0)
  {
    uint64_t v17 = *(unsigned int *)(v8 + 17);
    uint64_t v21 = sub_25F61FC14(37, v8, v9, sub_25F623920, sub_25F6238A0);
    uint64_t v22 = *(void *)(v8 + 21);
    if ((v22 & 0x8000000000000000) == 0)
    {
      uint64_t v23 = sub_25F61FDE8(v22, v21, v18, v19, v20, sub_25F623920, sub_25F6238A0);
      sub_25F629EB4(v23, v24, v25, v26);
      uint64_t v85 = v17;
      if (!v15)
      {
        uint64_t v88 = 0;
        if (a2 < 0) {
          goto LABEL_47;
        }
        goto LABEL_29;
      }
      uint64_t v86 = v15;
      unint64_t v83 = v13;
      uint64_t v27 = v4;
      uint64_t v29 = v4[2];
      uint64_t v28 = v4[3];
      uint64_t v30 = v4[4];
      uint64_t v84 = v27;
      uint64_t v31 = v27[5];
      if (sub_25F623920(v29, v28, v30, v31) < 8)
      {
        sub_25F642D20();
        sub_25F642B50();
        sub_25F642D40();
        sub_25F642B50();
        swift_bridgeObjectRelease();
        sub_25F642B50();
        sub_25F642D40();
        sub_25F642B50();
        swift_bridgeObjectRelease();
        sub_25F642B50();
        sub_25F623B40();
        sub_25F642CF0();
        sub_25F642B50();
        swift_bridgeObjectRelease();
        sub_25F642B50();
        sub_25F642CF0();
        sub_25F642B50();
        swift_bridgeObjectRelease();
        sub_25F642B50();
        v89[0] = sub_25F623920(v29, v28, v30, v31);
        sub_25F642CF0();
        sub_25F642B50();
        swift_bridgeObjectRelease();
        sub_25F642B50();
        goto LABEL_47;
      }
      uint64_t v88 = sub_25F6239B4(v29, v28, v30);
      if (!v88) {
        goto LABEL_47;
      }
      if ((unint64_t)(v86 - 0x1000000000000000) >> 61 != 7) {
        goto LABEL_43;
      }
      uint64_t v81 = a2;
      uint64_t v82 = v5;
      v84[2] = sub_25F61FDE8(8 * v86, v29, v28, v30, v31, sub_25F623920, sub_25F6238A0);
      v84[3] = v32;
      v84[4] = v33;
      v84[5] = v34;
      if ((*(void *)(v8 + 29) & 0x8000000000000000) == 0)
      {
        uint64_t v38 = sub_25F61FC14(37, v8, v9, sub_25F623920, sub_25F6238A0);
        uint64_t v39 = *(void *)(v8 + 21);
        if ((v39 & 0x8000000000000000) == 0)
        {
          uint64_t v40 = v35;
          uint64_t v41 = v36;
          uint64_t v42 = v37;
          uint64_t v43 = 0;
          while (1)
          {
            uint64_t v44 = sub_25F61FDE8(v39, v38, v40, v41, v42, sub_25F623920, sub_25F6238A0);
            sub_25F629EB4(v44, v45, v46, v47);
            ComponentInitDataReader.TypeBuffer.subscript.getter(v43, v89);
            uint64_t v48 = sub_25F61FC14(16, v89[0], v89[1], sub_25F623920, sub_25F6238A0);
            uint64_t v50 = v49;
            uint64_t v52 = v51;
            uint64_t v54 = v53;
            uint64_t v55 = sub_25F627F6C();
            uint64_t v56 = sub_25F62372C(v55, v48, v50, v52, v54);
            uint64_t v60 = (unsigned __int8 *)sub_25F629EB4(v56, v57, v58, v59);
            if (v60) {
              unint64_t v62 = v61 - (void)v60;
            }
            else {
              unint64_t v62 = 0;
            }
            uint64_t v63 = sub_25F620074(v60, v62);
            if (v64) {
              goto LABEL_44;
            }
            uint64_t v65 = *(uint64_t **)(v87 + 40);
            if (!v65)
            {
              sub_25F642D20();
              sub_25F642B50();
              sub_25F642B20();
              sub_25F642B50();
              swift_bridgeObjectRelease();
              sub_25F642B50();
              goto LABEL_47;
            }
            if (v63 < 0 || v63 >= *v65) {
              goto LABEL_47;
            }
            if (v43 == 0x1000000000000000) {
              break;
            }
            *(void *)(v88 + 8 * v43) = *(void *)(v65[1] + 8 * v63);
            if (v86 - 1 == v43) {
              goto LABEL_28;
            }
            if ((*(void *)(v8 + 29) & 0x8000000000000000) == 0)
            {
              uint64_t v38 = sub_25F61FC14(37, v8, v9, sub_25F623920, sub_25F6238A0);
              uint64_t v40 = v66;
              uint64_t v41 = v67;
              uint64_t v42 = v68;
              uint64_t v39 = *(void *)(v8 + 21);
              ++v43;
              if ((v39 & 0x8000000000000000) == 0) {
                continue;
              }
            }
            goto LABEL_27;
          }
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          sub_25F642D20();
          swift_bridgeObjectRelease();
          sub_25F642B20();
          sub_25F642B50();
          swift_bridgeObjectRelease();
          sub_25F642B50();
          sub_25F642B20();
          sub_25F642B50();
          swift_bridgeObjectRelease();
          while (1)
          {
LABEL_47:
            sub_25F642D90();
            __break(1u);
          }
        }
      }
    }
  }
LABEL_27:
  sub_25F642D80();
  __break(1u);
LABEL_28:
  a2 = v81;
  uint64_t v5 = v82;
  unint64_t v13 = v83;
  uint64_t v4 = v84;
  uint64_t v15 = v86;
  if (v81 < 0) {
    goto LABEL_47;
  }
LABEL_29:
  if (v4[14] <= a2) {
    goto LABEL_47;
  }
  if ((unint64_t)(a2 - 0x2000000000000000) >> 62 != 3) {
    goto LABEL_41;
  }
  uint64_t v69 = v4[13];
  uint64_t inited = (unsigned __int8 *)ComponentInitDataReader.Client.propertyName()();
  int v73 = v72 & 1;
  if (v73)
  {
    uint64_t inited = 0;
    uint64_t v71 = 0;
  }
  uint64_t v74 = sub_25F620204(inited, v71, v73);
  if (v4[16] <= a2) {
    goto LABEL_47;
  }
  if ((unint64_t)(a2 - 0x200000000000000) >> 58 != 63) {
    goto LABEL_42;
  }
  uint64_t v75 = v74;
  uint64_t v76 = (void *)(v4[15] + (a2 << 6));
  uint64_t result = ((uint64_t (*)(unint64_t))v74[1])(v13);
  *uint64_t v76 = v85;
  v76[1] = 0;
  v76[2] = v5;
  v76[3] = a2;
  v76[4] = result;
  v76[5] = v88;
  v76[6] = v15;
  v76[7] = v75;
  if (v4[12] <= a2) {
    goto LABEL_47;
  }
  uint64_t v78 = v4[11];
  uint64_t v79 = (_DWORD *)(v69 + 4 * a2);
  *uint64_t v79 = 0;
  uint64_t v80 = (void *)(v78 + 16 * a2);
  *uint64_t v80 = v79;
  v80[1] = v76;
  return result;
}

uint64_t ComponentRuntime.handleMessage(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  TightbeamBadge.init(_:)(a3, (uint64_t)v9);
  v6[0] = v9[0];
  v6[1] = v9[1];
  v6[2] = v9[2];
  int v7 = v10;
  __int16 v8 = v11;
  return ComponentRuntime.handleMessage(_:_:_:)(a1, a2, (uint64_t)v6);
}

{
  long long *v3;
  char v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  uint64_t v10;
  uint64_t result;
  __int16 v12;
  char v13;
  __int16 v14;
  __int16 v15;
  uint64_t v16;

  if (*(unsigned char *)(a3 + 1) == 1)
  {
    uint64_t v4 = *(unsigned char *)(a3 + 2);
    uint64_t v5 = *(_WORD *)(a3 + 4);
    uint64_t v6 = *(_WORD *)(a3 + 6);
    int v7 = *(_WORD *)(a3 + 8);
    if (*(unsigned char *)a3)
    {
      if (*(unsigned char *)a3 == 1)
      {
        unint64_t v12 = 257;
        unint64_t v13 = v4;
        unint64_t v14 = v5;
        uint64_t v15 = v6;
        LOWORD(v16) = v7;
        sub_25F62297C((char *)&v12, v3);
      }
      else
      {
        unint64_t v12 = 258;
        unint64_t v13 = v4;
        unint64_t v14 = v5;
        uint64_t v15 = v6;
        LOWORD(v16) = v7;
        sub_25F622F94((char *)&v12, v3, (void (*)(uint64_t, void))sub_25F623E38);
      }
      return 0;
    }
    else
    {
      unint64_t v12 = 256;
      unint64_t v13 = v4;
      unint64_t v14 = v5;
      uint64_t v15 = v6;
      LOWORD(v16) = v7;
      sub_25F622C98((char *)&v12, v3);
      unint64_t v12 = 256;
      unint64_t v13 = v4;
      unint64_t v14 = v5;
      uint64_t v15 = v6;
      LOWORD(v16) = v7;
      int v10 = sub_25F623284((char *)&v12, v3, a1, a2);
      unint64_t v12 = 256;
      unint64_t v13 = v4;
      unint64_t v14 = v5;
      uint64_t v15 = v6;
      LOWORD(v16) = v7;
      sub_25F622F94((char *)&v12, v3, (void (*)(uint64_t, void))sub_25F623F84);
    }
    return v10;
  }
  else
  {
    sub_25F642D20();
    sub_25F642B50();
    sub_25F642D70();
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

void sub_25F62297C(char *a1, long long *a2)
{
  char v3 = *a1;
  char v4 = a1[1];
  char v5 = a1[2];
  __int16 v6 = *((_WORD *)a1 + 2);
  __int16 v7 = *((_WORD *)a1 + 3);
  __int16 v8 = *((_WORD *)a1 + 4);
  long long v9 = a2[3];
  long long v27 = a2[2];
  long long v28 = v9;
  long long v10 = a2[1];
  long long v25 = *a2;
  long long v26 = v10;
  uint64_t v11 = *((void *)a2 + 8);
  uint64_t v12 = *((void *)a2 + 9);
  uint64_t v13 = *((void *)a2 + 10);
  long long v32 = *(long long *)((char *)a2 + 88);
  long long v33 = *(long long *)((char *)a2 + 104);
  long long v34 = *(long long *)((char *)a2 + 120);
  uint64_t v29 = v11;
  uint64_t v30 = v12;
  uint64_t v31 = v13;
  LOBYTE(v23) = v3;
  BYTE1(v23) = v4;
  BYTE2(v23) = v5;
  WORD2(v23) = v6;
  HIWORD(v23) = v7;
  __int16 v24 = v8;
  uint64_t v14 = sub_25F623598((uint64_t)&v23);
  if (v15 < 0 || v15 >= v13) {
    goto LABEL_24;
  }
  if ((unsigned __int128)(v15 * (__int128)48) >> 64 != (48 * v15) >> 63)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v16 = v12 + 48 * v15;
  if (!*(void *)(v16 + 16))
  {
    *(void *)&long long v25 = 0;
    *((void *)&v25 + 1) = 0xE000000000000000;
    uint64_t v22 = v15;
    sub_25F642D20();
    sub_25F642B50();
    uint64_t v23 = v22;
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    LOBYTE(v23) = v3;
    BYTE1(v23) = v4;
    BYTE2(v23) = v5;
    WORD2(v23) = v6;
    HIWORD(v23) = v7;
    __int16 v24 = v8;
    sub_25F642D70();
LABEL_24:
    sub_25F642D90();
    __break(1u);
    return;
  }
  if (v14 < 0 || v14 >= *((void *)a2 + 12)) {
    goto LABEL_24;
  }
  if ((unint64_t)(v14 - 0x800000000000000) >> 60 != 15) {
    goto LABEL_17;
  }
  uint64_t v17 = *((void *)a2 + 11) + 16 * v14;
  if (!*(void *)v17)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v18 = *(void *)(v16 + 40);
  os_unfair_lock_lock(*(os_unfair_lock_t *)v17);
  uint64_t v19 = *(void *)(v17 + 8);
  if ((unint64_t)*(unsigned __int8 *)(v19 + 4) << 32 == 0x200000000)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_24;
  }
  if (!*(void *)(v19 + 32))
  {
    uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)(v19 + 56) + 8))(v18);
    if ((unint64_t)*(unsigned __int8 *)(v19 + 4) << 32 != 0x200000000)
    {
      *(void *)(v19 + 32) = v20;
      goto LABEL_13;
    }
    goto LABEL_20;
  }
LABEL_13:
  uint64_t v21 = *(os_unfair_lock_s **)v17;
  os_unfair_lock_unlock(v21);
}

void sub_25F622C98(char *a1, long long *a2)
{
  char v3 = *a1;
  char v4 = a1[1];
  char v5 = a1[2];
  __int16 v6 = *((_WORD *)a1 + 2);
  __int16 v7 = *((_WORD *)a1 + 3);
  __int16 v8 = *((_WORD *)a1 + 4);
  long long v9 = a2[3];
  long long v27 = a2[2];
  long long v28 = v9;
  long long v10 = a2[1];
  long long v25 = *a2;
  long long v26 = v10;
  uint64_t v11 = *((void *)a2 + 8);
  uint64_t v12 = *((void *)a2 + 9);
  uint64_t v13 = *((void *)a2 + 10);
  long long v32 = *(long long *)((char *)a2 + 88);
  long long v33 = *(long long *)((char *)a2 + 104);
  long long v34 = *(long long *)((char *)a2 + 120);
  uint64_t v29 = v11;
  uint64_t v30 = v12;
  uint64_t v31 = v13;
  LOBYTE(v23) = v3;
  BYTE1(v23) = v4;
  BYTE2(v23) = v5;
  WORD2(v23) = v6;
  HIWORD(v23) = v7;
  __int16 v24 = v8;
  uint64_t v14 = sub_25F623598((uint64_t)&v23);
  if (v15 < 0 || v15 >= v13) {
    goto LABEL_22;
  }
  if ((unsigned __int128)(v15 * (__int128)48) >> 64 != (48 * v15) >> 63)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (!*(void *)(v12 + 48 * v15 + 16))
  {
    *(void *)&long long v25 = 0;
    *((void *)&v25 + 1) = 0xE000000000000000;
    uint64_t v22 = v15;
    sub_25F642D20();
    sub_25F642B50();
    uint64_t v23 = v22;
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    LOBYTE(v23) = v3;
    BYTE1(v23) = v4;
    BYTE2(v23) = v5;
    WORD2(v23) = v6;
    HIWORD(v23) = v7;
    __int16 v24 = v8;
    sub_25F642D70();
LABEL_22:
    sub_25F642D90();
    __break(1u);
    return;
  }
  if (v14 < 0 || v14 >= *((void *)a2 + 12)) {
    goto LABEL_22;
  }
  if ((unint64_t)(v14 - 0x800000000000000) >> 60 != 15) {
    goto LABEL_15;
  }
  uint64_t v16 = *((void *)a2 + 11) + 16 * v14;
  if (!*(void *)v16)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  os_unfair_lock_lock(*(os_unfair_lock_t *)v16);
  uint64_t v17 = *(void *)(v16 + 8);
  if ((unint64_t)*(unsigned __int8 *)(v17 + 4) << 32 == 0x200000000)
  {
LABEL_18:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v18 = *(void *)(v17 + 8);
  BOOL v19 = __CFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  *(void *)(v17 + 8) = v20;
  uint64_t v21 = *(os_unfair_lock_s **)v16;
  os_unfair_lock_unlock(v21);
}

void sub_25F622F94(char *a1, long long *a2, void (*a3)(uint64_t, void))
{
  char v5 = *a1;
  char v6 = a1[1];
  char v7 = a1[2];
  __int16 v8 = *((_WORD *)a1 + 2);
  __int16 v9 = *((_WORD *)a1 + 3);
  __int16 v10 = *((_WORD *)a1 + 4);
  long long v11 = a2[3];
  long long v28 = a2[2];
  long long v29 = v11;
  long long v12 = a2[1];
  long long v26 = *a2;
  long long v27 = v12;
  uint64_t v13 = *((void *)a2 + 8);
  uint64_t v14 = *((void *)a2 + 9);
  uint64_t v15 = *((void *)a2 + 10);
  long long v33 = *(long long *)((char *)a2 + 88);
  long long v34 = *(long long *)((char *)a2 + 104);
  long long v35 = *(long long *)((char *)a2 + 120);
  uint64_t v30 = v13;
  uint64_t v31 = v14;
  uint64_t v32 = v15;
  char v23 = v5;
  LOBYTE(v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5;
  BYTE1(v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v6;
  BYTE2(v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v7;
  WORD2(v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v8;
  HIWORD(v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v9;
  __int16 v25 = v10;
  uint64_t v16 = sub_25F623598((uint64_t)&v24);
  if (v17 < 0 || v17 >= v15) {
    goto LABEL_18;
  }
  if ((unsigned __int128)(v17 * (__int128)48) >> 64 != (48 * v17) >> 63)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v18 = v14 + 48 * v17;
  if (!*(void *)(v18 + 16))
  {
    *(void *)&long long v26 = 0;
    *((void *)&v26 + 1) = 0xE000000000000000;
    uint64_t v22 = v17;
    sub_25F642D20();
    sub_25F642B50();
    uint64_t v24 = v22;
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    LOBYTE(v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v23;
    BYTE1(v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v6;
    BYTE2(v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v7;
    WORD2(v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v8;
    HIWORD(v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v9;
    __int16 v25 = v10;
    sub_25F642D70();
LABEL_18:
    sub_25F642D90();
    __break(1u);
    return;
  }
  if (v16 < 0 || v16 >= *((void *)a2 + 12)) {
    goto LABEL_18;
  }
  if ((unint64_t)(v16 - 0x800000000000000) >> 60 != 15) {
    goto LABEL_13;
  }
  uint64_t v19 = *((void *)a2 + 11) + 16 * v16;
  if (!*(void *)v19)
  {
LABEL_14:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v20 = *(void *)(v18 + 40);
  os_unfair_lock_lock(*(os_unfair_lock_t *)v19);
  a3(v20, *(void *)(v19 + 8));
  uint64_t v21 = *(os_unfair_lock_s **)v19;
  os_unfair_lock_unlock(v21);
}

uint64_t sub_25F623284(char *a1, long long *a2, uint64_t a3, uint64_t a4)
{
  char v7 = *a1;
  char v8 = a1[1];
  char v9 = a1[2];
  __int16 v10 = *((_WORD *)a1 + 2);
  __int16 v11 = *((_WORD *)a1 + 3);
  __int16 v12 = *((_WORD *)a1 + 4);
  long long v13 = a2[3];
  long long v34 = a2[2];
  long long v35 = v13;
  long long v14 = a2[1];
  long long v32 = *a2;
  long long v33 = v14;
  uint64_t v15 = *((void *)a2 + 8);
  uint64_t v16 = *((void *)a2 + 9);
  uint64_t v17 = *((void *)a2 + 10);
  long long v39 = *(long long *)((char *)a2 + 88);
  long long v40 = *(long long *)((char *)a2 + 104);
  long long v41 = *(long long *)((char *)a2 + 120);
  uint64_t v36 = v15;
  uint64_t v37 = v16;
  uint64_t v38 = v17;
  char v28 = v8;
  char v29 = v7;
  LOBYTE(v30) = v7;
  BYTE1(v30) = v8;
  BYTE2(v30) = v9;
  WORD2(v30) = v10;
  HIWORD(v30) = v11;
  __int16 v31 = v12;
  uint64_t v18 = sub_25F623598((uint64_t)&v30);
  if (v19 < 0 || v19 >= v17) {
    goto LABEL_20;
  }
  if ((unsigned __int128)(v19 * (__int128)48) >> 64 != (48 * v19) >> 63)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v20 = v16 + 48 * v19;
  if (!*(void *)(v20 + 16))
  {
    *(void *)&long long v32 = 0;
    *((void *)&v32 + 1) = 0xE000000000000000;
    uint64_t v27 = v19;
    sub_25F642D20();
    sub_25F642B50();
    uint64_t v30 = v27;
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    LOBYTE(v30) = v29;
    BYTE1(v30) = v28;
    BYTE2(v30) = v9;
    WORD2(v30) = v10;
    HIWORD(v30) = v11;
    __int16 v31 = v12;
    sub_25F642D70();
LABEL_20:
    uint64_t result = sub_25F642D90();
    __break(1u);
    return result;
  }
  if (v18 < 0 || v18 >= *((void *)a2 + 12)) {
    goto LABEL_20;
  }
  if ((unint64_t)(v18 - 0x800000000000000) >> 60 != 15) {
    goto LABEL_14;
  }
  uint64_t v21 = (void *)(*((void *)a2 + 11) + 16 * v18);
  if (!*v21)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v22 = v21[1];
  if ((unint64_t)*(unsigned __int8 *)(v22 + 4) << 32 == 0x200000000)
  {
LABEL_16:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v23 = *(void *)(v20 + 40);
  uint64_t v24 = *(void *)(v22 + 32);
  __int16 v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 + 56) + 32);
  return v25(a3, a4, v23, v24);
}

uint64_t sub_25F623598(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + 96);
  if (v2 < 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  int v3 = *(unsigned __int16 *)(a1 + 4);
  int v4 = *(unsigned __int16 *)(a1 + 6);
  if (v2)
  {
    uint64_t result = 0;
    char v6 = (uint64_t **)(*(void *)(v1 + 88) + 8);
    while (result != 0x800000000000000)
    {
      if (*(v6 - 1))
      {
        uint64_t v7 = **v6;
        if ((v7 & 0xFF00000000) == 0x200000000) {
          goto LABEL_16;
        }
        if (v3 == (unsigned __int16)v7 && v4 == WORD1(v7)) {
          return result;
        }
      }
      ++result;
      v6 += 2;
      if (v2 == result) {
        goto LABEL_17;
      }
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_17:
  sub_25F642D20();
  sub_25F642B50();
  sub_25F642D70();
  uint64_t result = sub_25F642D90();
  __break(1u);
  return result;
}

uint64_t sub_25F62372C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = sub_25F623920(a2, a3, a4, a5);
    if (!a1 || v10 < 0 || (uint64_t v11 = a3, v10 >= a1)) {
      uint64_t v11 = sub_25F6238A0(a2, a1, a4, a5);
    }
    if (v11 < a2)
    {
      sub_25F642D80();
      __break(1u);
    }
    else if (v11 <= a3)
    {
      return a2;
    }
  }
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t sub_25F6238A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4 = __OFADD__(a1, a2);
  uint64_t result = a1 + a2;
  if (v4) {
    goto LABEL_8;
  }
  if (!a3)
  {
    if (!result) {
      return result;
    }
    goto LABEL_7;
  }
  if (result < 0 || a4 - a3 < result)
  {
LABEL_7:
    uint64_t result = sub_25F642D80();
    __break(1u);
LABEL_8:
    __break(1u);
  }
  return result;
}

uint64_t sub_25F623920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3) {
    uint64_t v4 = a4 - a3;
  }
  else {
    uint64_t v4 = 0;
  }
  if ((a1 & 0x8000000000000000) == 0 && v4 >= a1)
  {
    if (a3)
    {
      if ((a2 & 0x8000000000000000) == 0 && a4 - a3 >= a2) {
        return a2 - a1;
      }
    }
    else if (!a2)
    {
      return a2 - a1;
    }
  }
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t sub_25F6239B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    uint64_t result = a3 + a1;
  }
  else {
    uint64_t result = 0;
  }
  uint64_t v5 = a2 - a1;
  if (v5 < 0 || v5 && !result)
  {
    uint64_t result = sub_25F642DE0();
    __break(1u);
  }
  return result;
}

uint64_t *_s9Tightbeam16ComponentRuntimeV4size3forSiAC13ConfigurationV_tFZ_0(uint64_t *result)
{
  uint64_t v1 = 296 * *result;
  if ((unsigned __int128)(*result * (__int128)296) >> 64 != v1 >> 63)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v2 = result[1];
  uint64_t v3 = (unsigned __int128)(v2 * (__int128)320) >> 64;
  uint64_t v4 = 320 * v2;
  if (v3 != v4 >> 63)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v5 = v1 | 5;
  BOOL v6 = __OFADD__(v5, v4);
  uint64_t v7 = v5 + v4;
  if (v6)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v8 = result[2];
  BOOL v6 = __OFADD__(v7, 16 * v8);
  uint64_t v9 = v7 + 16 * v8;
  if (v6)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  BOOL v6 = __OFADD__(v9, 4 * v8);
  uint64_t v10 = v9 + 4 * v8;
  if (v6)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((unint64_t)(v8 - 0x200000000000000) >> 58 != 63)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  BOOL v6 = __OFADD__(v10, v8 << 6);
  uint64_t v11 = v10 + (v8 << 6);
  if (v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v12 = result[3];
  if ((unint64_t)(v12 - 0x1000000000000000) >> 61 != 7)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t result = (uint64_t *)(v11 + 8 * v12);
  if (__OFADD__(v11, 8 * v12)) {
LABEL_19:
  }
    __break(1u);
  return result;
}

unint64_t sub_25F623B40()
{
  unint64_t result = qword_26A7AF7F8;
  if (!qword_26A7AF7F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF7F8);
  }
  return result;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ComponentRuntime(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 136)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 48)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 136) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 136) = 0;
    }
    if (a2) {
      *(void *)(result + 48) = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentRuntime()
{
  return &type metadata for ComponentRuntime;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ComponentRuntime.Configuration(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime.Configuration(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ComponentRuntime.Configuration()
{
  return &type metadata for ComponentRuntime.Configuration;
}

uint64_t getEnumTagSinglePayload for ComponentRuntime.ComponentRegistration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 16)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime.ComponentRegistration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 48) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentRuntime.ComponentRegistration()
{
  return &type metadata for ComponentRuntime.ComponentRegistration;
}

uint64_t getEnumTagSinglePayload for ComponentRuntime.EndpointRegistration(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 8)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime.EndpointRegistration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentRuntime.EndpointRegistration()
{
  return &type metadata for ComponentRuntime.EndpointRegistration;
}

ValueMetadata *type metadata accessor for ComponentRuntime.Metadata()
{
  return &type metadata for ComponentRuntime.Metadata;
}

ValueMetadata *type metadata accessor for BumpBuffer()
{
  return &type metadata for BumpBuffer;
}

uint64_t sub_25F623E38(uint64_t result, uint64_t a2)
{
  if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 == 0x200000000)
  {
    __break(1u);
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)(a2 + 8))
  {
    *(unsigned char *)(a2 + 4) = 1;
    return result;
  }
  *(unsigned char *)(a2 + 4) = 0;
  uint64_t v3 = *(void *)(a2 + 32);
  if (v3)
  {
    uint64_t v4 = result;
    __n128 result = (*(uint64_t (**)(uint64_t, void))(*(void *)(a2 + 56) + 24))(result, *(void *)(a2 + 32));
    if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 != 0x200000000)
    {
      __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 + 56) + 16))(v4, v3);
      if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 != 0x200000000)
      {
        *(void *)(a2 + 32) = 0;
        return result;
      }
LABEL_11:
      __break(1u);
      return result;
    }
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_25F623EF0(uint64_t result, uint64_t a2)
{
  if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 == 0x200000000)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v3 = *(void *)(a2 + 32);
  if (!v3) {
    return result;
  }
  uint64_t v4 = result;
  __n128 result = (*(uint64_t (**)(uint64_t, void))(*(void *)(a2 + 56) + 24))(result, *(void *)(a2 + 32));
  if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 == 0x200000000) {
    goto LABEL_8;
  }
  __n128 result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 + 56) + 16))(v4, v3);
  if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 == 0x200000000)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  *(void *)(a2 + 32) = 0;
  return result;
}

uint64_t sub_25F623F84(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)a2;
  if ((*(void *)a2 & 0xFF00000000) == 0x200000000) {
    goto LABEL_8;
  }
  uint64_t v3 = *(void *)(a2 + 8);
  BOOL v4 = v3 != 0;
  uint64_t v5 = v3 - 1;
  if (!v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  *(void *)(a2 + 8) = v5;
  if ((v2 & 0x100000000) != 0 && !v5)
  {
    *(unsigned char *)(a2 + 4) = 0;
    return sub_25F623EF0(result, a2);
  }
  return result;
}

void sub_25F623FC4()
{
  qword_26A7AF800 = MEMORY[0x263F8EE78];
}

uint64_t sub_25F623FD8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF810);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_25F643CA0;
  sub_25F642D20();
  swift_bridgeObjectRelease();
  sub_25F642B50();
  *(void *)(v0 + 56) = MEMORY[0x263F8D310];
  *(void *)(v0 + 32) = 0xD00000000000001ALL;
  *(void *)(v0 + 40) = 0x800000025F646340;
  sub_25F642E80();
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F6240BC(uint64_t a1)
{
  return sub_25F6240E0(a1);
}

uint64_t sub_25F6240E0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v25 = sub_25F642A40();
  uint64_t v4 = *(void *)(v25 - 8);
  MEMORY[0x270FA5388](v25);
  long long v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_25F6428C0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  long long v13 = (char *)&v24 - v12;
  long long v14 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v24 = a1;
  v14((char *)&v24 - v12, a1, v7);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v13, v7);
  if (result == *MEMORY[0x263F14210])
  {
    (*(void (**)(char *, uint64_t))(v8 + 96))(v13, v7);
    uint64_t v16 = v13;
    uint64_t v17 = v25;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v16, v25);
    uint64_t v19 = v2[5];
    uint64_t v18 = v2[6];
    __swift_project_boxed_opaque_existential_1(v2 + 2, v19);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v6, v19, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v17);
  }
  else if (result != *MEMORY[0x263F14228])
  {
    if (result == *MEMORY[0x263F14200])
    {
      swift_retain();
      sub_25F642900();
      swift_release();
      uint64_t v20 = v2[5];
      uint64_t v21 = v2[6];
      __swift_project_boxed_opaque_existential_1(v2 + 2, v20);
      return (*(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 8))(v2, v20, v21);
    }
    else
    {
      v14(v11, v24, v7);
      sub_25F642B00();
      uint64_t v26 = 0;
      unint64_t v27 = 0xE000000000000000;
      sub_25F642D20();
      uint64_t v23 = v2[8];
      unint64_t v22 = v2[9];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v26 = v23;
      unint64_t v27 = v22;
      sub_25F642B50();
      sub_25F642B50();
      swift_bridgeObjectRelease();
      sub_25F623FD8();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    }
  }
  return result;
}

uint64_t sub_25F624474(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  if (a2 >> 60 == 15) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = a1;
  }
  if (a2 >> 60 == 15) {
    unint64_t v10 = 0xC000000000000000;
  }
  else {
    unint64_t v10 = a2;
  }
  uint64_t v11 = a6[5];
  uint64_t v12 = a6[6];
  __swift_project_boxed_opaque_existential_1(a6 + 2, v11);
  long long v13 = *(void (**)(void *, uint64_t, unint64_t, uint64_t, uint64_t))(v12 + 24);
  sub_25F6254E4(a1, a2);
  v13(a6, v9, v10, v11, v12);
  swift_retain();
  sub_25F642900();
  swift_release();
  return sub_25F625550(v9, v10);
}

uint64_t sub_25F62456C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF808);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F642A40();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F624838(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1) {
    return sub_25F6248A0((uint64_t)v4);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_25F642D20();
  sub_25F642B50();
  swift_bridgeObjectRetain();
  sub_25F642B50();
  swift_bridgeObjectRelease();
  sub_25F642B50();
  sub_25F642D70();
  sub_25F623FD8();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25F624788()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 80, 7);
}

uint64_t type metadata accessor for UnixProtocolConnection()
{
  return self;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_25F624838(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF808);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F6248A0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF808);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F624900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = a1;
    unint64_t v7 = *v4;
    if (!(*v4 >> 62))
    {
      if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v23 = sub_25F642DA0();
  swift_bridgeObjectRelease();
  if (v23 < v5) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v9 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v8 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_25F642DA0();
    swift_bridgeObjectRelease();
    uint64_t v11 = v10 + v8;
    if (!__OFADD__(v10, v8)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_25F642DA0();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  unint64_t v7 = *v4;
  if (*v4 >> 62) {
    goto LABEL_36;
  }
  uint64_t v10 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v11 = v10 + v8;
  if (__OFADD__(v10, v8)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v7 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v4 = v7;
  uint64_t v10 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v11 <= *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v10 = 1;
  }
  if (v7 >> 62) {
    goto LABEL_39;
  }
  uint64_t v14 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v14 <= v11) {
    uint64_t v14 = v11;
  }
  swift_bridgeObjectRetain();
  unint64_t v7 = MEMORY[0x2611F9BA0](v10, v14, 1, v7);
  swift_bridgeObjectRelease();
  unint64_t *v4 = v7;
  uint64_t v13 = v7 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v15 = (void *)(v13 + 32 + 8 * v6);
  sub_25F642A30();
  swift_arrayDestroy();
  if (v8)
  {
    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v24 = sub_25F642DA0();
      swift_bridgeObjectRelease();
      uint64_t v17 = v24 - v5;
      if (!__OFSUB__(v24, v5))
      {
LABEL_21:
        if (v17 < 0)
        {
LABEL_46:
          uint64_t result = sub_25F642DE0();
          __break(1u);
          return result;
        }
        uint64_t v18 = (char *)(v15 + 1);
        uint64_t v19 = (char *)(v13 + 32 + 8 * v5);
        if (v15 + 1 != (void *)v19 || v18 >= &v19[8 * v17]) {
          memmove(v18, v19, 8 * v17);
        }
        if (!(v7 >> 62))
        {
          uint64_t v20 = *(void *)(v13 + 16);
          uint64_t v21 = v20 + v8;
          if (!__OFADD__(v20, v8))
          {
LABEL_27:
            *(void *)(v13 + 16) = v21;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v25 = sub_25F642DA0();
        swift_bridgeObjectRelease();
        uint64_t v21 = v25 + v8;
        if (!__OFADD__(v25, v8)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v16 = *(void *)(v13 + 16);
      uint64_t v17 = v16 - v5;
      if (!__OFSUB__(v16, v5)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  void *v15 = v3;
  return sub_25F642BE0();
}

uint64_t sub_25F624BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = sub_25F642C50();
  uint64_t v47 = *(void *)(v14 - 8);
  uint64_t v48 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v46 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = sub_25F642C40();
  MEMORY[0x270FA5388](v44);
  uint64_t v45 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_25F642A70();
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v43 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_25F6427E0();
  uint64_t v19 = *(void *)(v42 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v42);
  unint64_t v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (uint64_t *)((char *)&v37 - v23);
  v50[3] = a6;
  v50[4] = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v50);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(boxed_opaque_existential_1, a3, a6);
  sub_25F625294((uint64_t)v50, (uint64_t)(a5 + 2));
  a5[8] = a1;
  a5[9] = a2;
  if (a4)
  {
    a5[7] = a4;
    uint64_t v26 = v42;
  }
  else
  {
    uint64_t v38 = a1;
    long long v39 = v22;
    uint64_t v41 = 0;
    sub_25F642970();
    uint64_t v40 = a2;
    swift_bridgeObjectRetain();
    sub_25F642960();
    if (qword_26A7AF720 != -1) {
      swift_once();
    }
    sub_25F6429E0();
    swift_allocObject();
    swift_retain();
    uint64_t v27 = sub_25F6429D0();
    sub_25F642940();
    swift_retain();
    char v29 = (void (*)(uint64_t *, void))sub_25F642930();
    uint64_t v30 = *v28;
    if ((unint64_t)*v28 >> 62)
    {
      uint64_t v36 = v30 & 0xFFFFFFFFFFFFFF8;
      if (v30 < 0) {
        uint64_t v36 = *v28;
      }
      uint64_t v37 = v36;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_25F642DA0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v37 < 0)
      {
        __break(1u);
        return result;
      }
    }
    sub_25F624900(0, 0, v27);
    v29(v49, 0);
    swift_release();
    uint64_t v31 = v40;
    *uint64_t v24 = v38;
    v24[1] = v31;
    uint64_t v26 = v42;
    (*(void (**)(void *, void, uint64_t))(v19 + 104))(v24, *MEMORY[0x263F14100], v42);
    (*(void (**)(char *, void *, uint64_t))(v19 + 16))(v39, v24, v26);
    sub_25F642920();
    swift_allocObject();
    uint64_t v32 = sub_25F642890();
    swift_release();
    (*(void (**)(void *, uint64_t))(v19 + 8))(v24, v26);
    a5[7] = v32;
  }
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25F6252FC((uint64_t)sub_25F6252F8);
  sub_25F642880();
  swift_release();
  swift_release();
  sub_25F62530C();
  sub_25F642910();
  sub_25F6427B0();
  (*(void (**)(void *, uint64_t))(v19 + 8))(v24, v26);
  sub_25F642A60();
  v49[0] = MEMORY[0x263F8EE78];
  sub_25F62534C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF828);
  sub_25F6253A4();
  sub_25F642D00();
  (*(void (**)(char *, void, uint64_t))(v47 + 104))(v46, *MEMORY[0x263F8F130], v48);
  long long v33 = (void *)sub_25F642C70();
  swift_retain();
  sub_25F6428D0();
  swift_release();
  if (qword_26A7AF700 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v34 = v33;
  MEMORY[0x2611F9A20]();
  if (*(void *)((qword_26A7AF800 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((qword_26A7AF800 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_25F642BF0();
  sub_25F642C10();
  sub_25F642BE0();
  swift_endAccess();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  return (uint64_t)a5;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_25F625294(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25F6252FC(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

unint64_t sub_25F62530C()
{
  unint64_t result = qword_26A7AF818;
  if (!qword_26A7AF818)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26A7AF818);
  }
  return result;
}

unint64_t sub_25F62534C()
{
  unint64_t result = qword_26A7AF820;
  if (!qword_26A7AF820)
  {
    sub_25F642C40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF820);
  }
  return result;
}

unint64_t sub_25F6253A4()
{
  unint64_t result = qword_26A7AF830;
  if (!qword_26A7AF830)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7AF828);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF830);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_25F6254DC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_25F624474(a1, a2, a3, a4, a5, v5);
}

uint64_t sub_25F6254E4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25F6254F8(a1, a2);
  }
  return a1;
}

uint64_t sub_25F6254F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_25F625550(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t ComponentInitDataReader.Component.dataBuffer()()
{
  uint64_t v1 = *v0;
  if (!*v0) {
    goto LABEL_12;
  }
  uint64_t v2 = v0[1];
  if (v2 - v1 < 48) {
    goto LABEL_12;
  }
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3 < 0) {
    goto LABEL_13;
  }
  BOOL v4 = __OFADD__(v3, 48);
  uint64_t v5 = v3 + 48;
  if (v4)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v6 = *(void *)(v1 + 24);
  if (v6 < 0)
  {
LABEL_13:
    uint64_t result = sub_25F642D80();
    __break(1u);
    return result;
  }
  if (__OFADD__(v5, v6))
  {
LABEL_11:
    __break(1u);
LABEL_12:
    sub_25F642D90();
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v7 = sub_25F61FBE0(v5 + v6, v1, v2);
  return sub_25F629EB4(v7, v8, v9, v10);
}

uint64_t ComponentInitDataReader.Client.badge()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *v1;
  if (*v1 && v1[1] - v2 > 36)
  {
    char v3 = *(unsigned char *)(v2 + 16);
    int v4 = *(_DWORD *)(v2 + 17);
    *(_WORD *)a1 = 257;
    *(unsigned char *)(a1 + 2) = v3;
    *(_DWORD *)(a1 + 4) = v4;
    *(_WORD *)(a1 + 8) = 0;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t ComponentInitDataReader.Client.types.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  if (*v1 && v1[1] - v3 >= 37)
  {
    uint64_t v4 = *(void *)(v3 + 29);
    if ((v4 & 0x8000000000000000) == 0)
    {
      uint64_t result = sub_25F62850C();
      *a1 = result;
      a1[1] = v6;
      a1[2] = v4;
      return result;
    }
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.TypeBuffer.subscript.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v5 = v2[2];
  uint64_t v6 = sub_25F61FBE0(0, v3, v4);
  if (v5 < 1)
  {
LABEL_57:
    uint64_t v28 = 0;
    unint64_t v29 = 0xE000000000000000;
    sub_25F642D20();
    swift_bridgeObjectRelease();
    uint64_t v28 = 0xD00000000000001FLL;
    unint64_t v29 = 0x800000025F646410;
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
LABEL_58:
    sub_25F642D90();
    __break(1u);
LABEL_59:
    sub_25F642D80();
    __break(1u);
LABEL_60:
    sub_25F642DE0();
    __break(1u);
LABEL_61:
    sub_25F642D80();
    __break(1u);
  }
  else
  {
    uint64_t v10 = v6;
    if ((v6 & 0x8000000000000000) == 0)
    {
      uint64_t v11 = v7;
      uint64_t v12 = v8;
      uint64_t v13 = v9 - v8;
      if (v8) {
        uint64_t v14 = v9 - v8;
      }
      else {
        uint64_t v14 = 0;
      }
      BOOL v16 = v7 < 0 || v13 < v7;
      uint64_t v17 = a1;
      while (1)
      {
        if (v12)
        {
          if (v13 < v11) {
            goto LABEL_62;
          }
          uint64_t v18 = (void *)(v12 + v10);
        }
        else
        {
          if (v11 > 0) {
            goto LABEL_62;
          }
          uint64_t v18 = 0;
        }
        unint64_t v19 = v11 - v10;
        BOOL v20 = __OFSUB__(v11, v10);
        if ((v19 & 0x8000000000000000) != 0) {
          goto LABEL_62;
        }
        if (v19) {
          break;
        }
        if (v18) {
          goto LABEL_26;
        }
        uint64_t v21 = 0;
LABEL_27:
        uint64_t result = sub_25F627B90(v18, v21, &v28);
        unint64_t v23 = v29;
        if (!v17)
        {
          *a2 = v28;
          a2[1] = v23;
          return result;
        }
        if (!v28 || (uint64_t)(v29 - v28) < 16) {
          goto LABEL_58;
        }
        unint64_t v24 = *(void *)(v28 + 8);
        if ((v24 & 0x8000000000000000) != 0) {
          goto LABEL_59;
        }
        if (v14 < 0) {
          goto LABEL_60;
        }
        if (v14 < v10) {
          goto LABEL_61;
        }
        if (v12)
        {
          if (v16) {
            goto LABEL_61;
          }
        }
        else if (v11)
        {
          goto LABEL_61;
        }
        if (v20)
        {
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_61;
        }
        uint64_t v25 = v11;
        if (v19 >= v24)
        {
          uint64_t v25 = v10 + v24;
          if (__OFADD__(v10, v24)) {
            goto LABEL_52;
          }
          if (v12)
          {
            if (v25 < 0 || v13 < v25) {
              goto LABEL_61;
            }
            if (v11 < (unint64_t)v25) {
              goto LABEL_63;
            }
          }
          else if (v25)
          {
            goto LABEL_61;
          }
        }
        if (v25 < v10) {
          goto LABEL_61;
        }
        --v17;
        uint64_t v10 = v25;
        if (!--v5) {
          goto LABEL_57;
        }
      }
      if (!v18) {
        goto LABEL_62;
      }
LABEL_26:
      uint64_t v21 = (uint64_t)v18 + v19;
      goto LABEL_27;
    }
  }
LABEL_62:
  sub_25F642DE0();
  __break(1u);
LABEL_63:
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t EndpointTuple.identifier.getter()
{
  return *(void *)v0;
}

uint64_t EndpointTuple.numHandlers.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_25F625CA4(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  if ((a4 & 0x1000000000000000) == 0)
  {
    if ((a4 & 0x2000000000000000) != 0) {
      uint64_t v8 = HIBYTE(a4) & 0xF;
    }
    else {
      uint64_t v8 = a3 & 0xFFFFFFFFFFFFLL;
    }
    swift_bridgeObjectRetain();
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_6;
    }
LABEL_9:
    size_t v10 = HIBYTE(v4) & 0xF;
    v14[0] = v5;
    v14[1] = v4 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = v14;
    goto LABEL_10;
  }
  uint64_t v8 = sub_25F642B60();
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_25F63A3D4();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v4 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_9;
  }
LABEL_6:
  if ((v5 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (void *)((v4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    size_t v10 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = (void *)sub_25F642D60();
  }
LABEL_10:
  sub_25F625DAC(v9, v10, a1, a2, v8);
  swift_bridgeObjectRelease();
  return v8;
}

void *sub_25F625DAC(void *__src, size_t __len, void *__dst, uint64_t a4, uint64_t a5)
{
  if (a5 < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (!__dst)
  {
    if (!a5) {
      return __src;
    }
    goto LABEL_12;
  }
  if (a4 - (uint64_t)__dst < a5)
  {
LABEL_12:
    sub_25F642DE0();
    __break(1u);
    goto LABEL_13;
  }
  if (!__src) {
    return __src;
  }
  if ((__len & 0x8000000000000000) != 0)
  {
LABEL_13:
    __src = (void *)sub_25F642DE0();
    __break(1u);
    return __src;
  }
  return memmove(__dst, __src, __len);
}

uint64_t sub_25F625EA8()
{
  return sub_25F642B20();
}

uint64_t sub_25F625ED4(uint64_t *a1, uint64_t a2)
{
  return sub_25F629E50(*a1, a1[1], *(unsigned __int8 **)a2, *(void *)(a2 + 8));
}

BOOL static ComponentInitDataBuilder.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ComponentInitDataBuilder.Error.hash(into:)()
{
  return sub_25F642EB0();
}

uint64_t ComponentInitDataBuilder.Error.hashValue.getter()
{
  return sub_25F642ED0();
}

BOOL sub_25F625F74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t _s9Tightbeam23ComponentInitDataReaderV0B0V5ErrorO9hashValueSivg_0()
{
  return sub_25F642ED0();
}

uint64_t sub_25F625FD4()
{
  return sub_25F642EB0();
}

uint64_t sub_25F626000()
{
  return sub_25F642ED0();
}

uint64_t ComponentInitDataBuilder.TypeData.type.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

Tightbeam::ComponentInitDataBuilder::TypeData __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComponentInitDataBuilder.TypeData.init(type:)(Tightbeam::ComponentInitDataBuilder::TypeData type)
{
  uint64_t v2 = HIBYTE(type.type._object) & 0xF;
  if (((uint64_t)type.type._object & 0x2000000000000000) == 0) {
    uint64_t v2 = type.type._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    *uint64_t v1 = type;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_25F629FE0();
    swift_allocError();
    unsigned char *v3 = 1;
    type.type._countAndFlagsBits = swift_willThrow();
  }
  return type;
}

void ComponentInitDataBuilder.Client.badge.getter(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 1);
  char v3 = *(unsigned char *)(v1 + 2);
  int v4 = *(_DWORD *)(v1 + 4);
  __int16 v5 = *(_WORD *)(v1 + 8);
  *(unsigned char *)a1 = *(unsigned char *)v1;
  *(unsigned char *)(a1 + 1) = v2;
  *(unsigned char *)(a1 + 2) = v3;
  *(_DWORD *)(a1 + 4) = v4;
  *(_WORD *)(a1 + 8) = v5;
}

uint64_t ComponentInitDataBuilder.Client.property.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ComponentInitDataBuilder.Client.types.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ComponentInitDataBuilder.Client.init(identifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = TightbeamBadge.init(_:)(a1, (uint64_t)v8);
  char v4 = v8[1];
  char v5 = v8[2];
  int v6 = v9;
  __int16 v7 = v10;
  *(unsigned char *)a2 = v8[0];
  *(unsigned char *)(a2 + 1) = v4;
  *(unsigned char *)(a2 + 2) = v5;
  *(_DWORD *)(a2 + 4) = v6;
  *(_WORD *)(a2 + 8) = v7;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *(void *)(a2 + 32) = MEMORY[0x263F8EE78];
  return result;
}

uint64_t ComponentInitDataBuilder.Client.init(badge:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 1);
  char v3 = *(unsigned char *)(result + 2);
  int v4 = *(_DWORD *)(result + 4);
  __int16 v5 = *(_WORD *)(result + 8);
  *(unsigned char *)a2 = *(unsigned char *)result;
  *(unsigned char *)(a2 + 1) = v2;
  *(unsigned char *)(a2 + 2) = v3;
  *(_DWORD *)(a2 + 4) = v4;
  *(_WORD *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *(void *)(a2 + 32) = MEMORY[0x263F8EE78];
  return result;
}

uint64_t ComponentInitDataBuilder.Client.init(badge:property:types:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v5 = *(unsigned char *)(result + 1);
  char v6 = *(unsigned char *)(result + 2);
  int v7 = *(_DWORD *)(result + 4);
  __int16 v8 = *(_WORD *)(result + 8);
  *(unsigned char *)a5 = *(unsigned char *)result;
  *(unsigned char *)(a5 + 1) = v5;
  *(unsigned char *)(a5 + 2) = v6;
  *(_DWORD *)(a5 + 4) = v7;
  *(_WORD *)(a5 + 8) = v8;
  *(void *)(a5 + 16) = a2;
  *(void *)(a5 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  *(void *)(a5 + 32) = a4;
  return result;
}

uint64_t sub_25F626238()
{
  unint64_t v1 = v0[3];
  char v2 = (unint64_t *)v0[4];
  if (!v1)
  {
    uint64_t i = 37;
    goto LABEL_10;
  }
  if ((v1 & 0x1000000000000000) != 0) {
    goto LABEL_28;
  }
  if ((v1 & 0x2000000000000000) != 0) {
    uint64_t result = HIBYTE(v1) & 0xF;
  }
  else {
    uint64_t result = v0[2] & 0xFFFFFFFFFFFFLL;
  }
  for (uint64_t i = result + 37; !__OFADD__(result, 37); uint64_t i = result + 37)
  {
LABEL_10:
    unint64_t v5 = v2[2];
    if (v5)
    {
      uint64_t v6 = 0;
      v2 += 5;
      while (1)
      {
        unint64_t v7 = *v2;
        if ((*v2 & 0x1000000000000000) != 0)
        {
          uint64_t v11 = sub_25F642B60();
          uint64_t v9 = v11 + 16;
          if (__OFADD__(v11, 16)) {
            goto LABEL_22;
          }
        }
        else
        {
          if ((v7 & 0x2000000000000000) != 0) {
            uint64_t v8 = HIBYTE(v7) & 0xF;
          }
          else {
            uint64_t v8 = *(v2 - 1) & 0xFFFFFFFFFFFFLL;
          }
          uint64_t v9 = v8 + 16;
          if (__OFADD__(v8, 16))
          {
LABEL_22:
            __break(1u);
            goto LABEL_23;
          }
        }
        BOOL v10 = __OFADD__(v6, v9);
        v6 += v9;
        if (v10) {
          break;
        }
        v2 += 2;
        if (!--v5) {
          goto LABEL_24;
        }
      }
      __break(1u);
    }
    else
    {
LABEL_23:
      uint64_t v6 = 0;
LABEL_24:
      uint64_t result = i + v6;
      if (!__OFADD__(i, v6)) {
        return result;
      }
    }
    __break(1u);
LABEL_28:
    uint64_t result = sub_25F642B60();
  }
  __break(1u);
  return result;
}

uint64_t sub_25F626310(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = v3;
  LOBYTE(v7) = *(unsigned char *)(v2 + 2);
  LOWORD(v8) = *(_WORD *)(v2 + 4);
  LOWORD(v9) = *(_WORD *)(v2 + 6);
  uint64_t v10 = *(void *)(v2 + 16);
  unint64_t v11 = *(void *)(v2 + 24);
  uint64_t v49 = *(void *)(v2 + 32);
  uint64_t v12 = sub_25F626238();
  uint64_t v13 = v12;
  uint64_t v48 = v12;
  if (a1)
  {
    if ((uint64_t)(a2 - a1) >= v12) {
      goto LABEL_3;
    }
LABEL_11:
    sub_25F629FE0();
    swift_allocError();
    unsigned char *v15 = 0;
    swift_willThrow();
    return v48;
  }
  if (v12 > 0) {
    goto LABEL_11;
  }
LABEL_3:
  if (v11)
  {
    if ((v11 & 0x1000000000000000) != 0) {
      goto LABEL_92;
    }
    if ((v11 & 0x2000000000000000) != 0)
    {
      if ((v12 & 0x8000000000000000) == 0)
      {
        uint64_t v14 = HIBYTE(v11) & 0xF;
        goto LABEL_16;
      }
    }
    else if ((v12 & 0x8000000000000000) == 0)
    {
      uint64_t v14 = v10 & 0xFFFFFFFFFFFFLL;
      while (1)
      {
        if (v14 < 0) {
          goto LABEL_93;
        }
LABEL_16:
        uint64_t v16 = *(void *)(v49 + 16);
        *(void *)a1 = 0x434C4E5444415441;
        *(void *)(a1 + 8) = v13;
        *(unsigned char *)(a1 + 16) = (_BYTE)v7;
        *(_WORD *)(a1 + 17) = v8;
        *(_WORD *)(a1 + 19) = v9;
        *(void *)(a1 + 21) = v14;
        *(void *)(a1 + 29) = v16;
        uint64_t v8 = a2 - a1;
        uint64_t v17 = a1;
        a1 = a1 ? a2 - a1 : 0;
        if (a1 > 36) {
          break;
        }
LABEL_91:
        __break(1u);
LABEL_92:
        uint64_t v14 = sub_25F642B60();
        uint64_t v13 = v48;
        if (v48 < 0) {
          goto LABEL_93;
        }
      }
      if (!v11)
      {
        uint64_t v10 = 37;
        uint64_t v9 = v4;
        uint64_t v21 = v49;
        uint64_t v24 = v17;
        uint64_t v26 = *(void *)(v49 + 16);
        if (v26)
        {
LABEL_25:
          uint64_t v27 = a2 - v24;
          if (v24) {
            int64_t v28 = a2 - v24;
          }
          else {
            int64_t v28 = 0;
          }
          uint64_t v43 = v27;
          BOOL v30 = v8 < 0 || v27 < v8;
          BOOL v44 = v30;
          swift_bridgeObjectRetain();
          unint64_t v7 = (unint64_t *)(v21 + 40);
          unint64_t v46 = v8;
          uint64_t v47 = v24;
          int64_t v45 = v28;
          while (1)
          {
            unint64_t v11 = v24 + v10;
            if (v24) {
              a1 = v24 + v10;
            }
            else {
              a1 = 0;
            }
            unint64_t v31 = v8 - v10;
            unint64_t v32 = __OFSUB__(v8, v10);
            if ((v31 & 0x8000000000000000) != 0) {
              goto LABEL_99;
            }
            uint64_t v33 = *(v7 - 1);
            a2 = *v7;
            uint64_t v8 = v9;
            if (v31) {
              break;
            }
            if (a1) {
              goto LABEL_46;
            }
            uint64_t v9 = 0;
            uint64_t v50 = v26;
            if ((a2 & 0x1000000000000000) == 0)
            {
LABEL_47:
              if ((a2 & 0x2000000000000000) != 0)
              {
                uint64_t v34 = HIBYTE(a2) & 0xF;
                uint64_t v4 = v34 + 16;
                if (__OFADD__(v34, 16)) {
                  goto LABEL_83;
                }
              }
              else
              {
                uint64_t v4 = (v33 & 0xFFFFFFFFFFFFLL) + 16;
                if (__OFADD__(v33 & 0xFFFFFFFFFFFFLL, 16)) {
                  goto LABEL_83;
                }
              }
              goto LABEL_52;
            }
LABEL_81:
            unsigned int v42 = v32;
            uint64_t v38 = *(v7 - 1);
            uint64_t v39 = sub_25F642B60();
            uint64_t v33 = v38;
            unint64_t v32 = v42;
            uint64_t v4 = v39 + 16;
            if (__OFADD__(v39, 16))
            {
LABEL_83:
              __break(1u);
LABEL_84:
              sub_25F629FE0();
              swift_allocError();
              *uint64_t v40 = 0;
              swift_bridgeObjectRetain();
              swift_willThrow();
              swift_bridgeObjectRelease();
LABEL_85:
              swift_bridgeObjectRelease();
              return v48;
            }
LABEL_52:
            if (a1)
            {
              if (v9 - a1 < v4) {
                goto LABEL_84;
              }
              if (v4 < 0) {
                goto LABEL_93;
              }
            }
            else
            {
              if (v4 >= 1) {
                goto LABEL_84;
              }
              unint64_t v11 = 0;
              if (v4 < 0) {
                goto LABEL_93;
              }
            }
            *(void *)unint64_t v11 = 0x5459504544415441;
            *(void *)(v11 + 8) = v4;
            if (!a1 || v9 - a1 < 16)
            {
              __break(1u);
LABEL_89:
              __break(1u);
LABEL_90:
              __break(1u);
              goto LABEL_91;
            }
            unint64_t v11 = v32;
            long long v35 = (void *)(a1 + 16);
            a1 = v9;
            uint64_t v36 = v33;
            swift_bridgeObjectRetain();
            sub_25F625CA4(v35, a1, v36, a2);
            uint64_t v9 = v8;
            swift_bridgeObjectRelease();
            if (v8) {
              goto LABEL_85;
            }
            a2 = v45;
            if (v45 < 0)
            {
              sub_25F642DE0();
              __break(1u);
LABEL_97:
              sub_25F642D80();
              __break(1u);
              goto LABEL_94;
            }
            uint64_t v8 = v46;
            uint64_t v24 = v47;
            if (v10 < 0 || v45 < v10) {
              goto LABEL_94;
            }
            if (v47)
            {
              if (v44) {
                goto LABEL_94;
              }
            }
            else if (v46)
            {
              goto LABEL_94;
            }
            if (v11) {
              goto LABEL_89;
            }
            unint64_t v37 = v46;
            if (v31 >= v4)
            {
              unint64_t v37 = v10 + v4;
              if (__OFADD__(v10, v4)) {
                goto LABEL_90;
              }
              if (v47)
              {
                if ((v37 & 0x8000000000000000) != 0 || v43 < (uint64_t)v37) {
                  goto LABEL_94;
                }
              }
              else if (v37)
              {
                goto LABEL_94;
              }
            }
            if (v46 < v37) {
              goto LABEL_97;
            }
            if (v37 < v10) {
              goto LABEL_94;
            }
            v7 += 2;
            uint64_t v10 = v37;
            uint64_t v26 = v50 - 1;
            if (v50 == 1) {
              goto LABEL_85;
            }
          }
          if (!a1) {
            goto LABEL_99;
          }
LABEL_46:
          uint64_t v9 = a1 + v31;
          uint64_t v50 = v26;
          if ((a2 & 0x1000000000000000) == 0) {
            goto LABEL_47;
          }
          goto LABEL_81;
        }
        return v13;
      }
      uint64_t v18 = (void *)sub_25F6239B4(37, a1, v17);
      uint64_t v20 = sub_25F625CA4(v18, v19, v10, v11);
      uint64_t v9 = v4;
      uint64_t v21 = v49;
      if (!v4)
      {
        uint64_t v10 = sub_25F61FBB4(v20, 37, a1, v17, a2);
        uint64_t v8 = v22;
        uint64_t v24 = v23;
        a2 = v25;
        uint64_t v13 = v48;
        uint64_t v26 = *(void *)(v49 + 16);
        if (!v26) {
          return v13;
        }
        goto LABEL_25;
      }
      return v48;
    }
  }
  else if ((v12 & 0x8000000000000000) == 0)
  {
    uint64_t v14 = 0;
    goto LABEL_16;
  }
LABEL_93:
  sub_25F642D80();
  __break(1u);
LABEL_94:
  sub_25F642D80();
  __break(1u);
LABEL_99:
  uint64_t result = sub_25F642DE0();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataBuilder.Component.identifier.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ComponentInitDataBuilder.Component.clients.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ComponentInitDataBuilder.Component.data.getter()
{
  return swift_bridgeObjectRetain();
}

void ComponentInitDataBuilder.Component.init(identifier:dataSize:clients:)(uint64_t a1@<X0>, uint64_t a2@<X1>, size_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  if ((a3 & 0x8000000000000000) != 0)
  {
    sub_25F642D80();
    __break(1u);
  }
  else
  {
    if (a3)
    {
      uint64_t v10 = sub_25F642C00();
      *(void *)(v10 + 16) = a3;
      bzero((void *)(v10 + 32), a3);
    }
    else
    {
      uint64_t v10 = MEMORY[0x263F8EE78];
    }
    *a5 = a1;
    a5[1] = a2;
    a5[2] = a4;
    a5[3] = v10;
  }
}

uint64_t ComponentInitDataBuilder.Component.withMutableMessage(_:)(void (*a1)(uint64_t))
{
  uint64_t v3 = *(char **)(v1 + 24);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = sub_25F629E3C((uint64_t)v3);
  }
  uint64_t result = sub_25F63D110(0, (uint64_t)(v3 + 32), *((void *)v3 + 2), a1);
  *(void *)(v1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  return result;
}

uint64_t sub_25F626A8C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v20 = MEMORY[0x263F8EE78];
  sub_25F629CBC(0, v1, 0);
  uint64_t v4 = 0;
  uint64_t v2 = v20;
  uint64_t v5 = a1 + 32;
  while (1)
  {
    uint64_t v6 = (void *)(v5 + 40 * v4);
    unint64_t v7 = v6[3];
    uint64_t v8 = v6[4];
    if (v7)
    {
      if ((v7 & 0x1000000000000000) != 0)
      {
        uint64_t result = sub_25F642B60();
        uint64_t v10 = result + 37;
        if (__OFADD__(result, 37)) {
          goto LABEL_33;
        }
      }
      else
      {
        if ((v7 & 0x2000000000000000) != 0) {
          uint64_t result = HIBYTE(v7) & 0xF;
        }
        else {
          uint64_t result = v6[2] & 0xFFFFFFFFFFFFLL;
        }
        uint64_t v10 = result + 37;
        if (__OFADD__(result, 37))
        {
LABEL_33:
          __break(1u);
          return v2;
        }
      }
    }
    else
    {
      uint64_t result = 0;
      uint64_t v10 = 37;
    }
    uint64_t v11 = *(void *)(v8 + 16);
    if (v11) {
      break;
    }
    uint64_t v12 = 0;
LABEL_26:
    uint64_t v17 = v10 + v12;
    if (__OFADD__(v10, v12)) {
      goto LABEL_37;
    }
    unint64_t v19 = *(void *)(v20 + 16);
    unint64_t v18 = *(void *)(v20 + 24);
    if (v19 >= v18 >> 1) {
      sub_25F629CBC(v18 > 1, v19 + 1, 1);
    }
    ++v4;
    *(void *)(v20 + 16) = v19 + 1;
    *(void *)(v20 + 8 * v19 + 32) = v17;
    if (v4 == v1) {
      return v2;
    }
  }
  uint64_t v12 = 0;
  uint64_t v13 = (unint64_t *)(v8 + 40);
  while (1)
  {
    unint64_t v14 = *v13;
    if ((*v13 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_25F642B60();
      uint64_t v15 = result + 16;
      if (__OFADD__(result, 16)) {
        goto LABEL_36;
      }
    }
    else
    {
      if ((v14 & 0x2000000000000000) != 0) {
        uint64_t result = HIBYTE(v14) & 0xF;
      }
      else {
        uint64_t result = *(v13 - 1) & 0xFFFFFFFFFFFFLL;
      }
      uint64_t v15 = result + 16;
      if (__OFADD__(result, 16)) {
        goto LABEL_36;
      }
    }
    BOOL v16 = __OFADD__(v12, v15);
    v12 += v15;
    if (v16) {
      break;
    }
    v13 += 2;
    if (!--v11) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_25F626C24(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t result = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v5 = MEMORY[0x263F8EE78];
    sub_25F629CBC(0, v1, 0);
    uint64_t result = v5;
    do
    {
      uint64_t v6 = result;
      unint64_t v4 = *(void *)(result + 16);
      unint64_t v3 = *(void *)(result + 24);
      if (v4 >= v3 >> 1)
      {
        sub_25F629CBC(v3 > 1, v4 + 1, 1);
        uint64_t result = v6;
      }
      *(void *)(result + 16) = v4 + 1;
      *(void *)(result + 8 * v4 + 32) = 24;
      --v1;
    }
    while (v1);
  }
  return result;
}

uint64_t sub_25F626CDC(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!v1) {
    return v2;
  }
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_25F629CBC(0, v1, 0);
  uint64_t v4 = 0;
  uint64_t v2 = v24;
  int64_t v22 = v1;
  uint64_t v23 = a1 + 32;
  while (1)
  {
    uint64_t v5 = (void *)(v23 + 32 * v4);
    unint64_t v6 = v5[1];
    uint64_t v8 = v5[2];
    uint64_t v7 = v5[3];
    if ((v6 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_25F642B60();
      uint64_t v10 = result + 48;
      if (__OFADD__(result, 48)) {
        goto LABEL_27;
      }
    }
    else
    {
      if ((v6 & 0x2000000000000000) != 0) {
        uint64_t result = HIBYTE(v6) & 0xF;
      }
      else {
        uint64_t result = *v5 & 0xFFFFFFFFFFFFLL;
      }
      uint64_t v10 = result + 48;
      if (__OFADD__(result, 48)) {
        goto LABEL_27;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_25F626A8C(v8);
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 16);
    if (v12) {
      break;
    }
    uint64_t v13 = 0;
LABEL_14:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v17 = v10 + v13;
    if (__OFADD__(v10, v13)) {
      goto LABEL_25;
    }
    uint64_t v18 = *(void *)(v7 + 16);
    uint64_t v19 = v17 + v18;
    if (__OFADD__(v17, v18)) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v24 + 16);
    unint64_t v20 = *(void *)(v24 + 24);
    if (v21 >= v20 >> 1) {
      sub_25F629CBC(v20 > 1, v21 + 1, 1);
    }
    ++v4;
    *(void *)(v24 + 16) = v21 + 1;
    *(void *)(v24 + 8 * v21 + 32) = v19;
    if (v4 == v22) {
      return v2;
    }
  }
  uint64_t v13 = 0;
  unint64_t v14 = (uint64_t *)(v11 + 32);
  while (1)
  {
    uint64_t v15 = *v14++;
    BOOL v16 = __OFADD__(v13, v15);
    v13 += v15;
    if (v16) {
      break;
    }
    if (!--v12) {
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_25F626EA8()
{
  unint64_t v1 = v0[1];
  uint64_t v3 = v0[2];
  uint64_t v2 = v0[3];
  if ((v1 & 0x1000000000000000) != 0) {
    goto LABEL_16;
  }
  if ((v1 & 0x2000000000000000) != 0) {
    uint64_t result = HIBYTE(v1) & 0xF;
  }
  else {
    uint64_t result = *v0 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v5 = result + 48;
  if (__OFADD__(result, 48))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_25F626A8C(v3);
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)(v6 + 16);
    if (!v7) {
      break;
    }
    uint64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v6 + 32);
    while (1)
    {
      uint64_t v10 = *v9++;
      BOOL v11 = __OFADD__(v8, v10);
      v8 += v10;
      if (v11) {
        break;
      }
      if (!--v7) {
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_16:
    uint64_t result = sub_25F642B60();
    uint64_t v5 = result + 48;
    if (__OFADD__(result, 48)) {
      goto LABEL_18;
    }
  }
  uint64_t v8 = 0;
LABEL_12:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v12 = v5 + v8;
  if (__OFADD__(v5, v8)) {
    goto LABEL_19;
  }
  uint64_t v13 = *(void *)(v2 + 16);
  uint64_t result = v12 + v13;
  if (__OFADD__(v12, v13)) {
LABEL_20:
  }
    __break(1u);
  return result;
}

uint64_t sub_25F626FB8(unint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  unint64_t v7 = v2[1];
  uint64_t v8 = v2[2];
  uint64_t v9 = v2[3];
  uint64_t v10 = sub_25F626EA8();
  uint64_t v11 = v10;
  if (a1)
  {
    if ((uint64_t)(a2 - a1) >= v10) {
      goto LABEL_3;
    }
LABEL_12:
    sub_25F629FE0();
    swift_allocError();
    *unint64_t v20 = 0;
    swift_willThrow();
    return v11;
  }
  if (v10 > 0) {
    goto LABEL_12;
  }
LABEL_3:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_25F626A8C(v8);
  unint64_t v13 = v3;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(v12 + 16);
  uint64_t v48 = v8;
  if (v14)
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    do
    {
      uint64_t v17 = *(void *)(v12 + 8 * v15 + 32);
      BOOL v18 = __OFADD__(v16, v17);
      v16 += v17;
      if (v18)
      {
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }
      ++v15;
    }
    while (v14 != v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v7 & 0x1000000000000000) != 0) {
      goto LABEL_73;
    }
    if ((v7 & 0x2000000000000000) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    uint64_t v19 = HIBYTE(v7) & 0xF;
    if ((v11 & 0x8000000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_74;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v16 = 0;
  if ((v7 & 0x1000000000000000) != 0)
  {
LABEL_73:
    uint64_t v19 = sub_25F642B60();
    if ((v11 & 0x8000000000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_74;
  }
  if ((v7 & 0x2000000000000000) != 0) {
    goto LABEL_15;
  }
LABEL_9:
  uint64_t v19 = v6 & 0xFFFFFFFFFFFFLL;
  if ((v11 & 0x8000000000000000) == 0)
  {
LABEL_16:
    if (v19 < 0 || (v16 & 0x8000000000000000) != 0) {
      goto LABEL_74;
    }
    uint64_t v21 = *(void *)(v48 + 16);
    uint64_t v22 = *(void *)(v9 + 16);
    *(void *)a1 = 0x434F4D5044415441;
    *(void *)(a1 + 8) = v11;
    *(void *)(a1 + 16) = v19;
    *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v16;
    *(void *)(a1 + 32) = v21;
    *(void *)(a1 + 40) = v22;
    if (a1) {
      uint64_t v23 = a2 - a1;
    }
    else {
      uint64_t v23 = 0;
    }
    if (v23 <= 47) {
      goto LABEL_75;
    }
    uint64_t v24 = (void *)sub_25F6239B4(48, v23, a1);
    uint64_t v26 = sub_25F625CA4(v24, v25, v6, v7);
    unint64_t v16 = v13;
    if (!v13)
    {
      uint64_t v41 = v11;
      unint64_t v7 = sub_25F61FBB4(v26, 48, v23, a1, a2);
      uint64_t v11 = v27;
      uint64_t v30 = v28;
      uint64_t v31 = *(void *)(v48 + 16);
      if (v31)
      {
        if (v28) {
          int64_t v32 = v29 - v28;
        }
        else {
          int64_t v32 = 0;
        }
        int64_t v44 = v32;
        int64_t v42 = v29 - v28;
        BOOL v34 = v27 < 0 || v29 - v28 < v27;
        BOOL v43 = v34;
        swift_bridgeObjectRetain();
        a2 = 0;
        unint64_t v45 = v11;
        uint64_t v46 = v9;
        uint64_t v47 = v30;
        while (1)
        {
          if (v30) {
            uint64_t v35 = v30 + v7;
          }
          else {
            uint64_t v35 = 0;
          }
          a1 = v11 - v7;
          uint64_t v6 = __OFSUB__(v11, v7);
          if ((a1 & 0x8000000000000000) != 0) {
            goto LABEL_81;
          }
          uint64_t v49 = v31;
          if (a1) {
            break;
          }
          if (v35) {
            goto LABEL_45;
          }
          unint64_t v36 = 0;
LABEL_46:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          unint64_t v13 = sub_25F626310(v35, v36);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v13 & 0x8000000000000000) != 0) {
            goto LABEL_80;
          }
          uint64_t v11 = v45;
          uint64_t v9 = v46;
          uint64_t v30 = v47;
          if (v44 < 0)
          {
            sub_25F642DE0();
            __break(1u);
            goto LABEL_80;
          }
          if ((v7 & 0x8000000000000000) != 0 || v44 < (uint64_t)v7) {
            goto LABEL_80;
          }
          if (v47)
          {
            if (v43) {
              goto LABEL_80;
            }
          }
          else if (v45)
          {
            goto LABEL_80;
          }
          if (v6) {
            goto LABEL_71;
          }
          unint64_t v37 = v45;
          if (a1 >= v13)
          {
            unint64_t v37 = v7 + v13;
            if (__OFADD__(v7, v13)) {
              goto LABEL_72;
            }
            if (v47)
            {
              if ((v37 & 0x8000000000000000) != 0 || v42 < (uint64_t)v37) {
                goto LABEL_80;
              }
              if (v45 < v37) {
                goto LABEL_82;
              }
            }
            else if (v37)
            {
              goto LABEL_80;
            }
          }
          if (v37 < v7) {
            goto LABEL_80;
          }
          a2 += 40;
          unint64_t v7 = v37;
          uint64_t v31 = v49 - 1;
          if (v49 == 1)
          {
            swift_bridgeObjectRelease();
            uint64_t v30 = v47;
            goto LABEL_68;
          }
        }
        if (!v35) {
          goto LABEL_81;
        }
LABEL_45:
        unint64_t v36 = v35 + a1;
        goto LABEL_46;
      }
      unint64_t v37 = v7;
LABEL_68:
      uint64_t v38 = v9 + 32 + *(void *)(v9 + 16);
      uint64_t v39 = sub_25F6239B4(v37, v11, v30);
      sub_25F63BD00((void *)(v9 + 32), v38, v39);
      return v41;
    }
    return v11;
  }
LABEL_74:
  sub_25F642D80();
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_80:
  sub_25F642D80();
  __break(1u);
LABEL_81:
  sub_25F642DE0();
  __break(1u);
LABEL_82:
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataBuilder.Endpoint.identifier.getter()
{
  return *(void *)v0;
}

uint64_t ComponentInitDataBuilder.Endpoint.init(identifier:numHandlers:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

Tightbeam::ComponentInitDataBuilder __swiftcall ComponentInitDataBuilder.init(components:endpoints:)(Swift::OpaquePointer components, Swift::OpaquePointer endpoints)
{
  v2->_rawValue = components._rawValue;
  v2[1]._rawValue = endpoints._rawValue;
  result.endpoints = endpoints;
  result.components = components;
  return result;
}

uint64_t ComponentInitDataBuilder.encodedByteSize.getter()
{
  uint64_t v0 = swift_bridgeObjectRetain();
  uint64_t v1 = sub_25F626C24(v0);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v3 = *(void *)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = (uint64_t *)(v1 + 32);
    while (1)
    {
      uint64_t v6 = *v5++;
      BOOL v7 = __OFADD__(v4, v6);
      v4 += v6;
      if (v7) {
        break;
      }
      if (!--v3) {
        goto LABEL_7;
      }
    }
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v4 = 0;
LABEL_7:
  uint64_t result = swift_bridgeObjectRelease();
  BOOL v7 = __OFADD__(v4, 32);
  uint64_t v8 = v4 + 32;
  if (v7) {
    goto LABEL_18;
  }
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_25F626CDC(v9);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11)
  {
    uint64_t v12 = 0;
    unint64_t v13 = (uint64_t *)(v10 + 32);
    while (1)
    {
      uint64_t v14 = *v13++;
      BOOL v7 = __OFADD__(v12, v14);
      v12 += v14;
      if (v7) {
        break;
      }
      if (!--v11) {
        goto LABEL_14;
      }
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    return result;
  }
  uint64_t v12 = 0;
LABEL_14:
  swift_bridgeObjectRelease();
  uint64_t result = v8 + v12;
  if (__OFADD__(v8, v12)) {
    goto LABEL_19;
  }
  return result;
}

uint64_t ComponentInitDataBuilder.encode(into:)(void *a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v2;
  uint64_t v7 = v2[1];
  uint64_t result = ComponentInitDataBuilder.encodedByteSize.getter();
  uint64_t v10 = a1;
  if (!a1)
  {
    if (result <= 0) {
      goto LABEL_7;
    }
LABEL_5:
    sub_25F629FE0();
    swift_allocError();
    *uint64_t v11 = 0;
    return swift_willThrow();
  }
  if (a2 - (uint64_t)a1 < result) {
    goto LABEL_5;
  }
LABEL_7:
  if (result < 0)
  {
    uint64_t result = sub_25F642D80();
    __break(1u);
    return result;
  }
  uint64_t v12 = *(void *)(v7 + 16);
  uint64_t v13 = *(void *)(v8 + 16);
  *a1 = 0x494E495444415441;
  a1[1] = result;
  a1[2] = v12;
  a1[3] = v13;
  uint64_t v14 = a2 - (void)a1;
  if (a1) {
    uint64_t v15 = a2 - (void)a1;
  }
  else {
    uint64_t v15 = 0;
  }
  if (v15 <= 31)
  {
LABEL_55:
    __break(1u);
    while (1)
    {
LABEL_56:
      sub_25F642D80();
      __break(1u);
LABEL_57:
      sub_25F642DE0();
      __break(1u);
LABEL_58:
      sub_25F642D80();
      __break(1u);
    }
  }
  uint64_t v16 = *(void *)(v7 + 16);
  if (!v16)
  {
    uint64_t v24 = 32;
    uint64_t v25 = *(void *)(v8 + 16);
    if (!v25) {
      return result;
    }
    goto LABEL_31;
  }
  unint64_t v17 = 0;
  BOOL v18 = (long long *)(v7 + 32);
  unint64_t v19 = (v15 - 8) / 0x18uLL;
  do
  {
    unint64_t v20 = v15 - (v17 + 32);
    BOOL v21 = __OFSUB__(v15, v17 + 32);
    if (!v19) {
      goto LABEL_57;
    }
    if (!v20) {
      goto LABEL_5;
    }
    if (!v10) {
      goto LABEL_57;
    }
    if (v20 < 0x18) {
      goto LABEL_5;
    }
    long long v22 = *v18;
    v10[v17 / 8 + 4] = 0x454E445044415441;
    *(_OWORD *)&v10[v17 / 8 + 5] = v22;
    if (v14 < (uint64_t)(v17 + 32)) {
      goto LABEL_56;
    }
    if (v21)
    {
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    if (v17 == 0x7FFFFFFFFFFFFFC8) {
      goto LABEL_53;
    }
    uint64_t v23 = v17 + 56;
    if (((v17 + 56) & 0x8000000000000000) != 0 || v14 < v23) {
      goto LABEL_56;
    }
    if (v14 < (unint64_t)v23) {
      goto LABEL_58;
    }
    v17 += 24;
    --v19;
    ++v18;
    --v16;
  }
  while (v16);
  uint64_t v24 = v17 + 32;
  uint64_t v25 = *(void *)(v8 + 16);
  if (v25)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v32 = (uint64_t)v10 + v15;
    uint64_t v26 = v8 + 56;
    uint64_t v33 = a2;
    uint64_t v35 = (uint64_t)v10;
    while (1)
    {
      uint64_t v34 = v25;
      if (v10) {
        unint64_t v27 = (unint64_t)v10 + v24;
      }
      else {
        unint64_t v27 = 0;
      }
      if (v15 - v24 < 0) {
        goto LABEL_57;
      }
      if (v15 != v24) {
        break;
      }
      if (v10) {
        goto LABEL_40;
      }
      uint64_t v28 = 0;
LABEL_41:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_25F626FB8(v27, v28);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v4) {
        return swift_bridgeObjectRelease();
      }
      if (v29 < 0) {
        goto LABEL_56;
      }
      uint64_t v30 = sub_25F623920(v24, v15, v35, v33);
      if (!v29 || v30 < 0 || (uint64_t v31 = v15, v30 >= v29))
      {
        uint64_t v31 = v24 + v29;
        if (__OFADD__(v24, v29)) {
          goto LABEL_54;
        }
        if (v31 < 0 || v15 < v31) {
          goto LABEL_56;
        }
      }
      if (v31 < v24) {
        goto LABEL_56;
      }
      v26 += 32;
      uint64_t v24 = v31;
      uint64_t v25 = v34 - 1;
      uint64_t v10 = (void *)v35;
      if (v34 == 1) {
        return swift_bridgeObjectRelease();
      }
    }
    if (!v10) {
      goto LABEL_57;
    }
LABEL_40:
    uint64_t v28 = v32;
    goto LABEL_41;
  }
  return result;
}

uint64_t sub_25F627B90@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (a1)
  {
    unint64_t v5 = a2 - (void)a1;
    if (a2 - (uint64_t)a1 >= 16)
    {
      if (*a1 == 0x5459504544415441)
      {
        unint64_t v7 = a1[1];
        if ((v7 & 0x8000000000000000) != 0)
        {
          sub_25F642D80();
          __break(1u);
        }
        else if (v5 >= v7)
        {
          uint64_t v8 = sub_25F627E98(v7, (uint64_t)a1, a2);
          uint64_t result = sub_25F629EB4(v8, v9, v10, v11);
          *a3 = result;
          a3[1] = v13;
          return result;
        }
        sub_25F642D20();
        sub_25F642B50();
        sub_25F62A0DC();
        sub_25F642CF0();
        sub_25F642B50();
        swift_bridgeObjectRelease();
        sub_25F642B50();
        sub_25F623B40();
        sub_25F642CF0();
        sub_25F642B50();
        swift_bridgeObjectRelease();
        sub_25F642B50();
      }
      else
      {
        sub_25F642D20();
        swift_bridgeObjectRelease();
        sub_25F62A0DC();
        sub_25F642CF0();
        sub_25F642B50();
        swift_bridgeObjectRelease();
        sub_25F642B50();
        sub_25F642CF0();
        sub_25F642B50();
        swift_bridgeObjectRelease();
      }
    }
  }
  uint64_t result = sub_25F642D90();
  __break(1u);
  return result;
}

uint64_t sub_25F627E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    if (a2)
    {
      if (a3 - a2 >= a1) {
        return 0;
      }
    }
    else if (!a1)
    {
      return 0;
    }
    sub_25F642DE0();
    __break(1u);
  }
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t sub_25F627F6C()
{
  uint64_t v1 = *v0;
  if (*v0 && v0[1] - v1 >= 16)
  {
    uint64_t v2 = *(void *)(v1 + 8);
    if ((v2 & 0x8000000000000000) == 0) {
      return v2 - 16;
    }
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.TypeData.type()()
{
  uint64_t v1 = sub_25F61FBE0(16, *v0, v0[1]);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v8 = sub_25F627F6C();
  uint64_t v9 = sub_25F62372C(v8, v1, v3, v5, v7);
  return sub_25F629EB4(v9, v10, v11, v12);
}

uint64_t sub_25F6280C8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  if (a1)
  {
    unint64_t v5 = a2 - (void)a1;
    if (a2 - (uint64_t)a1 >= 37)
    {
      if (*a1 == 0x434C4E5444415441)
      {
        unint64_t v7 = a1[1];
        if ((v7 & 0x8000000000000000) != 0)
        {
          sub_25F642D80();
          __break(1u);
        }
        else if (v5 >= v7)
        {
          uint64_t v8 = sub_25F627E98(v7, (uint64_t)a1, a2);
          uint64_t result = sub_25F629EB4(v8, v9, v10, v11);
          *a3 = result;
          a3[1] = v13;
          return result;
        }
        sub_25F642D20();
        sub_25F642B50();
        sub_25F62A0DC();
        sub_25F642CF0();
        sub_25F642B50();
        swift_bridgeObjectRelease();
        sub_25F642B50();
        sub_25F623B40();
        sub_25F642CF0();
        sub_25F642B50();
        swift_bridgeObjectRelease();
        sub_25F642B50();
      }
      else
      {
        sub_25F642D20();
        swift_bridgeObjectRelease();
        sub_25F62A0DC();
        sub_25F642CF0();
        sub_25F642B50();
        swift_bridgeObjectRelease();
        sub_25F642B50();
        sub_25F642CF0();
        sub_25F642B50();
        swift_bridgeObjectRelease();
      }
    }
  }
  uint64_t result = sub_25F642D90();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.Client.propertyName()()
{
  uint64_t v1 = *v0;
  if (!*v0 || (uint64_t v2 = v0[1], v2 - v1 < 37))
  {
    sub_25F642D90();
    __break(1u);
LABEL_11:
    uint64_t result = sub_25F642D80();
    __break(1u);
    return result;
  }
  uint64_t v3 = *(void *)(v1 + 21);
  if (v3 < 0) {
    goto LABEL_11;
  }
  if (!v3) {
    return 0;
  }
  uint64_t v7 = sub_25F61FBE0(37, v1, v2);
  uint64_t v8 = *(void *)(v1 + 21);
  if (v8 < 0) {
    goto LABEL_11;
  }
  uint64_t v9 = sub_25F62372C(v8, v7, v4, v5, v6);
  uint64_t result = sub_25F629EB4(v9, v10, v11, v12);
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t sub_25F62850C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_25F61FBE0(37, v1, v2);
  if (!v1 || v2 - v1 < 37)
  {
    sub_25F642D90();
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v7 = v3;
  uint64_t v8 = *(void *)(v1 + 21);
  if (v8 < 0)
  {
LABEL_8:
    uint64_t result = sub_25F642D80();
    __break(1u);
    return result;
  }
  uint64_t v9 = sub_25F61FBB4(v8, v7, v4, v5, v6);
  return sub_25F629EB4(v9, v10, v11, v12);
}

uint64_t ComponentInitDataReader.ClientBuffer.subscript.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v5 = v2[2];
  uint64_t v6 = sub_25F61FBE0(0, v3, v4);
  if (v5 < 1)
  {
LABEL_57:
    uint64_t v28 = 0;
    unint64_t v29 = 0xE000000000000000;
    sub_25F642D20();
    swift_bridgeObjectRelease();
    uint64_t v28 = 0xD00000000000001CLL;
    unint64_t v29 = 0x800000025F646590;
    sub_25F623B40();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
LABEL_58:
    sub_25F642D90();
    __break(1u);
LABEL_59:
    sub_25F642D80();
    __break(1u);
LABEL_60:
    sub_25F642DE0();
    __break(1u);
LABEL_61:
    sub_25F642D80();
    __break(1u);
  }
  else
  {
    uint64_t v10 = v6;
    if ((v6 & 0x8000000000000000) == 0)
    {
      uint64_t v11 = v7;
      uint64_t v12 = v8;
      uint64_t v13 = v9 - v8;
      if (v8) {
        uint64_t v14 = v9 - v8;
      }
      else {
        uint64_t v14 = 0;
      }
      BOOL v16 = v7 < 0 || v13 < v7;
      uint64_t v17 = a1;
      while (1)
      {
        if (v12)
        {
          if (v13 < v11) {
            goto LABEL_62;
          }
          BOOL v18 = (void *)(v12 + v10);
        }
        else
        {
          if (v11 > 0) {
            goto LABEL_62;
          }
          BOOL v18 = 0;
        }
        unint64_t v19 = v11 - v10;
        BOOL v20 = __OFSUB__(v11, v10);
        if ((v19 & 0x8000000000000000) != 0) {
          goto LABEL_62;
        }
        if (v19) {
          break;
        }
        if (v18) {
          goto LABEL_26;
        }
        uint64_t v21 = 0;
LABEL_27:
        uint64_t result = sub_25F6280C8(v18, v21, &v28);
        unint64_t v23 = v29;
        if (!v17)
        {
          *a2 = v28;
          a2[1] = v23;
          return result;
        }
        if (!v28 || (uint64_t)(v29 - v28) < 37) {
          goto LABEL_58;
        }
        unint64_t v24 = *(void *)(v28 + 8);
        if ((v24 & 0x8000000000000000) != 0) {
          goto LABEL_59;
        }
        if (v14 < 0) {
          goto LABEL_60;
        }
        if (v14 < v10) {
          goto LABEL_61;
        }
        if (v12)
        {
          if (v16) {
            goto LABEL_61;
          }
        }
        else if (v11)
        {
          goto LABEL_61;
        }
        if (v20)
        {
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_61;
        }
        uint64_t v25 = v11;
        if (v19 >= v24)
        {
          uint64_t v25 = v10 + v24;
          if (__OFADD__(v10, v24)) {
            goto LABEL_52;
          }
          if (v12)
          {
            if (v25 < 0 || v13 < v25) {
              goto LABEL_61;
            }
            if (v11 < (unint64_t)v25) {
              goto LABEL_63;
            }
          }
          else if (v25)
          {
            goto LABEL_61;
          }
        }
        if (v25 < v10) {
          goto LABEL_61;
        }
        --v17;
        uint64_t v10 = v25;
        if (!--v5) {
          goto LABEL_57;
        }
      }
      if (!v18) {
        goto LABEL_62;
      }
LABEL_26:
      uint64_t v21 = (uint64_t)v18 + v19;
      goto LABEL_27;
    }
  }
LABEL_62:
  sub_25F642DE0();
  __break(1u);
LABEL_63:
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

BOOL static ComponentInitDataReader.Component.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ComponentInitDataReader.Component.Error.hash(into:)()
{
  return sub_25F642EB0();
}

BOOL sub_25F628ABC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ComponentInitDataReader.Component.identifier()()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_25F61FBE0(48, v1, v2);
  if (v1 && v2 - v1 >= 48)
  {
    uint64_t v7 = v3;
    uint64_t v8 = *(void *)(v1 + 16);
    if ((v8 & 0x8000000000000000) == 0)
    {
      uint64_t v9 = sub_25F62372C(v8, v7, v4, v5, v6);
      return sub_25F629EB4(v9, v10, v11, v12);
    }
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t sub_25F628BF0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_25F61FBE0(48, v1, v2);
  if (!v1 || v2 - v1 < 48)
  {
    sub_25F642D90();
    __break(1u);
LABEL_9:
    uint64_t result = sub_25F642D80();
    __break(1u);
    return result;
  }
  uint64_t v7 = v3;
  uint64_t v8 = *(void *)(v1 + 16);
  if (v8 < 0) {
    goto LABEL_9;
  }
  uint64_t v12 = sub_25F61FBB4(v8, v7, v4, v5, v6);
  uint64_t v13 = *(void *)(v1 + 24);
  if (v13 < 0) {
    goto LABEL_9;
  }
  uint64_t v14 = sub_25F62372C(v13, v12, v9, v10, v11);
  return sub_25F629EB4(v14, v15, v16, v17);
}

uint64_t ComponentInitDataReader.Component.clients.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  if (*v1 && v1[1] - v3 >= 48)
  {
    uint64_t v4 = *(void *)(v3 + 32);
    if ((v4 & 0x8000000000000000) == 0)
    {
      uint64_t result = sub_25F628BF0();
      *a1 = result;
      a1[1] = v6;
      a1[2] = v4;
      return result;
    }
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.ComponentBuffer.count.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t ComponentInitDataReader.ComponentBuffer.subscript.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *v2;
  uint64_t v6 = v2[1];
  uint64_t v7 = v2[2];
  uint64_t result = sub_25F61FBE0(0, v5, v6);
  if (v7 < 1)
  {
LABEL_46:
    sub_25F642D20();
    sub_25F623B40();
    sub_25F642CF0();
    swift_bridgeObjectRelease();
    sub_25F642B50();
    while (1)
    {
LABEL_57:
      sub_25F642D90();
      __break(1u);
    }
  }
  if (result < 0)
  {
LABEL_52:
    sub_25F642DE0();
    __break(1u);
LABEL_53:
    char v22 = 1;
    goto LABEL_56;
  }
  uint64_t v12 = v11 - v10;
  if (v10) {
    uint64_t v13 = v11 - v10;
  }
  else {
    uint64_t v13 = 0;
  }
  BOOL v15 = v9 < 0 || v12 < v9;
  uint64_t v16 = a1;
  while (1)
  {
    if (v10)
    {
      if (v12 < v9) {
        goto LABEL_52;
      }
      uint64_t v17 = (void *)(v10 + result);
    }
    else
    {
      if (v9 > 0) {
        goto LABEL_52;
      }
      uint64_t v17 = 0;
    }
    unint64_t v18 = v9 - result;
    BOOL v19 = __OFSUB__(v9, result);
    if ((v18 & 0x8000000000000000) != 0) {
      goto LABEL_52;
    }
    if (!v18) {
      goto LABEL_51;
    }
    if (!v17) {
      goto LABEL_52;
    }
    if (v18 < 0x30)
    {
LABEL_51:
      char v22 = 0;
LABEL_56:
      sub_25F62A034();
      swift_allocError();
      *unint64_t v23 = v22;
      swift_willThrow();
      sub_25F642D20();
      sub_25F642B50();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF848);
      sub_25F642D70();
      goto LABEL_57;
    }
    if (*v17 != 0x434F4D5044415441) {
      goto LABEL_53;
    }
    unint64_t v20 = v17[1];
    if ((v20 & 0x8000000000000000) != 0)
    {
      sub_25F642D80();
      __break(1u);
LABEL_55:
      char v22 = 2;
      goto LABEL_56;
    }
    if (v18 < v20) {
      goto LABEL_55;
    }
    if (!v16)
    {
      *a2 = v17;
      a2[1] = (char *)v17 + v20;
      return result;
    }
    if (v20 <= 0x2F) {
      goto LABEL_57;
    }
    if (v13 < 0) {
      break;
    }
    if (v13 < result) {
      goto LABEL_61;
    }
    if (v10)
    {
      if (v15) {
        goto LABEL_61;
      }
    }
    else if (v9)
    {
      goto LABEL_61;
    }
    if (v19)
    {
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_61;
    }
    uint64_t v21 = result + v20;
    if (__OFADD__(result, v20)) {
      goto LABEL_49;
    }
    if (v10)
    {
      if (v21 < 0 || v12 < v21) {
        goto LABEL_61;
      }
    }
    else if (v21)
    {
      goto LABEL_61;
    }
    if (v9 < (unint64_t)v21) {
      goto LABEL_60;
    }
    if (v21 < result) {
      goto LABEL_61;
    }
    --v16;
    result += v20;
    if (!--v7) {
      goto LABEL_46;
    }
  }
  sub_25F642DE0();
  __break(1u);
LABEL_60:
  sub_25F642D80();
  __break(1u);
LABEL_61:
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.Error.description.getter()
{
  unint64_t v1 = 0x64696C61766E692ELL;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000010;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x696146646E69622ELL;
  }
}

uint64_t sub_25F629390()
{
  unint64_t v1 = 0x64696C61766E692ELL;
  if (*v0 != 1) {
    unint64_t v1 = 0xD000000000000010;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x696146646E69622ELL;
  }
}

void *ComponentInitDataReader.init(start:count:)@<X0>(void *result@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = (void *)sub_25F642DE0();
    __break(1u);
  }
  else
  {
    if (a2 >= 0x20)
    {
      if (*result == 0x494E495444415441)
      {
        if (result[1] == a2)
        {
          *a3 = result;
          a3[1] = (char *)result + a2;
          return result;
        }
        char v3 = 2;
      }
      else
      {
        char v3 = 1;
      }
    }
    else
    {
      char v3 = 0;
    }
    sub_25F62A088();
    swift_allocError();
    char *v4 = v3;
    return (void *)swift_willThrow();
  }
  return result;
}

uint64_t sub_25F6294F8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_25F61FBE0(32, v1, v2);
  if (!v1 || v2 - v1 < 32)
  {
LABEL_7:
    sub_25F642D90();
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v7 = *(void *)(v1 + 16);
  if ((v7 & 0x8000000000000000) == 0)
  {
    if ((unsigned __int128)(v7 * (__int128)24) >> 64 == (24 * v7) >> 63)
    {
      uint64_t v8 = sub_25F62372C(24 * v7, v3, v4, v5, v6);
      return sub_25F629EB4(v8, v9, v10, v11);
    }
    __break(1u);
    goto LABEL_7;
  }
LABEL_8:
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.endpointCount.getter()
{
  uint64_t v1 = *v0;
  if (!*v0 || v0[1] - v1 < 32)
  {
    sub_25F642D90();
    __break(1u);
    goto LABEL_6;
  }
  uint64_t result = *(void *)(v1 + 16);
  if (result < 0)
  {
LABEL_6:
    uint64_t result = sub_25F642D80();
    __break(1u);
  }
  return result;
}

uint64_t ComponentInitDataReader.totalClientCount.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  *(void *)&long long v8 = *v0;
  *((void *)&v8 + 1) = v2;
  uint64_t result = ComponentInitDataReader.components.getter((uint64_t *)&v11);
  uint64_t v4 = v12;
  if ((v12 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    if (!v12) {
      return v5;
    }
    uint64_t v6 = 0;
    while (1)
    {
      *(void *)&long long v8 = v1;
      *((void *)&v8 + 1) = v2;
      ComponentInitDataReader.components.getter((uint64_t *)&v11);
      long long v8 = v11;
      uint64_t v9 = v12;
      ComponentInitDataReader.ComponentBuffer.subscript.getter(v6, &v10);
      uint64_t result = ComponentInitDataReader.Component.clients.getter((uint64_t *)&v8);
      BOOL v7 = __OFADD__(v5, v9);
      v5 += v9;
      if (v7) {
        break;
      }
      if (v4 == ++v6) {
        return v5;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.components.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  if (*v1 && v1[1] - v3 >= 32)
  {
    uint64_t v4 = *(void *)(v3 + 24);
    if ((v4 & 0x8000000000000000) == 0)
    {
      uint64_t result = sub_25F629B88();
      *a1 = result;
      a1[1] = v6;
      a1[2] = v4;
      return result;
    }
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
  uint64_t result = sub_25F642D80();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.totalTypesCount.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  *(void *)&long long v14 = *v0;
  *((void *)&v14 + 1) = v2;
  uint64_t result = ComponentInitDataReader.components.getter((uint64_t *)&v16);
  uint64_t v4 = v17;
  if ((v17 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = 0;
    if (!v17) {
      return v5;
    }
    uint64_t v6 = 0;
    while (1)
    {
      *(void *)&long long v14 = v1;
      *((void *)&v14 + 1) = v2;
      ComponentInitDataReader.components.getter((uint64_t *)&v16);
      long long v14 = v16;
      uint64_t v15 = v17;
      ComponentInitDataReader.ComponentBuffer.subscript.getter(v6, &v10);
      long long v13 = v10;
      uint64_t result = ComponentInitDataReader.Component.clients.getter((uint64_t *)&v14);
      uint64_t v7 = v15;
      if (v15 < 0) {
        break;
      }
      if (v15)
      {
        uint64_t v8 = 0;
        while (1)
        {
          *(void *)&long long v14 = v1;
          *((void *)&v14 + 1) = v2;
          ComponentInitDataReader.components.getter((uint64_t *)&v16);
          long long v14 = v16;
          uint64_t v15 = v17;
          ComponentInitDataReader.ComponentBuffer.subscript.getter(v6, &v13);
          long long v10 = v13;
          ComponentInitDataReader.Component.clients.getter((uint64_t *)&v14);
          long long v10 = v14;
          uint64_t v11 = v15;
          ComponentInitDataReader.ClientBuffer.subscript.getter(v8, &v12);
          uint64_t result = ComponentInitDataReader.Client.types.getter((uint64_t *)&v10);
          BOOL v9 = __OFADD__(v5, v11);
          v5 += v11;
          if (v9) {
            break;
          }
          if (v7 == ++v8) {
            goto LABEL_4;
          }
        }
        __break(1u);
        break;
      }
LABEL_4:
      if (++v6 == v4) {
        return v5;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.endpoint(at:)@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (*(void *)(sub_25F6294F8() + 24 * a1) == 0x454E445044415441)
  {
    uint64_t v4 = 24 * a1;
    uint64_t v5 = *(void *)(sub_25F6294F8() + v4 + 8);
    uint64_t result = sub_25F6294F8();
    uint64_t v7 = *(void *)(result + v4 + 16);
    *a2 = v5;
    a2[1] = v7;
  }
  else
  {
    sub_25F642D20();
    swift_bridgeObjectRelease();
    sub_25F62A0DC();
    sub_25F642CF0();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F629B88()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = sub_25F61FBE0(32, v1, v2);
  if (!v1 || v2 - v1 < 32) {
    goto LABEL_9;
  }
  uint64_t v7 = *(void *)(v1 + 16);
  if (v7 < 0)
  {
LABEL_10:
    uint64_t result = sub_25F642D80();
    __break(1u);
    return result;
  }
  if ((unsigned __int128)(v7 * (__int128)24) >> 64 != (24 * v7) >> 63)
  {
    __break(1u);
LABEL_9:
    sub_25F642D90();
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v8 = sub_25F61FBB4(24 * v7, v3, v4, v5, v6);
  return sub_25F629EB4(v8, v9, v10, v11);
}

uint64_t sub_25F629CBC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_25F629CDC(a1, a2, a3, *v3);
  char *v3 = (char *)result;
  return result;
}

uint64_t sub_25F629CDC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF878);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  long long v13 = v10 + 32;
  long long v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_25F642DE0();
  __break(1u);
  return result;
}

char *sub_25F629E3C(uint64_t a1)
{
  return sub_25F6300B8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_25F629E50(uint64_t result, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  if (a2 != a4) {
    return 0;
  }
  if (a2 < 0)
  {
    __break(1u);
    return result;
  }
  if (!a2) {
    return 1;
  }
  if (*(unsigned __int8 *)result != *a3) {
    return 0;
  }
  uint64_t v4 = (unsigned __int8 *)(result + 1);
  uint64_t v5 = a3 + 1;
  uint64_t v6 = a2 - 1;
  do
  {
    uint64_t result = v6 == 0;
    if (!v6) {
      break;
    }
    int v8 = *v4++;
    int v7 = v8;
    int v9 = *v5++;
    --v6;
  }
  while (v7 == v9);
  return result;
}

uint64_t sub_25F629EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 < 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    if (a4 - a3 < a2) {
      goto LABEL_12;
    }
    uint64_t result = a3 + a1;
    uint64_t v7 = a2 - a1;
    BOOL v6 = v7 == 0;
    if (v7 < 0) {
      goto LABEL_12;
    }
  }
  else
  {
    if (a2 > 0) {
      goto LABEL_12;
    }
    uint64_t result = 0;
    uint64_t v8 = a2 - a1;
    BOOL v6 = v8 == 0;
    if (v8 < 0) {
      goto LABEL_12;
    }
  }
  if (!v6 && !result)
  {
LABEL_12:
    uint64_t result = sub_25F642DE0();
    __break(1u);
  }
  return result;
}

unint64_t sub_25F629FE0()
{
  unint64_t result = qword_26A7AF838;
  if (!qword_26A7AF838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF838);
  }
  return result;
}

unint64_t sub_25F62A034()
{
  unint64_t result = qword_26A7AF840;
  if (!qword_26A7AF840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF840);
  }
  return result;
}

unint64_t sub_25F62A088()
{
  unint64_t result = qword_26A7AF850;
  if (!qword_26A7AF850)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF850);
  }
  return result;
}

unint64_t sub_25F62A0DC()
{
  unint64_t result = qword_26A7AF858;
  if (!qword_26A7AF858)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF858);
  }
  return result;
}

unint64_t sub_25F62A134()
{
  unint64_t result = qword_26A7AF860;
  if (!qword_26A7AF860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF860);
  }
  return result;
}

unint64_t sub_25F62A18C()
{
  unint64_t result = qword_26A7AF868;
  if (!qword_26A7AF868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF868);
  }
  return result;
}

unint64_t sub_25F62A1E4()
{
  unint64_t result = qword_26A7AF870;
  if (!qword_26A7AF870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF870);
  }
  return result;
}

ValueMetadata *type metadata accessor for EndpointTuple()
{
  return &type metadata for EndpointTuple;
}

uint64_t destroy for ComponentInitDataBuilder()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s9Tightbeam24ComponentInitDataBuilderVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ComponentInitDataBuilder(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for ComponentInitDataBuilder(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder()
{
  return &type metadata for ComponentInitDataBuilder;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ComponentInitDataBuilder.Error(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25F62A55CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_25F62A584(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_25F62A590(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Error()
{
  return &type metadata for ComponentInitDataBuilder.Error;
}

void *initializeBufferWithCopyOfBuffer for ComponentInitDataBuilder.TypeData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ComponentInitDataBuilder.TypeData()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for ComponentInitDataBuilder.TypeData(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for ComponentInitDataBuilder.TypeData(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.TypeData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder.TypeData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.TypeData()
{
  return &type metadata for ComponentInitDataBuilder.TypeData;
}

uint64_t destroy for ComponentInitDataBuilder.Client()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComponentInitDataBuilder.Client(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ComponentInitDataBuilder.Client(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_WORD *)(a1 + 6) = *(_WORD *)(a2 + 6);
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComponentInitDataBuilder.Client(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_DWORD *)(a1 + 6) = *(_DWORD *)(a2 + 6);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.Client(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder.Client(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Client()
{
  return &type metadata for ComponentInitDataBuilder.Client;
}

uint64_t destroy for ComponentInitDataBuilder.Component()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ComponentInitDataBuilder.Component(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ComponentInitDataBuilder.Component(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComponentInitDataBuilder.Component(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(void *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.Component(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder.Component(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Component()
{
  return &type metadata for ComponentInitDataBuilder.Component;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Endpoint()
{
  return &type metadata for ComponentInitDataBuilder.Endpoint;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader()
{
  return &type metadata for ComponentInitDataReader;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.TypeData()
{
  return &type metadata for ComponentInitDataReader.TypeData;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.TypeBuffer()
{
  return &type metadata for ComponentInitDataReader.TypeBuffer;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Client()
{
  return &type metadata for ComponentInitDataReader.Client;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.ClientBuffer()
{
  return &type metadata for ComponentInitDataReader.ClientBuffer;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Component()
{
  return &type metadata for ComponentInitDataReader.Component;
}

unsigned char *sub_25F62AB90(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Component.Error()
{
  return &type metadata for ComponentInitDataReader.Component.Error;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataReader.ComponentBuffer(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataReader.ComponentBuffer(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.ComponentBuffer()
{
  return &type metadata for ComponentInitDataReader.ComponentBuffer;
}

uint64_t _s9Tightbeam23ComponentInitDataReaderV9ComponentV5ErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s9Tightbeam23ComponentInitDataReaderV9ComponentV5ErrorOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25F62AD60);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Error()
{
  return &type metadata for ComponentInitDataReader.Error;
}

ValueMetadata *type metadata accessor for _StaticString()
{
  return &type metadata for _StaticString;
}

ValueMetadata *type metadata accessor for EveIncomingMessageBuffer()
{
  return &type metadata for EveIncomingMessageBuffer;
}

ValueMetadata *type metadata accessor for EveMessageID()
{
  return &type metadata for EveMessageID;
}

uint64_t sub_25F62AE04()
{
  return 24;
}

uint64_t sub_25F62AE0C()
{
  return sub_25F642ED0();
}

uint64_t sub_25F62AE68()
{
  return sub_25F642EC0();
}

uint64_t sub_25F62AEA4()
{
  return sub_25F642ED0();
}

BOOL sub_25F62AEFC(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

unint64_t sub_25F62AF18()
{
  unint64_t result = qword_26A7AF880;
  if (!qword_26A7AF880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF880);
  }
  return result;
}

uint64_t sub_25F62AF6C()
{
  uint64_t v2 = *v1;
  unint64_t v3 = *(void *)(*v1 + 16);
  if (v3 >= 0x18)
  {
    unint64_t v4 = *(void *)(v2 + 32);
    if (v3 >= v4)
    {
      unint64_t v5 = v4 - 24;
      if (v4 < 0x18)
      {
        __break(1u);
        goto LABEL_22;
      }
      uint64_t v0 = *(void *)(v2 + 40);
      uint64_t v7 = sub_25F61FF68(*(void *)(v2 + 32), *v1);
      uint64_t v8 = v6;
      uint64_t v19 = v9;
      unint64_t v11 = v10;
      if (v10)
      {
        uint64_t v18 = v6;
        sub_25F642E20();
        swift_unknownObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v13 = swift_dynamicCastClass();
        if (!v13)
        {
          swift_unknownObjectRelease();
          uint64_t v13 = MEMORY[0x263F8EE78];
        }
        uint64_t v14 = *(void *)(v13 + 16);
        swift_release();
        if (__OFSUB__(v11 >> 1, v19))
        {
          __break(1u);
        }
        else if (v14 == (v11 >> 1) - v19)
        {
          uint64_t v12 = swift_dynamicCastClass();
          unint64_t v5 = v4 - 24;
          if (!v12)
          {
            swift_unknownObjectRelease();
            uint64_t v12 = MEMORY[0x263F8EE78];
          }
LABEL_14:
          swift_unknownObjectRelease();
          *uint64_t v1 = v12;
          sub_25F642E20();
          swift_unknownObjectRetain_n();
          uint64_t v15 = swift_dynamicCastClass();
          if (!v15)
          {
            swift_bridgeObjectRelease();
            uint64_t v15 = MEMORY[0x263F8EE78];
          }
          uint64_t v16 = *(void *)(v15 + 16);
          swift_release();
          if (v16 == v5)
          {
            if (!swift_dynamicCastClass()) {
              swift_bridgeObjectRelease();
            }
            goto LABEL_19;
          }
LABEL_22:
          swift_bridgeObjectRelease();
          sub_25F62B184(v2, v2 + 32, 24, (2 * v4) | 1);
LABEL_19:
          swift_bridgeObjectRelease();
          return v0;
        }
        swift_unknownObjectRelease();
        uint64_t v8 = v18;
        unint64_t v5 = v4 - 24;
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      uint64_t v12 = sub_25F62B184(v7, v8, v19, v11);
      goto LABEL_14;
    }
  }
  return 0;
}

uint64_t sub_25F62B184(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  int64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x263F8EE78];
    }
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x263F8EE78];
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0) {
          goto LABEL_17;
        }
        unint64_t v10 = v8 + 4;
        if (a2 + a3 < (unint64_t)v8 + v5 + 32 && (unint64_t)v10 < a2 + a3 + v5) {
          goto LABEL_17;
        }
        memcpy(v10, (const void *)(a2 + a3), v5);
        return (uint64_t)v8;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF888);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * v9 - 64;
      if (v4 != a3) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  uint64_t result = sub_25F642DE0();
  __break(1u);
  return result;
}

uint64_t sub_25F62B2E0()
{
  uint64_t v0 = sub_25F642C50();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  unint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_25F642C40();
  MEMORY[0x270FA5388](v4);
  uint64_t v5 = sub_25F642A70();
  MEMORY[0x270FA5388](v5 - 8);
  sub_25F62530C();
  sub_25F642A60();
  v7[1] = MEMORY[0x263F8EE78];
  sub_25F62534C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF828);
  sub_25F6253A4();
  sub_25F642D00();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x263F8F130], v0);
  uint64_t result = sub_25F642C70();
  qword_26A7AF890 = result;
  return result;
}

void *sub_25F62B4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  v45[5] = *(id *)MEMORY[0x263EF8340];
  uint64_t v12 = sub_25F6427D0();
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v40 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(qword_26A7AF898);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (uint64_t *)((char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = MEMORY[0x263F8EE78];
  v7[14] = a2;
  v7[15] = v17;
  v7[13] = a1;
  uint64_t v43 = a3;
  uint64_t v41 = v7 + 7;
  sub_25F625294(a3, (uint64_t)(v7 + 7));
  uint64_t v42 = a4;
  unint64_t v37 = v7 + 2;
  sub_25F625294(a4, (uint64_t)(v7 + 2));
  uint64_t v18 = self;
  swift_bridgeObjectRetain();
  id v19 = objc_msgSend(v18, sel_defaultManager);
  uint64_t v38 = a1;
  unint64_t v20 = (void *)sub_25F642AC0();
  v45[0] = 0;
  LODWORD(a1) = objc_msgSend(v19, sel_removeItemAtPath_error_, v20, v45);

  if (a1)
  {
    id v21 = v45[0];
  }
  else
  {
    id v22 = v45[0];
    uint64_t v23 = sub_25F6426B0();

    swift_willThrow();
    MEMORY[0x2611FA2B0](v23);
    uint64_t v6 = 0;
  }
  uint64_t v39 = v6;
  sub_25F642970();
  sub_25F642960();
  if (qword_26A7AF720 != -1) {
    swift_once();
  }
  sub_25F6429E0();
  swift_allocObject();
  swift_retain();
  uint64_t v24 = sub_25F6429D0();
  sub_25F642940();
  swift_retain();
  uint64_t v25 = (void (*)(id *, void))sub_25F642930();
  if (*v26 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_25F642DA0();
    swift_bridgeObjectRelease();
    if (v36 < 0)
    {
      __break(1u);
      goto LABEL_14;
    }
  }
  sub_25F624900(0, 0, v24);
  v25(v45, 0);
  swift_release();
  *uint64_t v16 = v38;
  v16[1] = a2;
  uint64_t v27 = *MEMORY[0x263F14100];
  uint64_t v28 = sub_25F6427E0();
  uint64_t v29 = *(void *)(v28 - 8);
  (*(void (**)(void *, uint64_t, uint64_t))(v29 + 104))(v16, v27, v28);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v29 + 56))(v16, 0, 1, v28);
  sub_25F642950();
  swift_retain();
  sub_25F6427C0();
  sub_25F642840();
  swift_allocObject();
  uint64_t v30 = v39;
  uint64_t v31 = sub_25F642830();
  if (!v30)
  {
    v7[12] = v31;
    uint64_t v32 = (void *)*__swift_project_boxed_opaque_existential_1(v41, v7[10]);
    v45[3] = (id)type metadata accessor for UnixTransportService();
    v45[4] = &off_270BAD898;
    v45[0] = v32;
    sub_25F625294((uint64_t)v45, (uint64_t)v44);
    uint64_t v33 = swift_allocObject();
    sub_25F62BF40(v44, v33 + 16);
    swift_retain();
    swift_retain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
    sub_25F6252FC((uint64_t)sub_25F62BF58);
    sub_25F6427F0();
    swift_release();
    swift_release();
    swift_retain();
    swift_retain();
    sub_25F6252FC((uint64_t)sub_25F62BF60);
    sub_25F642800();
    swift_release();
    swift_release();
    if (qword_26A7AF708 == -1)
    {
LABEL_10:
      sub_25F642820();
      swift_release();
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v42);
      __swift_destroy_boxed_opaque_existential_1(v43);
      return v7;
    }
LABEL_14:
    swift_once();
    goto LABEL_10;
  }
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v42);
  __swift_destroy_boxed_opaque_existential_1(v43);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for UnixListener();
  swift_deallocPartialClassInstance();
  return v7;
}

uint64_t sub_25F62BA94(uint64_t a1)
{
  uint64_t v2 = sub_25F642810();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  int v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x263F14148])
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
LABEL_4:
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_25F642D20();
    sub_25F642B50();
    sub_25F642D70();
    sub_25F623FD8();
    return swift_bridgeObjectRelease();
  }
  if (v6 == *MEMORY[0x263F14158]) {
    goto LABEL_4;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_25F62BC44(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v2[13];
  uint64_t v5 = v2[14];
  sub_25F625294((uint64_t)(v2 + 2), (uint64_t)v16);
  type metadata accessor for UnixProtocolConnection();
  int v6 = (void *)swift_allocObject();
  uint64_t v7 = v17;
  uint64_t v8 = v18;
  uint64_t v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v17);
  MEMORY[0x270FA5388](v9);
  unint64_t v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(unsigned char *))(v12 + 16))(v11);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_25F624BEC(v4, v5, (uint64_t)v11, a1, v6, v7, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  uint64_t v13 = swift_beginAccess();
  MEMORY[0x2611F9A20](v13);
  if (*(void *)((v2[15] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v2[15] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_25F642BF0();
  }
  sub_25F642C10();
  sub_25F642BE0();
  return swift_endAccess();
}

uint64_t UnixListener.deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t UnixListener.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 128, 7);
}

uint64_t type metadata accessor for UnixListener()
{
  return self;
}

uint64_t method lookup function for UnixListener(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for UnixListener);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_25F62BF08()
{
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_25F62BF40(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_25F62BF58(uint64_t a1)
{
  return sub_25F62BA94(a1);
}

uint64_t sub_25F62BF64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t getEnumTagSinglePayload for ComponentRuntimeLock(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntimeLock(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for _UnsafeMutableBufferPointer()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_25F62C034(uint64_t a1, unint64_t a2)
{
  int v3 = v2;
  uint64_t v6 = sub_25F642760();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v29[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_32;
      }
      uint64_t v10 = HIDWORD(a1) - (int)a1;
LABEL_6:
      uint64_t v13 = *v3;
      int64_t v14 = *((void *)*v3 + 2);
      int64_t v15 = v14 + v10;
      if (__OFADD__(v14, v10))
      {
        __break(1u);
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }
      isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
      char *v3 = v13;
      if (!isUniquelyReferenced_nonNull_native || (int64_t v17 = *((void *)v13 + 3) >> 1, v17 < v15))
      {
        if (v14 <= v15) {
          int64_t v18 = v14 + v10;
        }
        else {
          int64_t v18 = v14;
        }
        uint64_t v13 = sub_25F6300B8(isUniquelyReferenced_nonNull_native, v18, 1, v13);
        char *v3 = v13;
        int64_t v17 = *((void *)v13 + 3) >> 1;
      }
      uint64_t v19 = v17 - *((void *)v13 + 2);
      sub_25F6254F8(a1, a2);
      uint64_t v20 = sub_25F642730();
      sub_25F625550(a1, a2);
      sub_25F625550(a1, a2);
      if (v20 < v10) {
        goto LABEL_20;
      }
      if (v20 >= 1)
      {
        uint64_t v21 = *((void *)v13 + 2);
        BOOL v22 = __OFADD__(v21, v20);
        uint64_t v23 = v21 + v20;
        if (v22)
        {
          __break(1u);
LABEL_32:
          __break(1u);
LABEL_33:
          __break(1u);
          JUMPOUT(0x25F62C324);
        }
        *((void *)v13 + 2) = v23;
      }
      if (v20 == v19)
      {
LABEL_21:
        int64_t v25 = *((void *)v13 + 2);
        sub_25F632FC0((unint64_t *)&qword_26A7AF950, MEMORY[0x263F06F40]);
        sub_25F642CB0();
        if (v30) {
          return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
        }
        while (1)
        {
          unint64_t v26 = *((void *)v13 + 3);
          int64_t v27 = v26 >> 1;
          if ((uint64_t)(v26 >> 1) >= v25 + 1) {
            break;
          }
          uint64_t v13 = sub_25F6300B8((char *)(v26 > 1), v25 + 1, 1, v13);
          char *v3 = v13;
          char v28 = v30;
          int64_t v27 = *((void *)v13 + 3) >> 1;
          if ((v30 & 1) == 0) {
            goto LABEL_26;
          }
LABEL_23:
          *((void *)v13 + 2) = v25;
          if (v28) {
            return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
          }
        }
        char v28 = 0;
        do
        {
LABEL_26:
          if (v25 >= v27) {
            break;
          }
          v13[v25++ + 32] = v29[14];
          sub_25F642CB0();
          char v28 = v30;
        }
        while ((v30 & 1) == 0);
        goto LABEL_23;
      }
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
    case 2uLL:
      uint64_t v12 = *(void *)(a1 + 16);
      uint64_t v11 = *(void *)(a1 + 24);
      uint64_t v10 = v11 - v12;
      if (!__OFSUB__(v11, v12)) {
        goto LABEL_6;
      }
      goto LABEL_33;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v10 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_25F62C334()
{
  sub_25F62FF74(v0 + OBJC_IVAR____TtC9Tightbeam15EveEndpointData_baseURL);
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_25F62C398()
{
  type metadata accessor for EveTransportCoordinator();
  uint64_t v0 = swift_allocObject();
  unint64_t v1 = sub_25F62C404(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF9A0);
  uint64_t result = swift_allocObject();
  *(_DWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *(void *)(result + 16) = v1;
  *(void *)(v0 + 16) = result;
  qword_26A7B09E8 = v0;
  return result;
}

unint64_t sub_25F62C404(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF9A8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF980);
  uint64_t v6 = sub_25F642DD0();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_25F633008(v12, (uint64_t)v5, &qword_26A7AF9A8);
    unint64_t result = sub_25F6307A4((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_25F642710();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    *(void *)(v7[7] + 8 * v16) = *(void *)&v5[v9];
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    void v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_25F62C5F8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF970);
  uint64_t v2 = sub_25F642DD0();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_25F633008(v6, (uint64_t)&v13, &qword_26A7AF978);
    uint64_t v7 = v13;
    unint64_t result = sub_25F630900(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_25F632F6C(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_25F62C728@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = sub_25F642710();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  if (*(void *)(*a1 + 16) && (unint64_t v11 = sub_25F6307A4(a2), (v12 & 1) != 0))
  {
    *a3 = *(void *)(*(void *)(v10 + 56) + 8 * v11);
    return swift_retain();
  }
  else
  {
    long long v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v14(v9, a2, v6);
    type metadata accessor for EveTransportManager(0);
    uint64_t v15 = swift_allocObject();
    uint64_t v18 = a3;
    uint64_t v16 = v15;
    sub_25F62DD90((uint64_t)v9);
    v14(v9, a2, v6);
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *a1;
    *a1 = 0x8000000000000000;
    sub_25F631A18(v16, (uint64_t)v9, isUniquelyReferenced_nonNull_native);
    *a1 = v19;
    swift_bridgeObjectRelease();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t *v18 = v16;
  }
  return result;
}

uint64_t sub_25F62C8EC()
{
  return sub_25F62F9BC(24);
}

uint64_t sub_25F62C8F4()
{
  uint64_t v0 = sub_25F6427A0();
  __swift_allocate_value_buffer(v0, qword_26A7AF920);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A7AF920);
  return sub_25F642790();
}

uint64_t sub_25F62C974(uint64_t a1)
{
  *(_DWORD *)(v1 + 32) = 0;
  *(unsigned char *)(v1 + 36) = 1;
  *(void *)(v1 + 16) = dispatch_semaphore_create(0);
  type metadata accessor for TightbeamMessage();
  uint64_t v3 = (void *)swift_allocObject();
  v3[3] = 0;
  v3[4] = 0;
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    uint64_t v5 = transport_buffer;
    type metadata accessor for TransportBuffer();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)(v6 + 32) = 0;
    *(void *)(v6 + 16) = v5;
    *(unsigned char *)(v6 + 40) = 1;
    v3[3] = a1;
    v3[4] = v6;
    v3[2] = 0xC000000000000000;
    *(void *)(v1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
    *(_DWORD *)(v1 + 32) = 0;
    *(unsigned char *)(v1 + 36) = 1;
    return v1;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F62CA78()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 37, 7);
}

uint64_t sub_25F62CAB8()
{
  sub_25F6428F0();
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = v1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    int64_t v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v12 >= v6) {
      goto LABEL_21;
    }
    unint64_t v13 = *(void *)(v2 + 8 * v12);
    ++v8;
    if (!v13)
    {
      int64_t v8 = v12 + 1;
      if (v12 + 1 >= v6) {
        goto LABEL_21;
      }
      unint64_t v13 = *(void *)(v2 + 8 * v8);
      if (!v13)
      {
        int64_t v8 = v12 + 2;
        if (v12 + 2 >= v6) {
          goto LABEL_21;
        }
        unint64_t v13 = *(void *)(v2 + 8 * v8);
        if (!v13) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v10 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_5:
    uint64_t v11 = *(void *)(*(void *)(v1 + 56) + 8 * v10);
    *(_DWORD *)(v11 + 32) = 4;
    *(unsigned char *)(v11 + 36) = 0;
    swift_retain();
    sub_25F642C90();
    uint64_t result = swift_release();
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v6)
  {
LABEL_21:
    swift_release();
    *(void *)(v0 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = sub_25F6326C8(MEMORY[0x263F8EE78]);
    return swift_bridgeObjectRelease();
  }
  unint64_t v13 = *(void *)(v2 + 8 * v14);
  if (v13)
  {
    int64_t v8 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v8 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v8 >= v6) {
      goto LABEL_21;
    }
    unint64_t v13 = *(void *)(v2 + 8 * v8);
    ++v14;
    if (v13) {
      goto LABEL_20;
    }
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_25F62CC68()
{
  uint64_t v0 = sub_25F6428C0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v2);
  int64_t v6 = (char *)&v10 - v5;
  sub_25F6428E0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x263F14200], v0);
  char v7 = MEMORY[0x2611F9700](v6, v4);
  int64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v8)(v6, v0);
  if (v7)
  {
    swift_allocObject();
    swift_weakInit();
    swift_retain();
    sub_25F642900();
    return swift_release_n();
  }
  return result;
}

uint64_t sub_25F62CE0C(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_25F62D62C(a1, a2, a4 & 1);
    return swift_release();
  }
  return result;
}

uint64_t sub_25F62CE98(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_25F642870();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  int64_t v8 = (uint64_t (**)(uint64_t))((char *)&v26[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void *)(v2 + 40);
  if (v9 == -1)
  {
    __break(1u);
    goto LABEL_16;
  }
  *(void *)(v2 + 40) = v9 + 1;
  if (a1 < 0)
  {
LABEL_20:
    sub_25F642D80();
    __break(1u);
LABEL_21:
    uint64_t result = sub_25F642D90();
    __break(1u);
    return result;
  }
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v26[0] = *(void *)(v2 + 24);
  *(void *)(v2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0x8000000000000000;
  sub_25F631BC0(a2, a1, v9, isUniquelyReferenced_nonNull_native);
  *(void *)(v2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v26[0];
  swift_bridgeObjectRelease();
  swift_endAccess();
  uint64_t v11 = *(void *)(*(void *)(a2 + 24) + 32);
  if (!v11) {
    goto LABEL_21;
  }
  if (*(unsigned __int8 *)(v11 + 40) >= 2u) {
    goto LABEL_21;
  }
  uint64_t v12 = *(void *)(v11 + 16);
  uint64_t v13 = *(void *)(v12 + 16);
  if (*(void *)(v12 + 24) < v13) {
    goto LABEL_21;
  }
  if (v13 < 0)
  {
LABEL_19:
    sub_25F642DE0();
    __break(1u);
    goto LABEL_20;
  }
  if (*(uint64_t *)(v12 + 32) < 24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_21;
  }
  int64_t v14 = *(void **)v12;
  *int64_t v14 = v13;
  v14[1] = a1;
  void v14[2] = v9;
  if (*(unsigned __int8 *)(v11 + 40) >= 2u) {
    goto LABEL_21;
  }
  uint64_t v15 = *(uint64_t **)(v11 + 16);
  uint64_t v16 = v15[2];
  if (v15[3] < v16) {
    goto LABEL_21;
  }
  if (v16 < 0) {
    goto LABEL_19;
  }
  uint64_t v17 = *v15;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v11;
  *(void *)(v18 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  *int64_t v8 = sub_25F632E78;
  v8[1] = (uint64_t (*)(uint64_t))v18;
  (*(void (**)(uint64_t (**)(uint64_t), void, uint64_t))(v6 + 104))(v8, *MEMORY[0x263F141E0], v5);
  sub_25F642860();
  swift_retain_n();
  swift_retain();
  sub_25F642850();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF958);
  v27[3] = v19;
  v27[4] = sub_25F632F7C((unint64_t *)&qword_26A7AF960, &qword_26A7AF958);
  v27[0] = v17;
  v27[1] = v16;
  BOOL v20 = __swift_project_boxed_opaque_existential_1(v27, v19);
  if (*v20) {
    uint64_t v21 = (unsigned char *)(*v20 + v20[1]);
  }
  else {
    uint64_t v21 = 0;
  }
  sub_25F63C9F0((unsigned char *)*v20, v21, v26);
  uint64_t v22 = v26[0];
  unint64_t v23 = v26[1];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  sub_25F6428A0();
  sub_25F625550(v22, v23);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(uint64_t (**)(uint64_t), uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_25F62D31C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_25F6427A0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26A7AF718 != -1) {
    swift_once();
  }
  uint64_t v7 = __swift_project_value_buffer(v3, (uint64_t)qword_26A7AF920);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  swift_retain();
  int64_t v8 = sub_25F642780();
  os_log_type_t v9 = sub_25F642C30();
  if (!os_log_type_enabled(v8, v9))
  {

    swift_release();
    goto LABEL_9;
  }
  uint64_t v10 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)uint64_t v10 = 134217984;
  if (*(unsigned __int8 *)(a2 + 40) >= 2u
    || (uint64_t v11 = *(void *)(a2 + 16), v12 = *(void *)(v11 + 16), *(void *)(v11 + 24) < v12))
  {
    swift_release();
    sub_25F642D90();
    __break(1u);
  }
  else if ((v12 & 0x8000000000000000) == 0)
  {
    uint64_t v13 = v10;
    v15[1] = *(void *)(v11 + 16);
    sub_25F642CC0();
    swift_release();
    _os_log_impl(&dword_25F617000, v8, v9, "| message sent, %ld bytes", v13, 0xCu);
    MEMORY[0x2611FA440](v13, -1, -1);

LABEL_9:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return sub_25F62CC68();
  }
  swift_release();
  uint64_t result = sub_25F642DE0();
  __break(1u);
  return result;
}

uint64_t sub_25F62D62C(uint64_t result, unint64_t a2, char a3)
{
  if (a2 >> 60 != 15)
  {
    uint64_t v5 = result;
    sub_25F6254F8(result, a2);
    if (qword_26A7AF718 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_25F6427A0();
    __swift_project_value_buffer(v6, (uint64_t)qword_26A7AF920);
    sub_25F6254F8(v5, a2);
    uint64_t v7 = sub_25F642780();
    os_log_type_t v8 = sub_25F642C30();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v9 = 134217984;
      uint64_t v10 = v9;
      switch(a2 >> 62)
      {
        case 1uLL:
          if (!__OFSUB__(HIDWORD(v5), v5)) {
            goto LABEL_10;
          }
          __break(1u);
LABEL_20:
          __break(1u);
          JUMPOUT(0x25F62D8F0);
        case 2uLL:
          if (!__OFSUB__(*(void *)(v5 + 24), *(void *)(v5 + 16))) {
            goto LABEL_10;
          }
          goto LABEL_20;
        default:
LABEL_10:
          sub_25F642CC0();
          sub_25F632E24(v5, a2);
          _os_log_impl(&dword_25F617000, v7, v8, "| received: %ld", v10, 0xCu);
          MEMORY[0x2611FA440](v10, -1, -1);
          break;
      }
    }
    else
    {
      sub_25F632E24(v5, a2);
    }

    swift_beginAccess();
    sub_25F6254F8(v5, a2);
    sub_25F62C034(v5, a2);
    swift_endAccess();
    sub_25F62D900();
    uint64_t result = sub_25F632E24(v5, a2);
  }
  if (a3)
  {
    if (qword_26A7AF718 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_25F6427A0();
    __swift_project_value_buffer(v11, (uint64_t)qword_26A7AF920);
    uint64_t v12 = sub_25F642780();
    os_log_type_t v13 = sub_25F642C30();
    if (os_log_type_enabled(v12, v13))
    {
      int64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v14 = 0;
      _os_log_impl(&dword_25F617000, v12, v13, "| disconnected", v14, 2u);
      MEMORY[0x2611FA440](v14, -1, -1);
    }

    return sub_25F62CAB8();
  }
  return result;
}

void sub_25F62D900()
{
  swift_beginAccess();
  uint64_t v0 = sub_25F62AF6C();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  swift_endAccess();
  if (v4)
  {
    swift_beginAccess();
    uint64_t v5 = sub_25F630DE4(v0, v2);
    swift_endAccess();
    if (v5)
    {
      if (qword_26A7AF718 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_25F6427A0();
      __swift_project_value_buffer(v6, (uint64_t)qword_26A7AF920);
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_25F642780();
      os_log_type_t v8 = sub_25F642C30();
      if (os_log_type_enabled(v7, v8))
      {
        os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)os_log_type_t v9 = 134217984;
        sub_25F642CC0();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25F617000, v7, v8, "| copying out payload of %ld bytes", v9, 0xCu);
        MEMORY[0x2611FA440](v9, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      uint64_t v14 = *(void *)(*(void *)(v5 + 24) + 32);
      if (!v14) {
        goto LABEL_21;
      }
      uint64_t v15 = sub_25F62AE04();
      if (*(unsigned __int8 *)(v14 + 40) >= 2u) {
        goto LABEL_21;
      }
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)(v14 + 16);
      if (v15 >= *(void *)(v17 + 24)) {
        goto LABEL_21;
      }
      *(void *)(v17 + 16) = v15;
      sub_25F63BE90(v4, *(void *)(v4 + 16));
      swift_retain();
      swift_bridgeObjectRelease();
      if (*(unsigned __int8 *)(v14 + 40) < 2u
        && (uint64_t v18 = *(void *)(v14 + 16), v16 < *(void *)(v18 + 24))
        && (*(void *)(v18 + 16) = v16, (uint64_t v19 = *(void *)(*(void *)(v5 + 24) + 24)) != 0))
      {
        tb_message_configure_received(v19, 2);
        sub_25F642C90();
        swift_release();
        swift_release();
      }
      else
      {
LABEL_21:
        sub_25F642D90();
        __break(1u);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      if (qword_26A7AF718 != -1) {
        swift_once();
      }
      uint64_t v10 = sub_25F6427A0();
      __swift_project_value_buffer(v10, (uint64_t)qword_26A7AF920);
      uint64_t v11 = sub_25F642780();
      os_log_type_t v12 = sub_25F642C20();
      if (os_log_type_enabled(v11, v12))
      {
        uint64_t v13 = swift_slowAlloc();
        *(_DWORD *)uint64_t v13 = 134218240;
        sub_25F642CC0();
        *(_WORD *)(v13 + 12) = 2048;
        sub_25F642CC0();
        _os_log_impl(&dword_25F617000, v11, v12, "| reply message buffer for id %llu:%llu has already vanished!", (uint8_t *)v13, 0x16u);
        MEMORY[0x2611FA440](v13, -1, -1);
      }
    }
  }
}

uint64_t sub_25F62DD48()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t sub_25F62DD90(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v17 = a1;
  uint64_t v16 = sub_25F642C50();
  uint64_t v3 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25F642C40();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_25F642A70();
  MEMORY[0x270FA5388](v7 - 8);
  sub_25F62530C();
  sub_25F642A60();
  uint64_t v18 = MEMORY[0x263F8EE78];
  sub_25F632FC0((unint64_t *)&qword_26A7AF820, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF828);
  sub_25F632F7C((unint64_t *)&qword_26A7AF830, &qword_26A7AF828);
  sub_25F642D00();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F130], v16);
  *(void *)(v1 + 16) = sub_25F642C70();
  uint64_t v8 = v1 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_url;
  uint64_t v9 = sub_25F642710();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = v17;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v17, v9);
  unint64_t v12 = sub_25F6325C8(MEMORY[0x263F8EE78]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF990);
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 40) = 0;
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *(void *)(v13 + 32) = v12;
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v9);
  *(void *)(v2 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener) = v13;
  return v2;
}

uint64_t sub_25F62E0B4(uint64_t *a1, uint64_t a2)
{
  v74[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = sub_25F6427D0();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_26A7AF898);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (void *)((char *)v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = sub_25F642710();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = MEMORY[0x270FA5388](v13);
  uint64_t v18 = (char *)v61 - v17;
  if (!*a1)
  {
    uint64_t v66 = a2;
    uint64_t v67 = v7;
    char v64 = a1;
    uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    uint64_t v70 = a2 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_url;
    uint64_t v71 = v2;
    uint64_t v68 = v12 + 16;
    uint64_t v69 = v19;
    ((void (*)(char *))v19)(v15);
    sub_25F6426F0();
    BOOL v20 = *(void (**)(char *, uint64_t))(v12 + 8);
    uint64_t v72 = v12 + 8;
    v20(v15, v11);
    id v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
    uint64_t v22 = (void *)sub_25F6426D0();
    sub_25F62C5F8(MEMORY[0x263F8EE78]);
    type metadata accessor for FileAttributeKey(0);
    sub_25F632FC0(&qword_26A7AF7D0, type metadata accessor for FileAttributeKey);
    unint64_t v23 = (void *)sub_25F642A80();
    swift_bridgeObjectRelease();
    v74[0] = 0;
    unsigned int v24 = objc_msgSend(v21, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v22, 1, v23, v74);

    if (v24)
    {
      uint64_t v25 = v11;
      uint64_t v65 = v20;
      uint64_t v63 = v18;
      uint64_t v26 = qword_26A7AF718;
      id v27 = v74[0];
      if (v26 != -1) {
        swift_once();
      }
      uint64_t v28 = sub_25F6427A0();
      unint64_t v62 = (uint8_t *)__swift_project_value_buffer(v28, (uint64_t)qword_26A7AF920);
      uint64_t v29 = sub_25F642780();
      os_log_type_t v30 = sub_25F642C30();
      BOOL v31 = os_log_type_enabled(v29, v30);
      uint64_t v32 = v65;
      uint64_t v33 = v25;
      if (v31)
      {
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_25F617000, v29, v30, "| creating new tightbeam listener socket", v34, 2u);
        MEMORY[0x2611FA440](v34, -1, -1);
      }

      id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
      v69(v15, v70, v25);
      uint64_t v36 = (void *)sub_25F6426D0();
      v32(v15, v25);
      v74[0] = 0;
      unsigned int v37 = objc_msgSend(v35, sel_removeItemAtURL_error_, v36, v74);

      id v38 = v74[0];
      if (!v37)
      {
        uint64_t v39 = v38;
        uint64_t v40 = sub_25F6426B0();

        swift_willThrow();
        MEMORY[0x2611FA2B0](v40);
        uint64_t v71 = 0;
      }
      sub_25F642970();
      sub_25F642960();
      v69(v15, v70, v25);
      uint64_t v41 = sub_25F642700();
      uint64_t v43 = v42;
      v32(v15, v25);
      *uint64_t v10 = v41;
      v10[1] = v43;
      uint64_t v44 = *MEMORY[0x263F14100];
      uint64_t v45 = sub_25F6427E0();
      uint64_t v46 = *(void *)(v45 - 8);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v46 + 104))(v10, v44, v45);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v46 + 56))(v10, 0, 1, v45);
      sub_25F642950();
      swift_retain();
      sub_25F6427C0();
      sub_25F642840();
      swift_allocObject();
      uint64_t v47 = v71;
      uint64_t v48 = sub_25F642830();
      if (v47)
      {
        v32(v63, v33);
        return swift_release();
      }
      else
      {
        uint64_t v50 = v48;
        uint64_t v71 = 0;
        uint64_t v51 = v64;
        swift_retain();
        swift_release();
        *uint64_t v51 = v50;
        swift_retain();
        sub_25F6427F0();
        swift_allocObject();
        swift_weakInit();
        swift_retain();
        sub_25F642800();
        swift_release();
        swift_retain_n();
        uint64_t v52 = sub_25F642780();
        os_log_type_t v53 = sub_25F642C30();
        int v54 = v53;
        if (os_log_type_enabled(v52, v53))
        {
          LODWORD(v67) = v54;
          uint64_t v55 = (uint8_t *)swift_slowAlloc();
          char v64 = (uint64_t *)swift_slowAlloc();
          v74[0] = v64;
          unint64_t v62 = v55;
          *(_DWORD *)uint64_t v55 = 136315138;
          v61[1] = v55 + 4;
          v69(v15, v70, v33);
          sub_25F632FC0(&qword_26A7AF968, MEMORY[0x263F06EA8]);
          uint64_t v56 = sub_25F642E00();
          unint64_t v58 = v57;
          v65(v15, v33);
          uint64_t v73 = sub_25F6301B4(v56, v58, (uint64_t *)v74);
          sub_25F642CC0();
          swift_release_n();
          uint64_t v32 = v65;
          swift_bridgeObjectRelease();
          uint64_t v59 = v62;
          _os_log_impl(&dword_25F617000, v52, (os_log_type_t)v67, "| opening new listener at: %s", v62, 0xCu);
          uint64_t v60 = v64;
          swift_arrayDestroy();
          MEMORY[0x2611FA440](v60, -1, -1);
          MEMORY[0x2611FA440](v59, -1, -1);
        }
        else
        {

          swift_release_n();
        }
        sub_25F642820();
        swift_release();
        swift_release();
        return ((uint64_t (*)(char *, uint64_t))v32)(v63, v33);
      }
    }
    else
    {
      id v49 = v74[0];
      sub_25F6426B0();

      swift_willThrow();
      return ((uint64_t (*)(char *, uint64_t))v20)(v18, v11);
    }
  }
  return result;
}

void sub_25F62E93C(uint64_t a1)
{
  uint64_t v2 = sub_25F642810();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v17 - v7;
  if (qword_26A7AF718 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25F6427A0();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A7AF920);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, a1, v2);
  uint64_t v11 = sub_25F642780();
  os_log_type_t v12 = sub_25F642C30();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v20 = v18;
    *(_DWORD *)uint64_t v13 = 136315138;
    uint64_t v17 = v13 + 4;
    v10(v6, (uint64_t)v8, v2);
    uint64_t v14 = sub_25F642B00();
    uint64_t v19 = sub_25F6301B4(v14, v15, &v20);
    sub_25F642CC0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    _os_log_impl(&dword_25F617000, v11, v12, "| listener did change state, new state: %s", v13, 0xCu);
    uint64_t v16 = v18;
    swift_arrayDestroy();
    MEMORY[0x2611FA440](v16, -1, -1);
    MEMORY[0x2611FA440](v13, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
}

uint64_t sub_25F62EBD4()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_25F62ECE0();
    return swift_release();
  }
  return result;
}

uint64_t sub_25F62EC34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 8))
  {
    swift_retain();
    sub_25F62CE98(a2, a3);
    return swift_release();
  }
  else
  {
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = 0x8000000000000000;
    sub_25F631D08(a3, a2, isUniquelyReferenced_nonNull_native);
    *(void *)(a1 + 16) = v8;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_25F62ECE0()
{
  uint64_t v1 = v0;
  if (qword_26A7AF718 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_25F6427A0();
  __swift_project_value_buffer(v2, (uint64_t)qword_26A7AF920);
  swift_retain_n();
  uint64_t v3 = sub_25F642780();
  os_log_type_t v4 = sub_25F642C30();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    uint64_t v12 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_25F642920();
    swift_retain();
    uint64_t v7 = sub_25F642B00();
    sub_25F6301B4(v7, v8, &v12);
    sub_25F642CC0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25F617000, v3, v4, "| got new connection: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FA440](v6, -1, -1);
    MEMORY[0x2611FA440](v5, -1, -1);
  }
  else
  {

    uint64_t v9 = swift_release_n();
  }
  uint64_t v10 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  MEMORY[0x270FA5388](v9);
  swift_retain();
  os_unfair_lock_lock(v10 + 10);
  sub_25F632EDC((uint64_t)&v10[4]);
  os_unfair_lock_unlock(v10 + 10);
  return swift_release();
}

uint64_t sub_25F62EF10(uint64_t a1, uint64_t a2)
{
  type metadata accessor for EveTransportManager.Connection();
  os_log_type_t v4 = (void *)swift_allocObject();
  uint64_t v5 = MEMORY[0x263F8EE78];
  unint64_t v6 = sub_25F6326C8(MEMORY[0x263F8EE78]);
  v4[4] = v5;
  v4[5] = 0;
  v4[2] = a2;
  v4[3] = v6;
  if (*(void *)(a1 + 8))
  {
    swift_retain();
    sub_25F62CAB8();
  }
  else
  {
    swift_retain();
  }
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = v4;
  swift_allocObject();
  swift_weakInit();
  sub_25F642880();
  sub_25F6428D0();
  return swift_release();
}

uint64_t sub_25F62F008(uint64_t a1)
{
  uint64_t v2 = sub_25F6428C0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v7 = result;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    int v8 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
    if (v8 == *MEMORY[0x263F14210])
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    else
    {
      if (v8 == *MEMORY[0x263F14200])
      {
        sub_25F62F244();
        return swift_release();
      }
      if (v8 != *MEMORY[0x263F14220])
      {
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
    }
    uint64_t v9 = *(os_unfair_lock_s **)(v7 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
    swift_retain();
    os_unfair_lock_lock(v9 + 10);
    sub_25F62F1FC((uint64_t)&v9[4], &v11);
    os_unfair_lock_unlock(v9 + 10);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_25F62F1FC@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3 = *(void *)(result + 8);
  if (v3) {
    uint64_t result = sub_25F62CAB8();
  }
  *a2 = v3 == 0;
  return result;
}

uint64_t sub_25F62F244()
{
  uint64_t v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  os_unfair_lock_lock(v1 + 10);
  sub_25F632EC0((uint64_t)&v1[4]);
  os_unfair_lock_unlock(v1 + 10);
  return swift_release();
}

void sub_25F62F2DC(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v6 = sub_25F6428C0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 8)) {
    return;
  }
  swift_retain();
  sub_25F6428E0();
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v10 == *MEMORY[0x263F14210])
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    goto LABEL_4;
  }
  if (v10 != *MEMORY[0x263F14200])
  {
    if (v10 != *MEMORY[0x263F14220])
    {
      swift_release();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return;
    }
LABEL_4:
    if (qword_26A7AF718 != -1) {
      goto LABEL_36;
    }
    goto LABEL_5;
  }
  v30[1] = v2;
  a2 = *(void *)(a1 + 16);
  uint64_t v16 = a2 + 64;
  uint64_t v17 = 1 << *(unsigned char *)(a2 + 32);
  uint64_t v18 = -1;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  unint64_t v3 = v18 & *(void *)(a2 + 64);
  int64_t v19 = (unint64_t)(v17 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v20 = 0;
  while (1)
  {
    if (v3)
    {
      unint64_t v21 = __clz(__rbit64(v3));
      v3 &= v3 - 1;
      unint64_t v22 = v21 | (v20 << 6);
      goto LABEL_14;
    }
    int64_t v26 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v26 >= v19) {
      goto LABEL_32;
    }
    unint64_t v27 = *(void *)(v16 + 8 * v26);
    ++v20;
    if (!v27)
    {
      int64_t v20 = v26 + 1;
      if (v26 + 1 >= v19) {
        goto LABEL_32;
      }
      unint64_t v27 = *(void *)(v16 + 8 * v20);
      if (!v27)
      {
        int64_t v20 = v26 + 2;
        if (v26 + 2 >= v19) {
          goto LABEL_32;
        }
        unint64_t v27 = *(void *)(v16 + 8 * v20);
        if (!v27) {
          break;
        }
      }
    }
LABEL_29:
    unint64_t v3 = (v27 - 1) & v27;
    unint64_t v22 = __clz(__rbit64(v27)) + (v20 << 6);
LABEL_14:
    uint64_t v23 = 8 * v22;
    uint64_t v24 = *(void *)(*(void *)(a2 + 48) + v23);
    uint64_t v25 = *(void *)(*(void *)(a2 + 56) + v23);
    swift_retain();
    sub_25F62CE98(v24, v25);
    swift_release();
  }
  int64_t v28 = v26 + 3;
  if (v28 >= v19)
  {
LABEL_32:
    swift_release();
    unint64_t v29 = sub_25F6325C8(MEMORY[0x263F8EE78]);
    swift_bridgeObjectRelease();
    *(void *)(a1 + 16) = v29;
    sub_25F62CC68();
    swift_release();
    return;
  }
  unint64_t v27 = *(void *)(v16 + 8 * v28);
  if (v27)
  {
    int64_t v20 = v28;
    goto LABEL_29;
  }
  while (1)
  {
    int64_t v20 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v20 >= v19) {
      goto LABEL_32;
    }
    unint64_t v27 = *(void *)(v16 + 8 * v20);
    ++v28;
    if (v27) {
      goto LABEL_29;
    }
  }
LABEL_35:
  __break(1u);
LABEL_36:
  swift_once();
LABEL_5:
  uint64_t v11 = sub_25F6427A0();
  __swift_project_value_buffer(v11, (uint64_t)qword_26A7AF920);
  uint64_t v12 = sub_25F642780();
  os_log_type_t v13 = sub_25F642C30();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_25F617000, v12, v13, "| listener disconnected", v14, 2u);
    MEMORY[0x2611FA440](v14, -1, -1);
  }

  uint64_t v15 = *(void *)(a2 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v15 + 40));
  sub_25F62F6D0((void *)(v15 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v15 + 40));
  if (v3)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    swift_release();
  }
}

uint64_t sub_25F62F6D0(void *a1)
{
  if (a1[1]) {
    sub_25F62CAB8();
  }
  uint64_t result = swift_release();
  *a1 = 0;
  return result;
}

uint64_t sub_25F62F718()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_url;
  uint64_t v2 = sub_25F642710();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

void sub_25F62F7D0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener;
  uint64_t v6 = *(void *)(v4 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 40));
  sub_25F6328C0((uint64_t *)(v6 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 40));
  swift_release();
  if (!v2)
  {
    type metadata accessor for EveTransportManager.PendingMessage();
    uint64_t v7 = swift_allocObject();
    uint64_t v8 = sub_25F62C974(a1);
    uint64_t v9 = *(os_unfair_lock_s **)(v4 + v5);
    MEMORY[0x270FA5388](v8);
    swift_retain();
    os_unfair_lock_lock(v9 + 10);
    sub_25F632D6C((uint64_t)&v9[4]);
    os_unfair_lock_unlock(v9 + 10);
    swift_release();
    sub_25F642C80();
    if (*(unsigned char *)(v7 + 36))
    {
      swift_retain();
      sub_25F63DD10();
      swift_release();
    }
    else
    {
      int v10 = *(_DWORD *)(v7 + 32);
      type metadata accessor for TransportError(0);
      sub_25F632FC0((unint64_t *)&qword_26A7AF730, type metadata accessor for TransportError);
      swift_allocError();
      *uint64_t v11 = v10;
      swift_willThrow();
    }
    swift_release();
  }
}

uint64_t sub_25F62F9B4()
{
  return sub_25F62F9BC(32);
}

uint64_t sub_25F62F9BC(uint64_t a1)
{
  swift_release();
  return MEMORY[0x270FA0228](v1, a1, 7);
}

uint64_t sub_25F62FA04(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF938);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_25F642710();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v31 - v11;
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = (char *)&v31 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v31 - v16;
  uint64_t data = tb_endpoint_get_data(a1);
  LODWORD(a1) = tb_endpoint_get_options(a1);
  sub_25F6426C0();
  if (a1 == 1)
  {
    uint64_t v32 = *(void *)(data + 16);
    uint64_t v19 = data + OBJC_IVAR____TtC9Tightbeam15EveEndpointData_baseURL;
    swift_retain();
    sub_25F633008(v19, (uint64_t)v4, &qword_26A7AF938);
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      int64_t v20 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v20(v15, v17, v5);
      sub_25F62FF74((uint64_t)v4);
      v20(v17, v15, v5);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
      unint64_t v21 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v21(v15, v4, v5);
      v21(v17, v15, v5);
    }
  }
  else
  {
    uint64_t v32 = data;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v12, v17, v5);
  type metadata accessor for EveTransportClient();
  uint64_t v22 = swift_allocObject();
  BOOL v31 = v17;
  if (qword_26A7AF710 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_26A7B09E8;
  uint64_t v24 = sub_25F6426E0();
  uint64_t v25 = *(void *)(v23 + 16);
  MEMORY[0x270FA5388](v24);
  *(&v31 - 2) = v9;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v25 + 24));
  sub_25F62FF58((uint64_t *)(v25 + 16), &v33);
  os_unfair_lock_unlock((os_unfair_lock_t)(v25 + 24));
  uint64_t v26 = v33;
  swift_release();
  unint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
  v27(v9, v5);
  v27(v12, v5);
  int64_t v28 = v31;
  uint64_t v29 = v32;
  *(void *)(v22 + 16) = v26;
  *(void *)(v22 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v29;
  v27(v28, v5);
  return v22;
}

uint64_t sub_25F62FDEC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(tb_transport_get_context(a1) + 16)
                 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 40));
  sub_25F6328C0((uint64_t *)(v1 + 16));
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 40));
  swift_release();
  swift_release();
  return 0;
}

uint64_t _tb_eve_transport_destruct(uint64_t a1)
{
  tb_transport_get_context(a1);
  return swift_release();
}

uint64_t type metadata accessor for EveTransportClient()
{
  return self;
}

uint64_t sub_25F62FF58@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_25F62C728(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_25F62FF74(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF938);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_25F62FFD4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF888);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_25F63003C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_25F642BB0();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x2611F99D0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

char *sub_25F6300B8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF888);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      unint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)MEMORY[0x263F8EE78];
      unint64_t v12 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_25F6324E0(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_25F6301B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_25F630288(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_25F632EF8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_25F632EF8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_25F630288(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_25F642CE0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_25F630444(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_25F642D60();
  if (!v8)
  {
    sub_25F642D80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_25F642DE0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_25F630444(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_25F6304DC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_25F630654(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25F630654(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_25F6304DC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_25F62FFD4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_25F642D30();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_25F642D80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_25F642B60();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_25F642DE0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_25F642D80();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

uint64_t sub_25F630654(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF888);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_25F642DE0();
  __break(1u);
  return result;
}

unint64_t sub_25F6307A4(uint64_t a1)
{
  sub_25F642710();
  sub_25F632FC0(&qword_26A7AF988, MEMORY[0x263F06EA8]);
  uint64_t v2 = sub_25F642A90();
  return sub_25F630994(a1, v2);
}

unint64_t sub_25F63083C(uint64_t a1)
{
  uint64_t v2 = sub_25F642E90();
  return sub_25F630B54(a1, v2);
}

unint64_t sub_25F630880(uint64_t a1, uint64_t a2)
{
  sub_25F642EA0();
  sub_25F642EC0();
  sub_25F642EC0();
  uint64_t v4 = sub_25F642ED0();
  return sub_25F630BF0(a1, a2, v4);
}

unint64_t sub_25F630900(uint64_t a1)
{
  sub_25F642AF0();
  sub_25F642EA0();
  sub_25F642B40();
  uint64_t v2 = sub_25F642ED0();
  swift_bridgeObjectRelease();
  return sub_25F630C6C(a1, v2);
}

unint64_t sub_25F630994(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_25F642710();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  int64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    unint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    size_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_25F632FC0(&qword_26A7AF998, MEMORY[0x263F06EA8]);
      char v15 = sub_25F642AB0();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_25F630B54(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_25F630BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t result = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = ~v5;
    do
    {
      uint64_t v8 = (uint64_t *)(*(void *)(v3 + 48) + 16 * result);
      uint64_t v10 = *v8;
      uint64_t v9 = v8[1];
      if (v10 == a1 && v9 == a2) {
        break;
      }
      unint64_t result = (result + 1) & v7;
    }
    while (((*(void *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_25F630C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_25F642AF0();
    uint64_t v8 = v7;
    if (v6 == sub_25F642AF0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_25F642E10();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_25F642AF0();
          uint64_t v15 = v14;
          if (v13 == sub_25F642AF0() && v15 == v16) {
            break;
          }
          char v18 = sub_25F642E10();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_25F630DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v4 = sub_25F630880(a1, a2);
  if ((v5 & 1) == 0) {
    return 0;
  }
  unint64_t v6 = v4;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v2;
  uint64_t v11 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_25F632194();
    uint64_t v8 = v11;
  }
  uint64_t v9 = *(void *)(*(void *)(v8 + 56) + 8 * v6);
  sub_25F631844(v6, v8);
  uint64_t *v3 = v8;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_25F630E7C(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = sub_25F642710();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF980);
  int v46 = a2;
  uint64_t v10 = sub_25F642DC0();
  uint64_t v11 = v9;
  uint64_t v12 = v10;
  if (!*(void *)(v11 + 16)) {
    goto LABEL_41;
  }
  uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
  uint64_t v14 = *(void *)(v11 + 64);
  uint64_t v42 = (void *)(v11 + 64);
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  else {
    uint64_t v15 = -1;
  }
  unint64_t v16 = v15 & v14;
  uint64_t v40 = v3;
  int64_t v41 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v43 = (void (**)(char *, unint64_t, uint64_t))(v6 + 16);
  uint64_t v45 = v6;
  uint64_t v17 = (void (**)(char *, unint64_t, uint64_t))(v6 + 32);
  uint64_t v18 = v10 + 64;
  uint64_t result = swift_retain();
  int64_t v20 = 0;
  for (i = v11; ; uint64_t v11 = i)
  {
    if (v16)
    {
      unint64_t v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    int64_t v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41) {
      break;
    }
    uint64_t v25 = v42;
    unint64_t v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      int64_t v20 = v24 + 1;
      if (v24 + 1 >= v41) {
        goto LABEL_34;
      }
      unint64_t v26 = v42[v20];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v40;
          if ((v46 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t v20 = v27 + 1;
            if (__OFADD__(v27, 1)) {
              goto LABEL_43;
            }
            if (v20 >= v41) {
              goto LABEL_34;
            }
            unint64_t v26 = v42[v20];
            ++v27;
            if (v26) {
              goto LABEL_21;
            }
          }
        }
        int64_t v20 = v27;
      }
    }
LABEL_21:
    unint64_t v16 = (v26 - 1) & v26;
    unint64_t v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    uint64_t v28 = *(void *)(v45 + 72);
    unint64_t v29 = *(void *)(v11 + 48) + v28 * v23;
    if (v46)
    {
      (*v17)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*v43)(v8, v29, v5);
      uint64_t v30 = *(void *)(*(void *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_25F632FC0(&qword_26A7AF988, MEMORY[0x263F06EA8]);
    uint64_t result = sub_25F642A90();
    uint64_t v31 = -1 << *(unsigned char *)(v12 + 32);
    unint64_t v32 = result & ~v31;
    unint64_t v33 = v32 >> 6;
    if (((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      unint64_t v21 = __clz(__rbit64((-1 << v32) & ~*(void *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v34 = 0;
      unint64_t v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v36 = v33 == v35;
        if (v33 == v35) {
          unint64_t v33 = 0;
        }
        v34 |= v36;
        uint64_t v37 = *(void *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      unint64_t v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(void *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v17)(*(void *)(v12 + 48) + v28 * v21, v8, v5);
    *(void *)(*(void *)(v12 + 56) + 8 * v21) = v30;
    ++*(void *)(v12 + 16);
  }
  swift_release();
  uint64_t v3 = v40;
  uint64_t v25 = v42;
  if ((v46 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v38 = 1 << *(unsigned char *)(v11 + 32);
  if (v38 >= 64) {
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v25 = -1 << v38;
  }
  *(void *)(v11 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v12;
  return result;
}

uint64_t sub_25F6312A0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF948);
  uint64_t result = sub_25F642DC0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v21 >= v12) {
          goto LABEL_33;
        }
        unint64_t v22 = v30[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v12) {
            goto LABEL_33;
          }
          unint64_t v22 = v30[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v12)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
              if (v29 >= 64) {
                bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *uint64_t v30 = -1 << v29;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v30[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v12) {
                  goto LABEL_33;
                }
                unint64_t v22 = v30[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v11 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      long long v31 = *(_OWORD *)(*(void *)(v5 + 48) + 16 * v20);
      uint64_t v28 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      sub_25F642EA0();
      sub_25F642EC0();
      sub_25F642EC0();
      uint64_t result = sub_25F642ED0();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
        long long v18 = v31;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        long long v18 = v31;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_OWORD *)(*(void *)(v7 + 48) + 16 * v17) = v18;
      *(void *)(*(void *)(v7 + 56) + 8 * v17) = v28;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_25F63158C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF940);
  uint64_t result = sub_25F642DC0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v10;
    uint64_t v32 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if (a2)
              {
                if (v32 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v33);
                }
                else {
                  *uint64_t v9 = v31;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_41;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      uint64_t v30 = *(void *)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        swift_retain();
      }
      uint64_t result = sub_25F642E90();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_25F631844(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_25F642D10();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_25F642EA0();
        sub_25F642EC0();
        sub_25F642EC0();
        uint64_t result = sub_25F642ED0();
        unint64_t v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8) {
            goto LABEL_5;
          }
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          uint64_t v10 = *(void *)(a2 + 48);
          uint64_t v11 = (_OWORD *)(v10 + 16 * v3);
          unint64_t v12 = (_OWORD *)(v10 + 16 * v6);
          if (v3 != v6 || v11 >= v12 + 1) {
            *uint64_t v11 = *v12;
          }
          uint64_t v13 = *(void *)(a2 + 56);
          uint64_t v14 = (void *)(v13 + 8 * v3);
          unint64_t v15 = (void *)(v13 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v14 >= v15 + 1))
          {
            *uint64_t v14 = *v15;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v17 = *v16;
    uint64_t v18 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v18 = *v16;
    uint64_t v17 = (-1 << result) - 1;
  }
  *unint64_t v16 = v18 & v17;
  uint64_t v19 = *(void *)(a2 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_25F631A18(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_25F642710();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_25F6307A4(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    BOOL v20 = *v4;
    if (v18)
    {
LABEL_8:
      uint64_t v21 = v20[7];
      uint64_t result = swift_release();
      *(void *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_25F631EFC();
    goto LABEL_7;
  }
  sub_25F630E7C(v17, a3 & 1);
  unint64_t v23 = sub_25F6307A4(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    uint64_t result = sub_25F642E30();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  BOOL v20 = *v4;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_25F631E44(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_25F631BC0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_25F630880(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25F632194();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    uint64_t v21 = (uint64_t *)(v18[6] + 16 * v12);
    uint64_t *v21 = a2;
    v21[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    uint64_t v22 = v18[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_25F6312A0(result, a4 & 1);
  uint64_t result = sub_25F630880(a2, a3);
  if ((v16 & 1) == (v20 & 1))
  {
    unint64_t v12 = result;
    char v18 = (void *)*v5;
    if (v16) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_25F642E30();
  __break(1u);
  return result;
}

uint64_t sub_25F631D08(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_25F63083C(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_25F63233C();
LABEL_7:
    char v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_25F63158C(result, a3 & 1);
  uint64_t result = sub_25F63083C(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    char v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = sub_25F642E30();
  __break(1u);
  return result;
}

uint64_t sub_25F631E44(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_25F642710();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

void *sub_25F631EFC()
{
  uint64_t v1 = sub_25F642710();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF980);
  BOOL v23 = v0;
  uint64_t v5 = *v0;
  uint64_t v6 = sub_25F642DB0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    *BOOL v23 = v7;
    return result;
  }
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v5 + 64);
  uint64_t v24 = v5 + 64;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = v2 + 32;
  uint64_t v27 = v2 + 16;
  while (1)
  {
    if (v13)
    {
      unint64_t v14 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v15 = v14 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v10;
    if (!v20)
    {
      int64_t v10 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v10);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_9:
    unint64_t v16 = *(void *)(v2 + 72) * v15;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(void *)(v5 + 48) + v16, v1);
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v5 + 56) + 8 * v15);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(void *)(v7 + 48) + v16, v4, v1);
    *(void *)(*(void *)(v7 + 56) + v17) = v18;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25) {
    goto LABEL_23;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v10 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v10 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v10);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_25F632194()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF948);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25F642DB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = 8 * v15;
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v17);
    *(_OWORD *)(*(void *)(v4 + 48) + v16) = *(_OWORD *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v17) = v18;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_25F63233C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF940);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_25F642DB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_retain();
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_25F6324E0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    uint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_25F642DE0();
  __break(1u);
  return result;
}

unint64_t sub_25F6325C8(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF940);
  uint64_t v3 = (void *)sub_25F642DD0();
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_25F63083C(v5);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    int64_t v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_retain();
    unint64_t result = sub_25F63083C(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if (v15) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_25F6326C8(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF948);
  uint64_t v3 = (void *)sub_25F642DD0();
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  unint64_t result = sub_25F630880(v4, v5);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  uint64_t v9 = a1 + 9;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v10 = v4;
    v10[1] = v5;
    *(void *)(v3[7] + 8 * result) = v6;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v14 = v9 + 3;
    uint64_t v4 = *(v9 - 2);
    uint64_t v5 = *(v9 - 1);
    uint64_t v15 = *v9;
    swift_retain();
    unint64_t result = sub_25F630880(v4, v5);
    uint64_t v9 = v14;
    uint64_t v6 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t _tb_eve_transport_send_message_0(uint64_t a1, uint64_t a2, void *a3)
{
  tb_transport_get_context(a1);
  swift_retain();
  sub_25F62F7D0(a2);
  uint64_t v6 = v5;
  swift_release();
  *a3 = v6;
  return 0;
}

uint64_t sub_25F6328C0(uint64_t *a1)
{
  return sub_25F62E0B4(a1, v1);
}

uint64_t sub_25F6328DC()
{
  return type metadata accessor for EveEndpointData(0);
}

uint64_t type metadata accessor for EveEndpointData(uint64_t a1)
{
  return sub_25F632A48(a1, (uint64_t *)&unk_26B39A318);
}

void sub_25F632904()
{
  sub_25F6329A4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_25F6329A4()
{
  if (!qword_26B39A310)
  {
    sub_25F642710();
    unint64_t v0 = sub_25F642CA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26B39A310);
    }
  }
}

uint64_t type metadata accessor for EveTransportCoordinator()
{
  return self;
}

uint64_t sub_25F632A20()
{
  return type metadata accessor for EveTransportManager(0);
}

uint64_t type metadata accessor for EveTransportManager(uint64_t a1)
{
  return sub_25F632A48(a1, (uint64_t *)&unk_26B39A348);
}

uint64_t sub_25F632A48(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25F632A80()
{
  uint64_t result = sub_25F642710();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for EveTransportManager.PendingMessage()
{
  return self;
}

uint64_t type metadata accessor for EveTransportManager.Connection()
{
  return self;
}

uint64_t destroy for EveTransportManager.Listener()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

void *_s9Tightbeam19EveTransportManagerC8ListenerVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EveTransportManager.Listener(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for EveTransportManager.Listener(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EveTransportManager.Listener(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EveTransportManager.Listener(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EveTransportManager.Listener()
{
  return &type metadata for EveTransportManager.Listener;
}

uint64_t sub_25F632D6C(uint64_t a1)
{
  return sub_25F62EC34(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_25F632E24(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_25F625550(a1, a2);
  }
  return a1;
}

uint64_t sub_25F632E38()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F632E78(uint64_t a1)
{
  return sub_25F62D31C(a1, *(void *)(v1 + 16));
}

uint64_t sub_25F632E80()
{
  swift_weakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F632EB8(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  return sub_25F62CE0C(a1, a2, a3, a4);
}

void sub_25F632EC0(uint64_t a1)
{
  sub_25F62F2DC(a1, *(void *)(v1 + 16));
}

uint64_t sub_25F632EDC(uint64_t a1)
{
  return sub_25F62EF10(a1, *(void *)(v1 + 16));
}

uint64_t sub_25F632EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_25F632F54(uint64_t a1)
{
  return sub_25F62F008(a1);
}

void sub_25F632F5C(uint64_t a1)
{
}

uint64_t sub_25F632F64()
{
  return sub_25F62EBD4();
}

_OWORD *sub_25F632F6C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_25F632F7C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25F632FC0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25F633008(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_25F633070(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v10 = a1;
    char v11 = 1;
    uint64_t v12 = 0;
    uint64_t v13 = a2;
    type metadata accessor for TransportBuffer();
    uint64_t v14 = 0;
    int v15 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v19 = 0;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)(v4 + 32) = 0;
    *(void *)(v4 + 16) = &v10;
    *(unsigned char *)(v4 + 40) = 1;
    a3();
    uint64_t v5 = *(void *)(v4 + 16);
    uint64_t v6 = *(void *)(v4 + 24);
    uint64_t v7 = *(void *)(v4 + 32);
    *(void *)(v4 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)(v4 + 32) = 0;
    *(void *)(v4 + 16) = 0;
    char v8 = *(unsigned char *)(v4 + 40);
    *(unsigned char *)(v4 + 40) = 2;
    sub_25F633400(v5, v6, v7, v8);
    return swift_release();
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t TransportBuffer.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = swift_slowAlloc();
  tb_transport_initialize_message_buffer(v1);
  *(void *)(v0 + 16) = v1;
  *(void *)(v0 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = nullsub_1;
  *(void *)(v0 + 32) = 0;
  *(unsigned char *)(v0 + 40) = 0;
  return v0;
}

uint64_t TransportBuffer.init()()
{
  uint64_t v1 = swift_slowAlloc();
  tb_transport_initialize_message_buffer(v1);
  *(void *)(v0 + 16) = v1;
  *(void *)(v0 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = nullsub_1;
  *(void *)(v0 + 32) = 0;
  *(unsigned char *)(v0 + 40) = 0;
  return v0;
}

uint64_t sub_25F633270(uint64_t (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  if (*(unsigned char *)(v6 + 40))
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  else
  {
    uint64_t v10 = *(void *)(v6 + 16);
    int v11 = a1(a5, a6, v10);
    if (v11)
    {
      int v12 = v11;
      type metadata accessor for TransportError(0);
      sub_25F6333A8();
      swift_allocError();
      _DWORD *v13 = v12;
      return swift_willThrow();
    }
    else
    {
      uint64_t v16 = *(void *)(v6 + 16);
      uint64_t v15 = *(void *)(v6 + 24);
      uint64_t v17 = *(void *)(v7 + 32);
      *(void *)(v7 + 16) = v10;
      *(void *)(v7 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
      *(void *)(v7 + 32) = a4;
      char v18 = *(unsigned char *)(v7 + 40);
      *(unsigned char *)(v7 + 40) = 0;
      swift_retain();
      return sub_25F633400(v16, v15, v17, v18);
    }
  }
  return result;
}

unint64_t sub_25F6333A8()
{
  unint64_t result = qword_26A7AF730;
  if (!qword_26A7AF730)
  {
    type metadata accessor for TransportError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF730);
  }
  return result;
}

uint64_t sub_25F633400(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (!a4) {
    return swift_release();
  }
  return result;
}

uint64_t sub_25F633414(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(v2 + 40) >= 2u) {
    goto LABEL_8;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = *(void *)(v4 + 16);
  if (__OFADD__(v5, a2))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(void *)(v4 + 24) >= v5 + a2)
  {
    uint64_t result = sub_25F642CD0();
    uint64_t v7 = *(void *)(v4 + 16);
    BOOL v8 = __OFADD__(v7, a2);
    uint64_t v9 = v7 + a2;
    if (!v8)
    {
      *(void *)(v4 + 16) = v9;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  uint64_t result = sub_25F642D90();
  __break(1u);
  return result;
}

uint64_t sub_25F633524(uint64_t result)
{
  if (*(unsigned __int8 *)(v1 + 40) >= 2u || (uint64_t v2 = *(void *)(v1 + 16), *(void *)(v2 + 24) <= result))
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  else
  {
    *(void *)(v2 + 16) = result;
  }
  return result;
}

uint64_t sub_25F6335F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(unsigned __int8 *)(v5 + 40) < 2u)
  {
    uint64_t v7 = *(uint64_t **)(v5 + 16);
    if (v7[4] >= *(void *)(*(void *)(a4 - 8) + 64))
    {
      uint64_t v9 = *v7;
      MEMORY[0x270FA5388](a1);
      void v15[2] = a4;
      v15[3] = v10;
      v15[4] = v11;
      void v15[5] = v12;
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF848);
      return sub_25F6337A0(a4, 1, (uint64_t)sub_25F633768, (uint64_t)v15, v9, MEMORY[0x263F8E778], a4, v13, a5, MEMORY[0x263F8E4E0], (uint64_t)&v16);
    }
    __break(1u);
  }
  uint64_t result = sub_25F642D90();
  __break(1u);
  return result;
}

uint64_t sub_25F633768(uint64_t a1, void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 32))();
  if (v3) {
    *a2 = v3;
  }
  return result;
}

uint64_t sub_25F6337A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v13 = *(void *)(a8 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](a5);
  uint64_t v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v17(v14, v16);
  if (v11) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a11, v16, a8);
  }
  return result;
}

uint64_t sub_25F633870()
{
  if (*(unsigned __int8 *)(v0 + 40) >= 2u || (uint64_t v1 = *(void **)(v0 + 16), v2 = v1[4], v1[3] < v2))
  {
    sub_25F642D90();
    __break(1u);
  }
  else if ((v2 & 0x8000000000000000) == 0)
  {
    return *v1;
  }
  uint64_t result = sub_25F642DE0();
  __break(1u);
  return result;
}

uint64_t sub_25F633988()
{
  if (*(unsigned __int8 *)(v0 + 40) >= 2u) {
    goto LABEL_8;
  }
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = v1[2];
  uint64_t v3 = v1[4];
  if (v2 < v3) {
    goto LABEL_8;
  }
  uint64_t v4 = v1[3];
  if (v4 < v2) {
    goto LABEL_8;
  }
  if (__OFSUB__(v4, v3))
  {
    __break(1u);
LABEL_8:
    sub_25F642D90();
    __break(1u);
    goto LABEL_9;
  }
  if (((v4 - v3) & 0x8000000000000000) == 0) {
    return *v1 + v3;
  }
LABEL_9:
  uint64_t result = sub_25F642DE0();
  __break(1u);
  return result;
}

uint64_t sub_25F633AC0()
{
  if (*(unsigned __int8 *)(v0 + 40) >= 2u || (uint64_t v1 = *(void **)(v0 + 16), v2 = v1[2], v1[3] < v2))
  {
    sub_25F642D90();
    __break(1u);
  }
  else if ((v2 & 0x8000000000000000) == 0)
  {
    return *v1;
  }
  uint64_t result = sub_25F642DE0();
  __break(1u);
  return result;
}

uint64_t TransportBuffer.deinit()
{
  uint64_t v1 = v0;
  char v2 = *(unsigned char *)(v0 + 40);
  if (!v2)
  {
    uint64_t v4 = *(void (**)(uint64_t))(v0 + 24);
    uint64_t v3 = *(void *)(v0 + 32);
    uint64_t v5 = *(void *)(v1 + 16);
    swift_retain();
    v4(v5);
    MEMORY[0x2611FA440](v5, -1, -1);
    sub_25F633400(v5, (uint64_t)v4, v3, 0);
    char v2 = *(unsigned char *)(v1 + 40);
  }
  sub_25F633400(*(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), v2);
  return v1;
}

uint64_t TransportBuffer.__deallocating_deinit()
{
  uint64_t v1 = v0;
  char v2 = *(unsigned char *)(v0 + 40);
  if (!v2)
  {
    uint64_t v4 = *(void (**)(uint64_t))(v0 + 24);
    uint64_t v3 = *(void *)(v0 + 32);
    uint64_t v5 = *(void *)(v1 + 16);
    swift_retain();
    v4(v5);
    MEMORY[0x2611FA440](v5, -1, -1);
    sub_25F633400(v5, (uint64_t)v4, v3, 0);
    char v2 = *(unsigned char *)(v1 + 40);
  }
  sub_25F633400(*(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), v2);
  return MEMORY[0x270FA0228](v1, 41, 7);
}

uint64_t type metadata accessor for TransportBuffer()
{
  return self;
}

uint64_t method lookup function for TransportBuffer(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TransportBuffer);
}

uint64_t dispatch thunk of TransportBuffer.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of TransportBuffer.construct(with:destructor:size:capabilities:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of TransportBuffer.copyBytes<A>(from:size:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of TransportBuffer.setPosition(pos:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of TransportBuffer.withReservedDataRebound<A, B>(to:closure:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of TransportBuffer.reserved.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of TransportBuffer.data.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of TransportBuffer.rawData.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t sub_25F633E6C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (!a4) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for TransportBuffer.Buffer(uint64_t a1)
{
  return sub_25F633400(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(unsigned char *)(a1 + 24));
}

uint64_t initializeWithCopy for TransportBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_25F633E6C(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for TransportBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 24);
  sub_25F633E6C(*(void *)a2, v4, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  char v10 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v6;
  sub_25F633400(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TransportBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  char v4 = *(unsigned char *)(a2 + 24);
  uint64_t v5 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = v3;
  char v8 = *(unsigned char *)(a1 + 24);
  *(unsigned char *)(a1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
  sub_25F633400(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for TransportBuffer.Buffer(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 25)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TransportBuffer.Buffer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 25) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25F634058(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 1u) {
    return *(unsigned __int8 *)(a1 + 24);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_25F634070(uint64_t result, unsigned int a2)
{
  uint64_t v2 = a2 - 2;
  if (a2 >= 2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    LOBYTE(a2) = 2;
    *(void *)__n128 result = v2;
  }
  *(unsigned char *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TransportBuffer.Buffer()
{
  return &type metadata for TransportBuffer.Buffer;
}

uint64_t sub_25F63409C()
{
  swift_unknownObjectRelease();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_25F6340D4(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(a1, ObjectType, v3) & 1;
}

uint64_t sub_25F634130()
{
  swift_beginAccess();
  return MEMORY[0x2611FA4E0](v0 + 24);
}

uint64_t sub_25F634178(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 32) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_25F6341DC(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  void v3[5] = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x2611FA4E0](v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  v3[3] = v4;
  v3[4] = v5;
  return sub_25F63425C;
}

void sub_25F63425C(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + 32) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t ForwardingConnection.__allocating_init(service_endpoint:client_endpoint:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  ForwardingConnection.init(service_endpoint:client_endpoint:)(a1, a2);
  return v4;
}

uint64_t ForwardingConnection.init(service_endpoint:client_endpoint:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 32) = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  *(void *)(v6 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = &off_270BAD880;
  swift_retain();
  uint64_t v7 = TightbeamEndpoint.constructEndpoint()();
  char v8 = TightbeamEndpoint.constructEndpoint()();
  _DWORD v12[4] = sub_25F6344A4;
  v12[5] = v6;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_25F6344A8;
  uint64_t v12[3] = &block_descriptor;
  uint64_t v9 = _Block_copy(v12);
  swift_retain();
  swift_release();
  char v10 = tb_forwarding_connection_create_with_endpoint(v7, v8, v9);
  _Block_release(v9);
  swift_release();
  sub_25F63452C(a2);
  sub_25F63452C(a1);
  *(void *)(v3 + 16) = v10;
  return v3;
}

uint64_t type metadata accessor for AnyForwardingConnection()
{
  return self;
}

uint64_t sub_25F6344A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  LOBYTE(a4) = v7(a2, a3, a4);
  swift_release();
  return a4 & 1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_25F63452C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TightbeamEndpoint();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ForwardingConnection.__allocating_init(service_transport:client_transport:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = 0;
  *(void *)(v4 + 32) = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = &off_270BAD880;
  unsigned char v9[4] = sub_25F6344A4;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25F6344A8;
  v9[3] = &block_descriptor_3;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  uint64_t v7 = tb_forwarding_connection_create(a1, a2, v6);
  swift_release();
  _Block_release(v6);
  *(void *)(v4 + 16) = v7;
  return v4;
}

uint64_t ForwardingConnection.init(service_transport:client_transport:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 32) = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = &off_270BAD880;
  unsigned char v9[4] = sub_25F6344A4;
  v9[5] = v5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25F6344A8;
  v9[3] = &block_descriptor_7;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  uint64_t v7 = tb_forwarding_connection_create(a1, a2, v6);
  swift_release();
  _Block_release(v6);
  *(void *)(v2 + 16) = v7;
  return v2;
}

uint64_t ForwardingConnection.__allocating_init(serviceEndpoint:clientEndpoint:rawConnectionType:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = swift_allocObject();
  ForwardingConnection.init(serviceEndpoint:clientEndpoint:rawConnectionType:)(a1, a2, a3);
  return v6;
}

uint64_t ForwardingConnection.init(serviceEndpoint:clientEndpoint:rawConnectionType:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 32) = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v3;
  *(void *)(v8 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = &off_270BAD880;
  swift_retain();
  uint64_t v9 = TightbeamEndpoint.constructEndpoint()();
  char v10 = TightbeamEndpoint.constructEndpoint()();
  v14[4] = sub_25F6344A4;
  void v14[5] = v8;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  void v14[2] = sub_25F6344A8;
  v14[3] = &block_descriptor_10;
  uint64_t v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  uint64_t v12 = tb_forwarding_connection_create_with_endpoint_options(v9, v10, a3, v11);
  _Block_release(v11);
  swift_release();
  sub_25F63452C(a2);
  sub_25F63452C(a1);
  *(void *)(v4 + 16) = v12;
  return v4;
}

uint64_t sub_25F634990(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a2, ObjectType, v4) & 1;
}

uint64_t sub_25F6349EC(uint64_t a1)
{
  swift_beginAccess();
  if (MEMORY[0x2611FA4E0](v1 + 24))
  {
    uint64_t v3 = *(void *)(v1 + 32);
    type metadata accessor for AnyForwardingConnection();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v1;
    *(void *)(v4 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = &off_270BAD880;
    swift_retain();
    uint64_t v5 = sub_25F63E748(a1, v4);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v8 = v5;
    LOBYTE(v3) = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(v3 + 8))(v1, &v8, ObjectType, v3);
    swift_retain();
    sub_25F63DD10();
    swift_unknownObjectRelease();
    swift_release_n();
    return v3 & 1;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F634B34()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result) {
    return tb_forwarding_connection_activate(result);
  }
  __break(1u);
  return result;
}

uint64_t ForwardingConnection.deinit()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result)
  {
    tb_forwarding_connection_destruct(result);
    sub_25F634B74(v0 + 24);
    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_25F634B74(uint64_t a1)
{
  return a1;
}

uint64_t ForwardingConnection.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    tb_forwarding_connection_destruct(v4);
    sub_25F634B74(v3 + 24);
    uint64_t v4 = v3;
    a2 = 40;
    a3 = 7;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA0228](v4, a2, a3);
}

uint64_t sub_25F634BE8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 24;
  swift_beginAccess();
  uint64_t result = MEMORY[0x2611FA4E0](v4);
  uint64_t v6 = *(void *)(v3 + 32);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_25F634C44(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 32) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of ForwardingProtocol.decode(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for ForwardingConnection()
{
  return self;
}

uint64_t method lookup function for ForwardingConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ForwardingConnection);
}

uint64_t dispatch thunk of ForwardingConnection.forward.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ForwardingConnection.forward.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of ForwardingConnection.forward.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ForwardingConnection.__allocating_init(service_endpoint:client_endpoint:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ForwardingConnection.__allocating_init(service_transport:client_transport:)()
{
  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of ForwardingConnection.__allocating_init(serviceEndpoint:clientEndpoint:rawConnectionType:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ForwardingConnection.begin()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t tb_error_t.description.getter()
{
  return 0x206E776F6E6B6E55;
}

unint64_t static tb_error_t._nsErrorDomain.getter()
{
  return 0xD000000000000018;
}

uint64_t sub_25F634F90(uint64_t a1)
{
  uint64_t v2 = sub_25F6351FC(&qword_26A7AF778);
  return MEMORY[0x270EEEA80](a1, v2);
}

uint64_t sub_25F634FE8(uint64_t a1)
{
  uint64_t v2 = sub_25F6351FC(&qword_26A7AF778);
  return MEMORY[0x270EEEA78](a1, v2);
}

uint64_t sub_25F635040()
{
  return tb_error_t.description.getter();
}

uint64_t sub_25F635048()
{
  return sub_25F6351FC(&qword_26A7AF9B0);
}

uint64_t sub_25F63507C()
{
  return sub_25F6351FC(&qword_26A7AF9B8);
}

uint64_t sub_25F6350B0()
{
  return sub_25F6351FC(&qword_26A7AF9C0);
}

unint64_t sub_25F6350E8()
{
  unint64_t result = qword_26A7AF9C8;
  if (!qword_26A7AF9C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF9C8);
  }
  return result;
}

unint64_t sub_25F63513C()
{
  return 0xD000000000000018;
}

uint64_t sub_25F635158()
{
  return sub_25F6351FC((unint64_t *)&qword_26A7AF730);
}

uint64_t sub_25F63518C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_25F6351FC(&qword_26A7AF778);
  return MEMORY[0x270EEEA68](a1, a2, v4);
}

uint64_t sub_25F6351FC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for TransportError(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_25F635240()
{
  type metadata accessor for UnixTransportProtocol();
  sub_25F6358C0();
  sub_25F642990();
  swift_allocObject();
  uint64_t result = sub_25F642980();
  qword_26A7B09F0 = result;
  return result;
}

uint64_t sub_25F63529C(uint64_t *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = 0;
  if ((a3 & 1) == 0)
  {
    if (a1)
    {
      if (a2 - (uint64_t)a1 >= a5)
      {
LABEL_4:
        *(void *)a6 = sub_25F635474(a1, a2);
        *(unsigned char *)(a6 + 8) = 0;
        return a5;
      }
    }
    else if (a5 <= 0)
    {
      goto LABEL_4;
    }
    return 0;
  }
  return v6;
}

uint64_t sub_25F635368()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for UnixTransportProtocol()
{
  return self;
}

unint64_t sub_25F63539C()
{
  return 0xD000000000000013;
}

uint64_t sub_25F6353B8()
{
  swift_release();
  return swift_allocObject();
}

uint64_t sub_25F6353EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = *MEMORY[0x263F14288];
  uint64_t v3 = sub_25F6429A0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);
  return v4(a1, v2, v3);
}

uint64_t sub_25F635464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F635540(a1, a3);
}

uint64_t sub_25F63546C()
{
  return 1;
}

uint64_t sub_25F635474(uint64_t *a1, uint64_t a2)
{
  if (!a1)
  {
    uint64_t v2 = 0;
    goto LABEL_6;
  }
  uint64_t v2 = a2 - (void)a1;
  if (a2 - (uint64_t)a1 <= 15)
  {
LABEL_6:
    sub_25F635914();
    swift_allocError();
    *(void *)uint64_t v4 = 16;
    char v5 = 1;
    goto LABEL_7;
  }
  uint64_t v2 = *a1;
  if (*a1 == 0x12345678AABBCCDDLL) {
    return a1[1];
  }
  sub_25F635914();
  swift_allocError();
  char v5 = 0;
  *(void *)uint64_t v4 = 0x12345678AABBCCDDLL;
LABEL_7:
  *(void *)(v4 + 8) = v2;
  *(unsigned char *)(v4 + 16) = v5;
  return swift_willThrow();
}

uint64_t sub_25F635540(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2 < 0)
  {
    sub_25F642D80();
    __break(1u);
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    long long v13 = xmmword_25F644540;
    uint64_t __src = 0x12345678AABBCCDDLL;
    uint64_t v3 = sub_25F63CC3C(&__src, &v13);
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFFFLL;
    sub_25F642750();
    sub_25F625550(v3, v5);
    uint64_t v11 = a2;
    uint64_t v6 = sub_25F63CC3C(&v11, &__src);
    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFFLL;
    sub_25F642750();
    sub_25F625550(v6, v8);
    long long v9 = v13;
    sub_25F642A00();
    sub_25F625550(v9, *((unint64_t *)&v9 + 1));
    return sub_25F642A10();
  }
  return result;
}

uint64_t sub_25F6356C8()
{
  return 16;
}

uint64_t sub_25F6358B4(uint64_t *a1, uint64_t a2, char a3, uint64_t a4)
{
  return sub_25F63529C(a1, a2, a3 & 1, a4, *(void *)(v4 + 16), *(void *)(v4 + 24));
}

unint64_t sub_25F6358C0()
{
  unint64_t result = qword_26A7AF9D0;
  if (!qword_26A7AF9D0)
  {
    type metadata accessor for UnixTransportProtocol();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF9D0);
  }
  return result;
}

unint64_t sub_25F635914()
{
  unint64_t result = qword_26A7AF9D8;
  if (!qword_26A7AF9D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF9D8);
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for UnixProtocolHeader.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UnixProtocolHeader.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_25F635A08(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_25F635A10(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UnixProtocolHeader.Error()
{
  return &type metadata for UnixProtocolHeader.Error;
}

uint64_t TightbeamBadge.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = HIBYTE(result);
  *(unsigned char *)(a2 + 1) = 0;
  *(unsigned char *)(a2 + 2) = BYTE6(result);
  *(_WORD *)(a2 + 4) = WORD2(result);
  *(_WORD *)(a2 + 6) = WORD1(result);
  *(_WORD *)(a2 + 8) = result;
  return result;
}

unsigned char *TightbeamBadge.init(usage:variant:component:client:metadata:)@<X0>(unsigned char *result@<X0>, __int16 a2@<W1>, __int16 a3@<W2>, __int16 a4@<W3>, int a5@<W4>, uint64_t a6@<X8>)
{
  char v6 = result[1];
  if ((a2 & 0x100) != 0) {
    char v7 = 0;
  }
  else {
    char v7 = a2;
  }
  *(unsigned char *)a6 = *result;
  *(unsigned char *)(a6 + 1) = v6;
  *(unsigned char *)(a6 + 2) = v7;
  if ((a5 & 0x10000) != 0) {
    __int16 v8 = 0;
  }
  else {
    __int16 v8 = a5;
  }
  *(_WORD *)(a6 + 4) = a3;
  *(_WORD *)(a6 + 6) = a4;
  *(_WORD *)(a6 + 8) = v8;
  return result;
}

void TightbeamBadge.usage.getter(unsigned char *a1@<X8>)
{
  char v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
}

uint64_t TightbeamBadge.variant.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t TightbeamBadge.component.getter()
{
  return *(unsigned __int16 *)(v0 + 4);
}

uint64_t TightbeamBadge.client.getter()
{
  return *(unsigned __int16 *)(v0 + 6);
}

uint64_t TightbeamBadge.metadata.getter()
{
  return *(unsigned __int16 *)(v0 + 8);
}

uint64_t TightbeamBadge.Usage.init(_:)@<X0>(uint64_t result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = result;
  a2[1] = 0;
  return result;
}

uint64_t __swift_memcpy10_2(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TightbeamBadge(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 10)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for TightbeamBadge(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 10) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TightbeamBadge()
{
  return &type metadata for TightbeamBadge;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TightbeamBadge.Usage(unsigned __int16 *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  unsigned int v2 = a2 + 0xFFFF;
  if ((a2 + 0xFFFF) <= 0xFFFEFFFF) {
    unsigned int v3 = 2;
  }
  else {
    unsigned int v3 = 4;
  }
  if (v2 < 0xFF0000) {
    unsigned int v3 = 1;
  }
  if (v2 >= 0x10000) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  switch(v4)
  {
    case 1:
      uint64_t v4 = *((unsigned __int8 *)a1 + 2);
      if (!*((unsigned char *)a1 + 2)) {
        return v4;
      }
      goto LABEL_17;
    case 2:
      uint64_t v4 = a1[1];
      if (!a1[1]) {
        return v4;
      }
      goto LABEL_17;
    case 3:
      __break(1u);
      JUMPOUT(0x25F635BE4);
    case 4:
      uint64_t v4 = *(unsigned int *)(a1 + 1);
      if (v4) {
LABEL_17:
      }
        uint64_t v4 = (*a1 | (v4 << 16)) - 0xFFFF;
      break;
    default:
      return v4;
  }
  return v4;
}

uint64_t storeEnumTagSinglePayload for TightbeamBadge.Usage(uint64_t result, int a2, int a3)
{
  unsigned int v3 = a3 + 0xFFFF;
  if ((a3 + 0xFFFF) <= 0xFFFEFFFF) {
    int v4 = 2;
  }
  else {
    int v4 = 4;
  }
  if (v3 < 0xFF0000) {
    int v4 = 1;
  }
  if (v3 >= 0x10000) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 0;
  }
  if (a3) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2)
  {
    unsigned int v7 = ((a2 - 1) >> 16) + 1;
    *(_WORD *)__n128 result = a2 - 1;
    switch(v6)
    {
      case 1:
        *(unsigned char *)(result + 2) = v7;
        return result;
      case 2:
        *(_WORD *)(result + 2) = v7;
        return result;
      case 3:
        goto LABEL_21;
      case 4:
        *(_DWORD *)(result + 2) = v7;
        return result;
      default:
        return result;
    }
  }
  switch(v6)
  {
    case 1:
      *(unsigned char *)(result + 2) = 0;
      break;
    case 2:
      *(_WORD *)(result + 2) = 0;
      break;
    case 3:
LABEL_21:
      __break(1u);
      JUMPOUT(0x25F635CB4);
    case 4:
      *(_DWORD *)(result + 2) = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_25F635CDC(unsigned __int8 *a1)
{
  if (a1[1]) {
    return (*a1 | (a1[1] << 8)) - 255;
  }
  else {
    return 0;
  }
}

unsigned char *sub_25F635CFC(unsigned char *result, int a2)
{
  if (a2)
  {
    *__n128 result = a2 - 1;
    result[1] = ((unsigned __int16)(a2 - 1) >> 8) + 1;
  }
  else
  {
    result[1] = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TightbeamBadge.Usage()
{
  return &type metadata for TightbeamBadge.Usage;
}

uint64_t TightbeamDecoder.init(message:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t TightbeamDecoder.decode(as:)()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  unsigned __int8 v3 = 0;
  uint64_t v1 = *(void *)(*(void *)v0 + 24);
  if (v1)
  {
    tb_message_decode_BOOL(v1, &v3);
    return v3;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

{
  uint64_t vars8;

  return sub_25F636004((void (*)(uint64_t, unsigned __int8 *))tb_message_decode_u8);
}

{
  uint64_t vars8;

  return sub_25F63614C((void (*)(uint64_t, unsigned __int16 *))tb_message_decode_u16);
}

{
  uint64_t vars8;

  return sub_25F636294((void (*)(uint64_t, unsigned int *))tb_message_decode_u32);
}

{
  uint64_t vars8;

  return sub_25F6363DC((void (*)(uint64_t, void *))tb_message_decode_u64);
}

{
  uint64_t vars8;

  return sub_25F636004((void (*)(uint64_t, unsigned __int8 *))tb_message_decode_s8);
}

{
  uint64_t vars8;

  return sub_25F63614C((void (*)(uint64_t, unsigned __int16 *))tb_message_decode_s16);
}

{
  uint64_t vars8;

  return sub_25F636294((void (*)(uint64_t, unsigned int *))tb_message_decode_s32);
}

{
  uint64_t vars8;

  return sub_25F6363DC((void (*)(uint64_t, void *))tb_message_decode_s64);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  int v4;
  uint64_t v5;

  unsigned int v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = *v0;
  uint64_t v4 = 0;
  unsigned int v2 = *(void *)(v1 + 24);
  if (v2)
  {
    swift_retain();
    tb_message_decode_f32(v2, &v4);
    return swift_release();
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  void v4[2];

  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *v0;
  v4[0] = 0;
  unsigned int v2 = *(void *)(v1 + 24);
  if (v2)
  {
    swift_retain();
    tb_message_decode_f64(v2, v4);
    return swift_release();
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F636004(void (*a1)(uint64_t, unsigned __int8 *))
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *v1;
  unsigned __int8 v6 = 0;
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, &v6);
    swift_release();
    return v6;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F63614C(void (*a1)(uint64_t, unsigned __int16 *))
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *v1;
  unsigned __int16 v6 = 0;
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, &v6);
    swift_release();
    return v6;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F636294(void (*a1)(uint64_t, unsigned int *))
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *v1;
  unsigned int v6 = 0;
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, &v6);
    swift_release();
    return v6;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F6363DC(void (*a1)(uint64_t, void *))
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *v1;
  v6[0] = 0;
  uint64_t v3 = *(void *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, v6);
    swift_release();
    return v6[0];
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t TightbeamDecoder.decode(as:)@<X0>(void *a1@<X8>)
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  uint64_t v3 = *(void *)(*(void *)v1 + 24);
  if (v3)
  {
    uint64_t result = tb_message_decode_capability(v3, v5);
    *a1 = v5[0];
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

void TightbeamDecoder.decode(as:)()
{
}

uint64_t TightbeamDecoder.encoder(bytes:capabilities:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = *v3;
  uint64_t result = sub_25F63DAC8(a1, a2);
  if (!v4)
  {
    *a3 = v6;
    return swift_retain();
  }
  return result;
}

uint64_t TightbeamCapabilityDecoder.init(table:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

Swift::UInt __swiftcall TightbeamCapabilityDecoder.capability(for:)(Swift::Int a1)
{
  uint64_t v2 = *v1;
  if ((a1 & 0x8000000000000000) == 0 && v2 && v1[1] - *v1 > a1) {
    return v2 + a1;
  }
  sub_25F642D20();
  sub_25F642B50();
  sub_25F623B40();
  sub_25F642CF0();
  sub_25F642B50();
  swift_bridgeObjectRelease();
  sub_25F642B50();
  sub_25F642CF0();
  sub_25F642B50();
  swift_bridgeObjectRelease();
  sub_25F642B50();
  Swift::UInt result = sub_25F642D90();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for TightbeamDecoder()
{
  return &type metadata for TightbeamDecoder;
}

ValueMetadata *type metadata accessor for TightbeamCapabilityDecoder()
{
  return &type metadata for TightbeamCapabilityDecoder;
}

uint64_t sub_25F636928()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9Tightbeam16UnixEndpointData_targetUrl;
  uint64_t v2 = sub_25F642710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t _tb_unix_client_transport_create_with_endpoint(uint64_t a1)
{
  uint64_t v2 = sub_25F642710();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  unsigned int v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = tb_endpoint_get_data(a1) + OBJC_IVAR____TtC9Tightbeam16UnixEndpointData_targetUrl;
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  swift_retain();
  v7(v5, v6, v2);
  swift_release();
  type metadata accessor for UnixTransportClient(0);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_connection) = 0;
  *(void *)(v8 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage) = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v8 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_targetURL, v5, v2);
  return v8;
}

uint64_t type metadata accessor for UnixTransportClient(uint64_t a1)
{
  return sub_25F632A48(a1, (uint64_t *)&unk_26B39A360);
}

uint64_t __tb_unix_client_transport_destruct(uint64_t a1)
{
  tb_transport_get_context(a1);
  return swift_release();
}

uint64_t _tb_unix_client_transport_activate(uint64_t a1)
{
  uint64_t context = tb_transport_get_context(a1);
  swift_retain();
  uint64_t v2 = sub_25F642700();
  uint64_t v4 = v3;
  type metadata accessor for UnixProtocolConnection();
  unsigned int v5 = (void *)swift_allocObject();
  swift_retain();
  *(void *)(context + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_connection) = sub_25F637134(v2, v4, context, 0, v5);
  swift_release();
  swift_release();
  return 0;
}

uint64_t sub_25F636C08(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_25F642870();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (uint64_t (**)(uint64_t))((char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v9 = *(void *)(v3 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_connection);
  if (!v9)
  {
    uint64_t v11 = 0;
    goto LABEL_5;
  }
  uint64_t v10 = OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage;
  if (*(void *)(v3 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage))
  {
    uint64_t v11 = 1;
LABEL_5:
    sub_25F637DC4();
    swift_allocError();
    *uint64_t v12 = v11;
    swift_willThrow();
    return v11;
  }
  type metadata accessor for PendingMessage();
  swift_allocObject();
  swift_retain();
  uint64_t v13 = sub_25F62C974(a1);
  uint64_t v14 = *(void *)(*(void *)(v13 + 24) + 32);
  if (v14 && *(unsigned __int8 *)(v14 + 40) < 2u && (v15 = *(uint64_t **)(v14 + 16), uint64_t v16 = v15[2], v15[3] >= v16))
  {
    uint64_t v33 = v5;
    uint64_t v27 = v10;
    uint64_t v28 = v2;
    uint64_t v29 = v13;
    uint64_t v30 = v6;
    if ((v16 & 0x8000000000000000) == 0)
    {
      uint64_t v17 = *v15;
      uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF958);
      v32[3] = v18;
      v32[4] = sub_25F632F7C((unint64_t *)&qword_26A7AF960, &qword_26A7AF958);
      v32[0] = v17;
      v32[1] = v16;
      uint64_t v19 = __swift_project_boxed_opaque_existential_1(v32, v18);
      if (*v19) {
        uint64_t v20 = (unsigned char *)(*v19 + v19[1]);
      }
      else {
        uint64_t v20 = 0;
      }
      sub_25F63C9F0((unsigned char *)*v19, v20, v31);
      uint64_t v22 = v31[0];
      unint64_t v21 = v31[1];
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
      uint64_t v28 = *(void *)(v9 + 56);
      *uint64_t v8 = sub_25F637E18;
      v8[1] = (uint64_t (*)(uint64_t))v9;
      uint64_t v23 = v30;
      (*(void (**)(uint64_t (**)(uint64_t), void, uint64_t))(v30 + 104))(v8, *MEMORY[0x263F141E0], v33);
      sub_25F642860();
      swift_retain();
      sub_25F642850();
      sub_25F6428A0();
      swift_release();
      (*(void (**)(uint64_t (**)(uint64_t), uint64_t))(v23 + 8))(v8, v33);
      sub_25F625550(v22, v21);
      uint64_t v24 = v27;
      *(void *)(v3 + v27) = v29;
      swift_retain();
      swift_release();
      sub_25F642C80();
      *(void *)(v3 + v++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
      swift_release();
      swift_retain();
      uint64_t v11 = sub_25F63DD10();
      swift_release();
      swift_release();
      swift_release();
      return v11;
    }
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
  uint64_t result = sub_25F642DE0();
  __break(1u);
  return result;
}

uint64_t sub_25F637044()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_targetURL;
  uint64_t v2 = sub_25F642710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25F637108(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_25F63780C(a2, a3);
}

uint64_t sub_25F637134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = sub_25F642C50();
  uint64_t v43 = *(void *)(v10 - 8);
  uint64_t v44 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v42 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = sub_25F642C40();
  MEMORY[0x270FA5388](v40);
  int64_t v41 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_25F642A70();
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_25F6427E0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (uint64_t *)((char *)&v34 - v21);
  v47[3] = type metadata accessor for UnixTransportClient(0);
  v47[4] = &off_270BAD848;
  v47[0] = a3;
  sub_25F625294((uint64_t)v47, (uint64_t)(a5 + 2));
  a5[8] = a1;
  a5[9] = a2;
  uint64_t v45 = a4;
  if (a4)
  {
    a5[7] = a4;
  }
  else
  {
    uint64_t v37 = a1;
    uint64_t v39 = v15;
    sub_25F642970();
    uint64_t v38 = a2;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_25F642960();
    if (qword_26A7AF720 != -1) {
      swift_once();
    }
    sub_25F6429E0();
    swift_allocObject();
    swift_retain();
    uint64_t v24 = sub_25F6429D0();
    sub_25F642940();
    swift_retain();
    uint64_t v26 = (void (*)(void *, void))sub_25F642930();
    uint64_t v36 = v23;
    uint64_t v27 = *v25;
    if ((unint64_t)*v25 >> 62)
    {
      uint64_t v33 = v27 & 0xFFFFFFFFFFFFFF8;
      if (v27 < 0) {
        uint64_t v33 = *v25;
      }
      uint64_t v35 = v33;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_25F642DA0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v35 < 0)
      {
        __break(1u);
        return result;
      }
    }
    sub_25F624900(0, 0, v24);
    v26(v46, 0);
    swift_release();
    uint64_t v28 = v38;
    *uint64_t v22 = v37;
    v22[1] = v28;
    (*(void (**)(void *, void, uint64_t))(v17 + 104))(v22, *MEMORY[0x263F14100], v16);
    (*(void (**)(char *, void *, uint64_t))(v17 + 16))(v20, v22, v16);
    sub_25F642920();
    swift_allocObject();
    uint64_t v29 = sub_25F642890();
    swift_release();
    (*(void (**)(void *, uint64_t))(v17 + 8))(v22, v16);
    a5[7] = v29;
  }
  swift_retain();
  swift_retain();
  swift_retain();
  sub_25F6252FC((uint64_t)sub_25F637E20);
  sub_25F642880();
  swift_release();
  swift_release();
  sub_25F62530C();
  sub_25F642910();
  sub_25F6427B0();
  (*(void (**)(void *, uint64_t))(v17 + 8))(v22, v16);
  sub_25F642A60();
  v46[0] = MEMORY[0x263F8EE78];
  sub_25F62534C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF828);
  sub_25F632F7C((unint64_t *)&qword_26A7AF830, &qword_26A7AF828);
  sub_25F642D00();
  (*(void (**)(char *, void, uint64_t))(v43 + 104))(v42, *MEMORY[0x263F8F130], v44);
  uint64_t v30 = (void *)sub_25F642C70();
  swift_retain();
  sub_25F6428D0();
  swift_release();
  if (qword_26A7AF700 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v31 = v30;
  MEMORY[0x2611F9A20]();
  if (*(void *)((qword_26A7AF800 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((qword_26A7AF800 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_25F642BF0();
  sub_25F642C10();
  sub_25F642BE0();
  swift_endAccess();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  return (uint64_t)a5;
}

uint64_t sub_25F63776C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F63780C(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage);
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(v5 + 24) + 32);
    if (!v6 || *(unsigned __int8 *)(v6 + 40) >= 2u) {
      goto LABEL_37;
    }
    uint64_t v7 = *(void *)(v6 + 16);
    unint64_t v8 = a2 >> 62;
    switch(a2 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(a1), a1)) {
          goto LABEL_33;
        }
        size_t v9 = HIDWORD(a1) - (int)a1;
LABEL_16:
        swift_retain();
        tb_unix_transport_message_buffer_reset(v7, 0, v9);
        if (v9) {
          goto LABEL_17;
        }
        goto LABEL_28;
      case 2uLL:
        uint64_t v12 = *(void *)(a1 + 16);
        uint64_t v11 = *(void *)(a1 + 24);
        size_t v13 = v11 - v12;
        if (__OFSUB__(v11, v12))
        {
          __break(1u);
LABEL_33:
          __break(1u);
        }
        else
        {
          swift_retain();
          tb_unix_transport_message_buffer_reset(v7, 0, v13);
          uint64_t v15 = *(void *)(a1 + 16);
          uint64_t v14 = *(void *)(a1 + 24);
          if (!__OFSUB__(v14, v15))
          {
            if (v14 == v15)
            {
LABEL_28:
              uint64_t v21 = *(_DWORD **)(*(void *)(v5 + 24) + 24);
              if (v21)
              {
                tb_message_set_state(v21, 4);
                sub_25F642C90();
                return swift_release();
              }
LABEL_37:
              sub_25F642D90();
              __break(1u);
              JUMPOUT(0x25F637B50);
            }
LABEL_17:
            if (!*(void *)(*(void *)(v5 + 24) + 32)) {
              goto LABEL_37;
            }
            if (v8)
            {
              if (v8 == 1)
              {
                if (!__OFSUB__(HIDWORD(a1), a1))
                {
                  uint64_t v16 = HIDWORD(a1) - (int)a1;
                  goto LABEL_24;
                }
                goto LABEL_35;
              }
              uint64_t v18 = *(void *)(a1 + 16);
              uint64_t v17 = *(void *)(a1 + 24);
              uint64_t v16 = v17 - v18;
              if (__OFSUB__(v17, v18))
              {
LABEL_36:
                __break(1u);
                goto LABEL_37;
              }
            }
            else
            {
              uint64_t v16 = BYTE6(a2);
            }
LABEL_24:
            swift_retain();
            sub_25F63BD88(a1, a2, v16);
            swift_release();
            uint64_t v19 = *(void *)(*(void *)(v5 + 24) + 32);
            if (!v19) {
              goto LABEL_37;
            }
            if (*(unsigned __int8 *)(v19 + 40) >= 2u) {
              goto LABEL_37;
            }
            uint64_t v20 = *(void *)(v19 + 16);
            if (*(uint64_t *)(v20 + 24) < 1) {
              goto LABEL_37;
            }
            *(void *)(v20 + 16) = 0;
            goto LABEL_28;
          }
        }
        __break(1u);
LABEL_35:
        __break(1u);
        goto LABEL_36;
      case 3uLL:
        swift_retain();
        tb_unix_transport_message_buffer_reset(v7, 0, 0);
        goto LABEL_28;
      default:
        size_t v9 = BYTE6(a2);
        goto LABEL_16;
    }
  }
  sub_25F642D20();
  swift_bridgeObjectRelease();
  sub_25F642720();
  sub_25F642B50();
  swift_bridgeObjectRelease();
  sub_25F623FD8();
  return swift_bridgeObjectRelease();
}

uint64_t _tb_unix_client_transport_send_message_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  tb_transport_get_context(a1);
  swift_retain();
  uint64_t v5 = sub_25F636C08(a2);
  swift_release();
  if (a3) {
    *a3 = v5;
  }
  return 0;
}

uint64_t sub_25F637C44()
{
  return type metadata accessor for UnixEndpointData(0);
}

uint64_t type metadata accessor for UnixEndpointData(uint64_t a1)
{
  return sub_25F632A48(a1, (uint64_t *)&unk_26B39A328);
}

uint64_t sub_25F637C6C()
{
  uint64_t result = sub_25F642710();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for PendingMessage()
{
  return self;
}

uint64_t sub_25F637D20()
{
  return type metadata accessor for UnixTransportClient(0);
}

uint64_t sub_25F637D28()
{
  uint64_t result = sub_25F642710();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_25F637DC4()
{
  unint64_t result = qword_26A7AF9E0;
  if (!qword_26A7AF9E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF9E0);
  }
  return result;
}

uint64_t sub_25F637E18(uint64_t a1)
{
  return sub_25F62456C(a1);
}

uint64_t sub_25F637E20(uint64_t a1)
{
  return sub_25F6240BC(a1);
}

unsigned char *storeEnumTagSinglePayload for UnixTransportClient.Error(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25F637EF4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UnixTransportClient.Error()
{
  return &type metadata for UnixTransportClient.Error;
}

unint64_t sub_25F637F30()
{
  unint64_t result = qword_26A7AF9E8;
  if (!qword_26A7AF9E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF9E8);
  }
  return result;
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Bool a1)
{
  if (*(void *)(*(void *)v1 + 24))
  {
    Swift::Bool v2 = a1;
    uint64_t v3 = *(void *)(*(void *)v1 + 24);
    tb_message_encode_BOOL(v3, v2);
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt8 a1)
{
  if (*(void *)(*(void *)v1 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)v1 + 24);
    tb_message_encode_u8(v3, a1);
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt16 a1)
{
  if (*(void *)(*(void *)v1 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)v1 + 24);
    tb_message_encode_u16(v3, a1);
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt64 a1)
{
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int8 a1)
{
  if (*(void *)(*(void *)v1 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)v1 + 24);
    tb_message_encode_s8(v3, a1);
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int16 a1)
{
  if (*(void *)(*(void *)v1 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)v1 + 24);
    tb_message_encode_s16(v3, a1);
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int32 a1)
{
}

uint64_t sub_25F638288(uint64_t a1, uint64_t (*a2)(void))
{
  if (*(void *)(*(void *)v2 + 24))
  {
    return a2();
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int64 a1)
{
}

uint64_t sub_25F638330(uint64_t a1, uint64_t (*a2)(void))
{
  if (*(void *)(*(void *)v2 + 24))
  {
    return a2();
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Float a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  if (v2)
  {
    tb_message_encode_f32(v2, a1);
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Double a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  if (v2)
  {
    tb_message_encode_f64(v2, a1);
  }
  else
  {
    sub_25F642D90();
    __break(1u);
  }
}

uint64_t TightbeamEncoder.encode(_:)(uint64_t *a1)
{
  if (*(void *)(*(void *)v1 + 24))
  {
    uint64_t v2 = *a1;
    uint64_t v3 = *(void *)(*(void *)v1 + 24);
    return tb_message_encode_capability(v3, v2);
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

void *TightbeamEncoder.encode(_:)(const void *a1, uint64_t a2)
{
  if (a1 && (uint64_t v4 = *(void *)(*(void *)v2 + 24)) != 0)
  {
    return tb_message_encode_buffer(v4, a1, a2 - (void)a1);
  }
  else
  {
    uint64_t result = (void *)sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t TightbeamEncoder.complete()()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 24);
  if (v1)
  {
    tb_message_complete(v1);
    return swift_retain();
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F6386C0(char a1)
{
  if (*(void *)(*(void *)v1 + 24))
  {
    char v2 = a1 & 1;
    uint64_t v3 = *(void *)(*(void *)v1 + 24);
    return tb_message_encode_BOOL(v3, v2);
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F63874C(char a1)
{
  if (*(void *)(*(void *)v1 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)v1 + 24);
    return tb_message_encode_u8(v3, a1);
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F6387D8(__int16 a1)
{
  if (*(void *)(*(void *)v1 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)v1 + 24);
    return tb_message_encode_u16(v3, a1);
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F638864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F6389C4(a1, a2, a3, (uint64_t (*)(void))tb_message_encode_u32);
}

uint64_t sub_25F63887C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F638A68(a1, a2, a3, (uint64_t (*)(void))tb_message_encode_u64);
}

uint64_t sub_25F638894(char a1)
{
  if (*(void *)(*(void *)v1 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)v1 + 24);
    return tb_message_encode_s8(v3, a1);
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F638920(__int16 a1)
{
  if (*(void *)(*(void *)v1 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)v1 + 24);
    return tb_message_encode_s16(v3, a1);
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F6389AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F6389C4(a1, a2, a3, (uint64_t (*)(void))tb_message_encode_s32);
}

uint64_t sub_25F6389C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  if (*(void *)(*(void *)v4 + 24))
  {
    return a4();
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F638A50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F638A68(a1, a2, a3, (uint64_t (*)(void))tb_message_encode_s64);
}

uint64_t sub_25F638A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  if (*(void *)(*(void *)v4 + 24))
  {
    return a4();
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F638AF4(float a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  if (v2)
  {
    return tb_message_encode_f32(v2, a1);
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F638B78(double a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24);
  if (v2)
  {
    return tb_message_encode_f64(v2, a1);
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t TightbeamSizingEncoder.size.getter()
{
  return *(void *)v0;
}

Tightbeam::TightbeamSizingEncoder __swiftcall TightbeamSizingEncoder.init()()
{
  void *v0 = 0;
  return result;
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Bool a1)
{
  uint64_t v2 = tb_message_size_BOOL();
  if (__OFADD__(*v1, v2)) {
    __break(1u);
  }
  else {
    *v1 += v2;
  }
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt16 a1)
{
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt32 a1)
{
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt64 a1)
{
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int8 a1)
{
}

uint64_t sub_25F638CB0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (__OFADD__(*v2, result)) {
    __break(1u);
  }
  else {
    *v2 += result;
  }
  return result;
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int16 a1)
{
}

uint64_t sub_25F638CF8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (__OFADD__(*v2, result)) {
    __break(1u);
  }
  else {
    *v2 += result;
  }
  return result;
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int32 a1)
{
}

uint64_t sub_25F638D40(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (__OFADD__(*v2, result)) {
    __break(1u);
  }
  else {
    *v2 += result;
  }
  return result;
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int64 a1)
{
}

uint64_t sub_25F638D88(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = a2();
  if (__OFADD__(*v2, result)) {
    __break(1u);
  }
  else {
    *v2 += result;
  }
  return result;
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Float a1)
{
  uint64_t v2 = tb_message_size_f32();
  if (__OFADD__(*v1, v2)) {
    __break(1u);
  }
  else {
    *v1 += v2;
  }
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Double a1)
{
  uint64_t v2 = tb_message_size_f64();
  if (__OFADD__(*v1, v2)) {
    __break(1u);
  }
  else {
    *v1 += v2;
  }
}

uint64_t TightbeamSizingEncoder.encode(_:)()
{
  uint64_t result = tb_message_size_capability();
  if (__OFADD__(*v0, result)) {
    __break(1u);
  }
  else {
    *v0 += result;
  }
  return result;
}

uint64_t sub_25F638E3C()
{
  uint64_t result = tb_message_size_BOOL();
  if (__OFADD__(*v0, result)) {
    __break(1u);
  }
  else {
    *v0 += result;
  }
  return result;
}

uint64_t sub_25F638E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F638EE0(a1, a2, a3, tb_message_size_u8);
}

uint64_t sub_25F638E80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F638F28(a1, a2, a3, tb_message_size_u16);
}

uint64_t sub_25F638E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F638F70(a1, a2, a3, tb_message_size_u32);
}

uint64_t sub_25F638EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F638FB8(a1, a2, a3, tb_message_size_u64);
}

uint64_t sub_25F638EC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F638EE0(a1, a2, a3, tb_message_size_s8);
}

uint64_t sub_25F638EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (__OFADD__(*v4, result)) {
    __break(1u);
  }
  else {
    *v4 += result;
  }
  return result;
}

uint64_t sub_25F638F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F638F28(a1, a2, a3, tb_message_size_s16);
}

uint64_t sub_25F638F28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (__OFADD__(*v4, result)) {
    __break(1u);
  }
  else {
    *v4 += result;
  }
  return result;
}

uint64_t sub_25F638F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F638F70(a1, a2, a3, tb_message_size_s32);
}

uint64_t sub_25F638F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (__OFADD__(*v4, result)) {
    __break(1u);
  }
  else {
    *v4 += result;
  }
  return result;
}

uint64_t sub_25F638FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F638FB8(a1, a2, a3, tb_message_size_s64);
}

uint64_t sub_25F638FB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t result = a4();
  if (__OFADD__(*v4, result)) {
    __break(1u);
  }
  else {
    *v4 += result;
  }
  return result;
}

uint64_t sub_25F638FE8()
{
  uint64_t result = tb_message_size_f32();
  if (__OFADD__(*v0, result)) {
    __break(1u);
  }
  else {
    *v0 += result;
  }
  return result;
}

uint64_t sub_25F639014()
{
  uint64_t result = tb_message_size_f64();
  if (__OFADD__(*v0, result)) {
    __break(1u);
  }
  else {
    *v0 += result;
  }
  return result;
}

uint64_t dispatch thunk of TightbeamEncoderProtocol.encode(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of TightbeamEncoderProtocol.encode(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

ValueMetadata *type metadata accessor for TightbeamEncoder()
{
  return &type metadata for TightbeamEncoder;
}

ValueMetadata *type metadata accessor for TightbeamSizingEncoder()
{
  return &type metadata for TightbeamSizingEncoder;
}

_DWORD *TightbeamEndpoint.constructEndpoint()()
{
  uint64_t v1 = sub_25F642710();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v1);
  uint64_t v5 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v81 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF938);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  uint64_t v11 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  size_t v13 = (char *)&v81 - v12;
  uint64_t v14 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x270FA5388](v14);
  uint64_t v16 = (void *)((char *)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_25F639D78(v0, (uint64_t)v16);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v17 = *(unsigned int *)v16;
      if ((v17 & 0x80000000) != 0) {
        goto LABEL_39;
      }
      if (v17) {
        goto LABEL_21;
      }
      __break(1u);
      goto LABEL_35;
    case 2u:
      uint64_t v17 = *(unsigned int *)v16;
      if ((v17 & 0x80000000) != 0) {
        goto LABEL_39;
      }
      if (v17) {
        goto LABEL_21;
      }
      __break(1u);
LABEL_10:
      uint64_t v39 = *v16;
      uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF9F0);
      sub_25F63A2DC((uint64_t)v16 + *(int *)(v40 + 48), (uint64_t)v13);
      sub_25F63A354((uint64_t)v13, (uint64_t)v11);
      type metadata accessor for EveEndpointData(0);
      uint64_t v41 = swift_allocObject();
      *(void *)(v41 + 16) = v39;
      sub_25F63A2DC((uint64_t)v11, v41 + OBJC_IVAR____TtC9Tightbeam15EveEndpointData_baseURL);
      uint64_t v42 = swift_allocObject();
      *(void *)(v42 + 16) = v41;
      swift_retain();
      int v43 = sub_25F639DDC();
      int v44 = sub_25F639FA8();
      unint64_t v87 = sub_25F63A3CC;
      uint64_t v88 = v42;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v84 = 1107296256;
      uint64_t v85 = sub_25F63A22C;
      uint64_t v86 = &block_descriptor_30;
      uint64_t v45 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      int64_t v25 = tb_endpoint_create_with_data(v43, v41, v44, v45);
      _Block_release(v45);
      swift_release();
      sub_25F62FF74((uint64_t)v13);
      goto LABEL_32;
    case 3u:
      uint64_t v17 = *(unsigned int *)v16;
      if ((v17 & 0x80000000) != 0) {
        goto LABEL_39;
      }
      if (!v17)
      {
        __break(1u);
LABEL_14:
        uint64_t v47 = *v16;
        unint64_t v46 = v16[1];
        if ((v46 & 0x1000000000000000) != 0)
        {
          uint64_t v47 = sub_25F63A3D4();
          unint64_t v73 = v72;
          swift_bridgeObjectRelease();
          unint64_t v46 = v73;
          if ((v73 & 0x2000000000000000) == 0)
          {
LABEL_16:
            if ((v47 & 0x1000000000000000) != 0)
            {
              uint64_t v48 = (v46 & 0xFFFFFFFFFFFFFFFLL) + 32;
              uint64_t v49 = v47 & 0xFFFFFFFFFFFFLL;
              int64_t v50 = (v47 & 0xFFFFFFFFFFFFLL) + 1;
              if (!__OFADD__(v47 & 0xFFFFFFFFFFFFLL, 1))
              {
LABEL_18:
                uint64_t v51 = (char *)swift_slowAlloc();
                p_uint64_t aBlock = (char **)&aBlock;
                os_log_type_t v53 = (char *)v48;
                int64_t v54 = v49;
                goto LABEL_30;
              }
            }
            else
            {
LABEL_35:
              uint64_t v48 = sub_25F642D60();
              uint64_t v49 = v80;
              int64_t v50 = v80 + 1;
              if (!__OFADD__(v80, 1)) {
                goto LABEL_18;
              }
            }
            __break(1u);
            goto LABEL_38;
          }
        }
        else if ((v46 & 0x2000000000000000) == 0)
        {
          goto LABEL_16;
        }
        uint64_t aBlock = v47;
        uint64_t v84 = v46 & 0xFFFFFFFFFFFFFFLL;
        int64_t v50 = (HIBYTE(v46) & 0xF) + 1;
        uint64_t v51 = (char *)swift_slowAlloc();
        p_uint64_t aBlock = (char **)&v82;
        os_log_type_t v53 = (char *)&aBlock;
        int64_t v54 = HIBYTE(v46) & 0xF;
LABEL_30:
        v51[sub_25F63A108(p_aBlock, v53, v54, v51, v50)] = 0;
        uint64_t v74 = swift_allocObject();
        *(void *)(v74 + 16) = v51;
        *(void *)(v74 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v50;
        if (v51)
        {
          uint64_t v75 = v74;
          swift_bridgeObjectRelease();
          int v76 = sub_25F639DDC();
          int v77 = sub_25F639FA8();
          unint64_t v87 = sub_25F63A290;
          uint64_t v88 = v75;
          uint64_t aBlock = MEMORY[0x263EF8330];
          uint64_t v84 = 1107296256;
          uint64_t v85 = sub_25F63A22C;
          uint64_t v86 = &block_descriptor_36;
          uint64_t v78 = _Block_copy(&aBlock);
          swift_retain();
          swift_release();
          int64_t v25 = tb_endpoint_create_with_data(v76, (uint64_t)v51, v77, v78);
          _Block_release(v78);
LABEL_32:
          swift_release();
          return v25;
        }
LABEL_38:
        __break(1u);
LABEL_39:
        sub_25F642D80();
        __break(1u);
        JUMPOUT(0x25F639CF4);
      }
LABEL_21:
      int v55 = sub_25F639DDC();
      int v56 = sub_25F639FA8();
      return tb_endpoint_create_with_value(v55, v17, v56);
    case 4u:
    case 5u:
    case 6u:
      uint64_t v17 = *v16;
      goto LABEL_21;
    case 7u:
      goto LABEL_10;
    case 8u:
      (*(void (**)(char *, void *, uint64_t))(v2 + 32))(v7, v16, v1);
      (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v13, v7, v1);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v2 + 56))(v13, 0, 1, v1);
      type metadata accessor for EveEndpointData(0);
      uint64_t v60 = swift_allocObject();
      *(void *)(v60 + 16) = 0;
      sub_25F63A2DC((uint64_t)v13, v60 + OBJC_IVAR____TtC9Tightbeam15EveEndpointData_baseURL);
      uint64_t v61 = swift_allocObject();
      *(void *)(v61 + 16) = v60;
      swift_retain();
      int v62 = sub_25F639DDC();
      int v63 = sub_25F639FA8();
      unint64_t v87 = sub_25F63B938;
      uint64_t v88 = v61;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v84 = 1107296256;
      uint64_t v85 = sub_25F63A22C;
      uint64_t v86 = &block_descriptor_24;
      char v64 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      int64_t v25 = tb_endpoint_create_with_data(v62, v60, v63, v64);
      _Block_release(v64);
      swift_release();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
      goto LABEL_32;
    case 9u:
      uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v2 + 32);
      v33(v7, (char *)v16, v1);
      (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
      type metadata accessor for UnixEndpointData(0);
      uint64_t v34 = swift_allocObject();
      v33((char *)(v34 + OBJC_IVAR____TtC9Tightbeam16UnixEndpointData_targetUrl), v5, v1);
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = v34;
      swift_retain();
      int v36 = sub_25F639DDC();
      int v37 = sub_25F639FA8();
      unint64_t v87 = sub_25F63B938;
      uint64_t v88 = v35;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v84 = 1107296256;
      uint64_t v85 = sub_25F63A22C;
      uint64_t v86 = &block_descriptor_18;
      uint64_t v38 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      int64_t v25 = tb_endpoint_create_with_data(v36, v34, v37, v38);
      _Block_release(v38);
      swift_release();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
      goto LABEL_32;
    case 0xAu:
      uint64_t v66 = *v16;
      uint64_t v65 = v16[1];
      type metadata accessor for DelegatedClientEndpointData();
      uint64_t v67 = swift_allocObject();
      *(void *)(v67 + 16) = v66;
      *(void *)(v67 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v65;
      uint64_t v68 = swift_allocObject();
      *(void *)(v68 + 16) = v67;
      swift_retain();
      swift_retain();
      int v69 = sub_25F639DDC();
      int v70 = sub_25F639FA8();
      unint64_t v87 = sub_25F63B938;
      uint64_t v88 = v68;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v84 = 1107296256;
      uint64_t v85 = sub_25F63A22C;
      uint64_t v86 = &block_descriptor_12;
      uint64_t v71 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      int64_t v25 = tb_endpoint_create_with_data(v69, v67, v70, v71);
      _Block_release(v71);
      goto LABEL_26;
    case 0xBu:
      uint64_t v18 = *v16;
      uint64_t v19 = v16[3];
      type metadata accessor for DelegatedServiceEndpointData();
      uint64_t v20 = swift_allocObject();
      *(void *)(v20 + 16) = v18;
      long long v81 = *(_OWORD *)(v16 + 1);
      *(_OWORD *)(v20 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v81;
      *(void *)(v20 + 40) = v19;
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = v20;
      swift_retain();
      swift_retain();
      swift_retain();
      int v22 = sub_25F639DDC();
      int v23 = sub_25F639FA8();
      unint64_t v87 = sub_25F63B938;
      uint64_t v88 = v21;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v84 = 1107296256;
      uint64_t v85 = sub_25F63A22C;
      uint64_t v86 = &block_descriptor_6;
      uint64_t v24 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      int64_t v25 = tb_endpoint_create_with_data(v22, v20, v23, v24);
      _Block_release(v24);
      swift_release();
LABEL_26:
      swift_release();
      swift_release();
      goto LABEL_32;
    case 0xCu:
      uint64_t v26 = *v16;
      uint64_t v27 = (void *)swift_slowAlloc();
      if (v26 < 0) {
        goto LABEL_39;
      }
      uint64_t v28 = (uint64_t)v27;
      *uint64_t v27 = 0;
      v27[1] = v26;
      int v29 = sub_25F639DDC();
      int v30 = sub_25F639FA8();
      uint64_t v31 = swift_allocObject();
      *(void *)(v31 + 16) = v28;
      *(void *)(v31 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
      unint64_t v87 = sub_25F63A290;
      uint64_t v88 = v31;
      uint64_t aBlock = MEMORY[0x263EF8330];
      uint64_t v84 = 1107296256;
      uint64_t v85 = sub_25F63A22C;
      uint64_t v86 = &block_descriptor_0;
      uint64_t v32 = _Block_copy(&aBlock);
      swift_release();
      int64_t v25 = tb_endpoint_create_with_data(v29, v28, v30, v32);
      _Block_release(v32);
      return v25;
    case 0xDu:
      int v58 = sub_25F639DDC();
      int v59 = sub_25F639FA8();
      return tb_endpoint_create(v58, v59);
    default:
      goto LABEL_14;
  }
}

uint64_t type metadata accessor for TightbeamEndpoint()
{
  uint64_t result = qword_26A7AF9F8;
  if (!qword_26A7AF9F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25F639D78(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TightbeamEndpoint();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F639DDC()
{
  uint64_t v1 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F639D78(v0, (uint64_t)v3);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t result = 2;
  switch(EnumCaseMultiPayload)
  {
    case 1:
    case 2:
      return result;
    case 3:
      uint64_t result = 11;
      break;
    case 4:
    case 5:
    case 6:
      uint64_t result = 3;
      break;
    case 7:
      uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF9F0);
      sub_25F62FF74((uint64_t)&v3[*(int *)(v6 + 48)]);
      uint64_t result = 5;
      break;
    case 8:
      uint64_t v7 = sub_25F642710();
      (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v3, v7);
      uint64_t result = 5;
      break;
    case 9:
      uint64_t v8 = sub_25F642710();
      (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v3, v8);
      uint64_t result = 9;
      break;
    case 10:
    case 11:
      sub_25F63452C((uint64_t)v3);
      uint64_t result = 10;
      break;
    case 12:
      uint64_t result = 8;
      break;
    case 13:
      uint64_t result = 1;
      break;
    default:
      sub_25F63452C((uint64_t)v3);
      uint64_t result = 2;
      break;
  }
  return result;
}

uint64_t sub_25F639FA8()
{
  uint64_t v1 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x270FA5388](v1);
  sub_25F639D78(v0, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_getEnumCaseMultiPayload();
  return 3;
}

size_t sub_25F63A108(char **a1, char *__src, int64_t a3, char *__dst, int64_t a5)
{
  uint64_t v6 = __src;
  if (!a3 || !a5)
  {
    size_t v8 = 0;
    uint64_t v9 = &__src[a3];
    if (!__src) {
      uint64_t v9 = 0;
    }
    goto LABEL_12;
  }
  if (a3 >= a5) {
    size_t v8 = a5;
  }
  else {
    size_t v8 = a3;
  }
  if ((v8 & 0x8000000000000000) == 0 && (&__dst[v8] <= __src || &__src[v8] <= __dst))
  {
    memcpy(__dst, __src, v8);
    uint64_t v9 = &v6[a3];
    v6 += v8;
LABEL_12:
    *a1 = v6;
    a1[1] = v9;
    return v8;
  }
  size_t result = sub_25F642DE0();
  __break(1u);
  return result;
}

uint64_t sub_25F63A22C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_25F63A280()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_25F63A2AC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F63A2BC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F63A2CC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F63A2DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF938);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F63A344()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F63A354(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF938);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_25F63A3BC()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_25F63A3CC()
{
  return swift_release();
}

uint64_t sub_25F63A3D4()
{
  unint64_t v0 = sub_25F642BC0();
  uint64_t v4 = sub_25F63B4CC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_25F63A454()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_25F63A464()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result) {
    JUMPOUT(0x2611FA440);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for TightbeamEndpoint(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        uint64_t v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        *a1 = *a2;
        uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF9F0) + 48);
        uint64_t v11 = (char *)a1 + v10;
        uint64_t v12 = (char *)a2 + v10;
        uint64_t v13 = sub_25F642710();
        uint64_t v14 = *(void *)(v13 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
        {
          uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF938);
          memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 8u:
      case 9u:
        uint64_t v16 = sub_25F642710();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(a1, a2, v16);
        swift_storeEnumTagMultiPayload();
        break;
      case 0xAu:
        uint64_t v17 = a2[1];
        *a1 = *a2;
        a1[1] = v17;
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      case 0xBu:
        *a1 = *a2;
        uint64_t v18 = a2[3];
        *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
        a1[3] = v18;
        swift_retain();
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(v6 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for TightbeamEndpoint(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 7:
      uint64_t v7 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF9F0) + 48);
      uint64_t v8 = sub_25F642710();
      uint64_t v9 = *(void *)(v8 - 8);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
      if (!result)
      {
        uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
        uint64_t v6 = v7;
        uint64_t v5 = v8;
        goto LABEL_3;
      }
      break;
    case 8:
    case 9:
      uint64_t v3 = sub_25F642710();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t v5 = v3;
      uint64_t v6 = a1;
LABEL_3:
      uint64_t result = v4(v6, v5);
      break;
    case 10:
      goto LABEL_12;
    case 11:
      swift_release();
LABEL_12:
      uint64_t result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

void *initializeWithCopy for TightbeamEndpoint(void *a1, void *a2, uint64_t a3)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      goto LABEL_10;
    case 7u:
      *a1 = *a2;
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF9F0) + 48);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_25F642710();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF938);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      goto LABEL_10;
    case 8u:
    case 9u:
      uint64_t v13 = sub_25F642710();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(a1, a2, v13);
      goto LABEL_10;
    case 0xAu:
      uint64_t v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      swift_retain();
      goto LABEL_10;
    case 0xBu:
      *a1 = *a2;
      uint64_t v15 = a2[3];
      *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
      a1[3] = v15;
      swift_retain();
      swift_retain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

void *assignWithCopy for TightbeamEndpoint(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25F63452C((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_11;
      case 7u:
        *a1 = *a2;
        uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF9F0) + 48);
        uint64_t v7 = (char *)a1 + v6;
        uint64_t v8 = (char *)a2 + v6;
        uint64_t v9 = sub_25F642710();
        uint64_t v10 = *(void *)(v9 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
        {
          uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF938);
          memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
        }
        goto LABEL_11;
      case 8u:
      case 9u:
        uint64_t v12 = sub_25F642710();
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(a1, a2, v12);
        goto LABEL_11;
      case 0xAu:
        uint64_t v13 = a2[1];
        *a1 = *a2;
        a1[1] = v13;
        swift_retain();
        goto LABEL_11;
      case 0xBu:
        uint64_t v14 = a2[1];
        *a1 = *a2;
        a1[1] = v14;
        uint64_t v15 = a2[2];
        uint64_t v16 = a2[3];
        a1[2] = v15;
        a1[3] = v16;
        swift_retain();
        swift_retain();
LABEL_11:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for TightbeamEndpoint(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 9 || EnumCaseMultiPayload == 8)
  {
    uint64_t v13 = sub_25F642710();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
LABEL_10:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (EnumCaseMultiPayload == 7)
  {
    *a1 = *a2;
    uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF9F0) + 48);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_25F642710();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF938);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    goto LABEL_10;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

void *assignWithTake for TightbeamEndpoint(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_25F63452C((uint64_t)a1);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 9 || EnumCaseMultiPayload == 8)
    {
      uint64_t v13 = sub_25F642710();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 32))(a1, a2, v13);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (EnumCaseMultiPayload == 7)
    {
      *a1 = *a2;
      uint64_t v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF9F0) + 48);
      uint64_t v8 = (char *)a1 + v7;
      uint64_t v9 = (char *)a2 + v7;
      uint64_t v10 = sub_25F642710();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF938);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      goto LABEL_11;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for TightbeamEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for TightbeamEndpoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_25F63B390()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_25F63B3A0()
{
  uint64_t v5 = &unk_25F644878;
  uint64_t v6 = MEMORY[0x263F8CF68] + 64;
  uint64_t v7 = MEMORY[0x263F8CF68] + 64;
  uint64_t v8 = MEMORY[0x263F8CF68] + 64;
  uint64_t v0 = MEMORY[0x263F8CF70];
  uint64_t v9 = MEMORY[0x263F8CF70] + 64;
  uint64_t v10 = MEMORY[0x263F8CF70] + 64;
  uint64_t v11 = MEMORY[0x263F8CF70] + 64;
  sub_25F6329A4();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    uint64_t v12 = &v4;
    uint64_t v2 = sub_25F642710();
    if (v3 <= 0x3F)
    {
      uint64_t v13 = *(void *)(v2 - 8) + 64;
      uint64_t v14 = v13;
      uint64_t v15 = MEMORY[0x263F8EE70] + 64;
      uint64_t v16 = &unk_25F644890;
      uint64_t v17 = v0 + 64;
      swift_initEnumMetadataMultiPayload();
    }
  }
}

uint64_t sub_25F63B4CC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_25F63B624(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = sub_25F62FFD4(v9, 0);
      unint64_t v12 = sub_25F63B724((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_25F642D60();
LABEL_4:
        JUMPOUT(0x2611F9980);
      }
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x2611F9980](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2611F9980]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_25F63B624(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_25F63003C(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_25F63003C(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x270F9D808](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x270F9D808](a1, a2, a3, a4);
}

unint64_t sub_25F63B724(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    unsigned char v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_25F63003C(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_25F642BA0();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_25F642D60();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_25F63003C(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_25F642B70();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void *sub_25F63B96C(uint64_t a1, unint64_t a2, unsigned char *a3, uint64_t a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AFA08);
  uint64_t result = (void *)MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v27 = a1;
  unint64_t v28 = a2;
  if (a3)
  {
    uint64_t result = (void *)MEMORY[0x270FA5388](result);
    *(void *)&v20[-32] = &v27;
    *(void *)&v20[-24] = a3;
    *(void *)&v20[-16] = a4;
    *(void *)&v20[-8] = a3;
    switch(a2 >> 62)
    {
      case 1uLL:
        if (a1 >> 32 < (int)a1) {
          goto LABEL_17;
        }
        sub_25F6254F8(a1, a2);
        char v12 = sub_25F63CB90((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t (*)(uint64_t, uint64_t))sub_25F63CE00);
        uint64_t result = (void *)sub_25F625550(a1, a2);
        if (v12)
        {
LABEL_8:
          uint64_t v16 = v27;
          unint64_t v17 = v28;
          switch(v28 >> 62)
          {
            case 1uLL:
            case 2uLL:
              sub_25F6254F8(v27, v28);
              sub_25F6254F8(v16, v17);
              break;
            default:
              break;
          }
          sub_25F642770();
          sub_25F625550(v16, v17);
          sub_25F642760();
          sub_25F63CE18();
          sub_25F642CB0();
          uint64_t v18 = 0;
          if ((__src & 0x100) == 0)
          {
            uint64_t v19 = 0;
            do
            {
              uint64_t v18 = v19 + 1;
              if (__OFADD__(v19, 1))
              {
                __break(1u);
LABEL_17:
                __break(1u);
              }
              a3[v19] = __src;
              sub_25F642CB0();
              ++v19;
            }
            while (BYTE1(__src) != 1);
          }
          *(void *)&v11[*(int *)(v8 + 36)] = v18;
          uint64_t result = (void *)sub_25F63CE70((uint64_t)v11);
        }
        break;
      case 2uLL:
        uint64_t v13 = *(void *)(a1 + 16);
        uint64_t v14 = *(void *)(a1 + 24);
        swift_retain();
        swift_retain();
        char v15 = sub_25F63CB90(v13, v14, a2 & 0x3FFFFFFFFFFFFFFFLL, (uint64_t (*)(uint64_t, uint64_t))sub_25F63CE00);
        swift_release();
        uint64_t result = (void *)swift_release();
        if (v15) {
          goto LABEL_8;
        }
        return result;
      case 3uLL:
        return result;
      default:
        uint64_t __src = a1;
        __int16 v22 = a2;
        char v23 = BYTE2(a2);
        char v24 = BYTE3(a2);
        char v25 = BYTE4(a2);
        char v26 = BYTE5(a2);
        return memcpy(a3, &__src, BYTE6(a2));
    }
  }
  return result;
}

void *sub_25F63BD00(void *result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    unint64_t v3 = (void *)MEMORY[0x270FA5388](result);
    if (v3) {
      size_t v5 = v4 - (void)v3;
    }
    else {
      size_t v5 = 0;
    }
    return sub_25F63CE00(v3, v5);
  }
  return result;
}

uint64_t sub_25F63BD88(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (*(unsigned __int8 *)(v3 + 40) >= 2u) {
    goto LABEL_8;
  }
  size_t v5 = *(void **)(v3 + 16);
  uint64_t v6 = v5[2];
  if (__OFADD__(v6, a3))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v5[3] >= v6 + a3)
  {
    uint64_t result = (uint64_t)sub_25F63B96C(a1, a2, (unsigned char *)(*v5 + v6), *v5 + v6 + a3);
    uint64_t v8 = v5[2];
    BOOL v9 = __OFADD__(v8, a3);
    uint64_t v10 = v8 + a3;
    if (!v9)
    {
      void v5[2] = v10;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  uint64_t result = sub_25F642D90();
  __break(1u);
  return result;
}

uint64_t sub_25F63BE90(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(v2 + 40) >= 2u) {
    goto LABEL_8;
  }
  uint64_t v4 = *(void **)(v2 + 16);
  uint64_t v5 = v4[2];
  if (__OFADD__(v5, a2))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v4[3] >= v5 + a2)
  {
    uint64_t result = (uint64_t)memmove((void *)(*v4 + v5), (const void *)(a1 + 32), *(void *)(a1 + 16));
    uint64_t v7 = v4[2];
    BOOL v8 = __OFADD__(v7, a2);
    uint64_t v9 = v7 + a2;
    if (!v8)
    {
      v4[2] = v9;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  uint64_t result = sub_25F642D90();
  __break(1u);
  return result;
}

uint64_t _tb_unix_service_transport_create_with_endpoint(uint64_t a1)
{
  uint64_t v2 = sub_25F642710();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = tb_endpoint_get_data(a1) + OBJC_IVAR____TtC9Tightbeam16UnixEndpointData_targetUrl;
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  swift_retain();
  v7(v5, v6, v2);
  swift_release();
  type metadata accessor for UnixTransportService();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_listener) = 0;
  *(void *)(v8 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_transport) = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v8 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_targetURL, v5, v2);
  return v8;
}

uint64_t type metadata accessor for UnixTransportService()
{
  uint64_t result = qword_26B39A370;
  if (!qword_26B39A370) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void _tb_unix_service_transport_send_message()
{
}

uint64_t sub_25F63C1A8(uint64_t a1)
{
  uint64_t context = tb_transport_get_context(a1);
  *(void *)(context + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_transport) = a1;
  swift_retain();
  uint64_t v3 = sub_25F642700();
  uint64_t v5 = v4;
  uint64_t v9 = type metadata accessor for UnixTransportService();
  uint64_t v10 = &off_270BAD898;
  v7[4] = &off_270BAD8A8;
  v8[0] = context;
  v7[3] = v9;
  v7[0] = context;
  type metadata accessor for UnixListener();
  swift_allocObject();
  swift_retain_n();
  *(void *)(context + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_listener) = sub_25F62B4E0(v3, v5, (uint64_t)v8, (uint64_t)v7);
  swift_release();
  swift_release();
  return 0;
}

uint64_t sub_25F63C314(void *a1, uint64_t a2, unint64_t a3)
{
  v33[1] = *(void **)MEMORY[0x263EF8340];
  uint64_t v6 = tb_alloc_message();
  v33[0] = v6;
  uint64_t v7 = tb_alloc_transport_message_buffer();
  if (!v7)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v8 = v7;
  type metadata accessor for TransportBuffer();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *(void *)(inited + 32) = 0;
  *(void *)(inited + 16) = v8;
  *(unsigned char *)(inited + 40) = 1;
  size_t v10 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a2), a2))
      {
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      size_t v10 = HIDWORD(a2) - (int)a2;
LABEL_7:
      uint64_t v13 = tb_unix_transport_construct_message_buffer(v10, 0, (uint64_t)v8);
      sub_25F63F810(v13);
      if (!v6) {
LABEL_26:
      }
        __break(1u);
      uint64_t v14 = tb_message_construct((uint64_t)v6, (uint64_t)v8, 1);
      sub_25F63F810(v14);
      uint64_t v15 = 0;
      switch(a3 >> 62)
      {
        case 0uLL:
          uint64_t v15 = BYTE6(a3);
          goto LABEL_13;
        case 1uLL:
          if (__OFSUB__(HIDWORD(a2), a2)) {
            goto LABEL_23;
          }
          uint64_t v15 = HIDWORD(a2) - (int)a2;
LABEL_13:
          sub_25F63BD88(a2, a3, v15);
          if ((uint64_t)v8[3] <= 0) {
            goto LABEL_27;
          }
          void v8[2] = 0;
          tb_message_set_state(v6, 4);
          tb_transport_call_message_handler(a1, (uint64_t)v6, (uint64_t *)v33);
          uint64_t v18 = sub_25F633988();
          uint64_t v20 = v19;
          uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF958);
          unint64_t v32 = sub_25F63C994();
          v30[0] = v18;
          v30[1] = v20;
          uint64_t v21 = __swift_project_boxed_opaque_existential_1(v30, v31);
          __int16 v22 = *v21 ? (unsigned char *)(*v21 + v21[1]) : 0;
          sub_25F63C9F0((unsigned char *)*v21, v22, &v29);
          uint64_t v23 = v29;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
          unsigned int v24 = *(unsigned __int8 *)(inited + 40);
          if (v24 >= 2)
          {
LABEL_27:
            sub_25F642D90();
            __break(1u);
            JUMPOUT(0x25F63C664);
          }
          uint64_t v25 = *(void *)(inited + 16);
          char v26 = *(void (**)(uint64_t))(inited + 24);
          uint64_t v27 = *(void *)(inited + 32);
          tb_unix_transport_destruct_message_buffer(v25);
          tb_free_message(v8);
          tb_free_message(v33[0]);
          swift_setDeallocating();
          if (!v24)
          {
            swift_retain();
            v26(v25);
            MEMORY[0x2611FA440](v25, -1, -1);
            sub_25F633400(v25, (uint64_t)v26, v27, 0);
          }
          sub_25F633400(v25, (uint64_t)v26, v27, v24);
          return v23;
        case 2uLL:
          uint64_t v17 = *(void *)(a2 + 16);
          uint64_t v16 = *(void *)(a2 + 24);
          uint64_t v15 = v16 - v17;
          if (!__OFSUB__(v16, v17)) {
            goto LABEL_13;
          }
          goto LABEL_24;
        case 3uLL:
          goto LABEL_13;
        default:
          JUMPOUT(0);
      }
    case 2uLL:
      uint64_t v12 = *(void *)(a2 + 16);
      uint64_t v11 = *(void *)(a2 + 24);
      size_t v10 = v11 - v12;
      if (!__OFSUB__(v11, v12)) {
        goto LABEL_7;
      }
      goto LABEL_22;
    case 3uLL:
      goto LABEL_7;
    default:
      size_t v10 = BYTE6(a3);
      goto LABEL_7;
  }
}

uint64_t sub_25F63C684()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_targetURL;
  uint64_t v2 = sub_25F642710();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_25F63C734()
{
  return type metadata accessor for UnixTransportService();
}

uint64_t sub_25F63C73C()
{
  uint64_t result = sub_25F642710();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *sub_25F63C7E4(uint64_t (*a1)(uint64_t a1), uint64_t a2, unint64_t a3)
{
  uint64_t v7 = sub_25F642870();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  size_t v10 = (uint64_t (**)(uint64_t))((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t result = *(void **)(v3 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_transport);
  if (result)
  {
    uint64_t v12 = sub_25F63C314(result, a2, a3);
    unint64_t v14 = v13;
    *size_t v10 = sub_25F637E18;
    v10[1] = a1;
    (*(void (**)(uint64_t (**)(uint64_t), void, uint64_t))(v8 + 104))(v10, *MEMORY[0x263F141E0], v7);
    sub_25F642860();
    swift_retain();
    sub_25F642850();
    sub_25F6428A0();
    swift_release();
    (*(void (**)(uint64_t (**)(uint64_t), uint64_t))(v8 + 8))(v10, v7);
    return (void *)sub_25F625550(v12, v14);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_25F63C970(uint64_t (*a1)(uint64_t a1), uint64_t a2, unint64_t a3)
{
  return sub_25F63C7E4(a1, a2, a3);
}

unint64_t sub_25F63C994()
{
  unint64_t result = qword_26A7AF960;
  if (!qword_26A7AF960)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26A7AF958);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF960);
  }
  return result;
}

unsigned char *sub_25F63C9F0@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_25F63CC3C(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_25F63CD00((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_25F63CD7C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_25F63CA68(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!a1) {
    goto LABEL_4;
  }
  uint64_t v3 = a2 - a1;
  if (v3 < 0)
  {
    a1 = sub_25F642DE0();
    __break(1u);
LABEL_4:
    uint64_t v3 = 0;
  }
  return a3(a1, v3);
}

uint64_t sub_25F63CAF0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_25F63CB90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t result = sub_25F642630();
  uint64_t v8 = result;
  if (result)
  {
    uint64_t result = sub_25F642650();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v8 += a1 - result;
  }
  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v11 = sub_25F642640();
  if (v11 >= v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v13 = v8 + v12;
  if (v8) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  sub_25F63CA68(v8, v14, a4);
  return 0;
}

uint64_t sub_25F63CC3C(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_25F63CD00(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_25F642660();
  swift_allocObject();
  uint64_t result = sub_25F642620();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_25F642740();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  }
  return result;
}

uint64_t sub_25F63CD7C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_25F642660();
  swift_allocObject();
  uint64_t result = sub_25F642620();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

void *sub_25F63CE00(void *a1, size_t a2)
{
  return sub_25F63CED0(a1, a2);
}

unint64_t sub_25F63CE18()
{
  unint64_t result = qword_26A7AF950;
  if (!qword_26A7AF950)
  {
    sub_25F642760();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AF950);
  }
  return result;
}

uint64_t sub_25F63CE70(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AFA08);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_25F63CED0(void *__src, size_t __len)
{
  if (__src)
  {
    if ((__len & 0x8000000000000000) != 0)
    {
      uint64_t __src = (void *)sub_25F642DE0();
      __break(1u);
    }
    else
    {
      uint64_t v4 = __src;
      char v5 = *(void **)(v2 + 40);
      return memmove(v5, v4, __len);
    }
  }
  return __src;
}

uint64_t static TightbeamMessage.size<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t TightbeamEncoder.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  uint64_t result = (*(uint64_t (**)(uint64_t *))(a3 + 16))(&v6);
  if (v4)
  {
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t TightbeamDecoder.decode<A>(as:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = *v3;
  uint64_t v7 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8);
  swift_retain();
  uint64_t result = v7(&v9, a2, a3);
  if (v4)
  {
    uint64_t result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t dispatch thunk of TightbeamEndpointDecodable.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static TightbeamEncodable.encodedSize(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of TightbeamEncodable.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of TightbeamDecodable.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_25F63D110(char a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v16 = a2;
    char v17 = 1;
    uint64_t v18 = 0;
    uint64_t v19 = a3;
    uint64_t v20 = 0;
    int v21 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v25 = 0;
    if (a1) {
      int v5 = 4;
    }
    else {
      int v5 = 1;
    }
    int v8 = v5;
    char v9 = 0;
    long long v10 = 0uLL;
    long long v11 = 0uLL;
    long long v12 = 0uLL;
    long long v13 = 0uLL;
    uint64_t v14 = 0;
    uint64_t v15 = &v16;
    type metadata accessor for TightbeamMessage();
    uint64_t v6 = swift_allocObject();
    TightbeamMessage.init(wrapping:)((uint64_t)&v8);
    a4(v6);
    sub_25F63DD10();
    swift_release();
    return sub_25F633400((uint64_t)&v16, 0, 0, 1);
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t static TightbeamMessage.withBufferPointer<A>(for:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_25F633070(a2, a3, (void (*)(void))sub_25F63D5F4);
}

uint64_t TightbeamMessage.__allocating_init(wrapping:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  TightbeamMessage.init(wrapping:)(a1);
  return v2;
}

uint64_t Capability.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t Capability.value.getter()
{
  return *(void *)v0;
}

BOOL static TightbeamMessage.BufferUsage.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TightbeamMessage.BufferUsage.hash(into:)()
{
  return sub_25F642EB0();
}

uint64_t TightbeamMessage.BufferUsage.hashValue.getter()
{
  return sub_25F642ED0();
}

BOOL static TightbeamMessage.admissionSearchMultiple(table:selector:)(uint64_t *a1, unint64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    a2 = 0;
    a1 = 0;
  }
  return tb_component_admission_search_multiple(a1, a2, a4);
}

uint64_t sub_25F63D424(uint64_t a1, char a2, void (*a3)(void *))
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (*(unsigned __int8 *)(a1 + 40) >= 2u) {
    goto LABEL_7;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  int v5 = (a2 & 1) != 0 ? 4 : 1;
  int v11 = v5;
  char v12 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v17 = 0;
  uint64_t v18 = v4;
  type metadata accessor for TightbeamMessage();
  uint64_t v6 = (void *)swift_allocObject();
  v6[3] = 0;
  unsigned char v6[4] = 0;
  uint64_t transport_buffer = tb_message_get_transport_buffer((uint64_t)&v11);
  if (transport_buffer)
  {
    uint64_t v8 = transport_buffer;
    type metadata accessor for TransportBuffer();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)(v9 + 32) = 0;
    *(void *)(v9 + 16) = v8;
    *(unsigned char *)(v9 + 40) = 1;
    v6[3] = &v11;
    unsigned char v6[4] = v9;
    void v6[2] = 0xC000000000000000;
    a3(v6);
    sub_25F63DD10();
    return swift_release();
  }
  else
  {
LABEL_7:
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F63D5F4(uint64_t a1)
{
  return sub_25F63D424(a1, *(unsigned char *)(v1 + 24), *(void (**)(void *))(v1 + 32));
}

uint64_t static TightbeamMessage.decode(message:from:for:validating:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  char v12 = a6 & 1;
  type metadata accessor for UnownedServiceConnection();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  type metadata accessor for AnyServiceConnection();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = &off_270BADDA0;
  uint64_t v15 = a3[3];
  uint64_t v16 = a3[4];
  uint64_t v17 = __swift_project_boxed_opaque_existential_1(a3, v15);
  swift_retain();
  uint64_t v18 = sub_25F63E094(a1, v14, (uint64_t)v17, a4, a5, v12, v6, v15, v16);
  swift_release();
  swift_release();
  return v18;
}

uint64_t sub_25F63D710(uint64_t a1, size_t a2, uint64_t a3)
{
  v3[3] = 0;
  v3[4] = 0;
  uint64_t v7 = (_DWORD *)swift_slowAlloc();
  *uint64_t v7 = 0;
  type metadata accessor for TransportBuffer();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = swift_slowAlloc();
  tb_transport_initialize_message_buffer(v9);
  *(void *)(v8 + 16) = v9;
  *(void *)(v8 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = nullsub_1;
  *(void *)(v8 + 32) = 0;
  *(unsigned char *)(v8 + 40) = 0;
  if (tb_client_connection_message_construct(*(uint64_t **)(a1 + 16), (uint64_t)v7, v9, a2, a3))
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  else
  {
    v3[4] = v8;
    swift_release();
    v3[2] = a1;
    v3[3] = v7;
    return (uint64_t)v3;
  }
  return result;
}

uint64_t TightbeamMessage.__allocating_init(buffer:disposition:state:)(uint64_t a1, char a2, unint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  TightbeamMessage.init(buffer:disposition:state:)(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32));
  return v6;
}

uint64_t TightbeamMessage.init(buffer:disposition:state:)(uint64_t a1, char a2, uint64_t a3)
{
  v3[3] = 0;
  v3[4] = 0;
  uint64_t v7 = (_DWORD *)swift_slowAlloc();
  *uint64_t v7 = 0;
  if (*(unsigned __int8 *)(a1 + 40) >= 2u)
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  else
  {
    uint64_t v8 = v7;
    tb_message_construct((uint64_t)v7, *(void *)(a1 + 16), a2);
    if ((a3 & 0x100000000) == 0) {
      *uint64_t v8 = a3;
    }
    v3[2] = 0xC000000000000000;
    v3[3] = v8;
    v3[4] = a1;
    swift_release();
    return (uint64_t)v3;
  }
  return result;
}

uint64_t TightbeamMessage.init(wrapping:)(uint64_t a1)
{
  v1[3] = 0;
  v1[4] = 0;
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    uint64_t v4 = transport_buffer;
    type metadata accessor for TransportBuffer();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)(v5 + 32) = 0;
    *(void *)(v5 + 16) = v4;
    *(unsigned char *)(v5 + 40) = 1;
    v1[3] = a1;
    v1[4] = v5;
    swift_release();
    v1[2] = 0xC000000000000000;
    return (uint64_t)v1;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F63DA3C@<X0>(void *a1@<X8>)
{
  *a1 = v1;
  return swift_retain();
}

uint64_t sub_25F63DA48()
{
  if (*(void *)(v0 + 32))
  {
    return swift_retain();
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F63DAC8(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  unint64_t v4 = *(void *)(v2 + 16);
  switch(v4 >> 62)
  {
    case 1uLL:
      uint64_t v12 = *(void *)((v4 & 0x3FFFFFFFFFFFFFFFLL) + 0x18);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8);
      swift_retain();
      uint64_t v15 = (uint64_t *)v14(ObjectType, v12);
      if (!v15)
      {
        __break(1u);
        goto LABEL_12;
      }
      uint64_t v16 = *(_DWORD **)(v3 + 24);
      if (!v16)
      {
LABEL_12:
        sub_25F642D90();
        __break(1u);
        JUMPOUT(0x25F63DD00);
      }
      int v17 = tb_service_connection_message_configure_reply(v15, v16, a1, a2);
      if (v17)
      {
        int v18 = v17;
        type metadata accessor for TransportError(0);
        sub_25F6333A8();
        swift_allocError();
        *uint64_t v19 = v18;
        swift_willThrow();
      }
      return swift_release();
    case 2uLL:
    case 3uLL:
      goto LABEL_12;
    default:
      uint64_t v7 = *(_DWORD **)(v3 + 24);
      if (!v7) {
        goto LABEL_12;
      }
      uint64_t v8 = *(uint64_t **)(v4 + 16);
      swift_retain();
      int v9 = tb_client_connection_message_reset(v8, v7, a1, a2);
      if (v9)
      {
        int v10 = v9;
        type metadata accessor for TransportError(0);
        sub_25F6333A8();
        swift_allocError();
        *int v11 = v10;
        swift_willThrow();
      }
      return swift_release();
  }
}

uint64_t sub_25F63DD10()
{
  uint64_t v1 = *(void *)(v0 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(v1 + 16);
    uint64_t v3 = *(void *)(v1 + 24);
    uint64_t v4 = *(void *)(v1 + 32);
    *(void *)(v1 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)(v1 + 32) = 0;
    *(void *)(v1 + 16) = 0;
    char v5 = *(unsigned char *)(v1 + 40);
    *(unsigned char *)(v1 + 40) = 2;
    sub_25F633400(v2, v3, v4, v5);
  }
  uint64_t v6 = *(void *)(v0 + 24);
  if (v6)
  {
    *(void *)(v0 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)(v0 + 32) = 0;
    swift_release();
    return v6;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t TightbeamMessage.deinit()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1)
  {
    unint64_t v2 = *(void *)(v0 + 16);
    switch(v2 >> 62)
    {
      case 1uLL:
        uint64_t v3 = *(void *)((v2 & 0x3FFFFFFFFFFFFFFFLL) + 0x18);
        uint64_t ObjectType = swift_getObjectType();
        char v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
        swift_retain();
        uint64_t v6 = (uint64_t *)v5(ObjectType, v3);
        if (!v6)
        {
          __break(1u);
LABEL_9:
          sub_25F642D90();
          __break(1u);
          JUMPOUT(0x25F63DF0CLL);
        }
        tb_service_connection_message_destruct(v6, v1);
        swift_release();
LABEL_6:
        tb_message_destruct(v1);
        MEMORY[0x2611FA440](v1, -1, -1);
        break;
      case 2uLL:
        goto LABEL_6;
      case 3uLL:
        goto LABEL_9;
      default:
        tb_client_connection_message_destruct(*(uint64_t **)(v2 + 16), *(void *)(v0 + 24));
        goto LABEL_6;
    }
  }
  swift_release();
  swift_release();
  return v0;
}

uint64_t TightbeamMessage.__deallocating_deinit()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1)
  {
    unint64_t v2 = *(void *)(v0 + 16);
    switch(v2 >> 62)
    {
      case 1uLL:
        uint64_t v3 = *(void *)((v2 & 0x3FFFFFFFFFFFFFFFLL) + 0x18);
        uint64_t ObjectType = swift_getObjectType();
        char v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
        swift_retain();
        uint64_t v6 = (uint64_t *)v5(ObjectType, v3);
        if (!v6)
        {
          __break(1u);
LABEL_11:
          sub_25F642D90();
          __break(1u);
          JUMPOUT(0x25F63E080);
        }
        tb_service_connection_message_destruct(v6, v1);
        swift_release();
LABEL_6:
        tb_message_destruct(v1);
        MEMORY[0x2611FA440](v1, -1, -1);
        break;
      case 2uLL:
        goto LABEL_6;
      case 3uLL:
        goto LABEL_11;
      default:
        tb_client_connection_message_destruct(*(uint64_t **)(v2 + 16), *(void *)(v0 + 24));
        goto LABEL_6;
    }
  }
  swift_release();
  swift_release();
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_25F63E094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14 = *(void *)(a8 - 8);
  uint64_t v15 = a6 & 1;
  MEMORY[0x270FA5388](a1);
  int v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v18, v19);
  swift_retain();
  uint64_t v25 = sub_25F63E820(a1, a2);
  uint64_t v20 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 8);
  swift_retain();
  uint64_t v21 = v20(&v25, a4, a5, v15, a8, a9);
  uint64_t v22 = sub_25F63DD10();
  swift_release_n();
  swift_release();
  if (!v21) {
    uint64_t v22 = 0;
  }
  (*(void (**)(char *, uint64_t))(v14 + 8))(v17, a8);
  return v22;
}

unint64_t sub_25F63E2CC()
{
  unint64_t result = qword_26A7AFA10;
  if (!qword_26A7AFA10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A7AFA10);
  }
  return result;
}

uint64_t dispatch thunk of MessageDecodeProtocol.decode(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ValidatingMessageDecodeProtocol.decode(_:validating:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a6 + 8))(a1, a2, a3, a4 & 1);
}

ValueMetadata *type metadata accessor for Capability()
{
  return &type metadata for Capability;
}

uint64_t type metadata accessor for TightbeamMessage()
{
  return self;
}

uint64_t method lookup function for TightbeamMessage(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TightbeamMessage);
}

uint64_t dispatch thunk of TightbeamMessage.__allocating_init(buffer:disposition:state:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v3 + 200))(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32));
}

uint64_t dispatch thunk of TightbeamMessage.__allocating_init(wrapping:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of TightbeamMessage.encoder()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of TightbeamMessage.transportBuffer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of TightbeamMessage.unwrap()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

unsigned char *storeEnumTagSinglePayload for TightbeamMessage.BufferUsage(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x25F63E534);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TightbeamMessage.BufferUsage()
{
  return &type metadata for TightbeamMessage.BufferUsage;
}

void *initializeBufferWithCopyOfBuffer for TightbeamMessage.Connection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for TightbeamMessage.Connection()
{
  return swift_release();
}

void *assignWithCopy for TightbeamMessage.Connection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void *assignWithTake for TightbeamMessage.Connection(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TightbeamMessage.Connection(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7D && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 125);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7C) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for TightbeamMessage.Connection(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7C)
  {
    *(void *)unint64_t result = a2 - 125;
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7D) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)unint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_25F63E6E0(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 == 3) {
    return (*a1 >> 3) + 3;
  }
  else {
    return v1;
  }
}

void *sub_25F63E6FC(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_25F63E70C(unint64_t *result, uint64_t a2)
{
  if (a2 < 3)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 62;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 3);
    unint64_t v3 = 0xC000000000000000;
  }
  *unint64_t result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for TightbeamMessage.Connection()
{
  return &type metadata for TightbeamMessage.Connection;
}

uint64_t sub_25F63E748(uint64_t a1, uint64_t a2)
{
  type metadata accessor for TightbeamMessage();
  unsigned int v4 = (void *)swift_allocObject();
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    uint64_t v6 = transport_buffer;
    type metadata accessor for TransportBuffer();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)(v7 + 32) = 0;
    *(void *)(v7 + 16) = v6;
    *(unsigned char *)(v7 + 40) = 1;
    v4[3] = a1;
    v4[4] = v7;
    v4[2] = a2 | 0x8000000000000000;
    return (uint64_t)v4;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F63E820(uint64_t a1, uint64_t a2)
{
  type metadata accessor for TightbeamMessage();
  unsigned int v4 = (void *)swift_allocObject();
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    uint64_t v6 = transport_buffer;
    type metadata accessor for TransportBuffer();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    *(void *)(v7 + 32) = 0;
    *(void *)(v7 + 16) = v6;
    *(unsigned char *)(v7 + 40) = 1;
    v4[3] = a1;
    v4[4] = v7;
    v4[2] = a2 | 0x4000000000000000;
    return (uint64_t)v4;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t ClientConnection.__allocating_init(endpoint:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  unint64_t v3 = TightbeamEndpoint.constructEndpoint()();
  unsigned int v4 = tb_client_connection_create_with_endpoint(v3);
  tb_client_connection_activate(v4);
  sub_25F63452C(a1);
  *(void *)(v2 + 16) = v4;
  return v2;
}

uint64_t ClientConnection.init(endpoint:)(uint64_t a1)
{
  uint64_t v2 = v1;
  unsigned int v4 = TightbeamEndpoint.constructEndpoint()();
  uint64_t v5 = tb_client_connection_create_with_endpoint(v4);
  tb_client_connection_activate(v5);
  sub_25F63452C(a1);
  *(void *)(v2 + 16) = v5;
  return v2;
}

uint64_t ClientConnection.__allocating_init(connection:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t ClientConnection.init(connection:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t ClientConnection.allocateMessage(size:capabilities:)(size_t a1, uint64_t a2)
{
  type metadata accessor for TightbeamMessage();
  swift_allocObject();
  uint64_t v4 = swift_retain();
  return sub_25F63D710(v4, a1, a2);
}

void *ClientConnection.send(message:)(void *a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  v12[0] = 0;
  uint64_t v2 = a1[3];
  if (!v2) {
    goto LABEL_12;
  }
  unint64_t v3 = a1;
  int v4 = tb_connection_send_query(*(uint64_t **)(v1 + 16), v2, v12, 2uLL);
  if (!v4)
  {
    uint64_t v7 = v12[0];
    if (!v12[0])
    {
      int v4 = 4;
      goto LABEL_3;
    }
    uint64_t v8 = v3[3];
    if (v8)
    {
      if (v8 == v12[0])
      {
        swift_retain();
        return v3;
      }
      type metadata accessor for TightbeamMessage();
      unint64_t v3 = (void *)swift_allocObject();
      uint64_t transport_buffer = tb_message_get_transport_buffer(v7);
      if (transport_buffer)
      {
        uint64_t v10 = transport_buffer;
        type metadata accessor for TransportBuffer();
        uint64_t v11 = swift_allocObject();
        *(void *)(v11 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
        *(void *)(v11 + 32) = 0;
        *(void *)(v11 + 16) = v10;
        *(unsigned char *)(v11 + 40) = 1;
        v3[3] = v7;
        v3[4] = v11;
        v3[2] = 0xC000000000000000;
        return v3;
      }
    }
    while (1)
    {
LABEL_12:
      sub_25F642D90();
      __break(1u);
    }
  }
LABEL_3:
  type metadata accessor for TransportError(0);
  sub_25F6333A8();
  swift_allocError();
  *uint64_t v5 = v4;
  swift_willThrow();
  return v3;
}

uint64_t ClientConnection.sendOneway(message:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    uint64_t result = tb_connection_send_query(*(uint64_t **)(v1 + 16), v2, 0, 0);
    if (result)
    {
      int v4 = result;
      type metadata accessor for TransportError(0);
      sub_25F6333A8();
      swift_allocError();
      *uint64_t v5 = v4;
      return swift_willThrow();
    }
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t ClientConnection.deinit()
{
  tb_client_connection_destruct(*(void *)(v0 + 16));
  return v0;
}

uint64_t ClientConnection.__deallocating_deinit()
{
  tb_client_connection_destruct(*(void *)(v0 + 16));
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t type metadata accessor for ClientConnection()
{
  return self;
}

uint64_t method lookup function for ClientConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ClientConnection);
}

uint64_t dispatch thunk of ClientConnection.__allocating_init(endpoint:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of ClientConnection.__allocating_init(connection:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t _tb_eve_transport_construct_message_buffer(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (__OFADD__(result, 24))
  {
    __break(1u);
  }
  else if (result + 24 <= 4096)
  {
    int v4 = (void *)swift_slowAlloc();
    uint64_t result = 0;
    v4[1] = 0;
    v4[2] = 0;
    void *v4 = 0;
    *(void *)a3 = v4;
    *(unsigned char *)(a3 + 8) = 0;
    *(_OWORD *)(a3 + 16) = xmmword_25F644B20;
    *(void *)(a3 + 32) = 24;
    *(void *)(a3 + 48) = 0;
  }
  else
  {
    return 2;
  }
  return result;
}

void _tb_eve_transport_destruct_message_buffer()
{
}

uint64_t _tb_eve_transport_message_buffer_reset(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3 + 24;
  if (__OFADD__(a3, 24))
  {
    __break(1u);
  }
  else if (v3 <= 4096)
  {
    uint64_t v4 = result;
    uint64_t result = 0;
    *(void *)(v4 + 16) = 24;
    *(void *)(v4 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
    *(unsigned char *)(v4 + 41) = 1;
  }
  else
  {
    return 2;
  }
  return result;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for HandlerRegistration(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 4);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HandlerRegistration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 64) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 64) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 4) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HandlerRegistration()
{
  return &type metadata for HandlerRegistration;
}

ValueMetadata *type metadata accessor for ComponentRuntimeLock()
{
  return &type metadata for ComponentRuntimeLock;
}

uint64_t sub_25F63EF4C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(ObjectType, v1);
}

uint64_t sub_25F63EF98(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(a1, ObjectType, v3);
}

uint64_t sub_25F63EFF0()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_25F63F000()
{
  return *(void *)(v0 + 16);
}

void sub_25F63F008()
{
}

uint64_t ServiceConnection.__allocating_init(endpoint:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  ServiceConnection.init(endpoint:)(a1);
  return v2;
}

uint64_t ServiceConnection.init(endpoint:)(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 32) = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyServiceConnection();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = &off_270BAD680;
  swift_retain();
  int v5 = TightbeamEndpoint.constructEndpoint()();
  unsigned char v9[4] = sub_25F63F1FC;
  v9[5] = v4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1107296256;
  v9[2] = sub_25F63F254;
  v9[3] = &block_descriptor_1;
  uint64_t v6 = _Block_copy(v9);
  swift_retain();
  swift_release();
  uint64_t v7 = tb_service_connection_create_with_endpoint(v5, (uint64_t)v6);
  _Block_release(v6);
  sub_25F63F8BC(0xD00000000000001BLL, 0x800000025F6476C0);
  swift_release();
  sub_25F63452C(a1);
  *(void *)(v2 + 16) = v7;
  return v2;
}

uint64_t type metadata accessor for AnyServiceConnection()
{
  return self;
}

uint64_t sub_25F63F1FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + 24);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a2, ObjectType, v4);
}

uint64_t sub_25F63F254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v6 = v5(a2, a3);
  swift_release();
  return v6;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_25F63F2C8(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x2611FA4E0](v2 + 24);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(v2 + 32);
    type metadata accessor for AnyServiceConnection();
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v2;
    *(void *)(v7 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = &off_270BAD680;
    swift_retain();
    swift_unknownObjectRetain();
    uint64_t v8 = sub_25F63F630(a1, v7, v5, v6, 0, 0, 1);
    swift_release();
    swift_unknownObjectRelease_n();
    return v8;
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t *sub_25F63F3E8()
{
  uint64_t result = *(uint64_t **)(v0 + 16);
  if (result) {
    return (uint64_t *)tb_service_connection_activate(result);
  }
  __break(1u);
  return result;
}

uint64_t ServiceConnection.deinit()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result)
  {
    tb_service_connection_destruct();
    sub_25F634B74(v0 + 24);
    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ServiceConnection.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    tb_service_connection_destruct();
    sub_25F634B74(v3 + 24);
    uint64_t v4 = v3;
    a2 = 40;
    a3 = 7;
  }
  else
  {
    __break(1u);
  }
  return MEMORY[0x270FA0228](v4, a2, a3);
}

uint64_t sub_25F63F474@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 24;
  swift_beginAccess();
  uint64_t result = MEMORY[0x2611FA4E0](v4);
  uint64_t v6 = *(void *)(v3 + 32);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_25F63F4D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *a2;
  swift_beginAccess();
  *(void *)(v3 + 32) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t type metadata accessor for UnownedServiceConnection()
{
  return self;
}

uint64_t type metadata accessor for ServiceConnection()
{
  return self;
}

uint64_t method lookup function for ServiceConnection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ServiceConnection);
}

uint64_t dispatch thunk of ServiceConnection.service.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of ServiceConnection.service.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of ServiceConnection.service.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of ServiceConnection.__allocating_init(endpoint:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ServiceConnection.begin()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t sub_25F63F630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  swift_unknownObjectRetain();
  swift_retain();
  uint64_t v11 = sub_25F63E820(a1, a2);
  if (a7)
  {
    uint64_t v12 = v11;
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v19 = v12;
    uint64_t v14 = *(void *)(a4 + 8);
    uint64_t v15 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v14 + 8);
    swift_retain();
    uint64_t v16 = v15(&v19, ObjectType, v14);
    uint64_t v17 = sub_25F63DD10();
    swift_release_n();
    swift_release();
    swift_unknownObjectRelease();
    if (v16) {
      return v17;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

uint64_t sub_25F63F810(uint64_t result)
{
  if (result)
  {
    sub_25F642D20();
    swift_bridgeObjectRelease();
    tb_error_t.description.getter();
    sub_25F642B50();
    swift_bridgeObjectRelease();
    uint64_t result = sub_25F642D90();
    __break(1u);
  }
  return result;
}

void sub_25F63F8BC(uint64_t a1, unint64_t a2)
{
  if (qword_26A7AF728 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_25F6427A0();
  __swift_project_value_buffer(v4, (uint64_t)qword_26A7AFA18);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = sub_25F642780();
  os_log_type_t v6 = sub_25F642C30();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = v8;
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_25F6301B4(a1, a2, &v9);
    sub_25F642CC0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25F617000, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2611FA440](v8, -1, -1);
    MEMORY[0x2611FA440](v7, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_25F63FA64()
{
  uint64_t v0 = sub_25F6427A0();
  __swift_allocate_value_buffer(v0, qword_26A7AFA18);
  __swift_project_value_buffer(v0, (uint64_t)qword_26A7AFA18);
  return sub_25F642790();
}

uint64_t sub_25F63FAD0()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t _tb_delegated_client_transport_create(uint64_t a1)
{
  uint64_t data = tb_endpoint_get_data(a1);
  type metadata accessor for DelegatedTransportClient();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = data;
  *(void *)(v2 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  swift_retain();
  return v2;
}

uint64_t type metadata accessor for DelegatedTransportClient()
{
  return self;
}

uint64_t _tb_delegated_client_transport_activate(uint64_t a1)
{
  *(void *)(tb_transport_get_context(a1) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a1;
  return 0;
}

uint64_t sub_25F63FBA4(uint64_t a1)
{
  uint64_t v3 = v2;
  type metadata accessor for TightbeamMessage();
  uint64_t inited = (void *)swift_initStackObject();
  inited[3] = 0;
  inited[4] = 0;
  uint64_t transport_buffer = tb_message_get_transport_buffer(a1);
  if (!transport_buffer) {
    goto LABEL_40;
  }
  uint64_t v7 = transport_buffer;
  type metadata accessor for TransportBuffer();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *(void *)(v8 + 32) = 0;
  *(void *)(v8 + 16) = v7;
  *(unsigned char *)(v8 + 40) = 1;
  inited[3] = a1;
  inited[4] = v8;
  swift_release();
  inited[2] = 0xC000000000000000;
  if (*(unsigned __int8 *)(v8 + 40) >= 2u) {
    goto LABEL_40;
  }
  uint64_t v9 = *(uint64_t **)(v8 + 16);
  uint64_t v10 = v9[2];
  if (v9[3] < v10) {
    goto LABEL_40;
  }
  if (v10 < 0)
  {
    sub_25F642DE0();
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v11 = *v9;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF958);
  unint64_t v38 = sub_25F63C994();
  v36[0] = v11;
  v36[1] = v10;
  uint64_t v12 = __swift_project_boxed_opaque_existential_1(v36, v37);
  uint64_t v13 = *v12 ? (unsigned char *)(*v12 + v12[1]) : 0;
  sub_25F63C9F0((unsigned char *)*v12, v13, v35);
  uint64_t v14 = v35[0];
  unint64_t v15 = v35[1];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  uint64_t v16 = *(uint64_t (**)(uint64_t, unint64_t))(*(void *)(v1 + 16) + 16);
  swift_retain();
  uint64_t v17 = v16(v14, v15);
  unint64_t v19 = v18;
  swift_release();
  uint64_t v20 = inited[4];
  if (!v20 || *(unsigned __int8 *)(v20 + 40) >= 2u) {
    goto LABEL_40;
  }
  uint64_t v39 = v3;
  uint64_t v21 = (_DWORD **)(inited + 3);
  uint64_t v22 = *(void *)(v20 + 16);
  unint64_t v23 = v19 >> 62;
  switch(v19 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v17), v17)) {
        goto LABEL_32;
      }
      size_t v24 = HIDWORD(v17) - (int)v17;
LABEL_19:
      tb_delegated_transport_message_buffer_reset(v22, 0, v24);
      if (v24) {
        goto LABEL_20;
      }
      goto LABEL_29;
    case 2uLL:
      uint64_t v26 = *(void *)(v17 + 16);
      uint64_t v25 = *(void *)(v17 + 24);
      if (__OFSUB__(v25, v26))
      {
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      tb_delegated_transport_message_buffer_reset(v22, 0, v25 - v26);
      uint64_t v28 = *(void *)(v17 + 16);
      uint64_t v27 = *(void *)(v17 + 24);
      if (__OFSUB__(v27, v28))
      {
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      if (v27 != v28)
      {
LABEL_20:
        if (!v23)
        {
          uint64_t v29 = BYTE6(v19);
          goto LABEL_26;
        }
        if (v23 != 1)
        {
          uint64_t v31 = *(void *)(v17 + 16);
          uint64_t v30 = *(void *)(v17 + 24);
          uint64_t v29 = v30 - v31;
          if (!__OFSUB__(v30, v31)) {
            goto LABEL_26;
          }
LABEL_35:
          __break(1u);
          goto LABEL_40;
        }
        if (!__OFSUB__(HIDWORD(v17), v17))
        {
          uint64_t v29 = HIDWORD(v17) - (int)v17;
LABEL_26:
          swift_retain();
          sub_25F63BD88(v17, v19, v29);
          swift_release();
          if (*(unsigned __int8 *)(v20 + 40) < 2u)
          {
            uint64_t v32 = *(void *)(v20 + 16);
            if (*(uint64_t *)(v32 + 24) >= 1)
            {
              *(void *)(v32 + 16) = 0;
              goto LABEL_29;
            }
          }
LABEL_40:
          sub_25F642D90();
          __break(1u);
          JUMPOUT(0x25F640004);
        }
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
LABEL_29:
      if (!*v21) {
        goto LABEL_40;
      }
      tb_message_set_state(*v21, 4);
      uint64_t v33 = sub_25F63DD10();
      sub_25F625550(v17, v19);
      sub_25F625550(v14, v15);
      swift_setDeallocating();
      TightbeamMessage.__deallocating_deinit();
      return v33;
    case 3uLL:
      tb_delegated_transport_message_buffer_reset(v22, 0, 0);
      goto LABEL_29;
    default:
      size_t v24 = BYTE6(v19);
      goto LABEL_19;
  }
}

uint64_t sub_25F640014()
{
  swift_release();
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t _tb_delegated_client_transport_send_message_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  tb_transport_get_context(a1);
  swift_retain();
  uint64_t v5 = sub_25F63FBA4(a2);
  swift_release();
  if (a3) {
    *a3 = v5;
  }
  return 0;
}

uint64_t type metadata accessor for DelegatedClientEndpointData()
{
  return self;
}

uint64_t tb_component_admission_search(uint64_t a1, unint64_t a2)
{
  return admissionSearch(_:_:)(a1, a2) & 1;
}

uint64_t admissionSearch(_:_:)(uint64_t a1, unint64_t a2)
{
  if (!a1) {
    return 1;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 0)
  {
LABEL_25:
    uint64_t result = sub_25F642DE0();
    __break(1u);
    return result;
  }
  uint64_t v3 = v2 - 1;
  if (v2 >= 1) {
    uint64_t v4 = v2 - 1;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  uint64_t v5 = v4 >> 1;
  if (v2 > (unint64_t)v5)
  {
    uint64_t v6 = *(void *)(a1 + 16);
    unint64_t v7 = *(void *)(v6 + 8 * v5);
    if (v7 == a2) {
      return 1;
    }
    uint64_t v9 = 0;
    while (1)
    {
      if (v7 <= a2) {
        uint64_t v9 = v5 + 1;
      }
      else {
        uint64_t v3 = v5 - 1;
      }
      uint64_t v5 = v9 + (v3 - v9) / 2;
      if (__OFADD__(v9, (v3 - v9) / 2)) {
        break;
      }
      uint64_t result = v5 >= v9 && v3 >= v5;
      if (result == 1)
      {
        unint64_t v7 = *(void *)(v6 + 8 * v5);
        if (v7 != a2) {
          continue;
        }
      }
      return result;
    }
    goto LABEL_25;
  }
  return 0;
}

uint64_t sub_25F640298()
{
  swift_release();
  swift_release();
  return MEMORY[0x270FA0228](v0, 48, 7);
}

uint64_t _tb_delegated_service_transport_create(uint64_t a1)
{
  tb_endpoint_get_data(a1);
  type metadata accessor for DelegatedTransportService();
  uint64_t v1 = swift_allocObject();
  uint64_t v2 = swift_retain();
  sub_25F640398(v2);
  return v1;
}

uint64_t type metadata accessor for DelegatedTransportService()
{
  return self;
}

uint64_t sub_25F640348(uint64_t a1)
{
  return 0;
}

void *sub_25F640398(uint64_t a1)
{
  uint64_t v10 = a1;
  uint64_t v2 = sub_25F642C50();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_25F642C40();
  MEMORY[0x270FA5388](v6);
  uint64_t v7 = sub_25F642A70();
  MEMORY[0x270FA5388](v7 - 8);
  v9[1] = sub_25F62530C();
  sub_25F642A60();
  uint64_t v11 = MEMORY[0x263F8EE78];
  sub_25F641038((unint64_t *)&qword_26A7AF820, MEMORY[0x263F8F0F8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF828);
  sub_25F632F7C((unint64_t *)&qword_26A7AF830, &qword_26A7AF828);
  sub_25F642D00();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F130], v2);
  v1[3] = sub_25F642C70();
  v1[4] = 0;
  v1[2] = v10;
  return v1;
}

uint64_t sub_25F6405FC(uint64_t a1)
{
  uint64_t v3 = sub_25F642A50();
  uint64_t v13 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_25F642A70();
  uint64_t v6 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v1 + 32) = a1;
  aBlock[4] = sub_25F641088;
  uint64_t v15 = v1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F6408D4;
  aBlock[3] = &block_descriptor_12_0;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  sub_25F642A60();
  uint64_t v16 = MEMORY[0x263F8EE78];
  sub_25F641038(&qword_26A7AFA30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AFA38);
  sub_25F632F7C((unint64_t *)&unk_26A7AFA40, &qword_26A7AFA38);
  sub_25F642D00();
  MEMORY[0x2611F9AB0](0, v8, v5, v9);
  _Block_release(v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v12);
  return swift_release();
}

uint64_t type metadata accessor for DelegatedServiceEndpointData()
{
  return self;
}

uint64_t sub_25F6408D4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_25F640918()
{
  uint64_t v1 = sub_25F642A50();
  uint64_t v23 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_25F642A70();
  uint64_t v4 = *(void *)(v22 - 8);
  MEMORY[0x270FA5388](v22);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)(v0 + 16);
  uint64_t v8 = *(uint64_t (**)(uint64_t))(v7 + 16);
  uint64_t v9 = swift_retain();
  uint64_t v10 = v8(v9);
  unint64_t v20 = v11;
  uint64_t v21 = v10;
  unint64_t v12 = v11;
  swift_release();
  uint64_t v13 = sub_25F640C40(v10, v12);
  unint64_t v15 = v14;
  uint64_t v16 = *(void (**)(uint64_t, unint64_t))(v7 + 32);
  swift_retain();
  v16(v13, v15);
  swift_release();
  uint64_t v19 = *(void *)(v0 + 24);
  aBlock[4] = sub_25F64101C;
  uint64_t v26 = v0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_25F6408D4;
  aBlock[3] = &block_descriptor_2;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain();
  sub_25F642A60();
  uint64_t v24 = MEMORY[0x263F8EE78];
  sub_25F641038(&qword_26A7AFA30, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AFA38);
  sub_25F632F7C((unint64_t *)&unk_26A7AFA40, &qword_26A7AFA38);
  sub_25F642D00();
  MEMORY[0x2611F9AB0](0, v6, v3, v17);
  _Block_release(v17);
  sub_25F625550(v13, v15);
  sub_25F625550(v21, v20);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v22);
  return swift_release();
}

uint64_t sub_25F640C40(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  v34[1] = *(void **)MEMORY[0x263EF8340];
  uint64_t v6 = tb_alloc_message();
  v34[0] = v6;
  uint64_t v7 = tb_alloc_transport_message_buffer();
  if (!v7)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v8 = v7;
  type metadata accessor for TransportBuffer();
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  *(void *)(inited + 32) = 0;
  *(void *)(inited + 16) = v8;
  *(unsigned char *)(inited + 40) = 1;
  size_t v10 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
        goto LABEL_26;
      }
      size_t v10 = HIDWORD(a1) - (int)a1;
LABEL_7:
      uint64_t v13 = tb_delegated_transport_construct_message_buffer(v10, 0, (uint64_t)v8);
      sub_25F63F810(v13);
      if (!v6)
      {
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
      }
      uint64_t v14 = tb_message_construct((uint64_t)v6, (uint64_t)v8, 1);
      sub_25F63F810(v14);
      uint64_t v15 = 0;
      switch(a2 >> 62)
      {
        case 0uLL:
          uint64_t v15 = BYTE6(a2);
          goto LABEL_13;
        case 1uLL:
          if (__OFSUB__(HIDWORD(a1), a1)) {
            goto LABEL_24;
          }
          uint64_t v15 = HIDWORD(a1) - (int)a1;
LABEL_13:
          sub_25F63BD88(a1, a2, v15);
          if ((uint64_t)v8[3] <= 0) {
            goto LABEL_29;
          }
          void v8[2] = 0;
          tb_message_set_state(v6, 4);
          unint64_t v18 = *(void **)(v3 + 32);
          if (!v18) {
            goto LABEL_28;
          }
          tb_transport_call_message_handler(v18, (uint64_t)v6, (uint64_t *)v34);
          uint64_t v19 = sub_25F633988();
          uint64_t v21 = v20;
          uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A7AF958);
          uint64_t v33 = sub_25F632F7C((unint64_t *)&qword_26A7AF960, &qword_26A7AF958);
          v31[0] = v19;
          v31[1] = v21;
          uint64_t v22 = __swift_project_boxed_opaque_existential_1(v31, v32);
          if (*v22) {
            uint64_t v23 = (unsigned char *)(*v22 + v22[1]);
          }
          else {
            uint64_t v23 = 0;
          }
          sub_25F63C9F0((unsigned char *)*v22, v23, &v30);
          uint64_t v24 = v30;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
          unsigned int v25 = *(unsigned __int8 *)(inited + 40);
          if (v25 >= 2)
          {
LABEL_29:
            sub_25F642D90();
            __break(1u);
            JUMPOUT(0x25F640FBCLL);
          }
          uint64_t v26 = *(void *)(inited + 16);
          uint64_t v27 = *(void (**)(uint64_t))(inited + 24);
          uint64_t v28 = *(void *)(inited + 32);
          tb_delegated_transport_destruct_message_buffer(v26);
          tb_free_message(v8);
          tb_free_message(v34[0]);
          swift_setDeallocating();
          if (!v25)
          {
            swift_retain();
            v27(v26);
            MEMORY[0x2611FA440](v26, -1, -1);
            sub_25F633400(v26, (uint64_t)v27, v28, 0);
          }
          sub_25F633400(v26, (uint64_t)v27, v28, v25);
          return v24;
        case 2uLL:
          uint64_t v17 = *(void *)(a1 + 16);
          uint64_t v16 = *(void *)(a1 + 24);
          uint64_t v15 = v16 - v17;
          if (!__OFSUB__(v16, v17)) {
            goto LABEL_13;
          }
          goto LABEL_25;
        case 3uLL:
          goto LABEL_13;
        default:
          JUMPOUT(0);
      }
    case 2uLL:
      uint64_t v12 = *(void *)(a1 + 16);
      uint64_t v11 = *(void *)(a1 + 24);
      size_t v10 = v11 - v12;
      if (!__OFSUB__(v11, v12)) {
        goto LABEL_7;
      }
      goto LABEL_23;
    case 3uLL:
      goto LABEL_7;
    default:
      size_t v10 = BYTE6(a2);
      goto LABEL_7;
  }
}

uint64_t sub_25F640FDC()
{
  swift_release();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_25F641038(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void _tb_afk_common_transport_construct_message_buffer_cold_1()
{
}

void tb_afk_transport_create_cold_3()
{
}

void _tb_afk_user_transport_send_message_cold_2()
{
}

void _tb_afk_user_transport_send_message_cold_3()
{
}

void __tb_afk_transport_create_block_invoke_cold_3()
{
}

void _tb_null_transport_send_message_cold_4()
{
}

void tb_message_construct_cold_1()
{
}

void tb_message_configure_received_cold_1()
{
}

void tb_message_measure_subrange_cold_1()
{
}

void tb_message_subrange_cold_1()
{
}

void tb_message_subrange_cold_2()
{
}

void tb_message_subrange_cold_3()
{
}

void tb_message_precheck_encoding_cold_1()
{
}

void tb_message_precheck_encoding_cold_2()
{
}

void tb_message_precheck_encoding_cold_3()
{
}

void tb_message_encode_BOOL_cold_1()
{
}

void tb_message_encode_BOOL_cold_2()
{
}

void tb_message_encode_u8_cold_1()
{
}

void tb_message_encode_u8_cold_2()
{
}

void tb_message_encode_u16_cold_1()
{
}

void tb_message_encode_u16_cold_2()
{
}

void tb_message_encode_u32_cold_1()
{
}

void tb_message_encode_u32_cold_2()
{
}

void tb_message_encode_u64_cold_1()
{
}

void tb_message_encode_u64_cold_2()
{
}

void tb_message_encode_s8_cold_1()
{
}

void tb_message_encode_s8_cold_2()
{
}

void tb_message_encode_s16_cold_1()
{
}

void tb_message_encode_s16_cold_2()
{
}

void tb_message_encode_s32_cold_1()
{
}

void tb_message_encode_s32_cold_2()
{
}

void tb_message_encode_s64_cold_1()
{
}

void tb_message_encode_s64_cold_2()
{
}

void tb_message_encode_f32_v2_cold_1()
{
}

void tb_message_encode_f32_v2_cold_2()
{
}

void tb_message_encode_f64_v2_cold_1()
{
}

void tb_message_encode_f64_v2_cold_2()
{
}

void tb_message_encode_f32_cold_1(int a1)
{
}

void tb_message_raw_encode_f32_cold_1(int a1)
{
}

void tb_message_encode_f64_cold_1(int a1)
{
}

void tb_message_raw_encode_f64_cold_1(int a1)
{
}

void tb_message_encode_buffer_cold_1()
{
}

void tb_message_encode_buffer_cold_2()
{
}

void tb_message_precheck_decoding_cold_1()
{
}

void tb_message_precheck_decoding_cold_2()
{
}

void tb_message_precheck_decoding_cold_3()
{
}

void tb_message_precheck_decoding_cold_4()
{
}

void tb_message_decode_BOOL_cold_1()
{
}

void tb_message_decode_BOOL_cold_2()
{
}

void tb_message_decode_BOOL_cold_3()
{
}

void tb_message_decode_u8_cold_1()
{
}

void tb_message_decode_u8_cold_2()
{
}

void tb_message_decode_u8_cold_3()
{
}

void tb_message_decode_u16_cold_1()
{
}

void tb_message_decode_u16_cold_2()
{
}

void tb_message_decode_u16_cold_3()
{
}

void tb_message_decode_u32_cold_1()
{
}

void tb_message_decode_u32_cold_2()
{
}

void tb_message_decode_u32_cold_3()
{
}

void tb_message_decode_u64_cold_1()
{
}

void tb_message_decode_u64_cold_2()
{
}

void tb_message_decode_u64_cold_3()
{
}

void tb_message_decode_s8_cold_1()
{
}

void tb_message_decode_s8_cold_2()
{
}

void tb_message_decode_s8_cold_3()
{
}

void tb_message_decode_s16_cold_1()
{
}

void tb_message_decode_s16_cold_2()
{
}

void tb_message_decode_s16_cold_3()
{
}

void tb_message_decode_s32_cold_1()
{
}

void tb_message_decode_s32_cold_2()
{
}

void tb_message_decode_s32_cold_3()
{
}

void tb_message_decode_s64_cold_1()
{
}

void tb_message_decode_s64_cold_2()
{
}

void tb_message_decode_s64_cold_3()
{
}

void tb_message_decode_f32_v2_cold_1()
{
}

void tb_message_decode_f32_v2_cold_2()
{
}

void tb_message_decode_f32_v2_cold_3()
{
}

void tb_message_decode_f64_v2_cold_1()
{
}

void tb_message_decode_f64_v2_cold_2()
{
}

void tb_message_decode_f64_v2_cold_3()
{
}

void tb_message_decode_f32_cold_1(int a1)
{
}

void tb_message_raw_decode_f32_cold_1(int a1)
{
}

void tb_message_decode_f64_cold_1(int a1)
{
}

void tb_message_raw_decode_f64_cold_1(int a1)
{
}

void __tb_service_connection_create_block_invoke_cold_1()
{
}

void __tb_service_connection_create_block_invoke_cold_2()
{
}

void __tb_service_connection_create_block_invoke_cold_3()
{
}

void __tb_service_connection_create_block_invoke_cold_4()
{
}

void _get_accumulator_list_cold_1()
{
}

void _tb_connection_transport_for_endpoint_inplace_cold_1()
{
}

void tb_connection_send_query_cold_3()
{
}

void tb_connection_send_query_cold_4()
{
}

void tb_connection_dealloc_destruct_owned_transport_message_buffer_cold_1()
{
}

void _tb_connection_message_construct_cold_1()
{
}

void _tb_connection_message_destruct_cold_1()
{
}

void _add_accumulator_cold_1()
{
}

void tb_message_accumulator_accumulate_cold_2()
{
}

void tb_message_accumulator_accumulate_cold_4()
{
}

void tb_message_accumulator_accumulate_cold_6()
{
}

void tb_message_accumulator_accumulate_cold_7()
{
}

void tb_message_accumulator_accumulate_cold_9()
{
}

void tb_message_splitter_send_cold_2()
{
}

void tb_reply_splitter_add_reply_cold_1()
{
}

void tb_reply_splitter_next_message_cold_1()
{
}

void _tb_forwarding_connection_message_forward_cold_1()
{
}

void _tb_forwarding_connection_message_forward_cold_2()
{
}

void _tb_forwarding_connection_message_forward_cold_3()
{
}

uint64_t sub_25F642620()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_25F642630()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_25F642640()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_25F642650()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_25F642660()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_25F6426B0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_25F6426C0()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_25F6426D0()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_25F6426E0()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_25F6426F0()
{
  return MEMORY[0x270EEFDC0]();
}

uint64_t sub_25F642700()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_25F642710()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_25F642720()
{
  return MEMORY[0x270EF0020]();
}

uint64_t sub_25F642730()
{
  return MEMORY[0x270EF0048]();
}

uint64_t sub_25F642740()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_25F642750()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_25F642760()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_25F642770()
{
  return MEMORY[0x270EF0248]();
}

uint64_t sub_25F642780()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_25F642790()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_25F6427A0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_25F6427B0()
{
  return MEMORY[0x270EF7108]();
}

uint64_t sub_25F6427C0()
{
  return MEMORY[0x270EF7148]();
}

uint64_t sub_25F6427D0()
{
  return MEMORY[0x270EF7160]();
}

uint64_t sub_25F6427E0()
{
  return MEMORY[0x270EF7188]();
}

uint64_t sub_25F6427F0()
{
  return MEMORY[0x270EF71A0]();
}

uint64_t sub_25F642800()
{
  return MEMORY[0x270EF71A8]();
}

uint64_t sub_25F642810()
{
  return MEMORY[0x270EF71C0]();
}

uint64_t sub_25F642820()
{
  return MEMORY[0x270EF71C8]();
}

uint64_t sub_25F642830()
{
  return MEMORY[0x270EF71D0]();
}

uint64_t sub_25F642840()
{
  return MEMORY[0x270EF7210]();
}

uint64_t sub_25F642850()
{
  return MEMORY[0x270EF7318]();
}

uint64_t sub_25F642860()
{
  return MEMORY[0x270EF7340]();
}

uint64_t sub_25F642870()
{
  return MEMORY[0x270EF7348]();
}

uint64_t sub_25F642880()
{
  return MEMORY[0x270EF7360]();
}

uint64_t sub_25F642890()
{
  return MEMORY[0x270EF7430]();
}

uint64_t sub_25F6428A0()
{
  return MEMORY[0x270EF7438]();
}

uint64_t sub_25F6428B0()
{
  return MEMORY[0x270EF7440]();
}

uint64_t sub_25F6428C0()
{
  return MEMORY[0x270EF7448]();
}

uint64_t sub_25F6428D0()
{
  return MEMORY[0x270EF7450]();
}

uint64_t sub_25F6428E0()
{
  return MEMORY[0x270EF7458]();
}

uint64_t sub_25F6428F0()
{
  return MEMORY[0x270EF7460]();
}

uint64_t sub_25F642900()
{
  return MEMORY[0x270EF7468]();
}

uint64_t sub_25F642910()
{
  return MEMORY[0x270EF7470]();
}

uint64_t sub_25F642920()
{
  return MEMORY[0x270EF7488]();
}

uint64_t sub_25F642930()
{
  return MEMORY[0x270EF74B8]();
}

uint64_t sub_25F642940()
{
  return MEMORY[0x270EF74C8]();
}

uint64_t sub_25F642950()
{
  return MEMORY[0x270EF74D8]();
}

uint64_t sub_25F642960()
{
  return MEMORY[0x270EF74F0]();
}

uint64_t sub_25F642970()
{
  return MEMORY[0x270EF7510]();
}

uint64_t sub_25F642980()
{
  return MEMORY[0x270EF7690]();
}

uint64_t sub_25F642990()
{
  return MEMORY[0x270EF7698]();
}

uint64_t sub_25F6429A0()
{
  return MEMORY[0x270EF76A0]();
}

uint64_t sub_25F6429B0()
{
  return MEMORY[0x270EF76B0]();
}

uint64_t sub_25F6429C0()
{
  return MEMORY[0x270EF76B8]();
}

uint64_t sub_25F6429D0()
{
  return MEMORY[0x270EF76D0]();
}

uint64_t sub_25F6429E0()
{
  return MEMORY[0x270EF76D8]();
}

uint64_t sub_25F6429F0()
{
  return MEMORY[0x270EF76E0]();
}

uint64_t sub_25F642A00()
{
  return MEMORY[0x270EF76E8]();
}

uint64_t sub_25F642A10()
{
  return MEMORY[0x270EF76F0]();
}

uint64_t sub_25F642A20()
{
  return MEMORY[0x270EF76F8]();
}

uint64_t sub_25F642A30()
{
  return MEMORY[0x270EF7700]();
}

uint64_t sub_25F642A40()
{
  return MEMORY[0x270EF77E0]();
}

uint64_t sub_25F642A50()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_25F642A60()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_25F642A70()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_25F642A80()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_25F642A90()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_25F642AA0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_25F642AB0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_25F642AC0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_25F642AD0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_25F642AE0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_25F642AF0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_25F642B00()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_25F642B10()
{
  return MEMORY[0x270F9D620]();
}

uint64_t sub_25F642B20()
{
  return MEMORY[0x270F9D6B0]();
}

uint64_t sub_25F642B30()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_25F642B40()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_25F642B50()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_25F642B60()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_25F642B70()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_25F642B80()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_25F642BA0()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_25F642BB0()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_25F642BC0()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_25F642BD0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_25F642BE0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_25F642BF0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_25F642C00()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_25F642C10()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_25F642C20()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_25F642C30()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_25F642C40()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_25F642C50()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_25F642C60()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_25F642C70()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_25F642C80()
{
  return MEMORY[0x270FA0F10]();
}

uint64_t sub_25F642C90()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_25F642CA0()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_25F642CB0()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_25F642CC0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_25F642CD0()
{
  return MEMORY[0x270F9E558]();
}

uint64_t sub_25F642CE0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_25F642CF0()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_25F642D00()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_25F642D10()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_25F642D20()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_25F642D30()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_25F642D40()
{
  return MEMORY[0x270F9E9E8]();
}

uint64_t sub_25F642D50()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_25F642D60()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_25F642D70()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_25F642D80()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_25F642D90()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_25F642DA0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_25F642DB0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_25F642DC0()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_25F642DD0()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_25F642DE0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_25F642E00()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_25F642E10()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_25F642E20()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_25F642E30()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_25F642E40()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_25F642E50()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_25F642E60()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_25F642E70()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_25F642E80()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_25F642E90()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_25F642EA0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_25F642EB0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_25F642EC0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_25F642ED0()
{
  return MEMORY[0x270F9FC90]();
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

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x270ED7F58](*(void *)&image_index);
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x270ED7F98]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8770](*(void *)&bp, service_name, sp);
}

kern_return_t bootstrap_register(mach_port_t bp, name_t service_name, mach_port_t sp)
{
  return MEMORY[0x270ED8780](*(void *)&bp, service_name, *(void *)&sp);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x270ED93C8]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x270ED93D0]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x270ED93D8]();
}

uint64_t dispatch_mach_msg_create()
{
  return MEMORY[0x270ED93F0]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x270ED93F8]();
}

uint64_t dispatch_mach_send()
{
  return MEMORY[0x270ED9400]();
}

uint64_t dispatch_mach_send_and_wait_for_reply()
{
  return MEMORY[0x270ED9408]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

uint64_t exclaves_endpoint_call()
{
  return MEMORY[0x270ED97D8]();
}

uint64_t exclaves_launch_conclave()
{
  return MEMORY[0x270ED97F0]();
}

uint64_t exclaves_lookup_service()
{
  return MEMORY[0x270ED97F8]();
}

uint64_t exclaves_notification_create()
{
  return MEMORY[0x270ED9800]();
}

void free(void *a1)
{
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x270ED9D60](mhp, segname, sectname, size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x270FA0410]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x270EDB850](*(void *)&task, *(void *)&which_port, special_port);
}