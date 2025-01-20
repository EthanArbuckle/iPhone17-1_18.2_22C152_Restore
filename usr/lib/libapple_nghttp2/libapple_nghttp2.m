uint64_t nghttp2_session_get_remote_window_size(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2828);
}

uint64_t nghttp2_session_get_local_window_size(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 2844) - *(_DWORD *)(a1 + 2832));
}

uint64_t nghttp2_check_header_value(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  while (VALID_HD_VALUE_CHARS[*a1])
  {
    ++a1;
    if (!--a2) {
      return 1;
    }
  }
  return 0;
}

uint64_t nghttp2_check_header_name(unsigned char *a1, uint64_t a2)
{
  if (a2)
  {
    if (*a1 != 58) {
      goto LABEL_6;
    }
    if (--a2)
    {
      ++a1;
LABEL_6:
      while (VALID_HD_NAME_CHARS[*a1])
      {
        ++a1;
        if (!--a2) {
          return 1;
        }
      }
    }
  }
  return 0;
}

BOOL nghttp2_session_want_read(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 2933) & 2) != 0) {
    return 0;
  }
  if (*(void *)(a1 + 16) == *(void *)(a1 + 2736) + *(void *)(a1 + 2728)) {
    return (*(unsigned char *)(a1 + 2933) & 0xC) == 0;
  }
  return 1;
}

BOOL nghttp2_session_want_write(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 2933) & 2) != 0) {
    return 0;
  }
  if (*(void *)(a1 + 648) || *(void *)(a1 + 256) || *(void *)(a1 + 280)) {
    return 1;
  }
  uint64_t v1 = *(void *)(a1 + 56);
  if (!v1)
  {
    while (!*(void *)(a1 + 344 + v1))
    {
      v1 += 40;
      if (v1 == 320) {
        return *(void *)(a1 + 304) && *(void *)(a1 + 2696) < (unint64_t)*(unsigned int *)(a1 + 2860);
      }
    }
  }
  if (*(int *)(a1 + 2828) > 0) {
    return 1;
  }
  return *(void *)(a1 + 304) && *(void *)(a1 + 2696) < (unint64_t)*(unsigned int *)(a1 + 2860);
}

uint64_t nghttp2_session_get_next_stream_id(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2800);
}

uint64_t nghttp2_submit_settings(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  return nghttp2_session_add_settings(a1, 0, a3, a4);
}

uint64_t nghttp2_session_add_rst_stream(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = nghttp2_map_find((uint64_t *)a1, a2);
  if (v6 && (*(unsigned char *)(v6 + 216) & 2) == 0 && *(_DWORD *)(v6 + 204) == 3) {
    return 0;
  }
  if (a2)
  {
    int v7 = *(unsigned __int8 *)(a1 + 2932);
    if (((a2 ^ (*(unsigned char *)(a1 + 2932) == 0)) & 1) == 0)
    {
      if (*(_DWORD *)(a1 + 2800) > a2) {
        goto LABEL_10;
      }
      return 0;
    }
  }
  if (*(_DWORD *)(a1 + 2808) < a2) {
    return 0;
  }
  if (a2)
  {
    int v7 = *(unsigned __int8 *)(a1 + 2932);
LABEL_10:
    if (!v7 && (a2 & 1) != 0)
    {
      uint64_t v8 = *(void *)(a1 + 304);
      if (v8)
      {
        if (*(unsigned char *)(v8 + 12) != 1) {
          __assert_rtn("nghttp2_session_add_rst_stream", "nghttp2_session.c", 1274, "headers_frame->hd.type == NGHTTP2_HEADERS");
        }
        if (*(_DWORD *)(v8 + 8) <= a2)
        {
          while (1)
          {
            int v9 = *(_DWORD *)(v8 + 8);
            if (v9 >= a2) {
              break;
            }
            uint64_t v8 = *(void *)(v8 + 144);
            if (!v8) {
              goto LABEL_21;
            }
          }
          if (v9 <= a2 && !*(unsigned char *)(v8 + 132))
          {
            uint64_t v10 = 0;
            *(_DWORD *)(v8 + 128) = a3;
            *(unsigned char *)(v8 + 132) = 1;
            return v10;
          }
        }
      }
    }
  }
LABEL_21:
  uint64_t v11 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
  if (!v11) {
    return 4294966395;
  }
  uint64_t v12 = v11;
  *(_OWORD *)(v11 + 137) = 0u;
  *(_OWORD *)(v11 + 112) = 0u;
  *(_OWORD *)(v11 + 128) = 0u;
  *(_OWORD *)(v11 + 96) = 0u;
  *(void *)uint64_t v11 = 4;
  *(_WORD *)(v11 + 12) = 3;
  *(_DWORD *)(v11 + 8) = a2;
  *(unsigned char *)(v11 + 14) = 0;
  *(_DWORD *)(v11 + 16) = a3;
  uint64_t v10 = nghttp2_session_add_item(a1, v11);
  if (v10) {
    (*(void (**)(uint64_t, void))(a1 + 2584))(v12, *(void *)(a1 + 2568));
  }
  return v10;
}

uint64_t nghttp2_option_new(void *a1)
{
  v2 = malloc_type_calloc(1uLL, 0x88uLL, 0x1000040B5CA6940uLL);
  *a1 = v2;
  if (v2) {
    return 0;
  }
  else {
    return 4294966395;
  }
}

uint64_t session_terminate_session(uint64_t a1, int a2, int a3, char *__s)
{
  if (*(unsigned char *)(a1 + 2933)) {
    return 0;
  }
  int v5 = a3;
  int v6 = a2;
  uint64_t v7 = a1;
  *(_DWORD *)(a1 + 952) = 15;
  if (__s)
  {
    size_t v8 = strlen(__s);
    a1 = v7;
    a2 = v6;
    a3 = v5;
    int v9 = __s;
  }
  else
  {
    int v9 = 0;
    size_t v8 = 0;
  }
  uint64_t result = nghttp2_session_add_goaway(a1, a2, a3, v9, v8, 1);
  if (!result) {
    *(unsigned char *)(v7 + 2933) |= 1u;
  }
  return result;
}

uint64_t nghttp2_session_add_goaway(uint64_t a1, int a2, int a3, const void *a4, size_t a5, char a6)
{
  if (a2 && (a2 & 1) == (*(unsigned char *)(a1 + 2932) == 0)) {
    return 4294966795;
  }
  if (a5)
  {
    if (a5 - 16377 < 0xFFFFFFFFFFFFBFFFLL) {
      return 4294966795;
    }
    v14 = (void *)(*(uint64_t (**)(size_t, void))(a1 + 2576))(a5, *(void *)(a1 + 2568));
    if (!v14) {
      return 4294966395;
    }
    v13 = v14;
    memcpy(v14, a4, a5);
  }
  else
  {
    v13 = 0;
  }
  uint64_t v15 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
  if (!v15)
  {
    (*(void (**)(void *, void))(a1 + 2584))(v13, *(void *)(a1 + 2568));
    return 4294966395;
  }
  uint64_t v16 = v15;
  *(_OWORD *)(v15 + 137) = 0u;
  *(_OWORD *)(v15 + 112) = 0u;
  *(_OWORD *)(v15 + 128) = 0u;
  *(_OWORD *)(v15 + 96) = 0u;
  int v17 = *(_DWORD *)(a1 + 2820);
  if (a2 < v17) {
    int v17 = a2;
  }
  *(void *)uint64_t v15 = a5 + 8;
  *(_WORD *)(v15 + 12) = 7;
  *(_DWORD *)(v15 + 8) = 0;
  *(unsigned char *)(v15 + 14) = 0;
  *(_DWORD *)(v15 + 16) = v17;
  *(_DWORD *)(v15 + 20) = a3;
  *(void *)(v15 + 24) = v13;
  *(void *)(v15 + 32) = a5;
  *(unsigned char *)(v15 + 40) = 0;
  *(unsigned char *)(v15 + 96) = a6;
  uint64_t v12 = nghttp2_session_add_item(a1, v15);
  if (v12)
  {
    (*(void (**)(void, void))(a1 + 2584))(*(void *)(v16 + 24), *(void *)(a1 + 2568));
    (*(void (**)(uint64_t, void))(a1 + 2584))(v16, *(void *)(a1 + 2568));
  }
  else
  {
    *(unsigned char *)(a1 + 2933) |= 0x10u;
  }
  return v12;
}

uint64_t buf_chain_new(void *a1, uint64_t a2, void *a3)
{
  int v6 = (void *)((uint64_t (*)(uint64_t, void))a3[1])(48, *a3);
  *a1 = v6;
  if (v6)
  {
    *int v6 = 0;
    uint64_t v7 = *a1;
    *(void *)(v7 + 40) = 0;
    *(_OWORD *)(v7 + 24) = 0u;
    *(_OWORD *)(v7 + 8) = 0u;
    if (!a2) {
      return 0;
    }
    uint64_t v8 = ((uint64_t (*)(void, uint64_t, void))a3[4])(0, a2, *a3);
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t result = 0;
      uint64_t v11 = *(void *)(v7 + 8);
      uint64_t v12 = v9 + *(void *)(v7 + 32) - v11;
      *(void *)(v7 + 24) = v9 + *(void *)(v7 + 24) - v11;
      *(void *)(v7 + 32) = v12;
      *(void *)(v7 + 40) = v9 + *(void *)(v7 + 40) - v11;
      *(void *)(v7 + 8) = v9;
      *(void *)(v7 + 16) = v9 + a2;
      return result;
    }
    ((void (*)(void, void))a3[2])(*a1, *a3);
  }
  return 4294966395;
}

void *default_realloc(void *a1, size_t a2)
{
  return malloc_type_realloc(a1, a2, 0x89B77B64uLL);
}

uint64_t nghttp2_session_add_window_update(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
  if (!v6) {
    return 4294966395;
  }
  uint64_t v7 = v6;
  *(_OWORD *)(v6 + 137) = 0u;
  *(_OWORD *)(v6 + 112) = 0u;
  *(_OWORD *)(v6 + 128) = 0u;
  *(_OWORD *)(v6 + 96) = 0u;
  *(void *)uint64_t v6 = 4;
  *(_WORD *)(v6 + 12) = 8;
  *(_DWORD *)(v6 + 8) = a2;
  *(unsigned char *)(v6 + 14) = 0;
  *(_DWORD *)(v6 + 16) = a3;
  *(unsigned char *)(v6 + 20) = 0;
  uint64_t v8 = nghttp2_session_add_item(a1, v6);
  if (v8) {
    (*(void (**)(uint64_t, void))(a1 + 2584))(v7, *(void *)(a1 + 2568));
  }
  return v8;
}

uint64_t nghttp2_submit_data(uint64_t a1, char a2, int a3, long long *a4)
{
  if (!a4) {
    __assert_rtn("nghttp2_submit_data", "nghttp2_submit.c", 900, "data_prd");
  }
  uint64_t v5 = 1;
  long long v6 = *a4;
  return nghttp2_submit_data_shared(a1, a2, a3, (long long *)&v5);
}

uint64_t nghttp2_submit_data_shared(uint64_t a1, char a2, int a3, long long *a4)
{
  if (!a3) {
    return 4294966795;
  }
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
  if (!v8) {
    return 4294966395;
  }
  uint64_t v9 = v8;
  *(_OWORD *)(v8 + 137) = 0u;
  *(_OWORD *)(v8 + 112) = 0u;
  *(_OWORD *)(v8 + 128) = 0u;
  *(_OWORD *)(v8 + 96) = 0u;
  long long v10 = *a4;
  *(void *)(v8 + 112) = *((void *)a4 + 2);
  *(_OWORD *)(v8 + 96) = v10;
  *(unsigned char *)(v8 + 120) = a2 & 1;
  *(void *)uint64_t v8 = 0;
  *(_WORD *)(v8 + 12) = 0;
  *(_DWORD *)(v8 + 8) = a3;
  *(unsigned char *)(v8 + 14) = 0;
  *(void *)(v8 + 16) = 0;
  uint64_t v11 = nghttp2_session_add_item(a1, v8);
  if (v11) {
    (*(void (**)(uint64_t, void))(a1 + 2584))(v9, *(void *)(a1 + 2568));
  }
  return v11;
}

uint64_t nghttp2_submit_request(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t a6)
{
  uint64_t v7 = 0;
  long long v8 = 0uLL;
  if (a5)
  {
    LODWORD(v7) = 1;
    long long v8 = *a5;
    a5 = (long long *)&v7;
  }
  return submit_request_shared(a1, a2, a3, a4, (uint64_t)a5, a6);
}

uint64_t submit_request_shared(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (*(unsigned char *)(a1 + 2932)) {
    return 4294966791;
  }
  uint64_t v9 = a2;
  if (a2)
  {
    if ((*(_DWORD *)a2 || *(_DWORD *)(a2 + 4) != 16 || *(unsigned char *)(a2 + 8)) && *(_DWORD *)(a1 + 2880) != 1)
    {
      if (*(_DWORD *)(a1 + 2800) == *(_DWORD *)a2) {
        return 4294966795;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  if (a5 && *(void *)(a5 + 16))
  {
    char v10 = 32 * (v9 != 0);
  }
  else if (v9)
  {
    char v10 = 33;
  }
  else
  {
    char v10 = 1;
  }
  return submit_headers_shared_nva(a1, v10, -1, v9, a3, a4, (long long *)a5, a6);
}

uint64_t submit_headers_shared_nva(uint64_t a1, char a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, long long *a7, uint64_t a8)
{
  LODWORD(v11) = a3;
  char v29 = 0;
  __int16 v28 = 0;
  if (a4)
  {
    uint64_t v14 = *(void *)a4;
    char v15 = *(unsigned char *)(a4 + 8);
    __int16 v28 = *(_WORD *)(a4 + 9);
    char v29 = *(unsigned char *)(a4 + 11);
    if ((int)HIDWORD(*(void *)a4) < 1)
    {
      int v16 = 1;
    }
    else
    {
      if (HIDWORD(*(void *)a4) < 0x101) {
        goto LABEL_8;
      }
      int v16 = 256;
    }
    HIDWORD(v14) = v16;
  }
  else
  {
    char v15 = 0;
    uint64_t v14 = 0x1000000000;
  }
LABEL_8:
  uint64_t v27 = v14;
  uint64_t v30 = 0;
  uint64_t v17 = nghttp2_nv_array_copy(&v30, a5, a6, a1 + 2568);
  if ((v17 & 0x80000000) != 0) {
    return v17;
  }
  uint64_t v18 = v30;
  uint64_t v19 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
  uint64_t v20 = v19;
  if (!v19)
  {
    uint64_t v22 = 4294966395;
LABEL_22:
    (*(void (**)(uint64_t, void))(a1 + 2584))(v18, *(void *)(a1 + 2568));
    (*(void (**)(uint64_t, void))(a1 + 2584))(v20, *(void *)(a1 + 2568));
    return v22;
  }
  *(_OWORD *)(v19 + 96) = 0u;
  *(_OWORD *)(v19 + 137) = 0u;
  *(_OWORD *)(v19 + 112) = 0u;
  *(_OWORD *)(v19 + 128) = 0u;
  if (a7 && *((void *)a7 + 2))
  {
    long long v21 = *a7;
    *(void *)(v19 + 112) = *((void *)a7 + 2);
    *(_OWORD *)(v19 + 96) = v21;
  }
  *(void *)(v19 + 120) = a8;
  if (v11 == -1)
  {
    uint64_t v11 = *(unsigned int *)(a1 + 2800);
    uint64_t v24 = v27;
    if ((v11 & 0x80000000) != 0)
    {
      uint64_t v22 = 4294966787;
      goto LABEL_22;
    }
    int v23 = 0;
    *(_DWORD *)(a1 + 2800) = v11 + 2;
    uint64_t v22 = v11;
  }
  else
  {
    uint64_t v22 = 0;
    int v23 = 3;
    uint64_t v24 = v27;
  }
  *(void *)uint64_t v19 = 0;
  *(unsigned char *)(v19 + 12) = 1;
  *(unsigned char *)(v19 + 13) = a2 & 0x21 | 4;
  *(_DWORD *)(v19 + 8) = v11;
  *(unsigned char *)(v19 + 14) = 0;
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 40) = v18;
  *(void *)(v19 + 48) = a6;
  *(_DWORD *)(v19 + 56) = v23;
  *(void *)(v19 + 24) = v24;
  *(unsigned char *)(v19 + 32) = v15;
  *(_WORD *)(v19 + 33) = v28;
  *(unsigned char *)(v19 + 35) = v29;
  uint64_t v25 = nghttp2_session_add_item(a1, v19);
  if (v25)
  {
    uint64_t v18 = *(void *)(v20 + 40);
    uint64_t v22 = v25;
    goto LABEL_22;
  }
  return v22;
}

uint64_t nghttp2_session_del(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = (uint64_t *)(result + 2568);
    v3 = *(void **)(result + 2648);
    if (v3)
    {
      do
      {
        v4 = (void *)*v3;
        (*(void (**)(void, void))(v1 + 2584))(v3[1], *(void *)(v1 + 2568));
        (*(void (**)(void *, void))(v1 + 2584))(v3, *(void *)(v1 + 2568));
        v3 = v4;
      }
      while (v4);
    }
    for (uint64_t i = 0; i != 320; i += 40)
    {
      (*(void (**)(void, void))(*(void *)(v1 + i + 336) + 16))(*(void *)(v1 + i + 328), **(void **)(v1 + i + 336));
      *(void *)(v1 + i + 328) = 0;
    }
    (*(void (**)(void, void))(*(void *)(v1 + 48) + 16))(*(void *)(v1 + 40), **(void **)(v1 + 48));
    *(void *)(v1 + 40) = 0;
    unint64_t v6 = *(unsigned int *)(v1 + 24);
    if (v6)
    {
      unint64_t v7 = 0;
      uint64_t v8 = 8;
      do
      {
        uint64_t v9 = *(void **)(*(void *)v1 + v8);
        if (v9)
        {
          free_streams(v9, v1);
          unint64_t v6 = *(unsigned int *)(v1 + 24);
        }
        ++v7;
        v8 += 16;
      }
      while (v7 < v6);
    }
    (*(void (**)(void, void))(*(void *)(v1 + 8) + 16))(*(void *)v1, **(void **)(v1 + 8));
    ob_q_free(*(void *)(v1 + 256), v2);
    ob_q_free(*(void *)(v1 + 280), v2);
    ob_q_free(*(void *)(v1 + 304), v2);
    active_outbound_item_reset((uint64_t *)(v1 + 648), v2);
    session_inbound_frame_reset(v1);
    hd_context_free((uint64_t *)(v1 + 992));
    nghttp2_hd_inflate_free((uint64_t *)(v1 + 2104));
    nghttp2_bufs_free((void **)(v1 + 656));
    char v10 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 2584);
    uint64_t v11 = *(void *)(v1 + 2568);
    return v10(v1, v11);
  }
  return result;
}

uint64_t ob_q_free(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    uint64_t v3 = result;
    do
    {
      uint64_t v4 = *(void *)(v3 + 144);
      nghttp2_outbound_item_free(v3, a2);
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))a2[2])(v3, *a2);
      uint64_t v3 = v4;
    }
    while (v4);
  }
  return result;
}

uint64_t hd_context_free(uint64_t *a1)
{
  v2 = (uint64_t *)a1[4];
  if (a1[3])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = (uint64_t *)hd_ringbuf_get(a1, v3);
      nghttp2_rcbuf_decref(v4[1]);
      nghttp2_rcbuf_decref(*v4);
      ((void (*)(uint64_t *, void))v2[2])(v4, *v2);
      ++v3;
    }
    while (v3 < a1[3]);
  }
  uint64_t v5 = *a1;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))v2[2];
  uint64_t v7 = *v2;

  return v6(v5, v7);
}

uint64_t nghttp2_hd_deflate_hd_bufs(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 60)) {
    return 4294966773;
  }
  uint64_t v8 = a1;
  if (*(unsigned char *)(a1 + 1104))
  {
    unint64_t v9 = *(void *)(a1 + 1096);
    *(unsigned char *)(a1 + 1104) = 0;
    *(void *)(a1 + 1096) = 0xFFFFFFFFLL;
    unint64_t v10 = *(void *)(a1 + 48);
    if (v10 > v9)
    {
      uint64_t result = emit_table_size(a2, v9);
      if (result)
      {
LABEL_8:
        *(unsigned char *)(v8 + 60) = 1;
        return result;
      }
      unint64_t v10 = *(void *)(v8 + 48);
    }
    uint64_t result = emit_table_size(a2, v10);
    if (result) {
      goto LABEL_8;
    }
  }
  if (!a4) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v59 = v8 + 64;
  uint64_t v60 = a3;
  uint64_t v56 = a4;
  uint64_t v57 = a2;
  uint64_t v58 = v8;
  do
  {
    uint64_t v61 = *(void *)(v8 + 32);
    uint64_t v62 = a3 + 40 * v11;
    uint64_t v12 = *(void *)(v62 + 16);
    __s2 = *(unsigned __int8 **)v62;
    unsigned int v13 = lookup_token(*(unsigned char **)v62, v12);
    unsigned int v14 = v13;
    uint64_t v15 = v13;
    size_t __n = v12;
    if (v13 == -1)
    {
      int v16 = -2128831035;
      if (!v12) {
        goto LABEL_22;
      }
      uint64_t v17 = __s2;
      uint64_t v18 = v12;
      do
      {
        int v19 = *v17++;
        int v16 = 16777619 * (v16 ^ v19);
        --v18;
      }
      while (v18);
    }
    else if (v13 > 0x3C)
    {
      int v16 = 0;
    }
    else
    {
      int v16 = static_table[32 * (unint64_t)v13 + 31];
    }
    if (v13 == 22 || v13 == 31 && *(void *)(a3 + 40 * v11 + 24) < 0x14uLL)
    {
LABEL_26:
      int v20 = 2;
      goto LABEL_27;
    }
LABEL_22:
    if (*(unsigned char *)(a3 + 40 * v11 + 32)) {
      goto LABEL_26;
    }
    int v20 = v13 <= 0x36 && ((1 << v13) & 0x40218208100008) != 0
       || v12 + *(void *)(a3 + 40 * v11 + 24) + 32 > (unint64_t)(3 * *(void *)(v8 + 48)) >> 2;
LABEL_27:
    uint64_t v21 = *(void *)(v59 + 8 * (v16 & 0x7F));
    if (!v21)
    {
      if (v13 <= 0x3C) {
        goto LABEL_49;
      }
      goto LABEL_58;
    }
    uint64_t v22 = 0;
    uint64_t v23 = a3 + 40 * v11;
    uint64_t v24 = (void *)(v23 + 24);
    uint64_t v25 = (const void **)(v23 + 8);
    while (*(_DWORD *)(v21 + 16) != v14
         || v14 == -1
         && (*(_DWORD *)(v21 + 76) != v16
          || *(void *)(*(void *)v21 + 24) != __n
          || memcmp(*(const void **)(*(void *)v21 + 16), __s2, __n)))
    {
      uint64_t v26 = v22;
LABEL_43:
      uint64_t v21 = *(void *)(v21 + 64);
      uint64_t v22 = v26;
      if (!v21) {
        goto LABEL_48;
      }
    }
    if (v22) {
      uint64_t v26 = v22;
    }
    else {
      uint64_t v26 = v21;
    }
    if (v20 != 2 || v22)
    {
      uint64_t v27 = *(void *)(v21 + 8);
      size_t v28 = *(void *)(v27 + 24);
      if (v28 == *v24 && !memcmp(*(const void **)(v27 + 16), *v25, v28))
      {
        uint64_t v8 = v58;
        uint64_t v48 = (*(_DWORD *)(v58 + 56) + ~*(_DWORD *)(v21 + 72) + 61);
        goto LABEL_83;
      }
      goto LABEL_43;
    }
    uint64_t v26 = v21;
LABEL_48:
    uint64_t v8 = v58;
    if (v14 >= 0x3D)
    {
      if (v26)
      {
        uint64_t v15 = (*(_DWORD *)(v58 + 56) + ~*(_DWORD *)(v26 + 72) + 61);
LABEL_59:
        a3 = v60;
LABEL_60:
        uint64_t v34 = v61;
        if (!v20)
        {
          uint64_t __src = 0;
          uint64_t v67 = 0;
          uint64_t v68 = 0;
          if (v15 != -1)
          {
            nghttp2_hd_table_get(v65, (void *)v8, v15);
            uint64_t v35 = v65[0];
            uint64_t __src = v65[0];
            int v36 = *(_DWORD *)(v65[0] + 32);
            if (v36 != -1) {
              *(_DWORD *)(v65[0] + 32) = v36 + 1;
            }
            goto LABEL_69;
          }
          uint64_t v38 = (*(uint64_t (**)(size_t, void))(v61 + 8))(__n + 41, *(void *)v61);
          if (v38)
          {
            uint64_t v35 = v38;
            uint64_t __src = v38;
            *(void *)uint64_t v38 = *(void *)v61;
            v39 = (unsigned char *)(v38 + 40);
            *(void *)(v38 + 8) = *(void *)(v61 + 16);
            *(void *)(v38 + 16) = v38 + 40;
            *(_DWORD *)(v38 + 32) = 1;
            *(void *)(v38 + 24) = __n;
            if (__n)
            {
              memcpy((void *)(v38 + 40), __s2, __n);
              v39 += __n;
            }
            unsigned char *v39 = 0;
            uint64_t v34 = v61;
LABEL_69:
            uint64_t v40 = a3 + 40 * v11;
            v41 = *(const void **)(v40 + 8);
            size_t v42 = *(void *)(v40 + 24);
            uint64_t v43 = (*(uint64_t (**)(size_t, void))(v34 + 8))(v42 + 41, *(void *)v34);
            if (v43)
            {
              uint64_t v44 = v43;
              uint64_t v67 = v43;
              *(void *)uint64_t v43 = *(void *)v34;
              uint64_t v45 = *(void *)(v34 + 16);
              v46 = (unsigned char *)(v43 + 40);
              *(void *)(v43 + 8) = v45;
              *(void *)(v43 + 16) = v43 + 40;
              *(_DWORD *)(v43 + 32) = 1;
              *(void *)(v43 + 24) = v42;
              if (v42)
              {
                memcpy((void *)(v43 + 40), v41, v42);
                v46 += v42;
              }
              a3 = v60;
              unsigned char *v46 = 0;
              LODWORD(v68) = v14;
              uint64_t v8 = v58;
              int v47 = add_hd_table_incremental((uint64_t *)v58, &__src, v59, v16);
              nghttp2_rcbuf_decref(v44);
              nghttp2_rcbuf_decref(v35);
              if (v47)
              {
                uint64_t result = 4294966773;
                goto LABEL_8;
              }
              goto LABEL_73;
            }
            nghttp2_rcbuf_decref(v35);
            uint64_t v8 = v58;
          }
          uint64_t result = 4294966395;
          goto LABEL_8;
        }
LABEL_73:
        if (v15 == -1)
        {
          uint64_t result = nghttp2_bufs_addb(v57, (0x100040u >> (8 * v20)) & 0xF0);
          if (result) {
            goto LABEL_8;
          }
          uint64_t result = emit_string(v57, *(char **)v62, *(void *)(v62 + 16));
          if (result) {
            goto LABEL_8;
          }
          uint64_t result = emit_string(v57, *(char **)(a3 + 40 * v11 + 8), *(void *)(a3 + 40 * v11 + 24));
        }
        else
        {
          uint64_t result = emit_indname_block(v57, v15, v62, v20);
        }
        uint64_t v37 = v56;
        goto LABEL_79;
      }
LABEL_58:
      uint64_t v15 = -1;
      goto LABEL_59;
    }
LABEL_49:
    if (v20 == 2)
    {
      uint64_t result = emit_indname_block(v57, v15, v62, 2);
      uint64_t v37 = v56;
      a3 = v60;
      goto LABEL_79;
    }
    a3 = v60;
    uint64_t v29 = v60 + 40 * v11;
    uint64_t v30 = (void *)(v29 + 24);
    v31 = (const void **)(v29 + 8);
    v32 = (char *)&static_table[32 * v15 + 16];
    uint64_t v33 = -1;
    while (1)
    {
      if (*((_DWORD *)v32 + 14) != v15)
      {
LABEL_55:
        uint64_t v8 = v58;
        goto LABEL_60;
      }
      if (*(void *)v32 == *v30 && !memcmp(*((const void **)v32 - 1), *v31, *(void *)v32)) {
        break;
      }
      ++v33;
      v32 += 128;
      if ((int)v15 + (int)v33 >= 60) {
        goto LABEL_55;
      }
    }
    uint64_t v48 = v15 + v33 + 1;
    uint64_t v8 = v58;
LABEL_83:
    uint64_t v37 = v56;
    if ((unint64_t)(v48 + 1) <= 0x7E)
    {
      LOBYTE(__src) = (v48 + 1) | 0x80;
      unint64_t v49 = 1;
      a3 = v60;
      goto LABEL_96;
    }
    unint64_t v50 = v48 - 126;
    if (v50 < 0x80)
    {
      LOBYTE(__src) = -1;
      unint64_t v49 = 2;
      v54 = (char *)&__src + 1;
      a3 = v60;
    }
    else
    {
      unint64_t v51 = 0;
      unint64_t v52 = v50;
      a3 = v60;
      do
      {
        unint64_t v53 = v52 >> 14;
        v52 >>= 7;
        ++v51;
      }
      while (v53);
      if (v51 > 0xE)
      {
        uint64_t result = 4294966773;
        goto LABEL_79;
      }
      LOBYTE(__src) = -1;
      v54 = (char *)&__src + 1;
      do
      {
        *v54++ = v50 | 0x80;
        unint64_t v55 = v50 >> 14;
        v50 >>= 7;
      }
      while (v55);
      unint64_t v49 = v51 + 2;
    }
    unsigned char *v54 = v50;
LABEL_96:
    uint64_t result = nghttp2_bufs_add(v57, (char *)&__src, v49);
LABEL_79:
    if (result) {
      goto LABEL_8;
    }
    ++v11;
  }
  while (v11 != v37);
  return 0;
}

uint64_t lookup_token(unsigned char *a1, uint64_t a2)
{
  switch(a2)
  {
    case 2:
      if (a1[1] != 101 || *a1 != 116) {
        return 0xFFFFFFFFLL;
      }
      return 61;
    case 3:
      int v3 = a1[2];
      if (v3 == 101)
      {
        if (*(_WORD *)a1 != 26465) {
          return 0xFFFFFFFFLL;
        }
        return 20;
      }
      else
      {
        if (v3 != 97 || *(_WORD *)a1 != 26998) {
          return 0xFFFFFFFFLL;
        }
        return 59;
      }
    case 4:
      int v4 = a1[3];
      switch(a1[3])
      {
        case 'e':
          if (*(_WORD *)a1 != 24932 || a1[2] != 116) {
            return 0xFFFFFFFFLL;
          }
          return 32;
        case 'f':
        case 'h':
        case 'i':
        case 'j':
        case 'l':
          return 0xFFFFFFFFLL;
        case 'g':
          if (*(_WORD *)a1 != 29797 || a1[2] != 97) {
            return 0xFFFFFFFFLL;
          }
          return 33;
        case 'k':
          if (*(_WORD *)a1 != 26988 || a1[2] != 110) {
            return 0xFFFFFFFFLL;
          }
          return 44;
        case 'm':
          if (*(_WORD *)a1 != 29286 || a1[2] != 111) {
            return 0xFFFFFFFFLL;
          }
          return 36;
        default:
          if (v4 == 116)
          {
            if (*(_WORD *)a1 == 28520 && a1[2] == 115) {
              return 37;
            }
          }
          else if (v4 == 121 && *(_WORD *)a1 == 24950 && a1[2] == 114)
          {
            return 58;
          }
          break;
      }
      return 0xFFFFFFFFLL;
    case 5:
      int v6 = a1[4];
      if (v6 == 119)
      {
        if (*(_DWORD *)a1 != 1869376609) {
          return 0xFFFFFFFFLL;
        }
        return 21;
      }
      else
      {
        if (v6 != 104)
        {
          if (v6 == 101 && *(_DWORD *)a1 == 1735287154) {
            return 49;
          }
          return 0xFFFFFFFFLL;
        }
        if (*(_DWORD *)a1 != 1952542778) {
          return 0xFFFFFFFFLL;
        }
        return 3;
      }
    case 6:
      int v7 = a1[5];
      if (v7 == 116)
      {
        if (*(_DWORD *)a1 == 1701012321 && a1[4] == 112) {
          return 18;
        }
        if (*(_DWORD *)a1 == 1701869669 && a1[4] == 99) {
          return 34;
        }
      }
      else if (v7 == 114)
      {
        if (*(_DWORD *)a1 == 1987208563 && a1[4] == 101) {
          return 53;
        }
      }
      else if (v7 == 101 && *(_DWORD *)a1 == 1802465123 && a1[4] == 105)
      {
        return 31;
      }
      return 0xFFFFFFFFLL;
    case 7:
      unsigned int v9 = a1[6];
      if (v9 <= 0x67)
      {
        if (v9 == 100)
        {
          if (*(_DWORD *)a1 == 1952804154 && *((_WORD *)a1 + 2) == 28520) {
            return 1;
          }
        }
        else
        {
          if (v9 != 101) {
            return 0xFFFFFFFFLL;
          }
          if (*(_DWORD *)a1 == 1751348026 && *((_WORD *)a1 + 2) == 28005) {
            return 5;
          }
          if (*(_DWORD *)a1 == 1919381621 && *((_WORD *)a1 + 2) == 25697) {
            return 65;
          }
        }
      }
      else
      {
        switch(v9)
        {
          case 'h':
            if (*(_DWORD *)a1 == 1919313266 && *((_WORD *)a1 + 2) == 29541) {
              return 51;
            }
            break;
          case 'r':
            if (*(_DWORD *)a1 == 1701209458 && *((_WORD *)a1 + 2) == 25970) {
              return 50;
            }
            break;
          case 's':
            if (*(_DWORD *)a1 == 1635021626 && *((_WORD *)a1 + 2) == 30068) {
              return 7;
            }
            if (*(_DWORD *)a1 == 1768978533 && *((_WORD *)a1 + 2) == 25970) {
              return 35;
            }
            break;
          default:
            return 0xFFFFFFFFLL;
        }
      }
      return 0xFFFFFFFFLL;
    case 8:
      unsigned int v12 = a1[7];
      if (v12 > 0x6D)
      {
        if (v12 == 110)
        {
          if (*(_DWORD *)a1 == 1633906540 && *(_DWORD *)(a1 + 3) == 1869182049) {
            return 45;
          }
        }
        else if (v12 == 121 && *(_DWORD *)a1 == 1869181552 && *(_DWORD *)(a1 + 3) == 1953067631)
        {
          return 67;
        }
      }
      else if (v12 == 101)
      {
        if (*(_DWORD *)a1 == 1915577961 && *(_DWORD *)(a1 + 3) == 1735287154) {
          return 41;
        }
      }
      else if (v12 == 104 && *(_DWORD *)a1 == 1831691881 && *(_DWORD *)(a1 + 3) == 1668571501)
      {
        return 38;
      }
      return 0xFFFFFFFFLL;
    case 9:
      if (a1[8] != 108 || *(void *)a1 != 0x6F636F746F72703ALL) {
        return 0xFFFFFFFFLL;
      }
      return 66;
    case 10:
      unsigned int v14 = a1[9];
      if (v14 > 0x73)
      {
        if (v14 == 116)
        {
          if (*(void *)a1 == 0x6567612D72657375 && a1[8] == 110) {
            return 57;
          }
        }
        else if (v14 == 121 && *(void *)a1 == 0x69726F687475613ALL && a1[8] == 116)
        {
          return 0;
        }
      }
      else if (v14 == 101)
      {
        if (*(void *)a1 == 0x696C612D7065656BLL && a1[8] == 118) {
          return 63;
        }
        if (*(void *)a1 == 0x6B6F6F632D746573 && a1[8] == 105) {
          return 54;
        }
      }
      else if (v14 == 110 && *(void *)a1 == 0x697463656E6E6F63 && a1[8] == 111)
      {
        return 62;
      }
      return 0xFFFFFFFFLL;
    case 11:
      if (a1[10] != 114) {
        return 0xFFFFFFFFLL;
      }
      if (*(void *)a1 != 0x66612D7972746572 || *((_WORD *)a1 + 4) != 25972) {
        return 0xFFFFFFFFLL;
      }
      return 52;
    case 12:
      int v17 = a1[11];
      if (v17 == 115)
      {
        if (*(void *)a1 == 0x77726F662D78616DLL && *(void *)(a1 + 3) == 0x64726177726F662DLL) {
          return 46;
        }
      }
      else if (v17 == 101 && *(void *)a1 == 0x2D746E65746E6F63 && *(void *)(a1 + 3) == 0x7079742D746E6574)
      {
        return 30;
      }
      return 0xFFFFFFFFLL;
    case 13:
      switch(a1[12])
      {
        case 'd':
          if (*(void *)a1 != 0x646F6D2D7473616CLL || *((_DWORD *)a1 + 2) != 1701406313) {
            return 0xFFFFFFFFLL;
          }
          uint64_t result = 43;
          break;
        case 'e':
          if (*(void *)a1 != 0x2D746E65746E6F63 || *((_DWORD *)a1 + 2) != 1735287154) {
            return 0xFFFFFFFFLL;
          }
          uint64_t result = 29;
          break;
        case 'f':
        case 'g':
        case 'i':
        case 'j':
        case 'k':
        case 'm':
          return 0xFFFFFFFFLL;
        case 'h':
          if (*(void *)a1 != 0x2D656E6F6E2D6669 || *((_DWORD *)a1 + 2) != 1668571501) {
            return 0xFFFFFFFFLL;
          }
          uint64_t result = 40;
          break;
        case 'l':
          if (*(void *)a1 != 0x6F632D6568636163 || *((_DWORD *)a1 + 2) != 1869771886) {
            return 0xFFFFFFFFLL;
          }
          uint64_t result = 23;
          break;
        case 'n':
          if (*(void *)a1 != 0x7A69726F68747561 || *((_DWORD *)a1 + 2) != 1869182049) {
            return 0xFFFFFFFFLL;
          }
          uint64_t result = 22;
          break;
        default:
          if (a1[12] != 115) {
            return 0xFFFFFFFFLL;
          }
          if (*(void *)a1 != 0x722D747065636361 || *((_DWORD *)a1 + 2) != 1701277281) {
            return 0xFFFFFFFFLL;
          }
          uint64_t result = 17;
          break;
      }
      return result;
    case 14:
      int v20 = a1[13];
      if (v20 == 116)
      {
        if (*(void *)a1 == 0x632D747065636361 && *(void *)(a1 + 5) == 0x6573726168632D74) {
          return 14;
        }
      }
      else if (v20 == 104 && *(void *)a1 == 0x2D746E65746E6F63 && *(void *)(a1 + 5) == 0x74676E656C2D746ELL)
      {
        return 27;
      }
      return 0xFFFFFFFFLL;
    case 15:
      int v22 = a1[14];
      if (v22 == 103)
      {
        if (*(void *)a1 == 0x652D747065636361 && *(void *)(a1 + 6) == 0x6E69646F636E652DLL) {
          return 15;
        }
      }
      else if (v22 == 101 && *(void *)a1 == 0x6C2D747065636361 && *(void *)(a1 + 6) == 0x676175676E616C2DLL)
      {
        return 16;
      }
      return 0xFFFFFFFFLL;
    case 16:
      int v24 = a1[15];
      switch(v24)
      {
        case 'n':
          if (*(void *)a1 == 0x2D746E65746E6F63 && *(void *)(a1 + 7) == 0x6F697461636F6C2DLL) {
            return 28;
          }
          if (*(void *)a1 == 0x6F632D79786F7270 && *(void *)(a1 + 7) == 0x6F697463656E6E6FLL) {
            return 64;
          }
          break;
        case 'g':
          if (*(void *)a1 == 0x2D746E65746E6F63 && *(void *)(a1 + 7) == 0x6E69646F636E652DLL) {
            return 25;
          }
          break;
        case 'e':
          if (*(void *)a1 == 0x2D746E65746E6F63 && *(void *)(a1 + 7) == 0x676175676E616C2DLL) {
            return 26;
          }
          if (*(void *)a1 == 0x687475612D777777 && *(void *)(a1 + 7) == 0x74616369746E6568) {
            return 60;
          }
          break;
        default:
          return 0xFFFFFFFFLL;
      }
      return 0xFFFFFFFFLL;
    case 17:
      int v27 = a1[16];
      if (v27 == 103)
      {
        if (*(void *)a1 == 0x726566736E617274 && *((void *)a1 + 1) == 0x6E69646F636E652DLL) {
          return 56;
        }
      }
      else if (v27 == 101 && *(void *)a1 == 0x6669646F6D2D6669 && *((void *)a1 + 1) == 0x636E69732D646569)
      {
        return 39;
      }
      return 0xFFFFFFFFLL;
    case 18:
      if (a1[17] != 101) {
        return 0xFFFFFFFFLL;
      }
      BOOL v29 = *(void *)a1 == 0x75612D79786F7270 && *((void *)a1 + 1) == 0x616369746E656874;
      if (!v29 || a1[16] != 116) {
        return 0xFFFFFFFFLL;
      }
      return 47;
    case 19:
      int v31 = a1[18];
      if (v31 == 110)
      {
        if (*(void *)a1 == 0x2D746E65746E6F63
          && *((void *)a1 + 1) == 0x7469736F70736964
          && *((_WORD *)a1 + 8) == 28521)
        {
          return 24;
        }
        if (*(void *)a1 == 0x75612D79786F7270
          && *((void *)a1 + 1) == 0x74617A69726F6874
          && *((_WORD *)a1 + 8) == 28521)
        {
          return 48;
        }
      }
      else if (v31 == 101)
      {
        BOOL v32 = *(void *)a1 == 0x646F6D6E752D6669 && *((void *)a1 + 1) == 0x69732D6465696669;
        if (v32 && *((_WORD *)a1 + 8) == 25454) {
          return 42;
        }
      }
      return 0xFFFFFFFFLL;
    case 25:
      if (a1[24] != 121) {
        return 0xFFFFFFFFLL;
      }
      BOOL v34 = *(void *)a1 == 0x742D746369727473 && *((void *)a1 + 1) == 0x74726F70736E6172;
      if (!v34 || *((void *)a1 + 2) != 0x746972756365732DLL) {
        return 0xFFFFFFFFLL;
      }
      return 55;
    case 27:
      if (a1[26] != 110) {
        return 0xFFFFFFFFLL;
      }
      BOOL v36 = *(void *)a1 == 0x632D737365636361 && *((void *)a1 + 1) == 0x612D6C6F72746E6FLL;
      BOOL v37 = v36 && *((void *)a1 + 2) == 0x69726F2D776F6C6CLL;
      if (!v37 || *((_WORD *)a1 + 12) != 26983) {
        return 0xFFFFFFFFLL;
      }
      return 19;
    default:
      return 0xFFFFFFFFLL;
  }
}

uint64_t nghttp2_hd_inflate_hd_nv(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned __int8 *a4, uint64_t a5, int a6)
{
  int v57 = 0;
  if (*(unsigned char *)(a1 + 60)) {
    return -523;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  nghttp2_rcbuf_decref(*(void *)(a1 + 176));
  nghttp2_rcbuf_decref(*(void *)(a1 + 168));
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0;
  unsigned int v14 = a4;
  *a3 = 0;
  if (!a5) {
    goto LABEL_70;
  }
  uint64_t v54 = a2;
  unint64_t v55 = a3;
  int v56 = a6;
  unsigned int v14 = &a4[a5];
  uint64_t v15 = (uint64_t *)(a1 + 160);
  int v16 = (uint64_t *)(a1 + 152);
  uint64_t v17 = a1 + 72;
  uint64_t v18 = a4;
  while (2)
  {
    int v19 = *(_DWORD *)(a1 + 228);
    switch(v19)
    {
      case 0:
        if ((*v18 & 0xE0) != 0x20) {
          goto LABEL_76;
        }
        goto LABEL_10;
      case 1:
      case 2:
        int v20 = *v18;
        if ((v20 & 0xE0) == 0x20)
        {
          if (v19 == 2) {
            goto LABEL_76;
          }
LABEL_10:
          *(void *)(a1 + 224) = 0x300000001;
        }
        else if ((v20 & 0x80) != 0)
        {
          *(void *)(a1 + 224) = 0x400000001;
        }
        else
        {
          if (!*v18 || v20 == 16)
          {
            uint64_t v37 = 1;
            uint64_t v38 = 0x500000002;
          }
          else
          {
            uint64_t v37 = 1;
            uint64_t v38 = 0x500000002;
            if (v20 != 64)
            {
              uint64_t v37 = 0;
              uint64_t v38 = 0x400000003;
            }
          }
          *(void *)(a1 + 224) = v38;
          *(unsigned char *)(a1 + 233) = (*v18 & 0x40) != 0;
          *(unsigned char *)(a1 + 234) = (*v18 & 0xF0) == 16;
          v18 += v37;
        }
        LOBYTE(v23) = 0;
        *(void *)(a1 + 184) = 0;
        *(void *)(a1 + 216) = 0;
        goto LABEL_67;
      case 3:
        int v57 = 0;
        if (*(void *)(a1 + 208) >= *(void *)(a1 + 200)) {
          unint64_t v21 = *(void *)(a1 + 200);
        }
        else {
          unint64_t v21 = *(void *)(a1 + 208);
        }
        uint64_t v22 = hd_inflate_read_len(a1, &v57, v18, v14, 5, v21);
        size_t v6 = v22;
        if (v22 < 0) {
          goto LABEL_77;
        }
        v18 += v22;
        if (!v57) {
          goto LABEL_74;
        }
        *(void *)(a1 + 208) = 0xFFFFFFFFLL;
        *(void *)(a1 + 48) = *(void *)(a1 + 184);
        hd_context_shrink_table_size((void *)a1, 0);
        LOBYTE(v23) = 0;
        *(_DWORD *)(a1 + 228) = 1;
        goto LABEL_67;
      case 4:
        if (*(_DWORD *)(a1 + 224) == 1)
        {
          char v24 = 7;
        }
        else if (*(unsigned char *)(a1 + 233))
        {
          char v24 = 6;
        }
        else
        {
          char v24 = 4;
        }
        int v57 = 0;
        uint64_t v46 = hd_inflate_read_len(a1, &v57, v18, v14, v24, *(void *)(a1 + 24) + 61);
        size_t v6 = v46;
        if (v46 < 0) {
          goto LABEL_77;
        }
        v18 += v46;
        if (!v57) {
          goto LABEL_74;
        }
        uint64_t v47 = *(void *)(a1 + 184);
        if (!v47) {
          goto LABEL_76;
        }
        int v48 = *(_DWORD *)(a1 + 224);
        *(void *)(a1 + 192) = v47 - 1;
        if (v48 == 1)
        {
          long long v58 = 0uLL;
          uint64_t v59 = 0;
          nghttp2_hd_table_get(&v58, (void *)a1, v47 - 1);
          *(_OWORD *)uint64_t v54 = v58;
          *(void *)(v54 + 16) = v59;
          *(_DWORD *)(a1 + 228) = 2;
          *v55 |= 2u;
          return v18 - a4;
        }
        LOBYTE(v23) = 0;
LABEL_62:
        *(_DWORD *)(a1 + 228) = 9;
        goto LABEL_67;
      case 5:
        *(unsigned char *)(a1 + 232) = *v18 >> 7;
        *(_DWORD *)(a1 + 228) = 6;
        *(void *)(a1 + 184) = 0;
        *(void *)(a1 + 216) = 0;
        goto LABEL_20;
      case 6:
LABEL_20:
        int v57 = 0;
        uint64_t v25 = hd_inflate_read_len(a1, &v57, v18, v14, 7, 0x10000uLL);
        size_t v6 = v25;
        if (v25 < 0) {
          goto LABEL_77;
        }
        v18 += v25;
        if (!v57) {
          goto LABEL_74;
        }
        if (*(unsigned char *)(a1 + 232))
        {
          *(_WORD *)(a1 + 64) = 0x4000;
          uint64_t v26 = (2 * *(void *)(a1 + 184)) | 1;
          int v27 = 7;
        }
        else
        {
          uint64_t v26 = *(void *)(a1 + 184) + 1;
          int v27 = 8;
        }
        *(_DWORD *)(a1 + 228) = v27;
        int v39 = nghttp2_rcbuf_new(v16, v26, v13);
        if (v39) {
          goto LABEL_94;
        }
        uint64_t v40 = *(void *)(a1 + 152);
        uint64_t v41 = *(void *)(v40 + 16);
        uint64_t v42 = *(void *)(v40 + 24);
        *(void *)(a1 + 96) = v41;
        *(void *)(a1 + 104) = v41;
        *(void *)(a1 + 80) = v41;
        *(void *)(a1 + 88) = v41;
        *(void *)(a1 + 72) = v41;
        if (v42)
        {
          LOBYTE(v23) = 0;
          *(void *)(a1 + 80) = v41 + v42;
        }
        else
        {
LABEL_48:
          LOBYTE(v23) = 0;
        }
        goto LABEL_67;
      case 7:
        uint64_t huff = hd_inflate_read_huff(a1, v17, v18, v14);
        size_t v6 = huff;
        if (huff < 0) {
          goto LABEL_77;
        }
        v18 += huff;
        uint64_t v23 = *(void *)(a1 + 184);
        if (v23) {
          goto LABEL_74;
        }
        **(unsigned char **)(a1 + 96) = 0;
        *(void *)(*(void *)(a1 + 152) + 24) = *(void *)(a1 + 96) - *(void *)(a1 + 88);
        goto LABEL_62;
      case 8:
        uint64_t v29 = v17;
        uint64_t v30 = v16;
        int v31 = v15;
        unint64_t v32 = *(void *)(a1 + 184);
        if (v14 - v18 >= v32) {
          size_t v6 = *(void *)(a1 + 184);
        }
        else {
          size_t v6 = v14 - v18;
        }
        uint64_t v33 = *(unsigned char **)(a1 + 96);
        if (v6)
        {
          memcpy(*(void **)(a1 + 96), v18, v6);
          v33 += v6;
          *(void *)(a1 + 96) = v33;
          unint64_t v32 = *(void *)(a1 + 184);
          *(void *)(a1 + 184) = v32 - v6;
          if ((v6 & 0x8000000000000000) != 0) {
            goto LABEL_77;
          }
        }
        v18 += v6;
        if (v32 != v6) {
          goto LABEL_74;
        }
        LOBYTE(v23) = 0;
        *uint64_t v33 = 0;
        *(void *)(*(void *)(a1 + 152) + 24) = *(void *)(a1 + 96) - *(void *)(a1 + 88);
        *(_DWORD *)(a1 + 228) = 9;
        uint64_t v15 = v31;
        int v16 = v30;
        uint64_t v17 = v29;
        goto LABEL_67;
      case 9:
        *(unsigned char *)(a1 + 232) = *v18 >> 7;
        *(_DWORD *)(a1 + 228) = 10;
        *(void *)(a1 + 184) = 0;
        *(void *)(a1 + 216) = 0;
        goto LABEL_35;
      case 10:
LABEL_35:
        int v57 = 0;
        uint64_t v34 = hd_inflate_read_len(a1, &v57, v18, v14, 7, 0x10000uLL);
        size_t v6 = v34;
        if (v34 < 0) {
          goto LABEL_77;
        }
        v18 += v34;
        if (!v57)
        {
LABEL_74:
          int v49 = v56;
LABEL_75:
          if (v49)
          {
LABEL_76:
            size_t v6 = -523;
            goto LABEL_77;
          }
          return v18 - a4;
        }
        if (*(unsigned char *)(a1 + 232))
        {
          *(_WORD *)(a1 + 64) = 0x4000;
          uint64_t v35 = (2 * *(void *)(a1 + 184)) | 1;
          int v36 = 11;
        }
        else
        {
          uint64_t v35 = *(void *)(a1 + 184) + 1;
          int v36 = 12;
        }
        *(_DWORD *)(a1 + 228) = v36;
        int v39 = nghttp2_rcbuf_new(v15, v35, v13);
        if (v39)
        {
LABEL_94:
          size_t v6 = v39;
LABEL_77:
          *(unsigned char *)(a1 + 60) = 1;
          return v6;
        }
        uint64_t v43 = *(void *)(a1 + 160);
        uint64_t v44 = *(void *)(v43 + 16);
        uint64_t v45 = *(void *)(v43 + 24);
        *(void *)(a1 + 136) = v44;
        *(void *)(a1 + 144) = v44;
        *(void *)(a1 + 120) = v44;
        *(void *)(a1 + 128) = v44;
        *(void *)(a1 + 112) = v44;
        if (v45) {
          *(void *)(a1 + 120) = v44 + v45;
        }
        LOBYTE(v23) = 1;
LABEL_67:
        if (v18 != v14 || (v23 & 1) != 0) {
          continue;
        }
        a6 = v56;
        a3 = v55;
LABEL_70:
        if (a6)
        {
          if ((*(_DWORD *)(a1 + 228) - 1) > 1) {
            goto LABEL_76;
          }
          *a3 |= 1u;
        }
        return v14 - a4;
      case 11:
        uint64_t v51 = hd_inflate_read_huff(a1, a1 + 112, v18, v14);
        size_t v6 = v51;
        if (v51 < 0) {
          goto LABEL_77;
        }
        v18 += v51;
        int v49 = v56;
        if (*(void *)(a1 + 184)) {
          goto LABEL_75;
        }
        **(unsigned char **)(a1 + 136) = 0;
        goto LABEL_89;
      case 12:
        unint64_t v52 = *(void *)(a1 + 184);
        if (v14 - v18 >= v52) {
          size_t v6 = *(void *)(a1 + 184);
        }
        else {
          size_t v6 = v14 - v18;
        }
        unint64_t v53 = *(unsigned char **)(a1 + 136);
        if (v6)
        {
          memcpy(*(void **)(a1 + 136), v18, v6);
          v53 += v6;
          *(void *)(a1 + 136) = v53;
          unint64_t v52 = *(void *)(a1 + 184);
          *(void *)(a1 + 184) = v52 - v6;
          if ((v6 & 0x8000000000000000) != 0) {
            goto LABEL_77;
          }
        }
        v18 += v6;
        int v49 = v56;
        if (v52 != v6) {
          goto LABEL_75;
        }
        *unint64_t v53 = 0;
LABEL_89:
        *(void *)(*(void *)(a1 + 160) + 24) = *(void *)(a1 + 136) - *(void *)(a1 + 128);
        if (*(_DWORD *)(a1 + 224) == 2) {
          hd_inflate_commit_newname(a1, v54);
        }
        else {
          hd_inflate_commit_indname(a1, v54);
        }
        if (v39) {
          goto LABEL_94;
        }
        *(_DWORD *)(a1 + 228) = 2;
        *v55 |= 2u;
        return v18 - a4;
      default:
        goto LABEL_48;
    }
  }
}

uint64_t nghttp2_rcbuf_decref(uint64_t result)
{
  if (result)
  {
    int v1 = *(_DWORD *)(result + 32);
    if (v1 != -1)
    {
      if (v1 <= 0) {
        __assert_rtn("nghttp2_rcbuf_decref", "nghttp2_rcbuf.c", 88, "rcbuf->ref > 0");
      }
      int v2 = v1 - 1;
      *(_DWORD *)(result + 32) = v2;
      if (!v2)
      {
        int v3 = *(uint64_t (**)(void))(result + 8);
        return v3();
      }
    }
  }
  return result;
}

uint64_t hd_inflate_read_len(uint64_t a1, _DWORD *a2, unsigned char *a3, unsigned char *a4, char a5, unint64_t a6)
{
  unsigned int v6 = *(_DWORD *)(a1 + 184);
  unint64_t v7 = *(void *)(a1 + 216);
  *(void *)(a1 + 216) = 0;
  *a2 = 0;
  uint64_t v8 = a3;
  if (!v6)
  {
    unsigned int v6 = ~(-1 << a5);
    unsigned int v13 = v6 & *a3;
    if (v13 == v6)
    {
      uint64_t v8 = a3 + 1;
      if (a3 + 1 != a4) {
        goto LABEL_2;
      }
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v12 = 1;
      *a2 = 1;
      unsigned int v6 = v13;
    }
LABEL_17:
    if (v6 <= a6)
    {
      *(void *)(a1 + 184) = v6;
      return v12;
    }
    return -523;
  }
LABEL_2:
  if (v8 != a4)
  {
    uint64_t v9 = -7 * (void)v8 + v7 - (void)a4 + 8 * (void)a4;
    while (v7 <= 0x1F)
    {
      unsigned int v10 = *v8 & 0x7F;
      if (0xFFFFFFFF >> v7 < v10) {
        break;
      }
      unsigned int v11 = v10 << v7;
      if (__CFADD__(v11, v6)) {
        break;
      }
      v6 += v11;
      if (((char)*v8 & 0x80000000) == 0)
      {
        *(void *)(a1 + 216) = v7;
        *a2 = 1;
        a4 = v8 + 1;
        goto LABEL_11;
      }
      ++v8;
      v7 += 7;
      if (v8 == a4)
      {
        unint64_t v7 = v9;
        goto LABEL_10;
      }
    }
    return -523;
  }
LABEL_10:
  *(void *)(a1 + 216) = v7;
LABEL_11:
  uint64_t v12 = a4 - a3;
  if (a4 - a3 != -1) {
    goto LABEL_17;
  }
  return -523;
}

uint64_t nghttp2_rcbuf_new(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void))(a3 + 8))(a2 + 40, *(void *)a3);
  if (!v6) {
    return 4294966395;
  }
  unint64_t v7 = (void *)v6;
  uint64_t result = 0;
  *a1 = (uint64_t)v7;
  *unint64_t v7 = *(void *)a3;
  *(void *)(*a1 + 8) = *(void *)(a3 + 16);
  *(void *)(*a1 + 16) = v7 + 5;
  uint64_t v9 = *a1;
  *(void *)(v9 + 24) = a2;
  *(_DWORD *)(v9 + 32) = 1;
  return result;
}

void *default_malloc(size_t a1)
{
  return malloc_type_malloc(a1, 0x7693B7D9uLL);
}

uint64_t hd_inflate_read_huff(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  unint64_t v4 = a4 - a3;
  unint64_t v5 = *(void *)(a1 + 184);
  uint64_t v6 = &a3[v5];
  if (a4 - a3 < v5) {
    uint64_t v6 = a4;
  }
  int v7 = *(unsigned __int16 *)(a1 + 64);
  uint64_t v8 = v6 - a3;
  if (v8)
  {
    uint64_t v9 = v8;
    do
    {
      unsigned int v11 = *a3++;
      char v10 = v11;
      unint64_t v12 = (unint64_t)v11 >> 4;
      unsigned int v13 = (char *)&huff_decode_table + 64 * (unint64_t)(v7 & 0x1FF);
      int v14 = *(__int16 *)&v13[4 * v12];
      if (v14 < 0)
      {
        char v15 = v13[4 * v12 + 2];
        int v16 = *(char **)(a2 + 24);
        *(void *)(a2 + 24) = v16 + 1;
        *int v16 = v15;
      }
      uint64_t v17 = v10 & 0xF;
      uint64_t v18 = (char *)&huff_decode_table + 64 * (unint64_t)(v14 & 0x1FF);
      int v7 = *(__int16 *)&v18[4 * v17];
      if (v7 < 0)
      {
        char v19 = v18[4 * v17 + 2];
        int v20 = *(char **)(a2 + 24);
        *(void *)(a2 + 24) = v20 + 1;
        *int v20 = v19;
      }
      int v7 = (unsigned __int16)v7;
      --v9;
    }
    while (v9);
  }
  BOOL v21 = (v7 & 0x4000) == 0 && v4 >= v5;
  *(_WORD *)(a1 + 64) = v7;
  uint64_t v22 = -523;
  if (!v21) {
    uint64_t v22 = v8;
  }
  if ((v22 & 0x8000000000000000) == 0)
  {
    if (v7 == 256) {
      return -523;
    }
    else {
      *(void *)(a1 + 184) -= v22;
    }
  }
  return v22;
}

uint64_t emit_string(uint64_t a1, char *a2, unint64_t a3)
{
  unint64_t v4 = a2;
  *(void *)&v29[15] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v6 = 0;
    int v7 = a2;
    unint64_t v8 = a3;
    do
    {
      unsigned int v9 = *v7++;
      v6 += huff_sym_table[2 * v9];
      --v8;
    }
    while (v8);
    unint64_t v10 = (unint64_t)(v6 + 7) >> 3;
  }
  else
  {
    unint64_t v10 = 0;
  }
  if (v10 >= a3) {
    unint64_t v11 = a3;
  }
  else {
    unint64_t v11 = v10;
  }
  if (v11 > 0x7E)
  {
    unint64_t v13 = v11 - 127;
    if (v13 < 0x80)
    {
      if (v10 < a3) {
        char v18 = -1;
      }
      else {
        char v18 = 127;
      }
      char __src = v18;
      char v19 = v29;
      unint64_t v12 = 2;
    }
    else
    {
      unint64_t v14 = 0;
      unint64_t v15 = v13;
      do
      {
        unint64_t v16 = v15 >> 14;
        v15 >>= 7;
        ++v14;
      }
      while (v16);
      if (v14 > 0xE) {
        return 4294966773;
      }
      if (v10 < a3) {
        char v20 = -1;
      }
      else {
        char v20 = 127;
      }
      char __src = v20;
      char v19 = v29;
      do
      {
        *v19++ = v13 | 0x80;
        unint64_t v21 = v13 >> 14;
        v13 >>= 7;
      }
      while (v21);
      unint64_t v12 = v14 + 2;
    }
    *char v19 = v13;
  }
  else
  {
    char __src = v11 | ((v10 < a3) << 7);
    unint64_t v12 = 1;
  }
  uint64_t result = nghttp2_bufs_add(a1, &__src, v12);
  if (!result)
  {
    if (v10 >= a3)
    {
      return nghttp2_bufs_add(a1, v4, a3);
    }
    unint64_t v22 = 0;
    uint64_t v23 = 0;
    char v24 = &v4[a3];
    uint64_t v25 = *(void *)(a1 + 8);
    unint64_t v26 = *(void *)(v25 + 16) - *(void *)(v25 + 32);
    while (1)
    {
      unsigned int v27 = *v4++;
      v23 |= (unint64_t)huff_sym_table[2 * v27 + 1] << (32 - v22);
      v22 += huff_sym_table[2 * v27];
      if (v22 >= 0x20)
      {
        if (v26 <= 3)
        {
          while (1)
          {
            uint64_t result = nghttp2_bufs_addb(a1, SHIBYTE(v23));
            if (result) {
              return result;
            }
            v23 <<= 8;
            v22 -= 8;
            if (v22 <= 7)
            {
              uint64_t v25 = *(void *)(a1 + 8);
              unint64_t v26 = *(void *)(v25 + 16) - *(void *)(v25 + 32);
              goto LABEL_37;
            }
          }
        }
        **(_DWORD **)(v25 + 32) = bswap32(HIDWORD(v23));
        uint64_t v25 = *(void *)(a1 + 8);
        *(void *)(v25 + 32) += 4;
        v26 -= 4;
        v23 <<= 32;
        v22 -= 32;
      }
LABEL_37:
      if (v4 == v24)
      {
        if (v22 < 8)
        {
LABEL_41:
          if (!v22) {
            return 0;
          }
          uint64_t result = nghttp2_bufs_addb(a1, HIBYTE(v23) | ~(-1 << (8 - v22)));
          if (!result) {
            return 0;
          }
        }
        else
        {
          while (1)
          {
            uint64_t result = nghttp2_bufs_addb(a1, SHIBYTE(v23));
            if (result) {
              break;
            }
            v23 <<= 8;
            v22 -= 8;
            if (v22 <= 7) {
              goto LABEL_41;
            }
          }
        }
        return result;
      }
    }
  }
  return result;
}

uint64_t nghttp2_bufs_addb(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = *(unsigned char **)(v3 + 32);
  if (*(unsigned char **)(v3 + 16) != v4) {
    goto LABEL_2;
  }
  uint64_t result = bufs_alloc_chain(a1);
  if (!result)
  {
    uint64_t v3 = *(void *)(a1 + 8);
    unint64_t v4 = *(unsigned char **)(v3 + 32);
LABEL_2:
    uint64_t result = 0;
    *(void *)(v3 + 32) = v4 + 1;
    unsigned char *v4 = a2;
  }
  return result;
}

uint64_t nghttp2_bufs_add(uint64_t a1, char *__src, unint64_t a3)
{
  if (!a3) {
    return 0;
  }
  unint64_t v3 = a3;
  do
  {
    while (1)
    {
      uint64_t v6 = *(void *)(a1 + 8);
      uint64_t v7 = *(void *)(v6 + 32);
      size_t v8 = *(void *)(v6 + 16) - v7 >= v3 ? v3 : *(void *)(v6 + 16) - v7;
      if (v8) {
        break;
      }
      uint64_t result = bufs_alloc_chain(a1);
      if (result) {
        return result;
      }
    }
    memcpy(*(void **)(v6 + 32), __src, v8);
    *(void *)(v6 + 32) = v7 + v8;
    __src += v8;
    v3 -= v8;
  }
  while (v3);
  return 0;
}

uint64_t add_hd_table_incremental(uint64_t *a1, void *a2, uint64_t a3, int a4)
{
  unint64_t v8 = *(void *)(*a2 + 24) + *(void *)(a2[1] + 24) + 32;
  unsigned int v9 = (void *)a1[4];
  unint64_t v10 = a1[5] + v8;
  unint64_t v11 = a1[6];
  while (v10 > v11)
  {
    uint64_t v12 = a1[3];
    if (!v12) {
      break;
    }
    unint64_t v13 = (uint64_t *)hd_ringbuf_get(a1, v12 - 1);
    uint64_t v14 = v13[1];
    a1[5] = a1[5] - (*(void *)(*v13 + 24) + *(void *)(v14 + 24)) - 32;
    uint64_t v15 = a1[3];
    if (!v15) {
      __assert_rtn("hd_ringbuf_pop_back", "nghttp2_hd.c", 671, "ringbuf->len > 0");
    }
    a1[3] = v15 - 1;
    if (a3)
    {
      unint64_t v16 = (uint64_t **)(a3 + 8 * (*((_DWORD *)v13 + 19) & 0x7F));
      uint64_t v17 = *v16;
      if (*v16)
      {
        if (v17 == v13)
        {
LABEL_11:
          *unint64_t v16 = (uint64_t *)v13[8];
          v13[8] = 0;
          uint64_t v14 = v13[1];
        }
        else
        {
          while (1)
          {
            char v18 = v17;
            uint64_t v17 = (uint64_t *)v17[8];
            if (!v17) {
              break;
            }
            if (v17 == v13)
            {
              unint64_t v16 = (uint64_t **)(v18 + 8);
              goto LABEL_11;
            }
          }
        }
      }
    }
    nghttp2_rcbuf_decref(v14);
    nghttp2_rcbuf_decref(*v13);
    ((void (*)(uint64_t *, void))v9[2])(v13, *v9);
    unint64_t v11 = a1[6];
    unint64_t v10 = a1[5] + v8;
  }
  if (v8 > v11) {
    return 0;
  }
  uint64_t v20 = ((uint64_t (*)(uint64_t, void))v9[1])(80, *v9);
  if (!v20) {
    return 4294966395;
  }
  uint64_t v21 = v20;
  long long v22 = *(_OWORD *)a2;
  *(void *)(v20 + 16) = a2[2];
  *(_OWORD *)uint64_t v20 = v22;
  uint64_t v23 = a2[1];
  uint64_t v24 = *(void *)(*a2 + 24);
  uint64_t v26 = *(void *)(v23 + 16);
  uint64_t v25 = *(void *)(v23 + 24);
  *(void *)(v20 + 24) = *(void *)(*a2 + 16);
  *(void *)(v20 + 32) = v26;
  *(void *)(v20 + 40) = v24;
  *(void *)(v20 + 48) = v25;
  *(unsigned char *)(v20 + 56) = *((unsigned char *)a2 + 20);
  *(void *)(v20 + 64) = 0;
  *(_DWORD *)(v20 + 76) = 0;
  int v27 = *(_DWORD *)(*(void *)v20 + 32);
  if (v27 != -1) {
    *(_DWORD *)(*(void *)v20 + 32) = v27 + 1;
  }
  uint64_t v28 = *(void *)(v20 + 8);
  int v29 = *(_DWORD *)(v28 + 32);
  if (v29 != -1) {
    *(_DWORD *)(v28 + 32) = v29 + 1;
  }
  unint64_t v30 = a1[3] + 1;
  unint64_t v31 = a1[1];
  if (v31 + 1 < v30)
  {
    uint64_t v32 = 1;
    do
    {
      unint64_t v33 = v32;
      v32 *= 2;
    }
    while (v33 < v30);
    uint64_t v34 = ((uint64_t (*)(unint64_t, void))v9[1])(8 * v33, *v9);
    if (v34)
    {
      uint64_t v35 = v34;
      if (a1[3])
      {
        unint64_t v36 = 0;
        do
        {
          *(void *)(v35 + 8 * v36) = hd_ringbuf_get(a1, v36);
          ++v36;
        }
        while (v36 < a1[3]);
      }
      ((void (*)(uint64_t, void))v9[2])(*a1, *v9);
      unint64_t v31 = v33 - 1;
      *a1 = v35;
      a1[1] = v33 - 1;
      unint64_t v30 = a1[3] + 1;
      uint64_t v37 = -1;
      goto LABEL_29;
    }
    nghttp2_rcbuf_decref(*(void *)(v21 + 8));
    nghttp2_rcbuf_decref(*(void *)v21);
    ((void (*)(uint64_t, void))v9[2])(v21, *v9);
    return 4294966395;
  }
  uint64_t v35 = *a1;
  uint64_t v37 = a1[2] - 1;
LABEL_29:
  *(void *)(v35 + 8 * (v37 & v31)) = v21;
  a1[2] = v37;
  a1[3] = v30;
  int v38 = *((_DWORD *)a1 + 14);
  *((_DWORD *)a1 + 14) = v38 + 1;
  *(_DWORD *)(v21 + 72) = v38;
  *(_DWORD *)(v21 + 76) = a4;
  if (a3)
  {
    uint64_t v39 = *(void *)(a3 + 8 * (a4 & 0x7F));
    if (v39) {
      *(void *)(v21 + 64) = v39;
    }
    *(void *)(a3 + 8 * (a4 & 0x7F)) = v21;
  }
  uint64_t result = 0;
  a1[5] += v8;
  return result;
}

void *nghttp2_hd_table_get(void *result, void *a2, unint64_t a3)
{
  if (a2[3] + 61 <= a3) {
    __assert_rtn("nghttp2_hd_table_get", "nghttp2_hd.c", 1304, "INDEX_RANGE_VALID(context, idx)");
  }
  unint64_t v3 = result;
  if (a3 < 0x3D)
  {
    unint64_t v4 = (char *)&static_table + 128 * a3;
    *uint64_t result = v4;
    result[1] = v4 + 40;
    result[2] = 0;
    *((_DWORD *)result + 4) = *((_DWORD *)v4 + 30);
  }
  else
  {
    uint64_t result = (void *)hd_ringbuf_get(a2, a3 - 61);
    *(_OWORD *)unint64_t v3 = *(_OWORD *)result;
    v3[2] = result[2];
  }
  return result;
}

double hd_inflate_commit_newname(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 152;
  uint64_t v5 = *(void *)(a1 + 152);
  BOOL v6 = *(unsigned char *)(a1 + 234) != 0;
  uint64_t v10 = 0;
  BYTE4(v10) = v6;
  uint64_t v7 = *(void *)(a1 + 160);
  *(void *)&long long v9 = v5;
  *((void *)&v9 + 1) = v7;
  LODWORD(v10) = lookup_token(*(unsigned char **)(v5 + 16), *(void *)(v5 + 24));
  if (!*(unsigned char *)(v4 + 81) || !add_hd_table_incremental((uint64_t *)a1, &v9, 0, 0))
  {
    double result = *(double *)&v9;
    *(_OWORD *)a2 = v9;
    *(void *)(a2 + 16) = v10;
    *(void *)(a1 + 168) = v5;
    *(void *)(a1 + 176) = v7;
    *(void *)uint64_t v4 = 0;
    *(void *)(v4 + 8) = 0;
  }
  return result;
}

uint64_t emit_indname_block(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)&v19[15] = *MEMORY[0x263EF8340];
  unint64_t v6 = a2 + 1;
  if (a4) {
    unint64_t v7 = 15;
  }
  else {
    unint64_t v7 = 63;
  }
  unint64_t v8 = v6 - v7;
  if (v6 >= v7)
  {
    if (v8 < 0x80)
    {
      char __src = (0x100040u >> (8 * a4)) | v7;
      uint64_t v14 = v19;
      unint64_t v9 = 2;
    }
    else
    {
      unint64_t v10 = 0;
      unint64_t v11 = v8;
      do
      {
        unint64_t v12 = v11 >> 14;
        v11 >>= 7;
        ++v10;
      }
      while (v12);
      if (v10 > 0xE) {
        return 4294966773;
      }
      char __src = (0x100040u >> (8 * a4)) | v7;
      uint64_t v14 = v19;
      do
      {
        *v14++ = v8 | 0x80;
        unint64_t v15 = v8 >> 14;
        v8 >>= 7;
      }
      while (v15);
      unint64_t v9 = v10 + 2;
    }
    unsigned char *v14 = v8;
  }
  else
  {
    char __src = (0x100040u >> (8 * a4)) & ~(_BYTE)v7 | v6;
    unint64_t v9 = 1;
  }
  uint64_t result = nghttp2_bufs_add(a1, &__src, v9);
  if (!result)
  {
    unint64_t v16 = *(char **)(a3 + 8);
    unint64_t v17 = *(void *)(a3 + 24);
    return emit_string(a1, v16, v17);
  }
  return result;
}

double hd_inflate_commit_indname(uint64_t a1, uint64_t a2)
{
  nghttp2_hd_table_get(&v8, (void *)a1, *(void *)(a1 + 192));
  BYTE4(v9) = *(unsigned char *)(a1 + 234) != 0;
  uint64_t v4 = v8;
  int v5 = *(_DWORD *)(v8 + 32);
  if (v5 != -1) {
    *(_DWORD *)(v8 + 32) = v5 + 1;
  }
  uint64_t v6 = *(void *)(a1 + 160);
  *((void *)&v8 + 1) = v6;
  if (*(unsigned char *)(a1 + 233) && add_hd_table_incremental((uint64_t *)a1, &v8, 0, 0))
  {
    nghttp2_rcbuf_decref(v4);
  }
  else
  {
    double result = *(double *)&v8;
    *(_OWORD *)a2 = v8;
    *(void *)(a2 + 16) = v9;
    *(void *)(a1 + 168) = v4;
    *(void *)(a1 + 176) = v6;
    *(void *)(a1 + 160) = 0;
  }
  return result;
}

uint64_t hd_ringbuf_get(void *a1, unint64_t a2)
{
  if (a1[3] <= a2) {
    __assert_rtn("hd_ringbuf_get", "nghttp2_hd.c", 611, "idx < ringbuf->len");
  }
  return *(void *)(*a1 + 8 * ((a1[2] + a2) & a1[1]));
}

uint64_t nghttp2_nv_array_copy(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    uint64_t v7 = 0;
    long long v8 = (unsigned char *)(a2 + 32);
    uint64_t v9 = a3;
    do
    {
      if ((*v8 & 2) == 0) {
        v7 += *((void *)v8 - 2) + 1;
      }
      if ((*v8 & 4) == 0) {
        v7 += *((void *)v8 - 1) + 1;
      }
      v8 += 40;
      --v9;
    }
    while (v9);
    uint64_t v10 = (*(uint64_t (**)(uint64_t, void))(a4 + 8))(v7 + 40 * a3, *(void *)a4);
    *a1 = v10;
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      unint64_t v13 = (char *)(v10 + 40 * a3);
      while (1)
      {
        uint64_t v14 = a2 + 40 * v12;
        unint64_t v15 = (unsigned char *)(v14 + 32);
        *(unsigned char *)(v11 + 32) = *(unsigned char *)(v14 + 32);
        char v16 = *(unsigned char *)(v14 + 32);
        if ((v16 & 2) != 0)
        {
          *(void *)uint64_t v11 = *(void *)v14;
          *(void *)(v11 + 16) = *(void *)(a2 + 40 * v12 + 16);
          if ((v16 & 4) == 0) {
            goto LABEL_20;
          }
        }
        else
        {
          uint64_t v17 = a2 + 40 * v12;
          size_t v20 = *(void *)(v17 + 16);
          char v19 = (uint64_t *)(v17 + 16);
          size_t v18 = v20;
          if (v20)
          {
            memcpy(v13, *(const void **)v14, v18);
            uint64_t v21 = *v19;
          }
          else
          {
            uint64_t v21 = 0;
          }
          *(void *)uint64_t v11 = v13;
          *(void *)(v11 + 16) = v21;
          v13[v21] = 0;
          uint64_t v23 = *(void *)(v11 + 16);
          if (v23)
          {
            uint64_t v24 = *(unsigned char **)v11;
            do
            {
              *uint64_t v24 = DOWNCASE_TBL[*v24];
              ++v24;
              --v23;
            }
            while (v23);
          }
          v13 += *v19 + 1;
          if ((*v15 & 4) == 0)
          {
LABEL_20:
            uint64_t v25 = a2 + 40 * v12;
            size_t v28 = *(void *)(v25 + 24);
            int v27 = (uint64_t *)(v25 + 24);
            size_t v26 = v28;
            if (v28)
            {
              memcpy(v13, *(const void **)(a2 + 40 * v12 + 8), v26);
              uint64_t v29 = *v27;
            }
            else
            {
              uint64_t v29 = 0;
            }
            *(void *)(v11 + 8) = v13;
            *(void *)(v11 + 24) = v29;
            v13[v29] = 0;
            v13 += *v27 + 1;
            goto LABEL_24;
          }
        }
        uint64_t v22 = a2 + 40 * v12;
        *(void *)(v11 + 8) = *(void *)(v22 + 8);
        *(void *)(v11 + 24) = *(void *)(v22 + 24);
LABEL_24:
        v11 += 40;
        if (++v12 == a3) {
          return 0;
        }
      }
    }
    return 4294966395;
  }
  else
  {
    uint64_t result = 0;
    *a1 = 0;
  }
  return result;
}

uint64_t nghttp2_hd_inflate_free(uint64_t *a1)
{
  nghttp2_rcbuf_decref(a1[22]);
  nghttp2_rcbuf_decref(a1[21]);
  a1[21] = 0;
  a1[22] = 0;
  nghttp2_rcbuf_decref(a1[20]);
  nghttp2_rcbuf_decref(a1[19]);

  return hd_context_free(a1);
}

void **nghttp2_bufs_free(void **result)
{
  if (result)
  {
    int v1 = result;
    int v2 = *result;
    if (*result)
    {
      do
      {
        unint64_t v3 = (void *)v1[2];
        uint64_t v4 = (void *)*v2;
        ((void (*)(void, void))v3[2])(v2[1], *v3);
        v2[1] = 0;
        uint64_t result = (void **)((uint64_t (*)(void *, void))v3[2])(v2, *v3);
        int v2 = v4;
      }
      while (v4);
    }
    *int v1 = 0;
  }
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_frame_recv_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 32) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_rfc9113_leading_and_trailing_ws_validation(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x4000u;
  *(_DWORD *)(result + 100) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_auto_window_update(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 1u;
  *(_DWORD *)(result + 72) = a2;
  return result;
}

uint64_t nghttp2_session_resume_data(uint64_t *a1, int a2)
{
  uint64_t v3 = nghttp2_map_find(a1, a2);
  if (!v3) {
    return 4294966795;
  }
  uint64_t v4 = v3;
  char v5 = *(unsigned char *)(v3 + 216);
  if ((v5 & 2) != 0 || *(_DWORD *)(v3 + 204) == 5) {
    return 4294966795;
  }
  uint64_t v7 = *(void *)(v3 + 152);
  uint64_t result = 4294966795;
  if (v7 && (v5 & 0xC) != 0)
  {
    LODWORD(result) = session_resume_deferred_stream_item((uint64_t)a1, v4, 8);
    if ((int)result <= -901) {
      return result;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t nghttp2_session_set_stream_user_data(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = nghttp2_map_find((uint64_t *)a1, a2);
  if (v6 && (*(unsigned char *)(v6 + 216) & 2) == 0 && *(_DWORD *)(v6 + 204) != 5)
  {
    uint64_t v10 = (void *)(v6 + 144);
LABEL_14:
    uint64_t result = 0;
    *uint64_t v10 = a3;
    return result;
  }
  uint64_t result = 4294966795;
  if ((a2 & 1) != 0 && !*(unsigned char *)(a1 + 2932))
  {
    uint64_t v8 = *(void *)(a1 + 304);
    if (v8)
    {
      if (*(unsigned char *)(v8 + 12) != 1) {
        __assert_rtn("nghttp2_session_set_stream_user_data", "nghttp2_session.c", 7910, "frame->hd.type == NGHTTP2_HEADERS");
      }
      if (*(_DWORD *)(v8 + 8) <= a2 && *(_DWORD *)(a1 + 2800) > a2)
      {
        while (1)
        {
          int v9 = *(_DWORD *)(v8 + 8);
          if (v9 >= a2) {
            break;
          }
          uint64_t v8 = *(void *)(v8 + 144);
          if (!v8) {
            return 4294966795;
          }
        }
        if (v9 > a2) {
          return 4294966795;
        }
        uint64_t v10 = (void *)(v8 + 120);
        goto LABEL_14;
      }
    }
  }
  return result;
}

uint64_t nghttp2_session_get_stream_remote_window_size(uint64_t *a1, int a2)
{
  uint64_t v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(unsigned char *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *(_DWORD *)(v2 + 172) & ~(*(int *)(v2 + 172) >> 31);
  }
}

uint64_t nghttp2_session_add_item(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 8);
  uint64_t v5 = nghttp2_map_find((uint64_t *)a1, v4);
  if (!v5 || (*(unsigned char *)(v5 + 216) & 2) != 0)
  {
    uint64_t v6 = 0;
  }
  else if (*(_DWORD *)(v5 + 204) == 5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = v5;
  }
  switch(*(unsigned char *)(a2 + 12))
  {
    case 0:
      if (!v6) {
        return 4294966786;
      }
      if (*(void *)(v6 + 152)) {
        return 4294966767;
      }
      char v18 = *(unsigned char *)(v6 + 216);
      if ((v18 & 0xC) != 0) {
        __assert_rtn("nghttp2_stream_attach_item", "nghttp2_stream.c", 480, "(stream->flags & NGHTTP2_STREAM_FLAG_DEFERRED_ALL) == 0");
      }
      *(void *)(v6 + 152) = a2;
      if ((v18 & 0x10) != 0) {
        goto LABEL_41;
      }
      uint64_t v19 = stream_obq_push(*(void *)(v6 + 96), (uint64_t *)v6);
      if (v19)
      {
        uint64_t v7 = v19;
        *(void *)(v6 + 152) = 0;
      }
      else if ((*(unsigned char *)(v6 + 216) & 0x10) != 0)
      {
LABEL_41:
        uint64_t v7 = session_ob_data_push(a1, v6);
        if (v7) {
          nghttp2_stream_detach_item(v6);
        }
      }
      else
      {
        return 0;
      }
      return v7;
    case 1:
      if (*(_DWORD *)(a2 + 56) && (!v6 || *(_DWORD *)(v6 + 204) != 4)) {
        goto LABEL_30;
      }
      uint64_t v7 = 0;
      uint64_t v11 = (void *)(a1 + 304);
      uint64_t v12 = *(void *)(a1 + 312);
      uint64_t v13 = *(void *)(a1 + 320);
      if (v12) {
        uint64_t v11 = (void *)(v12 + 144);
      }
      *uint64_t v11 = a2;
      *(void *)(a1 + 312) = a2;
      *(void *)(a1 + 320) = v13 + 1;
      goto LABEL_33;
    case 3:
      if (v6) {
        *(_DWORD *)(v6 + 204) = 3;
      }
      goto LABEL_30;
    case 4:
    case 6:
      uint64_t v7 = 0;
      uint64_t v8 = (void *)(a1 + 256);
      uint64_t v9 = *(void *)(a1 + 264);
      uint64_t v10 = *(void *)(a1 + 272);
      if (v9) {
        uint64_t v8 = (void *)(v9 + 144);
      }
      *uint64_t v8 = a2;
      *(void *)(a1 + 264) = a2;
      *(void *)(a1 + 272) = v10 + 1;
      goto LABEL_33;
    case 5:
      int v21 = 0;
      if (!v6) {
        return 4294966786;
      }
      LODWORD(v20) = *(_DWORD *)(v6 + 168);
      HIDWORD(v20) = 16;
      if (!nghttp2_session_open_stream(a1, *(_DWORD *)(a2 + 40), &v20, 4, *(void *)(a2 + 120))) {
        return 4294966395;
      }
LABEL_30:
      uint64_t v7 = 0;
      uint64_t v14 = (void *)(a1 + 280);
      uint64_t v15 = *(void *)(a1 + 288);
      uint64_t v16 = *(void *)(a1 + 296);
      if (v15) {
        uint64_t v14 = (void *)(v15 + 144);
      }
      void *v14 = a2;
      *(void *)(a1 + 288) = a2;
      *(void *)(a1 + 296) = v16 + 1;
LABEL_33:
      *(unsigned char *)(a2 + 152) = 1;
      return v7;
    case 8:
      if (v6)
      {
        *(unsigned char *)(v6 + 219) = 1;
      }
      else if (!v4)
      {
        *(unsigned char *)(a1 + 2934) = 1;
      }
      goto LABEL_30;
    default:
      goto LABEL_30;
  }
}

void nghttp2_session_on_data_received(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a2 + 8));
  if (v4)
  {
    uint64_t v5 = v4;
    if ((*(unsigned char *)(v4 + 216) & 2) == 0)
    {
      int v6 = *(_DWORD *)(v4 + 204);
      if (v6 != 3 && v6 != 5)
      {
        if ((*(unsigned char *)(a1 + 2916) & 4) != 0
          || (*(unsigned char *)(a2 + 13) & 1) == 0
          || (*(unsigned char *)(v4 + 213) & 0x40) == 0
          && ((uint64_t v10 = *(void *)(v4 + 48), v10 == -1) || v10 == *(void *)(v4 + 56)))
        {
          uint64_t v8 = *(unsigned int (**)(uint64_t, uint64_t, void))(a1 + 2376);
          if (!v8 || !v8(a1, a2, *(void *)(a1 + 2608))) && (*(unsigned char *)(a2 + 13))
          {
            char v9 = *(unsigned char *)(v5 + 217);
            *(unsigned char *)(v5 + 217) = v9 | 1;
            if ((v9 & 2) != 0) {
              nghttp2_session_close_stream(a1, *(unsigned int *)(v5 + 168), 0);
            }
          }
        }
        else if ((int)nghttp2_session_add_rst_stream(a1, *(_DWORD *)(v4 + 168), 1) >= -900)
        {
          *(unsigned char *)(v5 + 217) |= 1u;
        }
      }
    }
  }
}

uint64_t nghttp2_session_mem_recv2(uint64_t a1, char *a2, size_t a3)
{
  size_t v3 = a3;
  uint64_t v4 = a2;
  if (!a2)
  {
    if (a3) {
      __assert_rtn("nghttp2_session_mem_recv2", "nghttp2_session.c", 5899, "inlen == 0");
    }
    uint64_t v4 = (char *)&unk_20DB48D08;
  }
  nghttp2_session_adjust_idle_stream(a1);
  if (updated <= -901) {
    return updated;
  }
  if ((*(unsigned char *)(a1 + 2933) & 2) != 0) {
    return v3;
  }
  BOOL v7 = *(void *)(a1 + 16) != *(void *)(a1 + 2736) + *(void *)(a1 + 2728) || (*(unsigned char *)(a1 + 2933) & 0xC) == 0;
  if (!v7) {
    return v3;
  }
  uint64_t v8 = (void *)(a1 + 728);
  char v9 = &v4[v3];
  v365 = (_OWORD *)(a1 + 872);
  uint64_t v368 = 0;
  uint64_t v369 = 0;
  v361 = (int *)(a1 + 2832);
  v362 = (int *)(a1 + 2836);
  v363 = (uint64_t *)(a1 + 920);
  uint64_t v359 = a1 + 792;
  v360 = v4;
LABEL_12:
  while (2)
  {
    int v10 = *(_DWORD *)(a1 + 952);
    switch(v10)
    {
      case 0:
        size_t v86 = *(void *)(a1 + 936);
        if (v3 >= v86) {
          size_t v87 = *(void *)(a1 + 936);
        }
        else {
          size_t v87 = v3;
        }
        if (memcmp(&aPriHttp20Sm[-v86 + 24], v4, v87)) {
          return -903;
        }
        *(void *)(a1 + 936) = v86 - v87;
        v4 += v87;
        if (v86 <= v3)
        {
          session_inbound_frame_reset(a1);
          *(_DWORD *)(a1 + 952) = 1;
        }
        goto LABEL_750;
      case 1:
        v81 = *(char **)(a1 + 864);
        v82 = *(char **)(a1 + 856);
        if (v9 - v4 >= (unint64_t)(v81 - v82)) {
          size_t v83 = v81 - v82;
        }
        else {
          size_t v83 = v9 - v4;
        }
        if (v83)
        {
          memcpy(*(void **)(a1 + 856), v4, v83);
          v82 += v83;
          v81 = *(char **)(a1 + 864);
        }
        *(void *)(a1 + 856) = v82;
        v4 += v83;
        if (v81 != v82) {
          return v4 - v360;
        }
        uint64_t v84 = *(void *)(a1 + 848);
        if (*(unsigned char *)(v84 + 3) != 4 || (*(unsigned char *)(v84 + 4) & 1) != 0)
        {
          int updated = session_call_error_callback(a1, 4294966760, "Remote peer returned unexpected data while we expected SETTINGS frame.  Perhaps, peer does not support HTTP/2 properly.");
          if (updated > -901)
          {
            int v342 = *(_DWORD *)(a1 + 2812);
            v343 = "SETTINGS expected";
            goto LABEL_818;
          }
          return updated;
        }
        *(_DWORD *)(a1 + 952) = 2;
        v85 = v81;
LABEL_158:
        if (v9 - v4 >= (unint64_t)(v81 - v85)) {
          size_t v88 = v81 - v85;
        }
        else {
          size_t v88 = v9 - v4;
        }
        if (v88)
        {
          memcpy(v85, v4, v88);
          v85 += v88;
          v81 = *(char **)(a1 + 864);
        }
        *(void *)(a1 + 856) = v85;
        v4 += v88;
        if (v81 != v85) {
          return v4 - v360;
        }
        uint64_t v89 = *(void *)(a1 + 848);
        unsigned int v90 = bswap32(*(_DWORD *)v89);
        unint64_t v91 = v90 >> 8;
        *(void *)(a1 + 728) = v91;
        unint64_t v92 = *(unsigned __int8 *)(v89 + 3);
        *(unsigned char *)(a1 + 740) = v92;
        unsigned int v93 = *(unsigned __int8 *)(v89 + 4);
        *(unsigned char *)(a1 + 741) = v93;
        unsigned int v94 = *(_DWORD *)(v89 + 5) & 0xFFFFFF7F;
        int v95 = bswap32(v94);
        *(_DWORD *)(a1 + 736) = v95;
        *(unsigned char *)(a1 + 742) = 0;
        *(void *)(a1 + 936) = v91;
        if (v91 > *(_DWORD *)(a1 + 2900))
        {
          int v342 = *(_DWORD *)(a1 + 2812);
          v343 = "too large frame size";
          uint64_t v339 = a1;
          int v340 = 6;
          goto LABEL_819;
        }
        switch((int)v92)
        {
          case 0:
            *(unsigned char *)(a1 + 741) = v93 & 9;
            if (v94)
            {
              BOOL v259 = *(unsigned char *)(a1 + 2932) == 0;
              if ((v95 & 1) == v259) {
                int v260 = *(_DWORD *)(a1 + 2804);
              }
              else {
                int v260 = *(_DWORD *)(a1 + 2808);
              }
              if (v260 >= v95)
              {
                uint64_t v290 = nghttp2_map_find((uint64_t *)a1, v95);
                if (!v290 || (*(unsigned char *)(v290 + 216) & 2) != 0 || (int v291 = *(_DWORD *)(v290 + 204), v291 == 5))
                {
                  uint64_t v292 = nghttp2_map_find((uint64_t *)a1, v95);
                  if (!v292 || (*(unsigned char *)(v292 + 217) & 1) == 0)
                  {
LABEL_621:
                    int v293 = -104;
                    goto LABEL_744;
                  }
                  int v282 = 5;
                  v283 = "DATA: stream closed";
                }
                else if (*(unsigned char *)(v290 + 217))
                {
                  int v282 = 5;
                  v283 = "DATA: stream in half-closed(remote)";
                }
                else if ((v95 ^ v259))
                {
                  if (v291 == 3) {
                    goto LABEL_621;
                  }
                  if (v291 != 4) {
                    goto LABEL_766;
                  }
                  int v282 = 1;
                  v283 = "DATA: stream in reserved";
                }
                else
                {
                  if (v291 == 3) {
                    goto LABEL_621;
                  }
                  if (v291 == 2)
                  {
LABEL_766:
                    int v293 = 0;
                    goto LABEL_744;
                  }
                  int v282 = 1;
                  v283 = "DATA: stream not opened";
                }
              }
              else
              {
                int v282 = 1;
                v283 = "DATA: stream in idle";
              }
            }
            else
            {
              int v282 = 1;
              v283 = "DATA: stream_id == 0";
            }
            int v327 = session_terminate_session(a1, *(_DWORD *)(a1 + 2812), v282, v283);
            if (v327 <= -901) {
              int v293 = v327;
            }
            else {
              int v293 = -104;
            }
LABEL_744:
            if (*(_DWORD *)(a1 + 952) == 15) {
              return v3;
            }
            if (v293 == -104)
            {
LABEL_746:
              int v275 = 14;
              goto LABEL_747;
            }
            if (v293 <= -901) {
              return v293;
            }
            if ((*(unsigned char *)(a1 + 741) & 8) != 0)
            {
              if (!*v8)
              {
                int v342 = *(_DWORD *)(a1 + 2812);
                v343 = "DATA: insufficient padding space";
                goto LABEL_818;
              }
              uint64_t v328 = *(void *)(a1 + 832);
              *(void *)(a1 + 856) = v328;
              *(void *)(a1 + 848) = v328;
              *(void *)(a1 + 864) = v328 + 1;
              int v96 = 1;
              int v269 = 12;
            }
            else
            {
              int v96 = 1;
              int v269 = 13;
            }
            goto LABEL_585;
          case 1:
            *(unsigned char *)(a1 + 741) = v93 & 0x2D;
            if ((v93 & 8) != 0)
            {
              if (v90 <= 0xFF)
              {
                int v342 = *(_DWORD *)(a1 + 2812);
                v343 = "HEADERS: insufficient padding space";
                goto LABEL_818;
              }
              goto LABEL_584;
            }
            if ((v93 & 0x20) == 0)
            {
              v261 = *(unsigned int (**)(uint64_t, void *, void))(a1 + 2504);
              if (v261 && v261(a1, v8, *(void *)(a1 + 2608))) {
                return -902;
              }
              goto LABEL_512;
            }
            if (v91 < 5) {
              goto LABEL_739;
            }
            int v96 = 0;
            *(_DWORD *)(a1 + 952) = 3;
            uint64_t v297 = *(void *)(a1 + 832);
            *(void *)(a1 + 856) = v297;
            *(void *)(a1 + 848) = v297;
            uint64_t v98 = v297 + 5;
            goto LABEL_533;
          case 2:
            *(unsigned char *)(a1 + 741) = 0;
            if (v91 != 5) {
              goto LABEL_739;
            }
            int v96 = 0;
            *(_DWORD *)(a1 + 952) = 3;
            uint64_t v258 = *(void *)(a1 + 832);
            *(void *)(a1 + 856) = v258;
            *(void *)(a1 + 848) = v258;
            uint64_t v98 = v258 + 5;
            goto LABEL_533;
          case 3:
          case 8:
            *(unsigned char *)(a1 + 741) = 0;
            if (v91 == 4) {
              goto LABEL_167;
            }
            goto LABEL_739;
          case 4:
            int v263 = v93 & 1;
            *(unsigned char *)(a1 + 741) = v93 & 1;
            unint64_t v264 = ((v90 >> 8) * (unsigned __int128)0x2AAAAAAAAAAAAAABuLL) >> 64;
            if (-6 * v264 + v91) {
              goto LABEL_739;
            }
            if (v263)
            {
              if (v90 >= 0x100) {
                goto LABEL_739;
              }
              *(_DWORD *)(a1 + 952) = 8;
LABEL_634:
              uint64_t v298 = *(void *)(a1 + 832);
              *(void *)(a1 + 864) = v298;
              *(void *)(a1 + 856) = v298;
              *(void *)(a1 + 848) = v298;
              goto LABEL_635;
            }
            if (*(void *)(a1 + 2752) >= *(void *)(a1 + 2760)) {
              return -904;
            }
            *(_DWORD *)(a1 + 952) = 8;
            if (v90 < 0x100) {
              goto LABEL_634;
            }
            *(void *)(a1 + 928) = v264 + 1;
            if (v264 > *(void *)(a1 + 2776))
            {
              int v342 = *(_DWORD *)(a1 + 2812);
              v343 = "SETTINGS: too many setting entries";
              uint64_t v339 = a1;
              int v340 = 11;
              goto LABEL_819;
            }
            uint64_t v265 = (*(uint64_t (**)(unint64_t, void))(a1 + 2576))(8 * (v264 + 1), *(void *)(a1 + 2568));
            *(void *)(a1 + 824) = v265;
            if (!v265) {
              return -901;
            }
            int v96 = 0;
            *(void *)(v265 + 8 * *(void *)(a1 + 928) - 8) = 0xFFFFFFFF00000001;
            uint64_t v266 = *(void *)(a1 + 832);
            *(void *)(a1 + 856) = v266;
            *(void *)(a1 + 848) = v266;
            *(void *)(a1 + 864) = v266 + 6;
            unsigned int v267 = *(_DWORD *)(a1 + 952);
            if (v267 > 0xF || ((1 << v267) & 0xC0E0) == 0) {
              goto LABEL_586;
            }
            goto LABEL_749;
          case 5:
            *(unsigned char *)(a1 + 741) = v93 & 0xC;
            if ((v93 & 8) != 0)
            {
              if (v90 <= 0xFF)
              {
                int v342 = *(_DWORD *)(a1 + 2812);
                v343 = "PUSH_PROMISE: insufficient padding space";
                goto LABEL_818;
              }
LABEL_584:
              int v96 = 0;
              uint64_t v278 = *(void *)(a1 + 832);
              *(void *)(a1 + 856) = v278;
              *(void *)(a1 + 848) = v278;
              *(void *)(a1 + 864) = v278 + 1;
              int v269 = 3;
              goto LABEL_585;
            }
            if (v90 <= 0x3FF) {
              goto LABEL_739;
            }
LABEL_167:
            int v96 = 0;
            *(_DWORD *)(a1 + 952) = 3;
            uint64_t v97 = *(void *)(a1 + 832);
            *(void *)(a1 + 856) = v97;
            *(void *)(a1 + 848) = v97;
            uint64_t v98 = v97 + 4;
LABEL_533:
            *(void *)(a1 + 864) = v98;
            goto LABEL_586;
          case 6:
            *(unsigned char *)(a1 + 741) = v93 & 1;
            if (v91 != 8) {
              goto LABEL_739;
            }
            goto LABEL_532;
          case 7:
            *(unsigned char *)(a1 + 741) = 0;
            if (v90 <= 0x7FF) {
              goto LABEL_739;
            }
LABEL_532:
            int v96 = 0;
            *(_DWORD *)(a1 + 952) = 3;
            uint64_t v268 = *(void *)(a1 + 832);
            *(void *)(a1 + 856) = v268;
            *(void *)(a1 + 848) = v268;
            uint64_t v98 = v268 + 8;
            goto LABEL_533;
          case 9:
            int v342 = *(_DWORD *)(a1 + 2812);
            v343 = "CONTINUATION: unexpected";
            goto LABEL_818;
          default:
            if ((*(unsigned __int8 *)(a1 + 2935 + (v92 >> 3)) >> (v92 & 7)))
            {
              if (!*(void *)(a1 + 2536)) {
                goto LABEL_684;
              }
              int v96 = 1;
              int v269 = 18;
              goto LABEL_585;
            }
            switch(v92)
            {
              case 0x10:
                if ((*(unsigned char *)(a1 + 2924) & 4) == 0) {
                  goto LABEL_684;
                }
                *(unsigned char *)(a1 + 741) = 0;
                *(void *)(a1 + 744) = v359;
                if (!*(unsigned char *)(a1 + 2932))
                {
                  int v342 = *(_DWORD *)(a1 + 2812);
                  v343 = "PRIORITY_UPDATE is received from server";
LABEL_818:
                  uint64_t v339 = a1;
                  int v340 = 1;
LABEL_819:
                  int v341 = session_terminate_session(v339, v342, v340, v343);
                  if (v341 <= -901) {
                    return v341;
                  }
                  return v3;
                }
                if (v90 <= 0x3FF)
                {
LABEL_739:
                  int v275 = 7;
                  goto LABEL_747;
                }
                if (*(unsigned char *)(a1 + 2930) == 1 && v91 <= 0x20 && !*(unsigned char *)(a1 + 2931))
                {
                  *(_DWORD *)(a1 + 952) = 3;
                  uint64_t v326 = *(void *)(a1 + 832);
                  *(void *)(a1 + 856) = v326;
                  *(void *)(a1 + 848) = v326;
                  uint64_t v285 = v326 + v91;
LABEL_724:
                  *(void *)(a1 + 864) = v285;
LABEL_635:
                  int v96 = 1;
LABEL_586:
                  v279 = *(unsigned int (**)(uint64_t, void *, void))(a1 + 2504);
                  if (v279 && v279(a1, v8, *(void *)(a1 + 2608))) {
                    return -902;
                  }
                  goto LABEL_749;
                }
                break;
              case 0xC:
                if ((*(unsigned char *)(a1 + 2924) & 2) != 0)
                {
                  *(void *)(a1 + 744) = v359;
                  if (!*(unsigned char *)(a1 + 2932) && !v94 && v93 < 0x10)
                  {
                    *(unsigned char *)(a1 + 741) = 0;
                    if (v90 >= 0x100)
                    {
                      uint64_t v332 = (*(uint64_t (**)(void))(a1 + 2576))();
                      *(void *)(a1 + 912) = v332;
                      if (!v332) {
                        return -901;
                      }
                      uint64_t v333 = *(void *)(a1 + 936);
                      *(void *)(a1 + 880) = v332;
                      *(void *)(a1 + 904) = v332;
                      *(void *)(a1 + 896) = v332;
                      *(void *)(a1 + 888) = v332;
                      *(void *)(a1 + 872) = v332;
                      int v96 = 0;
                      if (v333) {
                        *(void *)(a1 + 880) = v332 + v333;
                      }
                    }
                    else
                    {
                      int v96 = 1;
                    }
                    int v269 = 17;
LABEL_585:
                    *(_DWORD *)(a1 + 952) = v269;
                    goto LABEL_586;
                  }
                }
                break;
              case 0xA:
                if ((*(unsigned char *)(a1 + 2924) & 1) == 0) {
                  goto LABEL_684;
                }
                *(unsigned char *)(a1 + 741) = 0;
                *(void *)(a1 + 744) = v359;
                if (*(unsigned char *)(a1 + 2932)) {
                  goto LABEL_684;
                }
                if (v90 <= 0x1FF) {
                  goto LABEL_739;
                }
                *(_DWORD *)(a1 + 952) = 3;
                uint64_t v284 = *(void *)(a1 + 832);
                *(void *)(a1 + 856) = v284;
                *(void *)(a1 + 848) = v284;
                uint64_t v285 = v284 + 2;
                goto LABEL_724;
              default:
                goto LABEL_684;
            }
            break;
        }
        goto LABEL_684;
      case 2:
        v81 = *(char **)(a1 + 864);
        v85 = *(char **)(a1 + 856);
        goto LABEL_158;
      case 3:
        uint64_t v99 = *(void *)(a1 + 864);
        uint64_t v100 = *(void *)(a1 + 856);
        if (v9 - v4 >= (unint64_t)(v99 - v100)) {
          size_t v101 = v99 - v100;
        }
        else {
          size_t v101 = v9 - v4;
        }
        if (v101)
        {
          memcpy(*(void **)(a1 + 856), v4, v101);
          v100 += v101;
          uint64_t v99 = *(void *)(a1 + 864);
        }
        *(void *)(a1 + 856) = v100;
        v4 += v101;
        unint64_t v102 = *(void *)(a1 + 936) - v101;
        *(void *)(a1 + 936) = v102;
        if (v99 != v100) {
          return v4 - v360;
        }
        switch(*(unsigned char *)(a1 + 740))
        {
          case 1:
            if (*(void *)(a1 + 944)) {
              goto LABEL_512;
            }
            char v103 = *(unsigned char *)(a1 + 741);
            if ((v103 & 8) == 0) {
              goto LABEL_512;
            }
            unint64_t v104 = 5;
            if ((*(unsigned char *)(a1 + 741) & 0x20) == 0) {
              unint64_t v104 = 0;
            }
            unint64_t v105 = **(unsigned __int8 **)(a1 + 848);
            if (v102 < v105 || (unint64_t v106 = v105 + 1, *(void *)(a1 + 944) = v106, v106 + v104 > v102 + 1))
            {
              int v342 = *(_DWORD *)(a1 + 2812);
              v343 = "HEADERS: invalid padding";
              goto LABEL_818;
            }
            *(void *)(a1 + 744) = v106;
            if ((v103 & 0x20) == 0)
            {
              uint64_t v107 = *(void *)(a1 + 832);
              *(void *)(a1 + 864) = v107;
              *(void *)(a1 + 856) = v107;
              *(void *)(a1 + 848) = v107;
LABEL_512:
              int updated = session_process_headers_frame(a1);
              if (updated <= -901) {
                return updated;
              }
              if (*(_DWORD *)(a1 + 952) == 15) {
                return v3;
              }
              if (updated == -103) {
                goto LABEL_577;
              }
              if (updated == -521)
              {
                int v262 = *(_DWORD *)(a1 + 736);
LABEL_576:
                int updated = nghttp2_session_add_rst_stream(a1, v262, 2);
                if (updated <= -901) {
                  return updated;
                }
LABEL_577:
                *(_DWORD *)(a1 + 952) = 5;
                goto LABEL_748;
              }
LABEL_608:
              int v275 = 4;
              goto LABEL_747;
            }
            if (v102 < v104) {
              goto LABEL_739;
            }
            *(_DWORD *)(a1 + 952) = 3;
            uint64_t v329 = *(void *)(a1 + 832);
            *(void *)(a1 + 856) = v329;
            *(void *)(a1 + 848) = v329;
            uint64_t v315 = v329 + v104;
            break;
          case 2:
            if (*(unsigned char *)(a1 + 2930) == 1 && !*(unsigned char *)(a1 + 2931) || *(_DWORD *)(a1 + 2880) == 1) {
              goto LABEL_710;
            }
            session_process_priority_frame(a1);
            goto LABEL_708;
          case 3:
            session_process_rst_stream_frame(a1);
            goto LABEL_708;
          case 5:
            if (!*(void *)(a1 + 944) && (*(unsigned char *)(a1 + 741) & 8) != 0)
            {
              unint64_t v324 = **(unsigned __int8 **)(a1 + 848);
              if (v102 < v324 || (*(void *)(a1 + 944) = v324 + 1, v324 + 5 > v102 + 1))
              {
                int v342 = *(_DWORD *)(a1 + 2812);
                v343 = "PUSH_PROMISE: invalid padding";
                goto LABEL_818;
              }
              *(void *)(a1 + 744) = v324 + 1;
              if (v102 > 3)
              {
                *(_DWORD *)(a1 + 952) = 3;
                uint64_t v325 = *(void *)(a1 + 832);
                *(void *)(a1 + 856) = v325;
                *(void *)(a1 + 848) = v325;
                uint64_t v315 = v325 + 4;
                goto LABEL_697;
              }
              goto LABEL_739;
            }
            int updated = session_process_push_promise_frame(a1);
            if (updated <= -901) {
              return updated;
            }
            if (*(_DWORD *)(a1 + 952) == 15) {
              return v3;
            }
            if (updated == -103) {
              goto LABEL_577;
            }
            if (updated != -521) {
              goto LABEL_608;
            }
            int v262 = *(_DWORD *)(a1 + 768);
            goto LABEL_576;
          case 6:
            int updated = session_process_ping_frame(a1);
            goto LABEL_708;
          case 7:
            uint64_t v273 = *v8 - 8;
            if (*v8 == 8) {
              goto LABEL_561;
            }
            uint64_t v274 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(*v8 - 8, *(void *)(a1 + 2568));
            *(void *)(a1 + 912) = v274;
            if (!v274) {
              return -901;
            }
            *(void *)(a1 + 904) = v274;
            *(void *)(a1 + 896) = v274;
            *(void *)(a1 + 888) = v274;
            *(void *)(a1 + 872) = v274;
            *(void *)(a1 + 880) = v274 + v273;
LABEL_561:
            int v275 = 9;
            goto LABEL_747;
          case 8:
            int updated = session_process_window_update_frame(a1);
            goto LABEL_708;
          case 0xA:
            if (v102 < bswap32(**(unsigned __int16 **)(a1 + 848)) >> 16) {
              goto LABEL_739;
            }
            if (*v8 < 3uLL) {
              goto LABEL_568;
            }
            uint64_t v276 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(*v8 - 2, *(void *)(a1 + 2568));
            *(void *)(a1 + 912) = v276;
            if (!v276) {
              return -901;
            }
            uint64_t v277 = *(void *)(a1 + 728);
            *(void *)(a1 + 880) = v276;
            *(void *)(a1 + 904) = v276;
            *(void *)(a1 + 896) = v276;
            *(void *)(a1 + 888) = v276;
            *(void *)(a1 + 872) = v276;
            if (v277) {
              *(void *)(a1 + 880) = v276 + v277;
            }
LABEL_568:
            int v275 = 16;
            goto LABEL_747;
          case 0x10:
            int updated = session_process_priority_update_frame(a1);
            if (updated <= -901) {
              return updated;
            }
            goto LABEL_710;
          default:
            goto LABEL_710;
        }
        goto LABEL_697;
      case 4:
      case 5:
        unint64_t v11 = *(void *)(a1 + 936);
        if (v9 - v4 >= v11) {
          unint64_t v12 = *(void *)(a1 + 936);
        }
        else {
          unint64_t v12 = v9 - v4;
        }
        unint64_t v13 = v11 - v12;
        uint64_t v14 = *(void *)(a1 + 944);
        unint64_t v15 = *(unsigned __int8 *)(a1 + 741);
        if (v14) {
          unint64_t v16 = v14 - ((v15 >> 3) & 1);
        }
        else {
          unint64_t v16 = 0;
        }
        uint64_t v17 = v11 - v16;
        if (v12 < v16 - v13) {
          uint64_t v17 = -1;
        }
        if (v16 <= v13) {
          uint64_t v17 = v12;
        }
        if (v17 == -1) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = v17;
        }
        unsigned int v19 = (v11 - v18 == v16) & (v15 >> 2);
        int v367 = v19;
        if (v18) {
          unsigned int v19 = 0;
        }
        if (v18 <= 0 && v19 == 0)
        {
          v4 += v12;
          *(void *)(a1 + 936) = v13;
          if (v13) {
            goto LABEL_750;
          }
LABEL_191:
          char v112 = *(unsigned char *)(a1 + 741);
          if ((v112 & 4) == 0)
          {
            uint64_t v113 = *(void *)(a1 + 832);
            *(void *)(a1 + 856) = v113;
            *(void *)(a1 + 848) = v113;
            *(void *)(a1 + 864) = v113 + 9;
            *(void *)(a1 + 944) = 0;
            if (v10 == 4) {
              int v114 = 10;
            }
            else {
              int v114 = 11;
            }
            *(_DWORD *)(a1 + 952) = v114;
            goto LABEL_750;
          }
          if (v10 != 4) {
            goto LABEL_797;
          }
          uint64_t v245 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
          if (!v245) {
            goto LABEL_797;
          }
          uint64_t v246 = v245;
          if ((*(unsigned char *)(v245 + 216) & 2) != 0) {
            goto LABEL_797;
          }
          int v247 = *(_DWORD *)(v245 + 204);
          if (v247 == 3 || v247 == 5) {
            goto LABEL_797;
          }
          if ((*(unsigned char *)(a1 + 2916) & 4) != 0) {
            goto LABEL_785;
          }
          int v248 = *(unsigned __int8 *)(a1 + 740);
          if (v248 == 5)
          {
            uint64_t v249 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 768));
            if (!v249
              || (*(unsigned char *)(v249 + 216) & 2) != 0
              || *(_DWORD *)(v249 + 204) == 5
              || !nghttp2_http_on_request_headers(v249, (uint64_t)v8))
            {
              goto LABEL_785;
            }
LABEL_778:
            uint64_t v334 = 736;
            if (*(unsigned char *)(a1 + 740) == 5) {
              uint64_t v334 = 768;
            }
            int updated = session_handle_invalid_stream2(a1, *(_DWORD *)(a1 + v334), (uint64_t)v8, 4294966764);
            if (updated < -900) {
              return updated;
            }
            if (*(unsigned char *)(a1 + 740) == 1 && (*(unsigned char *)(a1 + 741) & 1) != 0) {
              *(unsigned char *)(v246 + 217) |= 1u;
            }
            goto LABEL_797;
          }
          if (v248 != 1) {
            __assert_rtn("session_after_header_block_received", "nghttp2_session.c", 4146, "frame->hd.type == NGHTTP2_HEADERS");
          }
          int v330 = *(_DWORD *)(a1 + 784);
          if ((v330 - 1) >= 2)
          {
            if (v330 != 3)
            {
              if (v330) {
                __assert_rtn("session_after_header_block_received", "nghttp2_session.c", 4164, "0");
              }
              int v331 = nghttp2_http_on_request_headers(v245, (uint64_t)v8);
              goto LABEL_777;
            }
            if ((*(unsigned char *)(v245 + 213) & 0x40) == 0)
            {
              int v331 = (v112 & 1) - 1;
              goto LABEL_777;
            }
            if (*(unsigned char *)(a1 + 2932)) {
              __assert_rtn("session_after_header_block_received", "nghttp2_session.c", 4157, "!session->server");
            }
          }
          int v331 = nghttp2_http_on_response_headers(v245);
LABEL_777:
          if (v331) {
            goto LABEL_778;
          }
          if (*(unsigned char *)(a1 + 741))
          {
            if ((*(unsigned char *)(v246 + 213) & 0x40) != 0) {
              goto LABEL_778;
            }
            uint64_t v338 = *(void *)(v246 + 48);
            if (v338 != -1 && v338 != *(void *)(v246 + 56)) {
              goto LABEL_778;
            }
          }
LABEL_785:
          v335 = *(unsigned int (**)(uint64_t, void *, void))(a1 + 2376);
          if (v335 && v335(a1, v8, *(void *)(a1 + 2608))) {
            return -902;
          }
          if (*(unsigned char *)(a1 + 740) == 1)
          {
            if (*(unsigned char *)(a1 + 2932))
            {
              if ((*(unsigned char *)(a1 + 2916) & 4) == 0
                && !*(_DWORD *)(a1 + 784)
                && (*(unsigned char *)(v246 + 216) & 0x30) == 0x10
                && (*(unsigned char *)(v246 + 214) & 1) != 0)
              {
                int v336 = session_update_stream_priority(a1, v246, *(unsigned __int8 *)(v246 + 221));
                if (v336)
                {
                  if (v336 >= -900) {
                    __assert_rtn("session_end_stream_headers_received", "nghttp2_session.c", 4106, "nghttp2_is_fatal(rv)");
                  }
                  return -901;
                }
              }
            }
            if (*(unsigned char *)(a1 + 741))
            {
              char v337 = *(unsigned char *)(v246 + 217);
              *(unsigned char *)(v246 + 217) = v337 | 1;
              if ((v337 & 2) != 0)
              {
                nghttp2_session_close_stream(a1, *(unsigned int *)(v246 + 168), 0);
                if (updated <= -901) {
                  return updated;
                }
              }
            }
          }
LABEL_797:
          session_inbound_frame_reset(a1);
          *(void *)(a1 + 2792) = 0;
          goto LABEL_750;
        }
        unint64_t v358 = v12;
        uint64_t v21 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
        if (!v21 || (*(unsigned char *)(v21 + 216) & 2) != 0)
        {
          uint64_t v22 = 0;
        }
        else if (*(_DWORD *)(v21 + 204) == 5)
        {
          uint64_t v22 = 0;
        }
        else
        {
          uint64_t v22 = v21;
        }
        int v115 = *(unsigned __int8 *)(a1 + 740);
        v364 = v9;
        if (v115 == 5)
        {
          uint64_t v116 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 768));
          if (!v116 || (*(unsigned char *)(v116 + 216) & 2) != 0)
          {
            uint64_t v366 = 0;
            BOOL v357 = 0;
          }
          else
          {
            BOOL v357 = 0;
            if (*(_DWORD *)(v116 + 204) == 5) {
              uint64_t v117 = 0;
            }
            else {
              uint64_t v117 = v116;
            }
            uint64_t v366 = v117;
          }
        }
        else
        {
          BOOL v118 = 0;
          if (v22 && v115 == 1)
          {
            int v119 = *(_DWORD *)(a1 + 784);
            BOOL v120 = *(unsigned char *)(a1 + 2932) && v119 == 3;
            BOOL v118 = v120;
            if (!*(unsigned char *)(a1 + 2932) && v119 == 3) {
              BOOL v118 = (*(unsigned char *)(v22 + 213) & 0x40) == 0;
            }
          }
          BOOL v357 = v118;
          uint64_t v366 = v22;
        }
        uint64_t v147 = 0;
        uint64_t v370 = 0;
        uint64_t v371 = 0;
        v148 = (unsigned __int8 *)v4;
        uint64_t v372 = 0;
        break;
      case 6:
        unint64_t v45 = v9 - v4;
        unint64_t v46 = *(void *)(a1 + 936);
        if (v9 - v4 >= v46) {
          uint64_t v47 = *(void *)(a1 + 936);
        }
        else {
          uint64_t v47 = v9 - v4;
        }
        *(void *)(a1 + 936) = v46 - v47;
        v4 += v47;
        if (v46 > v45) {
          goto LABEL_750;
        }
        unsigned int v48 = *(unsigned __int8 *)(a1 + 740);
        BOOL v227 = v48 > 9;
        int v49 = (1 << v48) & 0x222;
        if (!v227 && v49 != 0) {
          *(unsigned char *)(a1 + 2164) = 1;
        }
        goto LABEL_710;
      case 7:
        int updated = session_terminate_session(a1, *(_DWORD *)(a1 + 2812), 6, 0);
        if (updated <= -901) {
          return updated;
        }
        if (*(_DWORD *)(a1 + 952) != 15) {
          __assert_rtn("nghttp2_session_mem_recv2", "nghttp2_session.c", 6898, "iframe->state == NGHTTP2_IB_IGN_ALL");
        }
        return v3;
      case 8:
        uint64_t v68 = *(void *)(a1 + 864);
        uint64_t v69 = *(void *)(a1 + 856);
        if (v9 - v4 >= (unint64_t)(v68 - v69)) {
          size_t v70 = v68 - v69;
        }
        else {
          size_t v70 = v9 - v4;
        }
        if (v70)
        {
          memcpy(*(void **)(a1 + 856), v4, v70);
          uint64_t v71 = *(void *)(a1 + 864);
          *(void *)(a1 + 856) = v69 + v70;
          *(void *)(a1 + 936) -= v70;
          v4 += v70;
          if (v71 != v69 + v70) {
            goto LABEL_750;
          }
          v72 = *(unsigned __int16 **)(a1 + 848);
          unsigned int v73 = *v72;
          uint64_t v74 = __rev16(v73);
          uint64_t v75 = bswap32(*(_DWORD *)(v72 + 1));
          if ((v74 - 1) >= 6 && (v74 - 8) >= 2)
          {
            uint64_t v312 = *(void *)(a1 + 824);
            uint64_t v313 = *(void *)(a1 + 920);
            *(void *)(a1 + 920) = v313 + 1;
            *(void *)(v312 + 8 * v313) = v74 | (v75 << 32);
          }
          else
          {
            uint64_t v76 = *(void *)(a1 + 920);
            uint64_t v77 = *(void *)(a1 + 824);
            uint64_t v78 = 0;
            if (!v76) {
              goto LABEL_604;
            }
            v79 = *(int **)(a1 + 824);
            while (1)
            {
              int v80 = *v79;
              v79 += 2;
              if (v80 == v74) {
                break;
              }
              if (v76 == ++v78)
              {
                uint64_t v78 = *(void *)(a1 + 920);
                goto LABEL_604;
              }
            }
            *(void *)(v77 + 8 * v78) = v74 | (v75 << 32);
            if (v78 == *v363)
            {
              uint64_t v77 = *(void *)(a1 + 824);
LABEL_604:
              uint64_t *v363 = v78 + 1;
              *(void *)(v77 + 8 * v78) = v74 | (v75 << 32);
            }
            if (v73 == 256)
            {
              uint64_t v286 = *(void *)(a1 + 824) + 8 * *(void *)(a1 + 928);
              unsigned int v288 = *(_DWORD *)(v286 - 4);
              v287 = (_DWORD *)(v286 - 4);
              if (v75 < v288) {
                _DWORD *v287 = v75;
              }
            }
          }
          uint64_t v137 = *(void *)(a1 + 936);
          goto LABEL_695;
        }
        *(void *)(a1 + 856) = v69;
        uint64_t v137 = *(void *)(a1 + 936);
        *(void *)(a1 + 936) = v137;
        if (v68 != v69) {
          goto LABEL_750;
        }
LABEL_695:
        if (v137)
        {
          uint64_t v314 = *(void *)(a1 + 832);
          *(void *)(a1 + 856) = v314;
          *(void *)(a1 + 848) = v314;
          uint64_t v315 = v314 + 6;
LABEL_697:
          *(void *)(a1 + 864) = v315;
          goto LABEL_750;
        }
        uint64_t v316 = *(void *)(a1 + 928);
        uint64_t v317 = *(void *)(a1 + 824);
        if (v316)
        {
          uint64_t v318 = *(void *)(v317 + 8 * v316 - 8);
          if (HIDWORD(v318) != -1)
          {
            uint64_t v319 = *v363;
            if (!*v363) {
LABEL_841:
            }
              __assert_rtn("session_process_settings_frame", "nghttp2_session.c", 5015, "i < iframe->niv");
            uint64_t v320 = 0;
            v321 = *(int **)(a1 + 824);
            while (1)
            {
              int v322 = *v321;
              v321 += 2;
              if (v322 == 1) {
                break;
              }
              if (v319 == ++v320) {
                goto LABEL_841;
              }
            }
            if (HIDWORD(v318) != *(_DWORD *)(v317 + 8 * v320 + 4))
            {
              *(void *)(a1 + 920) = v319 + 1;
              *(void *)(v317 + 8 * v319) = *(void *)(v317 + 8 * v320);
              uint64_t v317 = *(void *)(a1 + 824);
              *(void *)(v317 + 8 * v320) = v318;
            }
          }
        }
        uint64_t v323 = *(void *)(a1 + 920);
        *(void *)(a1 + 752) = v317;
        *(void *)(a1 + 744) = v323;
        *(void *)(a1 + 824) = 0;
        uint64_t *v363 = 0;
        *(void *)(a1 + 928) = 0;
        int updated = nghttp2_session_on_settings_received(a1, (uint64_t)v8, 0);
LABEL_708:
        if (updated <= -901) {
          return updated;
        }
        if (*(_DWORD *)(a1 + 952) == 15) {
          return v3;
        }
        goto LABEL_710;
      case 9:
        size_t v62 = *(void *)(a1 + 936);
        if (v9 - v4 >= v62) {
          size_t v63 = *(void *)(a1 + 936);
        }
        else {
          size_t v63 = v9 - v4;
        }
        if (v63)
        {
          v64 = *(char **)(a1 + 896);
          memcpy(v64, v4, v63);
          *(void *)(a1 + 896) = &v64[v63];
          size_t v62 = *(void *)(a1 + 936) - v63;
          *(void *)(a1 + 936) = v62;
          v4 += v63;
        }
        if (v62)
        {
          if (*(void *)(a1 + 880) == *(void *)(a1 + 896)) {
            __assert_rtn("nghttp2_session_mem_recv2", "nghttp2_session.c", 6952, "nghttp2_buf_avail(&iframe->lbuf) > 0");
          }
          goto LABEL_750;
        }
        v121 = *(_DWORD **)(a1 + 848);
        uint64_t v122 = *(void *)(a1 + 888);
        uint64_t v123 = *(void *)(a1 + 896) - v122;
        *(_DWORD *)(a1 + 744) = bswap32(*v121 & 0xFFFFFF7F);
        *(_DWORD *)(a1 + 748) = bswap32(v121[1]);
        *(void *)(a1 + 752) = v122;
        *(void *)(a1 + 760) = v123;
        *(void *)(a1 + 904) = 0;
        _OWORD *v365 = 0u;
        *(_OWORD *)(a1 + 888) = 0u;
        if (*(_DWORD *)(a1 + 736))
        {
          uint64_t v124 = a1;
          uint64_t v125 = (uint64_t)v8;
          v126 = "GOAWAY: stream_id != 0";
LABEL_542:
          int updated = session_handle_invalid_connection(v124, v125, 4294966791, v126);
          goto LABEL_708;
        }
        int v270 = *(_DWORD *)(a1 + 744);
        if (v270 >= 1 && ((v270 ^ (*(unsigned char *)(a1 + 2932) == 0)) & 1) != 0 || *(_DWORD *)(a1 + 2824) < v270)
        {
          uint64_t v124 = a1;
          uint64_t v125 = (uint64_t)v8;
          v126 = "GOAWAY: invalid last_stream_id";
          goto LABEL_542;
        }
        *(unsigned char *)(a1 + 2933) |= 8u;
        *(_DWORD *)(a1 + 2824) = v270;
        v296 = *(unsigned int (**)(uint64_t, void *, void))(a1 + 2376);
        if (v296)
        {
          if (v296(a1, v8, *(void *)(a1 + 2608))) {
            return -902;
          }
          int v270 = *(_DWORD *)(a1 + 744);
        }
        session_close_stream_on_goaway(a1, v270, 0);
        goto LABEL_708;
      case 10:
      case 11:
        unint64_t v23 = *(void *)(a1 + 2792) + 1;
        *(void *)(a1 + 2792) = v23;
        if (v23 > *(void *)(a1 + 2784)) {
          return -905;
        }
        uint64_t v24 = *(void *)(a1 + 864);
        uint64_t v25 = *(void *)(a1 + 856);
        if (v9 - v4 >= (unint64_t)(v24 - v25)) {
          size_t v26 = v24 - v25;
        }
        else {
          size_t v26 = v9 - v4;
        }
        if (v26)
        {
          memcpy(*(void **)(a1 + 856), v4, v26);
          v25 += v26;
          uint64_t v24 = *(void *)(a1 + 864);
        }
        *(void *)(a1 + 856) = v25;
        v4 += v26;
        if (v24 != v25) {
          return v4 - v360;
        }
        uint64_t v27 = *(void *)(a1 + 848);
        uint64_t v28 = bswap32(*(_DWORD *)v27) >> 8;
        uint64_t v368 = v28;
        BYTE4(v369) = *(unsigned char *)(v27 + 3);
        int v29 = BYTE4(v369);
        unsigned __int8 v30 = *(unsigned char *)(v27 + 4);
        *(_WORD *)((char *)&v369 + 5) = v30;
        unsigned int v31 = bswap32(*(_DWORD *)(v27 + 5) & 0xFFFFFF7F);
        LODWORD(v369) = v31;
        *(void *)(a1 + 936) = v28;
        if (v29 != 9 || v31 != *(_DWORD *)(a1 + 736))
        {
          int v342 = *(_DWORD *)(a1 + 2812);
          v343 = "unexpected non-CONTINUATION frame or stream_id is invalid";
          goto LABEL_818;
        }
        *(unsigned char *)(a1 + 741) |= v30 & 4;
        *(void *)(a1 + 728) += v28;
        if (*(_DWORD *)(a1 + 952) != 10) {
          goto LABEL_577;
        }
        *(_DWORD *)(a1 + 952) = 4;
        uint64_t v32 = *(unsigned int (**)(uint64_t, uint64_t *, void))(a1 + 2504);
        if (v32 && v32(a1, &v368, *(void *)(a1 + 2608))) {
          return -902;
        }
        goto LABEL_748;
      case 12:
        uint64_t v51 = *(void *)(a1 + 864);
        uint64_t v52 = *(void *)(a1 + 856);
        if (v9 - v4 >= (unint64_t)(v51 - v52)) {
          size_t v53 = v51 - v52;
        }
        else {
          size_t v53 = v9 - v4;
        }
        if (v53)
        {
          memcpy(*(void **)(a1 + 856), v4, v53);
          v52 += v53;
          uint64_t v51 = *(void *)(a1 + 864);
        }
        *(void *)(a1 + 856) = v52;
        v4 += v53;
        *(void *)(a1 + 936) -= v53;
        if (v51 != v52) {
          return v4 - v360;
        }
        int updated = nghttp2_session_update_recv_connection_window_size(a1, v53);
        if (updated <= -901) {
          return updated;
        }
        if (*(_DWORD *)(a1 + 952) == 15) {
          return v3;
        }
        int updated = nghttp2_session_consume(a1, *(_DWORD *)(a1 + 736), v53);
        if (updated <= -901) {
          return updated;
        }
        if (*(_DWORD *)(a1 + 952) == 15) {
          return v3;
        }
        uint64_t v54 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
        if (v54 && (*(unsigned char *)(v54 + 216) & 2) == 0 && *(_DWORD *)(v54 + 204) != 5)
        {
          BOOL v55 = *(void *)(a1 + 936) || (*(unsigned char *)(a1 + 741) & 1) == 0;
          int updated = nghttp2_session_update_recv_stream_window_size(a1, v54, v53, v55);
          if (updated <= -901) {
            return updated;
          }
        }
        unint64_t v294 = **(unsigned __int8 **)(a1 + 848);
        if (*(void *)(a1 + 936) < v294)
        {
          int v342 = *(_DWORD *)(a1 + 2812);
          v343 = "DATA: invalid padding";
          goto LABEL_818;
        }
        unint64_t v295 = v294 + 1;
        *(void *)(a1 + 944) = v295;
        *(void *)(a1 + 744) = v295;
        int v275 = 13;
        goto LABEL_747;
      case 13:
        uint64_t v56 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
        if (!v56) {
          goto LABEL_746;
        }
        uint64_t v57 = v56;
        if ((*(unsigned char *)(v56 + 216) & 2) != 0 || *(_DWORD *)(v56 + 204) == 5) {
          goto LABEL_746;
        }
        unint64_t v58 = *(void *)(a1 + 936);
        if (v9 - v4 >= v58) {
          unint64_t v59 = *(void *)(a1 + 936);
        }
        else {
          unint64_t v59 = v9 - v4;
        }
        unint64_t v60 = v58 - v59;
        *(void *)(a1 + 936) = v58 - v59;
        if (!v59) {
          goto LABEL_668;
        }
        int updated = nghttp2_session_update_recv_connection_window_size(a1, v59);
        if (updated <= -901) {
          return updated;
        }
        if (*(_DWORD *)(a1 + 952) == 15) {
          return v3;
        }
        if (*(void *)(a1 + 936)) {
          BOOL v61 = 1;
        }
        else {
          BOOL v61 = (*(unsigned char *)(a1 + 741) & 1) == 0;
        }
        int updated = nghttp2_session_update_recv_stream_window_size(a1, v57, v59, v61);
        if (updated <= -901) {
          return updated;
        }
        unint64_t v299 = *(void *)(a1 + 944);
        if (v299) {
          v299 -= ((unint64_t)*(unsigned __int8 *)(a1 + 741) >> 3) & 1;
        }
        unint64_t v300 = *(void *)(a1 + 936);
        uint64_t v301 = v59 - (v299 - v300);
        if (v59 < v299 - v300) {
          uint64_t v301 = -1;
        }
        if (v299 <= v300) {
          uint64_t v302 = v59;
        }
        else {
          uint64_t v302 = v301;
        }
        if (v302 == -1) {
          uint64_t v303 = 0;
        }
        else {
          uint64_t v303 = v302;
        }
        if ((uint64_t)(v59 - v303) < 1) {
          goto LABEL_654;
        }
        int updated = nghttp2_session_consume(a1, *(_DWORD *)(a1 + 736), v59 - v303);
        if (updated <= -901) {
          return updated;
        }
        if (*(_DWORD *)(a1 + 952) == 15) {
          return v3;
        }
LABEL_654:
        if (v303 < 1) {
          goto LABEL_667;
        }
        int v304 = *(_DWORD *)(a1 + 2916);
        if ((v304 & 4) != 0
          || (uint64_t v305 = *(void *)(v57 + 56) + v303, *(void *)(v57 + 56) = v305, (*(unsigned char *)(v57 + 213) & 0x40) == 0)
          && ((uint64_t v306 = *(void *)(v57 + 48), v306 == -1) || v305 <= v306))
        {
          v308 = *(uint64_t (**)(uint64_t, void, void, char *, uint64_t, void))(a1 + 2392);
          if (v308)
          {
            int v309 = v308(a1, *(unsigned __int8 *)(a1 + 741), *(unsigned int *)(a1 + 736), v4, v303, *(void *)(a1 + 2608));
            if (v309 == -526) {
              return &v4[v59] - v360;
            }
            if (v309 < -900) {
              return -902;
            }
          }
LABEL_667:
          unint64_t v60 = *(void *)(a1 + 936);
LABEL_668:
          if (!v60)
          {
            nghttp2_session_on_data_received(a1, (uint64_t)v8);
            if (updated <= -901) {
              return updated;
            }
            session_inbound_frame_reset(a1);
          }
          int v307 = 0;
        }
        else
        {
          if (v304)
          {
            int updated = session_update_consumed_size(a1, v362, v361, *(unsigned __int8 *)(a1 + 2934), 0, v303, *(_DWORD *)(a1 + 2844));
            if (updated <= -901) {
              return updated;
            }
            if (*(_DWORD *)(a1 + 952) == 14) {
              return v3;
            }
          }
          int updated = nghttp2_session_add_rst_stream(a1, *(_DWORD *)(a1 + 736), 1);
          if (updated <= -901) {
            return updated;
          }
          *(_DWORD *)(a1 + 952) = 14;
          int v307 = 1;
        }
        v4 += v59;
        if (v307) {
          continue;
        }
        goto LABEL_750;
      case 14:
        unint64_t v42 = *(void *)(a1 + 936);
        if (v9 - v4 >= v42) {
          uint64_t v43 = *(void *)(a1 + 936);
        }
        else {
          uint64_t v43 = v9 - v4;
        }
        unint64_t v44 = v42 - v43;
        *(void *)(a1 + 936) = v42 - v43;
        if (!v43) {
          goto LABEL_77;
        }
        int updated = nghttp2_session_update_recv_connection_window_size(a1, v43);
        if (updated <= -901) {
          return updated;
        }
        if (*(_DWORD *)(a1 + 952) == 15) {
          return v3;
        }
        if ((*(unsigned char *)(a1 + 2916) & 1) == 0) {
          goto LABEL_76;
        }
        int updated = session_update_consumed_size(a1, v362, v361, *(unsigned __int8 *)(a1 + 2934), 0, v43, *(_DWORD *)(a1 + 2844));
        if (updated <= -901) {
          return updated;
        }
        if (*(_DWORD *)(a1 + 952) == 15) {
          return v3;
        }
LABEL_76:
        unint64_t v44 = *(void *)(a1 + 936);
LABEL_77:
        v4 += v43;
        if (!v44) {
          goto LABEL_710;
        }
        goto LABEL_750;
      case 15:
        return v3;
      case 16:
        size_t v65 = *(void *)(a1 + 936);
        if (v9 - v4 >= v65) {
          size_t v66 = *(void *)(a1 + 936);
        }
        else {
          size_t v66 = v9 - v4;
        }
        if (v66)
        {
          uint64_t v67 = *(char **)(a1 + 896);
          memcpy(v67, v4, v66);
          *(void *)(a1 + 896) = &v67[v66];
          size_t v65 = *(void *)(a1 + 936) - v66;
          *(void *)(a1 + 936) = v65;
          v4 += v66;
        }
        if (v65)
        {
          if (*(void *)(a1 + 880) == *(void *)(a1 + 896)) {
            __assert_rtn("nghttp2_session_mem_recv2", "nghttp2_session.c", 7318, "nghttp2_buf_avail(&iframe->lbuf) > 0");
          }
          goto LABEL_750;
        }
        uint64_t v127 = bswap32(**(unsigned __int16 **)(a1 + 848)) >> 16;
        uint64_t v128 = *(void *)(a1 + 888);
        uint64_t v129 = *(void *)(a1 + 896);
        v130 = *(void **)(a1 + 744);
        void *v130 = v128;
        v130[1] = v127;
        v130[2] = v128 + v127;
        v130[3] = v129 - (v128 + v127);
        _OWORD *v365 = 0u;
        *(_OWORD *)(a1 + 888) = 0u;
        *(void *)(a1 + 904) = 0;
        uint64_t v131 = *(void *)(a1 + 744);
        int v132 = *(_DWORD *)(a1 + 736);
        uint64_t v133 = *(void *)(v131 + 8);
        if (v132)
        {
          if (v133) {
            goto LABEL_548;
          }
          uint64_t v134 = nghttp2_map_find((uint64_t *)a1, v132);
          if (!v134 || (*(unsigned char *)(v134 + 216) & 2) != 0) {
            goto LABEL_710;
          }
          int v135 = *(_DWORD *)(v134 + 204);
          if (v135 == 3 || v135 == 5) {
            goto LABEL_710;
          }
        }
        else if (!v133)
        {
          goto LABEL_548;
        }
        if (*(void *)(v131 + 24))
        {
          v271 = *(unsigned int (**)(uint64_t, void *, void))(a1 + 2376);
          if (v271 && v271(a1, v8, *(void *)(a1 + 2608))) {
            return -902;
          }
          goto LABEL_710;
        }
LABEL_548:
        v272 = *(unsigned int (**)(uint64_t, void *, uint64_t, void))(a1 + 2384);
        if (v272 && v272(a1, v8, 4294966791, *(void *)(a1 + 2608))) {
          return -902;
        }
        goto LABEL_710;
      case 17:
        size_t v108 = *(void *)(a1 + 936);
        if (v9 - v4 >= v108) {
          size_t v109 = *(void *)(a1 + 936);
        }
        else {
          size_t v109 = v9 - v4;
        }
        uint64_t v110 = *(void *)(a1 + 896);
        if (v109)
        {
          memcpy(*(void **)(a1 + 896), v4, v109);
          v111 = (unsigned __int16 *)(v110 + v109);
          *(void *)(a1 + 896) = v110 + v109;
          size_t v108 = *(void *)(a1 + 936) - v109;
          *(void *)(a1 + 936) = v108;
          v4 += v109;
          if (v108) {
            goto LABEL_188;
          }
        }
        else
        {
          v111 = *(unsigned __int16 **)(a1 + 896);
          if (v108)
          {
LABEL_188:
            if (*(unsigned __int16 **)(a1 + 880) == v111) {
              __assert_rtn("nghttp2_session_mem_recv2", "nghttp2_session.c", 7347, "nghttp2_buf_avail(&iframe->lbuf) > 0");
            }
            goto LABEL_750;
          }
        }
        v364 = v9;
        v138 = v8;
        uint64_t v139 = 0;
        v140 = *(unsigned __int16 **)(a1 + 888);
        v141 = *(void **)(a1 + 744);
        v142 = v140;
LABEL_229:
        uint64_t v143 = v110 + v109 - (void)v142;
        while (v142 != v111)
        {
          BOOL v227 = v143 < 2;
          v143 -= 2;
          if (v227) {
            goto LABEL_592;
          }
          unsigned int v145 = *v142++;
          unsigned int v144 = v145;
          if (v145)
          {
            unint64_t v146 = __rev16(v144);
            if ((char *)v111 - (char *)v142 < v146) {
              goto LABEL_592;
            }
            v142 = (unsigned __int16 *)((char *)v142 + v146);
            v108 += v146 + 1;
            ++v139;
            goto LABEL_229;
          }
        }
        if (v139)
        {
          uint64_t v251 = (*(uint64_t (**)(size_t, void))(a1 + 2576))(v108 + 16 * v139, *(void *)(a1 + 2568));
          if (!v251) {
            return -901;
          }
          v252 = (void *)v251;
          void *v141 = v139;
          v141[1] = v251;
          v253 = (char *)(v251 + 16 * v139);
          while (v140 != v111)
          {
            unsigned int v255 = *v140++;
            unsigned int v254 = v255;
            if (v255)
            {
              size_t v256 = __rev16(v254);
              void *v252 = v253;
              v252[1] = v256;
              v252 += 2;
              memcpy(v253, v140, v256);
              v257 = &v253[v256];
              char *v257 = 0;
              v253 = v257 + 1;
              v140 = (unsigned __int16 *)((char *)v140 + v256);
            }
          }
        }
        else
        {
          void *v141 = 0;
          v141[1] = 0;
        }
        v280 = *(unsigned int (**)(uint64_t, void *, void))(a1 + 2376);
        if (v280 && v280(a1, v138, *(void *)(a1 + 2608))) {
          return -902;
        }
LABEL_592:
        if (*(_DWORD *)(a1 + 952) == 15) {
          return v3;
        }
        session_inbound_frame_reset(a1);
        int v281 = 0;
        uint64_t v8 = v138;
        goto LABEL_689;
      case 18:
        unint64_t v33 = *(void *)(a1 + 936);
        if (v9 - v4 >= v33) {
          uint64_t v34 = *(void *)(a1 + 936);
        }
        else {
          uint64_t v34 = v9 - v4;
        }
        uint64_t v35 = v33 - v34;
        *(void *)(a1 + 936) = v33 - v34;
        unint64_t v36 = &v4[v34];
        if (!v34) {
          goto LABEL_58;
        }
        uint64_t v37 = *(uint64_t (**)(uint64_t, void *, char *))(a1 + 2544);
        if (!v37) {
          goto LABEL_58;
        }
        int v38 = v37(a1, v8, v4);
        if (v38 == -535)
        {
          *(_DWORD *)(a1 + 952) = 6;
          int v41 = 1;
        }
        else
        {
          if (v38) {
            return -902;
          }
          uint64_t v35 = *(void *)(a1 + 936);
LABEL_58:
          if (!v35)
          {
            uint64_t v370 = 0;
            int v39 = (*(uint64_t (**)(uint64_t, uint64_t *, void *, void))(a1 + 2536))(a1, &v370, v8, *(void *)(a1 + 2608));
            if (v39 != -535)
            {
              if (v39) {
                return -902;
              }
              *(void *)(a1 + 744) = v370;
              uint64_t v40 = *(unsigned int (**)(uint64_t, void *, void))(a1 + 2376);
              if (v40)
              {
                if (v40(a1, v8, *(void *)(a1 + 2608))) {
                  return -902;
                }
              }
            }
            session_inbound_frame_reset(a1);
          }
          int v41 = 0;
        }
        uint64_t v4 = v36;
        if (v41) {
          continue;
        }
        goto LABEL_750;
      default:
        goto LABEL_750;
    }
    break;
  }
  while (1)
  {
    int v373 = 0;
    uint64_t v149 = nghttp2_hd_inflate_hd_nv(a1 + 2104, (uint64_t)&v370, &v373, v148, v18, v367);
    uint64_t v150 = v149;
    if ((int)v149 < -900) {
      return (int)v150;
    }
    if (v149 < 0)
    {
      BOOL v250 = *(_DWORD *)(a1 + 952) != 4 || v366 == 0;
      if (!v250
        && *(_DWORD *)(v366 + 204) != 3
        && (int v207 = nghttp2_session_add_rst_stream(a1, *(_DWORD *)(v366 + 168), 9), v207 < -900)
        || (int v207 = session_terminate_session(a1, *(_DWORD *)(a1 + 2812), 9, 0), v207 <= -901))
      {
LABEL_814:
        LODWORD(v150) = v207;
        return (int)v150;
      }
      int v204 = -523;
      goto LABEL_678;
    }
    v147 += v149;
    char v151 = v373;
    if (v10 == 4 && (v373 & 2) != 0 && v366) {
      break;
    }
LABEL_457:
    if (v151)
    {
      nghttp2_rcbuf_decref(*(void *)(a1 + 2280));
      nghttp2_rcbuf_decref(*(void *)(a1 + 2272));
      int v204 = 0;
      *(void *)(a1 + 2272) = 0;
      *(void *)(a1 + 2280) = 0;
      *(_DWORD *)(a1 + 2332) = 1;
      goto LABEL_678;
    }
    v148 += v150;
    v18 -= v150;
    if (!v18 && (v151 & 2) == 0)
    {
      int v204 = 0;
LABEL_678:
      unint64_t v289 = v358;
LABEL_679:
      int v10 = *(_DWORD *)(a1 + 952);
      if (v10 == 15) {
        return v3;
      }
      if (v204 == -521)
      {
        *(void *)(a1 + 936) -= v147;
        uint64_t v311 = 736;
        if (*(unsigned char *)(a1 + 740) == 5) {
          uint64_t v311 = 768;
        }
        int updated = nghttp2_session_add_rst_stream(a1, *(_DWORD *)(a1 + v311), 2);
        if (updated <= -901) {
          return updated;
        }
        v4 += v147;
        *(_DWORD *)(a1 + 952) = 5;
        int v281 = 1;
LABEL_689:
        char v9 = v364;
        if (!v281) {
          goto LABEL_750;
        }
      }
      else
      {
        if (v204 == -526)
        {
          *(void *)(a1 + 936) -= v147;
          return &v4[v147] - v360;
        }
        v4 += v289;
        uint64_t v310 = *(void *)(a1 + 936);
        *(void *)(a1 + 936) = v310 - v289;
        if (v204 != -523)
        {
          char v9 = v364;
          if (v310 != v289) {
            goto LABEL_750;
          }
          goto LABEL_191;
        }
        char v9 = v364;
        if (v310 == v289)
        {
LABEL_710:
          session_inbound_frame_reset(a1);
          goto LABEL_750;
        }
LABEL_684:
        int v275 = 6;
LABEL_747:
        *(_DWORD *)(a1 + 952) = v275;
LABEL_748:
        int v96 = 1;
LABEL_749:
        if (!v96)
        {
LABEL_750:
          if (v4 == v9) {
            return v3;
          }
        }
      }
      goto LABEL_12;
    }
  }
  if ((*(unsigned char *)(a1 + 2916) & 4) != 0)
  {
LABEL_452:
    v239 = *(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, void, void))(a1 + 2448);
    if (v239)
    {
      int v204 = v239(a1, v8, v370, v371, BYTE4(v372), *(void *)(a1 + 2608));
      if (v204) {
        goto LABEL_609;
      }
    }
    else
    {
      v240 = *(uint64_t (**)(uint64_t, void *, void, void, void, void, void, void))(a1 + 2440);
      if (v240)
      {
        int v204 = v240(a1, v8, *(void *)(v370 + 16), *(void *)(v370 + 24), *(void *)(v371 + 16), *(void *)(v371 + 24), BYTE4(v372), *(void *)(a1 + 2608));
        if (v204)
        {
LABEL_609:
          unint64_t v289 = v358;
          if (v204 != -526 && v204 != -521) {
            goto LABEL_810;
          }
          goto LABEL_679;
        }
      }
    }
    goto LABEL_457;
  }
  uint64_t v152 = v370;
  v153 = *(const char **)(v370 + 16);
  uint64_t v154 = *(void *)(v370 + 24);
  if (!v154) {
    goto LABEL_357;
  }
  v352 = v8;
  int v155 = *(unsigned __int8 *)v153;
  v156 = *(unsigned __int8 **)(v370 + 16);
  uint64_t v157 = *(void *)(v370 + 24);
  if (v155 != 58) {
    goto LABEL_247;
  }
  uint64_t v157 = v154 - 1;
  if (v154 == 1) {
    goto LABEL_674;
  }
  v156 = (unsigned __int8 *)(v153 + 1);
  do
  {
LABEL_247:
    if (!VALID_HD_NAME_CHARS[*v156])
    {
      if (*v153 == 58) {
        goto LABEL_674;
      }
      uint64_t v162 = 0;
      uint64_t v8 = v352;
      while (v153[v162] - 91 < 0xFFFFFFE6)
      {
        if (v154 == ++v162) {
          goto LABEL_357;
        }
      }
      goto LABEL_675;
    }
    ++v156;
    --v157;
  }
  while (v157);
  int v158 = v372;
  switch((int)v372)
  {
    case 0:
      goto LABEL_272;
    case 1:
      uint64_t v159 = v371;
      uint64_t v160 = *(void *)(v371 + 24);
      if (!v160) {
        goto LABEL_356;
      }
      v161 = *(unsigned __int8 **)(v371 + 16);
      while (VALID_METHOD_CHARS[*v161])
      {
        ++v161;
        if (!--v160) {
          goto LABEL_306;
        }
      }
      goto LABEL_356;
    case 2:
    case 4:
      goto LABEL_279;
    case 3:
      uint64_t v159 = v371;
      uint64_t v175 = *(void *)(v371 + 24);
      if (!v175) {
        goto LABEL_306;
      }
      v176 = *(unsigned __int8 **)(v371 + 16);
      while (VALID_PATH_CHARS[*v176])
      {
        ++v176;
        if (!--v175) {
          goto LABEL_306;
        }
      }
      goto LABEL_356;
    case 5:
      uint64_t v159 = v371;
      uint64_t v177 = *(void *)(v371 + 24);
      if (!v177) {
        goto LABEL_356;
      }
      v178 = *(unsigned char **)(v371 + 16);
      if ((*v178 & 0xDFu) - 65 > 0x19) {
        goto LABEL_356;
      }
      uint64_t v179 = v177 - 1;
      if (!v179) {
        goto LABEL_306;
      }
      v180 = v178 + 1;
      while (1)
      {
        unsigned int v181 = *v180;
        if (v181 - 48 >= 0xA && (v181 & 0xFFFFFFDF) - 65 >= 0x1A)
        {
          BOOL v227 = v181 > 0x2E;
          uint64_t v183 = (1 << v181) & 0x680000000000;
          if (v227 || v183 == 0) {
            goto LABEL_356;
          }
        }
        ++v180;
        if (!--v179) {
          goto LABEL_306;
        }
      }
    default:
      if (v372 != 37)
      {
        if (v372 == 66)
        {
          char v163 = *(unsigned char *)(v366 + 216);
          uint64_t v159 = v371;
          if ((v163 & 0x40) != 0)
          {
            uint64_t v164 = *(void *)(v371 + 24);
            if (!v164) {
              goto LABEL_356;
            }
            v165 = *(unsigned __int8 **)(v371 + 16);
            while (1)
            {
              int v167 = *v165++;
              int v166 = v167;
              if (v167 != 32 && v166 != 9) {
                break;
              }
              if (!--v164) {
                goto LABEL_356;
              }
            }
          }
        }
        else
        {
LABEL_279:
          char v163 = *(unsigned char *)(v366 + 216);
          uint64_t v159 = v371;
        }
        v171 = *(unsigned __int8 **)(v159 + 16);
        uint64_t v172 = *(void *)(v159 + 24);
        if ((v163 & 0x40) == 0)
        {
LABEL_281:
          int v345 = v372;
          uint64_t v346 = v159;
          uint64_t v354 = v147;
          uint64_t v173 = v370;
          v347 = *(const char **)(v370 + 16);
          uint64_t v349 = *(void *)(v370 + 24);
          int v174 = nghttp2_check_header_value_rfc9113(v171, v172);
          v153 = v347;
          LODWORD(v154) = v349;
          uint64_t v152 = v173;
          uint64_t v147 = v354;
          int v158 = v345;
          uint64_t v159 = v346;
          if (!v174) {
            goto LABEL_356;
          }
          goto LABEL_306;
        }
        if (v172)
        {
          while (VALID_HD_VALUE_CHARS[*v171])
          {
            ++v171;
            if (!--v172) {
              goto LABEL_306;
            }
          }
          goto LABEL_356;
        }
LABEL_306:
        if (*(unsigned char *)(a1 + 2932))
        {
          BOOL v185 = *(unsigned char *)(a1 + 2929) != 0;
          goto LABEL_310;
        }
        if (*(unsigned char *)(a1 + 740) == 5)
        {
          BOOL v185 = 0;
LABEL_310:
          if (v155 == 58 && (v357 || (*(unsigned char *)(v366 + 212) & 0x40) != 0)) {
            goto LABEL_674;
          }
          if (v158 > 36)
          {
            switch(v158)
            {
              case '8':
              case '>':
              case '?':
              case '@':
              case 'A':
                goto LABEL_674;
              case '9':
              case ':':
              case ';':
              case '<':
                goto LABEL_364;
              case '=':
                if (*(void *)(v159 + 24) != 8) {
                  goto LABEL_674;
                }
                uint64_t v188 = 0;
                while (1)
                {
                  int v189 = aTrailers[v188];
                  if ((v189 - 65) < 0x1A) {
                    LOBYTE(v189) = v189 + 32;
                  }
                  int v190 = *(unsigned __int8 *)(*(void *)(v159 + 16) + v188);
                  if ((v190 - 65) < 0x1A) {
                    LOBYTE(v190) = v190 + 32;
                  }
                  if (v189 != v190) {
                    goto LABEL_674;
                  }
                  if (++v188 == 8) {
                    goto LABEL_449;
                  }
                }
              case 'B':
                if (!v185) {
                  goto LABEL_674;
                }
                int v208 = *(_DWORD *)(v366 + 212);
                if ((v208 & 0x8000) != 0 || !*(void *)(v159 + 24)) {
                  goto LABEL_674;
                }
                unsigned int v187 = v208 | 0x8000;
                goto LABEL_448;
              case 'C':
                if (v357
                  || (*(unsigned char *)(v366 + 168) & 1) == 0
                  || (*(unsigned char *)(v366 + 216) & 0x10) == 0
                  || (*(unsigned char *)(v366 + 214) & 2) != 0)
                {
                  break;
                }
                uint64_t v209 = v152;
                unsigned int v210 = *(unsigned __int8 *)(v366 + 221);
                unsigned int v374 = v210 & 0x7F;
                unsigned int v375 = v210 >> 7;
                if (nghttp2_http_parse_priority((int *)&v374, *(unsigned __int8 **)(v159 + 16), *(void *)(v159 + 24)))
                {
                  unsigned int v187 = *(_DWORD *)(v366 + 212) & 0xFFFCFFFF | 0x20000;
                }
                else
                {
                  *(unsigned char *)(v366 + 221) = v374 | ((_BYTE)v375 << 7);
                  unsigned int v187 = *(_DWORD *)(v366 + 212) | 0x10000;
                }
                uint64_t v152 = v209;
                goto LABEL_448;
              default:
                if (v158 == 37)
                {
                  int v198 = *(_DWORD *)(v366 + 212);
                  if ((v198 & 0x10) != 0 || !*(void *)(v159 + 24)) {
                    goto LABEL_674;
                  }
                  unsigned int v187 = v198 | 0x10;
LABEL_448:
                  *(_DWORD *)(v366 + 212) = v187;
                }
                else
                {
LABEL_364:
                  if (v155 == 58) {
                    goto LABEL_674;
                  }
                }
                break;
            }
          }
          else
          {
            switch(v158)
            {
              case 0:
                int v186 = *(_DWORD *)(v366 + 212);
                if ((v186 & 1) != 0 || !*(void *)(v159 + 24)) {
                  goto LABEL_674;
                }
                unsigned int v187 = v186 | 1;
                goto LABEL_448;
              case 1:
                int v211 = *(_DWORD *)(v366 + 212);
                if ((v211 & 4) != 0) {
                  goto LABEL_674;
                }
                uint64_t v212 = *(void *)(v159 + 24);
                if (!v212) {
                  goto LABEL_674;
                }
                *(_DWORD *)(v366 + 212) = v211 | 4;
                if (v212 == 7)
                {
                  v231 = *(int **)(v159 + 16);
                  int v232 = *((unsigned __int8 *)v231 + 6);
                  if (v232 == 83)
                  {
                    int v242 = *v231;
                    int v243 = *(int *)((char *)v231 + 3);
                    if (v242 == 1230262351 && v243 == 1397641033)
                    {
                      int v213 = 516;
                      goto LABEL_447;
                    }
                  }
                  else if (v232 == 84)
                  {
                    int v233 = *v231;
                    int v234 = *(int *)((char *)v231 + 3);
                    if (v233 == 1313754947 && v234 == 1413694798)
                    {
                      if ((*(unsigned char *)(v366 + 168) & 1) == 0) {
                        goto LABEL_674;
                      }
                      int v213 = 132;
                      goto LABEL_447;
                    }
                  }
                }
                else if (v212 == 4 && **(_DWORD **)(v159 + 16) == 1145128264)
                {
                  int v213 = 260;
LABEL_447:
                  unsigned int v187 = v211 | v213;
                  goto LABEL_448;
                }
                break;
              case 2:
              case 4:
                goto LABEL_364;
              case 3:
                int v211 = *(_DWORD *)(v366 + 212);
                if ((v211 & 2) != 0) {
                  goto LABEL_674;
                }
                uint64_t v214 = *(void *)(v159 + 24);
                if (!v214) {
                  goto LABEL_674;
                }
                *(_DWORD *)(v366 + 212) = v211 | 2;
                int v215 = **(unsigned __int8 **)(v159 + 16);
                if (v215 == 47)
                {
                  int v213 = 2050;
                  goto LABEL_447;
                }
                if (v214 != 1 || v215 != 42) {
                  break;
                }
                int v213 = 4098;
                goto LABEL_447;
              case 5:
                int v211 = *(_DWORD *)(v366 + 212);
                if ((v211 & 8) != 0) {
                  goto LABEL_674;
                }
                uint64_t v216 = *(void *)(v159 + 24);
                if (!v216) {
                  goto LABEL_674;
                }
                *(_DWORD *)(v366 + 212) = v211 | 8;
                if (v216 == 5)
                {
                  uint64_t v236 = 0;
                  while (1)
                  {
                    int v237 = aHttps[v236];
                    if ((v237 - 65) < 0x1A) {
                      LOBYTE(v237) = v237 + 32;
                    }
                    int v238 = *(unsigned __int8 *)(*(void *)(v159 + 16) + v236);
                    if ((v238 - 65) < 0x1A) {
                      LOBYTE(v238) = v238 + 32;
                    }
                    if (v237 != v238) {
                      break;
                    }
                    if (++v236 == 5)
                    {
LABEL_446:
                      int v213 = 8200;
                      goto LABEL_447;
                    }
                  }
                }
                else
                {
                  if (v216 != 4) {
                    break;
                  }
                  uint64_t v217 = 0;
                  while (1)
                  {
                    int v218 = aHttp[v217];
                    if ((v218 - 65) < 0x1A) {
                      LOBYTE(v218) = v218 + 32;
                    }
                    int v219 = *(unsigned __int8 *)(*(void *)(v159 + 16) + v217);
                    if ((v219 - 65) < 0x1A) {
                      LOBYTE(v219) = v219 + 32;
                    }
                    if (v218 != v219) {
                      break;
                    }
                    if (++v217 == 4) {
                      goto LABEL_446;
                    }
                  }
                }
                break;
              default:
                if (v158 != 27) {
                  goto LABEL_364;
                }
                if (*(void *)(v366 + 48) != -1) {
                  goto LABEL_674;
                }
                int v350 = v154;
                v195 = v153;
                uint64_t v355 = v147;
                uint64_t v196 = v152;
                uint64_t v197 = parse_uint(*(unsigned __int8 **)(v159 + 16), *(void *)(v159 + 24));
                uint64_t v152 = v196;
                uint64_t v147 = v355;
                v153 = v195;
                LODWORD(v154) = v350;
                *(void *)(v366 + 48) = v197;
                if (v197 == -1) {
                  goto LABEL_674;
                }
                break;
            }
          }
LABEL_449:
          if (**(unsigned char **)(v152 + 16) != 58) {
            *(_DWORD *)(v366 + 212) |= 0x40u;
          }
          uint64_t v8 = v352;
          goto LABEL_452;
        }
        if (v155 == 58 && (v357 || (*(unsigned char *)(v366 + 212) & 0x40) != 0)) {
          goto LABEL_674;
        }
        uint64_t v191 = (v158 - 27);
        if (v191 <= 0x26)
        {
          if (v158 == 27)
          {
            int v220 = *(unsigned __int16 *)(v366 + 208);
            if (v220 == 204)
            {
              uint64_t v8 = v352;
              if (*(void *)(v366 + 48) != -1 || *(void *)(v159 + 24) != 1) {
                goto LABEL_675;
              }
              int v221 = **(unsigned __int8 **)(v159 + 16);
              if ((v221 - 65) < 0x1A) {
                LOBYTE(v221) = v221 + 32;
              }
              if (v221 != 48) {
                goto LABEL_675;
              }
              *(void *)(v366 + 48) = 0;
              goto LABEL_457;
            }
            uint64_t v8 = v352;
            if ((v220 - 100) < 0x64) {
              goto LABEL_675;
            }
            if ((v220 - 200) <= 0x63 && (*(unsigned char *)(v366 + 212) & 0x80) != 0) {
              goto LABEL_457;
            }
            v348 = v153;
            int v351 = v154;
            if (*(void *)(v366 + 48) != -1) {
              goto LABEL_675;
            }
            uint64_t v241 = parse_uint(*(unsigned __int8 **)(v159 + 16), *(void *)(v159 + 24));
            *(void *)(v366 + 48) = v241;
            v153 = v348;
            LODWORD(v154) = v351;
            if (v241 == -1) {
              goto LABEL_675;
            }
            goto LABEL_466;
          }
          if (v191 == 34)
          {
            uint64_t v8 = v352;
            if (*(void *)(v159 + 24) == 8)
            {
              uint64_t v192 = 0;
              while (1)
              {
                int v193 = aTrailers[v192];
                if ((v193 - 65) < 0x1A) {
                  LOBYTE(v193) = v193 + 32;
                }
                int v194 = *(unsigned __int8 *)(*(void *)(v159 + 16) + v192);
                if ((v194 - 65) < 0x1A) {
                  LOBYTE(v194) = v194 + 32;
                }
                if (v193 != v194) {
                  break;
                }
                if (++v192 == 8) {
                  goto LABEL_466;
                }
              }
            }
LABEL_675:
            int v207 = session_call_error_callback(a1, 4294966765, "Invalid HTTP header field was received: frame type: %u, stream: %d, name: [%.*s], value: [%.*s]", *(unsigned __int8 *)(a1 + 740), *(_DWORD *)(a1 + 736), v154, v153, *(void *)(v371 + 24), *(const char **)(v371 + 16));
            if (v207 < -900) {
              goto LABEL_814;
            }
            int v207 = session_handle_invalid_stream2(a1, *(_DWORD *)(v366 + 168), (uint64_t)v8, 4294966765);
            if (v207 <= -901) {
              goto LABEL_814;
            }
            int v204 = -521;
            goto LABEL_678;
          }
          if (((1 << (v158 - 27)) & 0x6820000000) != 0) {
            goto LABEL_674;
          }
        }
        if (v158 == 7)
        {
          int v222 = *(_DWORD *)(v366 + 212);
          if ((v222 & 0x20) != 0)
          {
LABEL_674:
            uint64_t v8 = v352;
            goto LABEL_675;
          }
          uint64_t v223 = *(void *)(v159 + 24);
          uint64_t v8 = v352;
          if (v223)
          {
            *(_DWORD *)(v366 + 212) = v222 | 0x20;
            if (v223 == 3)
            {
              uint64_t v224 = 0;
              uint64_t v225 = 0;
              do
              {
                int v226 = *(unsigned __int8 *)(*(void *)(v159 + 16) + v224);
                BOOL v227 = (v226 - 58) >= 0xFFFFFFF6 && v225 <= 0xCCCCCCCCCCCCCCCLL;
                if (!v227 || (uint64_t v228 = 10 * v225, v229 = (v226 - 48), v228 > (v229 ^ 0x7FFFFFFFFFFFFFFFLL)))
                {
                  *(_WORD *)(v366 + 208) = -1;
                  goto LABEL_675;
                }
                uint64_t v225 = v229 + v228;
                ++v224;
              }
              while (v224 != 3);
              *(_WORD *)(v366 + 208) = v225;
              if ((unsigned __int16)v225 != 101 && (unsigned __int16)v225 != 0xFFFF) {
                goto LABEL_466;
              }
            }
          }
          goto LABEL_675;
        }
        BOOL v7 = v155 == 58;
        uint64_t v8 = v352;
        if (v7) {
          goto LABEL_675;
        }
LABEL_466:
        if (*v153 != 58) {
          *(_DWORD *)(v366 + 212) |= 0x40u;
        }
        goto LABEL_452;
      }
LABEL_272:
      if (*(unsigned char *)(a1 + 2932) || *(unsigned char *)(a1 + 740) == 5)
      {
        uint64_t v159 = v371;
        uint64_t v169 = *(void *)(v371 + 24);
        if (v169)
        {
          v170 = *(unsigned __int8 **)(v371 + 16);
          while (VALID_AUTHORITY_CHARS[*v170])
          {
            ++v170;
            if (!--v169) {
              goto LABEL_306;
            }
          }
          goto LABEL_356;
        }
        goto LABEL_306;
      }
      uint64_t v159 = v371;
      v171 = *(unsigned __int8 **)(v371 + 16);
      uint64_t v172 = *(void *)(v371 + 24);
      if ((*(unsigned char *)(v366 + 216) & 0x40) == 0) {
        goto LABEL_281;
      }
      if (!v172) {
        goto LABEL_306;
      }
      while (VALID_HD_VALUE_CHARS[*v171])
      {
        ++v171;
        if (!--v172) {
          goto LABEL_306;
        }
      }
LABEL_356:
      BOOL v7 = v155 == 58;
      uint64_t v8 = v352;
      if (v7) {
        goto LABEL_675;
      }
LABEL_357:
      *(_DWORD *)(v366 + 212) |= 0x40u;
      v199 = *(uint64_t (**)(uint64_t))(a1 + 2464);
      size_t v353 = v3;
      uint64_t v356 = v147;
      if (v199)
      {
        v200 = v8;
        uint64_t v201 = v371;
        v202 = v200;
        uint64_t v203 = v152;
        int v204 = v199(a1);
      }
      else
      {
        v205 = *(uint64_t (**)(uint64_t))(a1 + 2456);
        if (!v205) {
          goto LABEL_675;
        }
        uint64_t v203 = v152;
        v206 = v8;
        uint64_t v201 = v371;
        v202 = v206;
        int v204 = v205(a1);
      }
      switch(v204)
      {
        case 0:
          int v207 = session_call_error_callback(a1, 4294966765, "Ignoring received invalid HTTP header field: frame type: %u, stream: %d, name: [%.*s], value: [%.*s]", *(unsigned __int8 *)(a1 + 740), *(_DWORD *)(a1 + 736), *(void *)(v203 + 24), *(const char **)(v203 + 16), *(void *)(v201 + 24), *(const char **)(v201 + 16));
          uint64_t v8 = v202;
          size_t v3 = v353;
          uint64_t v147 = v356;
          if (v207 <= -901) {
            goto LABEL_814;
          }
          goto LABEL_457;
        case -526:
          uint64_t v8 = v202;
          size_t v3 = v353;
          uint64_t v147 = v356;
          goto LABEL_678;
        case -521:
          uint64_t v8 = v202;
          v153 = *(const char **)(v203 + 16);
          uint64_t v154 = *(void *)(v203 + 24);
          size_t v3 = v353;
          uint64_t v147 = v356;
          goto LABEL_675;
      }
LABEL_810:
      LODWORD(v150) = -902;
      return (int)v150;
  }
}

uint64_t nghttp2_session_get_stream_user_data(uint64_t *a1, int a2)
{
  uint64_t result = nghttp2_map_find(a1, a2);
  if (result)
  {
    if ((*(unsigned char *)(result + 216) & 2) != 0 || *(_DWORD *)(result + 204) == 5) {
      return 0;
    }
    else {
      return *(void *)(result + 144);
    }
  }
  return result;
}

uint64_t nghttp2_map_find(uint64_t *a1, int a2)
{
  if (!a1[2]) {
    return 0;
  }
  int v3 = *((_DWORD *)a1 + 7);
  uint64_t v4 = (-1640531527 * a2) >> -(char)v3;
  uint64_t v5 = *a1;
  uint64_t result = *(void *)(*a1 + 16 * v4 + 8);
  if (result)
  {
    char v7 = 32 - v3;
    int v8 = *((_DWORD *)a1 + 6) - 1;
    uint64_t v9 = -1;
    while (*(_DWORD *)(v5 + 16 * v4 + 4) != a2)
    {
      uint64_t v4 = (v4 + 1) & v8;
      uint64_t result = *(void *)(v5 + 16 * v4 + 8);
      if (!result) {
        break;
      }
      if (++v9 >= (unint64_t)((v4 - (*(_DWORD *)(v5 + 16 * v4) >> v7)) & v8)) {
        return 0;
      }
    }
  }
  return result;
}

void nghttp2_session_adjust_idle_stream(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 2892);
  if (v1 >= *(_DWORD *)(a1 + 2920)) {
    unsigned int v1 = *(_DWORD *)(a1 + 2920);
  }
  if (v1 <= 0x10) {
    unsigned int v1 = 16;
  }
  if (v1 >= 0x64) {
    unint64_t v2 = 100;
  }
  else {
    unint64_t v2 = v1;
  }
  if (*(void *)(a1 + 2736) > v2)
  {
    uint64_t v4 = (void *)(a1 + 2640);
    uint64_t v5 = *(void *)(a1 + 2632);
    do
    {
      if (!v5) {
        __assert_rtn("nghttp2_session_adjust_idle_stream", "nghttp2_session.c", 1737, "head");
      }
      uint64_t v6 = *(void *)(v5 + 136);
      nghttp2_session_destroy_stream(a1, v5);
      if (v7) {
        break;
      }
      *(void *)(a1 + 2632) = v6;
      int v8 = (void *)(v6 + 128);
      if (!v6) {
        int v8 = v4;
      }
      *int v8 = 0;
      unint64_t v9 = *(void *)(a1 + 2736) - 1;
      *(void *)(a1 + 2736) = v9;
      uint64_t v5 = v6;
    }
    while (v9 > v2);
  }
}

uint64_t nghttp2_session_update_recv_stream_window_size(uint64_t a1, uint64_t a2, int a3, int a4)
{
  int v5 = *(_DWORD *)(a2 + 188);
  int v6 = *(_DWORD *)(a2 + 176);
  if (v6 <= v5 - a3 && v6 <= (a3 ^ 0x7FFFFFFF))
  {
    int v10 = v6 + a3;
    *(_DWORD *)(a2 + 176) = v10;
    if (!a4 || (*(unsigned char *)(a1 + 2916) & 1) != 0) {
      return 0;
    }
    uint64_t v11 = 0;
    int v12 = v5 + (v5 < 0);
    if (!*(unsigned char *)(a2 + 219))
    {
      int v13 = v12 >> 1;
      if (v10 >= 1 && v13 <= v10)
      {
        uint64_t v11 = nghttp2_session_add_window_update(a1, *(_DWORD *)(a2 + 168), v10);
        if (!v11) {
          *(_DWORD *)(a2 + 176) = 0;
        }
      }
    }
    return v11;
  }
  else
  {
    int v8 = *(_DWORD *)(a2 + 168);
    return nghttp2_session_add_rst_stream(a1, v8, 3);
  }
}

uint64_t nghttp2_session_update_recv_connection_window_size(uint64_t a1, int a2)
{
  int v3 = *(_DWORD *)(a1 + 2844);
  int v4 = *(_DWORD *)(a1 + 2832);
  if (v4 <= v3 - a2 && v4 <= (a2 ^ 0x7FFFFFFF))
  {
    int v8 = v4 + a2;
    *(_DWORD *)(a1 + 2832) = v4 + a2;
    if (*(unsigned char *)(a1 + 2916))
    {
      return 0;
    }
    else
    {
      uint64_t result = 0;
      int v9 = v3 + (v3 < 0);
      if (!*(unsigned char *)(a1 + 2934))
      {
        int v10 = v9 >> 1;
        if (v8 >= 1 && v10 <= v8)
        {
          uint64_t result = nghttp2_session_add_window_update(a1, 0, v8);
          if (!result) {
            *(_DWORD *)(a1 + 2832) = 0;
          }
        }
      }
    }
  }
  else
  {
    int v6 = *(_DWORD *)(a1 + 2812);
    return session_terminate_session(a1, v6, 3, 0);
  }
  return result;
}

double session_inbound_frame_reset(uint64_t a1)
{
  unint64_t v2 = *(unsigned __int8 *)(a1 + 740);
  switch(*(unsigned char *)(a1 + 740))
  {
    case 0:
    case 2:
    case 3:
    case 6:
    case 8:
      goto LABEL_12;
    case 1:
      uint64_t v3 = *(void *)(a1 + 768);
      goto LABEL_10;
    case 4:
      (*(void (**)(void, void))(a1 + 2584))(*(void *)(a1 + 752), *(void *)(a1 + 2568));
      (*(void (**)(void, void))(a1 + 2584))(*(void *)(a1 + 824), *(void *)(a1 + 2568));
      *(void *)(a1 + 824) = 0;
      *(void *)(a1 + 928) = 0;
      *(void *)(a1 + 920) = 0;
      goto LABEL_12;
    case 5:
    case 7:
      uint64_t v3 = *(void *)(a1 + 752);
      goto LABEL_10;
    default:
      if ((*(unsigned __int8 *)(a1 + (v2 >> 3) + 2935) >> (v2 & 7))) {
        goto LABEL_12;
      }
      if (v2 == 12)
      {
        if ((*(unsigned char *)(a1 + 2924) & 2) != 0)
        {
          uint64_t v6 = *(void *)(a1 + 744);
          if (v6)
          {
            uint64_t v3 = *(void *)(v6 + 8);
            goto LABEL_10;
          }
        }
      }
      else if v2 == 10 && (*(unsigned char *)(a1 + 2924))
      {
        int v4 = *(uint64_t **)(a1 + 744);
        if (v4)
        {
          uint64_t v3 = *v4;
LABEL_10:
          (*(void (**)(uint64_t, void))(a1 + 2584))(v3, *(void *)(a1 + 2568));
        }
      }
LABEL_12:
      *(_OWORD *)(a1 + 792) = 0u;
      *(_OWORD *)(a1 + 808) = 0u;
      *(_OWORD *)(a1 + 760) = 0u;
      *(_OWORD *)(a1 + 776) = 0u;
      *(_OWORD *)(a1 + 728) = 0u;
      *(_OWORD *)(a1 + 744) = 0u;
      *(_DWORD *)(a1 + 952) = 2;
      *(void *)(a1 + 856) = a1 + 956;
      *(void *)(a1 + 848) = a1 + 956;
      *(void *)(a1 + 832) = a1 + 956;
      *(void *)(a1 + 840) = a1 + 988;
      *(void *)(a1 + 864) = a1 + 965;
      (*(void (**)(void, void))(a1 + 2584))(*(void *)(a1 + 872), *(void *)(a1 + 2568));
      *(void *)(a1 + 944) = 0;
      *(void *)(a1 + 936) = 0;
      double result = 0.0;
      *(_OWORD *)(a1 + 872) = 0u;
      *(_OWORD *)(a1 + 888) = 0u;
      *(_OWORD *)(a1 + 904) = 0u;
      return result;
  }
}

uint64_t session_process_headers_frame(uint64_t a1)
{
  uint64_t v2 = a1 + 728;
  uint64_t v3 = (uint64_t *)(a1 + 752);
  if ((*(unsigned char *)(a1 + 741) & 0x20) != 0)
  {
    uint64_t v6 = *(unsigned int **)(a1 + 848);
    unsigned int v7 = *v6;
    unsigned int v5 = bswap32(*v6 & 0xFFFFFF7F);
    LODWORD(v6) = *((unsigned __int8 *)v6 + 4) + 1;
    *(_DWORD *)(a1 + 752) = v5;
    *(_DWORD *)(a1 + 756) = v6;
    int v4 = (v7 >> 7) & 1;
  }
  else
  {
    LOBYTE(v4) = 0;
    unsigned int v5 = 0;
    uint64_t *v3 = 0x1000000000;
  }
  *(unsigned char *)(a1 + 760) = v4;
  *(void *)(a1 + 776) = 0;
  *(void *)(a1 + 768) = 0;
  int v8 = *(_DWORD *)(a1 + 736);
  uint64_t v9 = nghttp2_map_find((uint64_t *)a1, v8);
  if (!v9 || (*(unsigned char *)(v9 + 216) & 2) != 0) {
    goto LABEL_9;
  }
  int v10 = *(_DWORD *)(v9 + 204);
  if (v10 == 1)
  {
    if (v8)
    {
      if ((v8 & 1) == (*(unsigned char *)(a1 + 2932) == 0))
      {
        *(_DWORD *)(a1 + 784) = 1;
        if (*(_DWORD *)(v9 + 204) != 1) {
          __assert_rtn("nghttp2_session_on_response_headers_received", "nghttp2_session.c", 4318, "stream->state == NGHTTP2_STREAM_OPENING && nghttp2_session_is_my_stream_id(session, frame->hd.stream_id)");
        }
        if ((*(unsigned char *)(v9 + 217) & 1) == 0)
        {
          *(_DWORD *)(v9 + 204) = 2;
          goto LABEL_51;
        }
        goto LABEL_49;
      }
      *(_DWORD *)(a1 + 784) = 3;
LABEL_35:
      if ((*(unsigned char *)(v9 + 217) & 1) == 0)
      {
        int v17 = *(_DWORD *)(v9 + 204);
        if ((v8 ^ (*(unsigned char *)(a1 + 2932) == 0)))
        {
          if (v17 != 3) {
            goto LABEL_51;
          }
        }
        else if (v17 == 2)
        {
          goto LABEL_51;
        }
        return 4294967193;
      }
LABEL_49:
      int v12 = "HEADERS: stream closed";
      uint64_t v18 = a1;
      uint64_t v19 = v2;
      uint64_t v20 = 4294966786;
LABEL_64:
      int v25 = session_handle_invalid_connection(v18, v19, v20, v12);
      goto LABEL_65;
    }
    *(_DWORD *)(a1 + 784) = 3;
LABEL_44:
    int v12 = "HEADERS: stream_id == 0";
    goto LABEL_63;
  }
  if (v10 == 4)
  {
    *(_DWORD *)(a1 + 784) = 2;
    if (*(_DWORD *)(v9 + 204) != 4) {
      __assert_rtn("nghttp2_session_on_push_response_headers_received", "nghttp2_session.c", 4347, "stream->state == NGHTTP2_STREAM_RESERVED");
    }
    if (!v8)
    {
      int v12 = "push response HEADERS: stream_id == 0";
      goto LABEL_63;
    }
    if (*(unsigned char *)(a1 + 2932))
    {
      int v12 = "HEADERS: no HEADERS allowed from client in reserved state";
      goto LABEL_63;
    }
    unint64_t v24 = *(void *)(a1 + 2704);
    if (v24 >= *(unsigned int *)(a1 + 2892))
    {
      int v12 = "push response HEADERS: max concurrent streams exceeded";
      goto LABEL_63;
    }
    if ((*(unsigned char *)(a1 + 2933) & 5) == 0)
    {
      if (v24 < *(unsigned int *)(a1 + 2920))
      {
        *(_DWORD *)(v9 + 204) = 2;
        *(unsigned char *)(v9 + 216) &= ~1u;
        if ((*(unsigned char *)(v9 + 168) & 1) == 0) {
          --*(void *)(a1 + 2712);
        }
        *(void *)(a1 + 2704) = v24 + 1;
        goto LABEL_51;
      }
LABEL_77:
      int v25 = session_handle_invalid_stream2(a1, v8, v2, 4294966763);
LABEL_65:
      if (v25 <= -901) {
        return v25;
      }
      else {
        return 4294967193;
      }
    }
    return 4294967193;
  }
  if (v10 != 5)
  {
    *(_DWORD *)(a1 + 784) = 3;
    if (v8) {
      goto LABEL_35;
    }
    goto LABEL_44;
  }
LABEL_9:
  *(_DWORD *)(a1 + 784) = 0;
  if (!v8)
  {
    int v12 = "request HEADERS: stream_id == 0";
    goto LABEL_63;
  }
  if (!*(unsigned char *)(a1 + 2932) && (~*(_DWORD *)(a1 + 2916) & 0x84) != 0)
  {
    if (v8) {
      int v16 = *(_DWORD *)(a1 + 2804);
    }
    else {
      int v16 = *(_DWORD *)(a1 + 2808);
    }
    if (v16 < v8)
    {
      int v12 = "request HEADERS: client received request";
      goto LABEL_63;
    }
    return 4294967193;
  }
  if ((v8 & 1) == (*(unsigned char *)(a1 + 2932) == 0))
  {
    int v12 = "request HEADERS: invalid stream_id";
    goto LABEL_63;
  }
  if (*(_DWORD *)(a1 + 2808) >= v8)
  {
    uint64_t v13 = nghttp2_map_find((uint64_t *)a1, v8);
    if (v13)
    {
      uint64_t v14 = 4294967193;
      if (*(unsigned char *)(v13 + 217))
      {
        int v15 = session_handle_invalid_connection(a1, v2, 4294966786, "HEADERS: stream closed");
        if (v15 <= -901) {
          return v15;
        }
        else {
          return 4294967193;
        }
      }
      return v14;
    }
    return 4294967193;
  }
  *(_DWORD *)(a1 + 2808) = v8;
  unint64_t v11 = *(void *)(a1 + 2704);
  if (v11 >= *(unsigned int *)(a1 + 2892))
  {
    int v12 = "request HEADERS: max concurrent streams exceeded";
    goto LABEL_63;
  }
  if ((*(unsigned char *)(a1 + 2933) & 5) != 0) {
    return 4294967193;
  }
  if (v5 == v8)
  {
    int v12 = "request HEADERS: depend on itself";
LABEL_63:
    uint64_t v18 = a1;
    uint64_t v19 = v2;
    uint64_t v20 = 4294966791;
    goto LABEL_64;
  }
  if (v11 >= *(unsigned int *)(a1 + 2920)) {
    goto LABEL_77;
  }
  if (!nghttp2_session_open_stream(a1, v8, v3, 1, 0)) {
    return 4294966395;
  }
  nghttp2_session_adjust_closed_stream(a1);
  uint64_t v14 = v27;
  if ((int)v27 >= -900)
  {
    *(_DWORD *)(a1 + 2812) = *(_DWORD *)(a1 + 2808);
LABEL_51:
    uint64_t v21 = *(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 2432);
    if (v21)
    {
      int v22 = v21(a1, v2, *(void *)(a1 + 2608));
      if (v22) {
        unsigned int v23 = -902;
      }
      else {
        unsigned int v23 = 0;
      }
      if (v22 == -521) {
        return 4294966775;
      }
      else {
        return v23;
      }
    }
    else
    {
      return 0;
    }
  }
  return v14;
}

uint64_t nghttp2_http_on_response_headers(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 212);
  if ((v1 & 0x20) == 0) {
    return 0xFFFFFFFFLL;
  }
  __int16 v3 = *(_WORD *)(a1 + 208);
  if ((unsigned __int16)(v3 - 100) > 0x63u)
  {
    *(_DWORD *)(a1 + 212) = v1 & 0xFFFFBFFF;
    if ((v1 & 0x100) != 0 || (v3 - 100) < 0x64 || v3 == 304 || v3 == 204)
    {
      uint64_t v2 = 0;
      *(void *)(a1 + 48) = 0;
    }
    else
    {
      uint64_t v2 = 0;
      if ((v1 & 0x480) != 0) {
        *(void *)(a1 + 48) = -1;
      }
    }
  }
  else
  {
    uint64_t v2 = 0;
    *(_DWORD *)(a1 + 212) = *(_DWORD *)(a1 + 212) & 0x780 | 0x4000;
    *(void *)(a1 + 48) = -1;
    *(_WORD *)(a1 + 208) = -1;
  }
  return v2;
}

uint64_t parse_uint(unsigned __int8 *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t result = 0;
    while (1)
    {
      int v5 = *a1++;
      int v4 = v5;
      if ((v5 - 58) < 0xFFFFFFF6 || result > 0xCCCCCCCCCCCCCCCLL) {
        break;
      }
      uint64_t v7 = (v4 - 48);
      if (10 * result > (v7 ^ 0x7FFFFFFFFFFFFFFFLL)) {
        break;
      }
      uint64_t result = v7 + 10 * result;
      if (!--a2) {
        return result;
      }
    }
  }
  return -1;
}

void nghttp2_session_close_stream(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = nghttp2_map_find((uint64_t *)a1, a2);
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  if ((*(unsigned char *)(v6 + 216) & 2) != 0) {
    return;
  }
  if (*(_DWORD *)(v6 + 204) == 5) {
    return;
  }
  int v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 2424);
  if (v8)
  {
    if (v8(a1, a2, a3, *(void *)(a1 + 2608))) {
      return;
    }
  }
  uint64_t v9 = *(void *)(v7 + 152);
  if (v9)
  {
    session_detach_stream_item(a1, v7);
    if (!*(unsigned char *)(v9 + 152) && v9 != *(void *)(a1 + 648))
    {
      nghttp2_outbound_item_free(v9, (uint64_t *)(a1 + 2568));
      (*(void (**)(uint64_t, void))(a1 + 2584))(v9, *(void *)(a1 + 2568));
    }
  }
  if (!a2)
  {
    char v10 = *(unsigned char *)(v7 + 216);
    if ((v10 & 1) == 0) {
      goto LABEL_16;
    }
LABEL_18:
    char v12 = 0;
    unint64_t v11 = (void *)(a1 + 2712);
    goto LABEL_19;
  }
  char v10 = *(unsigned char *)(v7 + 216);
  if (v10)
  {
    if ((((*(unsigned char *)(a1 + 2932) == 0) ^ a2) & 1) == 0)
    {
      char v12 = 1;
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (((*(unsigned char *)(a1 + 2932) == 0) ^ a2))
  {
LABEL_16:
    char v12 = 0;
    unint64_t v11 = (void *)(a1 + 2704);
    goto LABEL_19;
  }
  unint64_t v11 = (void *)(a1 + 2696);
  char v12 = 1;
LABEL_19:
  --*v11;
LABEL_20:
  *(unsigned char *)(v7 + 216) = v10 | 2;
  if (*(unsigned char *)(a1 + 2930) == 1)
  {
LABEL_23:
    nghttp2_session_destroy_stream(a1, v7);
    return;
  }
  if ((*(unsigned char *)(a1 + 2916) & 0x10) != 0) {
    goto LABEL_23;
  }
  char v13 = *(unsigned char *)(a1 + 2932) ? v12 : 1;
  if ((v13 & 1) != 0
    || !*(void *)(v7 + 96) && !*(void *)(v7 + 104) && !*(void *)(v7 + 112) && !*(void *)(v7 + 120))
  {
    goto LABEL_23;
  }
  uint64_t v14 = *(void *)(a1 + 2624);
  if (v14)
  {
    *(void *)(v14 + 136) = v7;
    *(void *)(v7 + 128) = v14;
  }
  else
  {
    *(void *)(a1 + 2616) = v7;
  }
  *(void *)(a1 + 2624) = v7;
  ++*(void *)(a1 + 2728);
}

void nghttp2_session_destroy_stream(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 96) && !*(void *)(a2 + 104) && !*(void *)(a2 + 112) && !*(void *)(a2 + 120)
    || (nghttp2_stream_dep_remove(a2), !v4))
  {
    if (*(unsigned char *)(a2 + 218) && (*(unsigned char *)(a2 + 216) & 0x10) != 0) {
      session_ob_data_remove(a1, a2);
    }
    uint64_t v5 = *(void *)(a1 + 16);
    if (v5)
    {
      int v6 = *(_DWORD *)(a2 + 168);
      int v7 = *(_DWORD *)(a1 + 28);
      uint64_t v8 = (-1640531527 * v6) >> -(char)v7;
      uint64_t v9 = *(void *)a1;
      if (*(void *)(*(void *)a1 + 16 * v8 + 8))
      {
        char v10 = 32 - v7;
        int v11 = *(_DWORD *)(a1 + 24);
        unsigned int v12 = v11 - 1;
        uint64_t v13 = -1;
        do
        {
          if (++v13 > (unint64_t)((v8 - (*(_DWORD *)(v9 + 16 * v8) >> v10)) & v12)) {
            break;
          }
          uint64_t v14 = v9 + 16 * v8;
          if (*(_DWORD *)(v14 + 4) == v6)
          {
            uint64_t v15 = (v8 + 1) & v12;
            uint64_t v16 = v9 + 16 * v15;
            *(void *)uint64_t v14 = 0;
            *(void *)(v14 + 8) = 0;
            if (*(void *)(v16 + 8))
            {
              do
              {
                if (((v15 - (*(_DWORD *)v16 >> -*(unsigned char *)(a1 + 28))) & (v11 - 1)) == 0) {
                  break;
                }
                *(_OWORD *)(v9 + 16 * v8) = *(_OWORD *)v16;
                *(_DWORD *)uint64_t v16 = 0;
                uint64_t v17 = v9 + 16 * v15;
                *(_DWORD *)(v17 + 4) = 0;
                *(void *)(v17 + 8) = 0;
                int v11 = *(_DWORD *)(a1 + 24);
                uint64_t v8 = v15;
                uint64_t v15 = (v15 + 1) & (v11 - 1);
                uint64_t v9 = *(void *)a1;
                uint64_t v16 = *(void *)a1 + 16 * v15;
              }
              while (*(void *)(v16 + 8));
              uint64_t v5 = *(void *)(a1 + 16);
            }
            *(void *)(a1 + 16) = v5 - 1;
            break;
          }
          uint64_t v8 = (v8 + 1) & v12;
        }
        while (*(void *)(v9 + 16 * v8 + 8));
      }
    }
    (*(void (**)(void, void))(*(void *)(a2 + 16) + 16))(*(void *)(a2 + 8), **(void **)(a2 + 16));
    *(void *)(a2 + 8) = 0;
    (*(void (**)(uint64_t, void))(a1 + 2584))(a2, *(void *)(a1 + 2568));
  }
}

double nghttp2_stream_dep_remove(uint64_t a1)
{
  int v2 = -*(_DWORD *)(a1 + 192);
  uint64_t v3 = *(void *)(a1 + 104);
  if (!v3)
  {
LABEL_8:
    int v7 = (uint64_t *)(a1 + 96);
    uint64_t v6 = *(void *)(a1 + 96);
    if (!v6) {
      __assert_rtn("nghttp2_stream_dep_remove", "nghttp2_stream.c", 792, "stream->dep_prev");
    }
    *(_DWORD *)(v6 + 200) += v2;
    if (*(unsigned char *)(a1 + 218)) {
      stream_obq_remove(a1);
    }
    uint64_t v8 = *(void *)(a1 + 112);
    if (!v8)
    {
      uint64_t v13 = *(void *)(a1 + 96);
      if (!v13) {
        __assert_rtn("unlink_dep", "nghttp2_stream.c", 719, "prev");
      }
      uint64_t v14 = *(void *)(a1 + 104);
      if (v14)
      {
        *(void *)(v13 + 104) = v14;
        *(void *)(v14 + 96) = v13;
        uint64_t v15 = *v7;
        uint64_t v16 = v14;
        do
        {
          *(void *)(v16 + 96) = v15;
          uint64_t v16 = *(void *)(v16 + 120);
        }
        while (v16);
        uint64_t v17 = *(void *)(a1 + 120);
        if (v17)
        {
          do
          {
            uint64_t v18 = v14;
            uint64_t v14 = *(void *)(v14 + 120);
          }
          while (v14);
          *(void *)(v18 + 120) = v17;
          *(void *)(v17 + 112) = v18;
        }
      }
      else
      {
        uint64_t v19 = *(void *)(a1 + 120);
        if (v19)
        {
          *(void *)(v19 + 112) = 0;
          *(void *)(v13 + 104) = v19;
          *(void *)(v19 + 96) = v13;
        }
        else
        {
          *(void *)(v13 + 104) = 0;
        }
      }
      goto LABEL_27;
    }
    uint64_t v9 = *(void *)(a1 + 104);
    if (v9)
    {
      *(void *)(v8 + 120) = v9;
      *(void *)(v9 + 112) = v8;
      uint64_t v10 = v9;
      uint64_t v11 = *v7;
      do
      {
        *(void *)(v10 + 96) = v11;
        uint64_t v10 = *(void *)(v10 + 120);
      }
      while (v10);
      uint64_t v12 = *(void *)(a1 + 120);
      if (!v12) {
        goto LABEL_27;
      }
      do
      {
        uint64_t v8 = v9;
        uint64_t v9 = *(void *)(v9 + 120);
      }
      while (v9);
      *(void *)(v8 + 120) = v12;
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 120);
      *(void *)(v8 + 120) = v12;
      if (!v12)
      {
LABEL_27:
        *(_DWORD *)(a1 + 200) = 0;
        double result = 0.0;
        *(_OWORD *)int v7 = 0u;
        *(_OWORD *)(a1 + 112) = 0u;
        return result;
      }
    }
    *(void *)(v12 + 112) = v8;
    goto LABEL_27;
  }
  while (1)
  {
    int v4 = *(_DWORD *)(a1 + 192) * *(_DWORD *)(v3 + 192) / *(_DWORD *)(a1 + 200) <= 1
       ? 1
       : *(_DWORD *)(a1 + 192) * *(_DWORD *)(v3 + 192) / *(_DWORD *)(a1 + 200);
    *(_DWORD *)(v3 + 192) = v4;
    if (*(unsigned char *)(v3 + 218))
    {
      if (stream_obq_move(*(void *)(a1 + 96), a1, v3)) {
        return result;
      }
    }
    v2 += v4;
    uint64_t v3 = *(void *)(v3 + 120);
    if (!v3) {
      goto LABEL_8;
    }
  }
}

uint64_t session_resume_deferred_stream_item(uint64_t a1, uint64_t a2, char a3)
{
  if (!*(void *)(a2 + 152)) {
    __assert_rtn("nghttp2_stream_resume_deferred_item", "nghttp2_stream.c", 533, "stream->item");
  }
  char v5 = *(unsigned char *)(a2 + 216) & ~a3;
  *(unsigned char *)(a2 + 216) = v5;
  if ((v5 & 0x1C) == 0)
  {
    uint64_t result = stream_obq_push(*(void *)(a2 + 96), (uint64_t *)a2);
    if (result) {
      return result;
    }
    char v5 = *(unsigned char *)(a2 + 216);
  }
  if ((v5 & 0x1C) != 0x10) {
    return 0;
  }

  return session_ob_data_push(a1, a2);
}

uint64_t session_process_window_update_frame(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = a1 + 728;
  unsigned int v3 = **(_DWORD **)(a1 + 848) & 0xFFFFFF7F;
  unsigned int v4 = bswap32(v3);
  *(_DWORD *)(a1 + 744) = v4;
  int v5 = *(_DWORD *)(a1 + 736);
  if (!v5)
  {
    if (v3)
    {
      int v8 = *(_DWORD *)(a1 + 2828);
      if ((int)(v4 ^ 0x7FFFFFFF) < v8)
      {
        uint64_t v9 = a1 + 728;
        uint64_t v10 = 4294966772;
        uint64_t v11 = 0;
LABEL_30:
        return session_handle_invalid_connection(a1, v9, v10, v11);
      }
      *(_DWORD *)(a1 + 2828) = v8 + v4;
      goto LABEL_18;
    }
LABEL_28:
    uint64_t v11 = "WINDOW_UPDATE: window_size_increment == 0";
    goto LABEL_29;
  }
  int v6 = *(unsigned __int8 *)(a1 + 2932);
  if ((*(_DWORD *)(a1 + 736) & 1) == (*(unsigned char *)(a1 + 2932) == 0)) {
    int v7 = *(_DWORD *)(a1 + 2804);
  }
  else {
    int v7 = *(_DWORD *)(a1 + 2808);
  }
  if (v7 < v5)
  {
    uint64_t v11 = "WINDOW_UPDATE to idle stream";
LABEL_29:
    a1 = v1;
    uint64_t v9 = v2;
    uint64_t v10 = 4294966791;
    goto LABEL_30;
  }
  uint64_t result = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
  if (!result) {
    return result;
  }
  char v13 = *(unsigned char *)(result + 216);
  if ((v13 & 2) != 0) {
    return 0;
  }
  int v14 = *(_DWORD *)(result + 204);
  if (v14 == 5) {
    return 0;
  }
  if (v14 == 4 && (!*(_DWORD *)(result + 168) || (*(_DWORD *)(result + 168) & 1) != (v6 == 0)))
  {
    uint64_t v11 = "WINDOW_UPADATE to reserved stream";
    goto LABEL_29;
  }
  if (!v3) {
    goto LABEL_28;
  }
  int v16 = *(_DWORD *)(result + 172);
  if ((int)(v4 ^ 0x7FFFFFFF) >= v16)
  {
    int v17 = v16 + v4;
    *(_DWORD *)(result + 172) = v17;
    if (v17 >= 1)
    {
      if (*(void *)(result + 152))
      {
        if ((v13 & 4) != 0)
        {
          uint64_t result = session_resume_deferred_stream_item(v1, result, 4);
          if ((int)result < -900) {
            return result;
          }
        }
      }
    }
LABEL_18:
    uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, void))(v1 + 2376);
    if (v15 && v15(v1, v2, *(void *)(v1 + 2608))) {
      return 4294966394;
    }
    return 0;
  }

  return session_handle_invalid_stream2(v1, v5, v2, 4294966772);
}

uint64_t nghttp2_session_set_next_stream_id(uint64_t a1, int a2)
{
  if (a2 >= 1 && *(_DWORD *)(a1 + 2800) <= a2)
  {
    if (*(unsigned char *)(a1 + 2932))
    {
      if ((a2 & 1) == 0)
      {
LABEL_5:
        uint64_t result = 0;
        *(_DWORD *)(a1 + 2800) = a2;
        return result;
      }
    }
    else if (a2)
    {
      goto LABEL_5;
    }
  }
  return 4294966795;
}

uint64_t nghttp2_priority_spec_init(uint64_t result, int a2, int a3, int a4)
{
  *(_DWORD *)uint64_t result = a2;
  *(_DWORD *)(result + 4) = a3;
  *(unsigned char *)(result + 8) = a4 != 0;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_stream_close_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 80) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_invalid_header_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 112) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_invalid_frame_recv_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_header_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 96) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_frame_send_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 64) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_frame_not_send_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 72) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_data_chunk_recv_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_begin_headers_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 88) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_error_callback2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 216) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_before_frame_send_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 56) = a2;
  return result;
}

uint64_t session_new(uint64_t *a1, _OWORD *a2, uint64_t a3, int a4, long long *a5, uint64_t (**a6)(uint64_t, uint64_t, void))
{
  if (a6) {
    uint64_t v11 = a6;
  }
  else {
    uint64_t v11 = (uint64_t (**)(uint64_t, uint64_t, void))&mem_default;
  }
  uint64_t v12 = v11[3](1, 2968, *v11);
  *a1 = v12;
  if (!v12) {
    return 4294966395;
  }
  long long v13 = *(_OWORD *)v11;
  long long v14 = *((_OWORD *)v11 + 1);
  *(void *)(v12 + 2600) = v11[4];
  *(_OWORD *)(v12 + 2568) = v13;
  *(_OWORD *)(v12 + 2584) = v14;
  uint64_t v15 = *a1;
  int v16 = (uint64_t *)(*a1 + 2568);
  *(void *)(v15 + 40) = 0;
  *(void *)(v15 + 48) = v16;
  *(void *)(v15 + 56) = 0;
  *(void *)(v15 + 64) = 0;
  *(void *)(v15 + 72) = stream_less;
  *(_DWORD *)(v15 + 200) = 0;
  *(unsigned char *)(v15 + 248) = 0;
  *(_DWORD *)(v15 + 232) = 0;
  *(_DWORD *)(v15 + 236) = 5;
  *(_OWORD *)(v15 + 160) = 0u;
  *(_OWORD *)(v15 + 176) = 0u;
  *(_OWORD *)(v15 + 128) = 0u;
  *(_OWORD *)(v15 + 144) = 0u;
  *(void *)(v15 + 204) = 0;
  *(void *)(v15 + 212) = 0;
  *(void *)(v15 + 220) = 0x1000000000;
  *(_DWORD *)(v15 + 244) = 0;
  *(_WORD *)(v15 + 240) = -1;
  *(_DWORD *)(v15 + 228) = 0;
  *(void *)(v15 + 192) = 0;
  *(_OWORD *)(v15 + 80) = xmmword_20DB443D0;
  *(_OWORD *)(v15 + 96) = 0u;
  *(_OWORD *)(v15 + 112) = 0u;
  *(unsigned char *)(v15 + 253) = 3;
  *(_DWORD *)(v15 + 249) = 50331648;
  uint64_t v17 = *a1;
  uint64_t v18 = (_OWORD *)(*a1 + 2820);
  *(_DWORD *)(v17 + 2836) = 0;
  *(void *)(v17 + 2840) = 0xFFFF00000000;
  *(unsigned char *)(v17 + 2933) = 0;
  *uint64_t v18 = xmmword_20DB443E0;
  *(_DWORD *)(v17 + 2920) = -1;
  *(unsigned char *)(v17 + 2928) = 1;
  *(unsigned char *)(v17 + 2930) = -1;
  *(_OWORD *)(v17 + 2656) = xmmword_20DB443F0;
  *(_OWORD *)(v17 + 2672) = xmmword_20DB44400;
  if (a4) {
    *(unsigned char *)(v17 + 2932) = 1;
  }
  *(void *)(v17 + 2868) = 0xFFFFFFFF00004000;
  *(_OWORD *)(v17 + 2880) = xmmword_20DB44410;
  *(void *)(v17 + 2896) = 0x40000000FFFFLL;
  *(_DWORD *)(v17 + 2904) = -1;
  *(_DWORD *)(v17 + 2912) = -1;
  *(void *)(v17 + 2720) = 200;
  v18[2] = xmmword_20DB44420;
  *(void *)(v17 + 2760) = 1000;
  *(_OWORD *)(v17 + 2768) = xmmword_20DB44430;
  *(void *)(v17 + 2784) = 8;
  if (a5)
  {
    int v19 = *((_DWORD *)a5 + 14);
    if ((v19 & 1) != 0 && *((_DWORD *)a5 + 18)) {
      *(_DWORD *)(v17 + 2916) |= 1u;
    }
    if ((v19 & 2) != 0)
    {
      *(_DWORD *)(v17 + 2860) = *((_DWORD *)a5 + 15);
      if ((v19 & 0x10) == 0)
      {
LABEL_13:
        if ((v19 & 4) == 0) {
          goto LABEL_21;
        }
LABEL_19:
        if (*((_DWORD *)a5 + 19)) {
          *(_DWORD *)(v17 + 2916) |= 2u;
        }
LABEL_21:
        if ((v19 & 8) != 0 && *((_DWORD *)a5 + 20)) {
          *(_DWORD *)(v17 + 2916) |= 4u;
        }
        if ((v19 & 0x20) != 0)
        {
          long long v22 = *(long long *)((char *)a5 + 120);
          *(_OWORD *)(v17 + 2935) = *(long long *)((char *)a5 + 104);
          *(_OWORD *)(v17 + 2951) = v22;
          int v19 = *((_DWORD *)a5 + 14);
          if ((v19 & 0x80) == 0)
          {
LABEL_26:
            if ((v19 & 0x40) == 0) {
              goto LABEL_32;
            }
            goto LABEL_30;
          }
        }
        else if ((v19 & 0x80) == 0)
        {
          goto LABEL_26;
        }
        *(_DWORD *)(*a1 + 2924) = *((_DWORD *)a5 + 17);
        if ((v19 & 0x40) == 0) {
          goto LABEL_32;
        }
LABEL_30:
        if (*((_DWORD *)a5 + 21)) {
          *(_DWORD *)(*a1 + 2916) |= 8u;
        }
LABEL_32:
        if ((v19 & 0x100) != 0) {
          *(void *)(*a1 + 2768) = *((void *)a5 + 2);
        }
        if ((v19 & 0x200) != 0)
        {
          unint64_t v21 = *((void *)a5 + 3);
          if ((v19 & 0x400) == 0) {
            goto LABEL_40;
          }
        }
        else
        {
          unint64_t v21 = 4096;
          if ((v19 & 0x400) == 0) {
            goto LABEL_40;
          }
        }
        if (*((_DWORD *)a5 + 22)) {
          *(_DWORD *)(*a1 + 2916) |= 0x10u;
        }
LABEL_40:
        if ((v19 & 0x800) != 0) {
          *(void *)(*a1 + 2760) = *((void *)a5 + 4);
        }
        if ((v19 & 0x1000) != 0)
        {
          uint64_t v23 = *((void *)a5 + 5);
          if (v23) {
            *(void *)(*a1 + 2776) = v23;
          }
        }
        if ((v19 & 0x2000) != 0 && *((_DWORD *)a5 + 24)) {
          *(_DWORD *)(*a1 + 2916) |= 0x20u;
        }
        if ((v19 & 0x4000) != 0 && *((_DWORD *)a5 + 25)) {
          *(_DWORD *)(*a1 + 2916) |= 0x40u;
        }
        if ((v19 & 0x8000) != 0)
        {
          uint64_t v24 = *a1;
          long long v25 = *a5;
          *(void *)(v24 + 2672) = *(void *)a5;
          *(_OWORD *)(v24 + 2656) = v25;
          *(void *)(v24 + 2680) = 0;
          if ((v19 & 0x10000) == 0)
          {
LABEL_53:
            if ((v19 & 0x80000000) == 0)
            {
LABEL_54:
              uint64_t v17 = *a1;
              goto LABEL_59;
            }
LABEL_57:
            uint64_t v17 = *a1;
            if (*((_DWORD *)a5 + 23)) {
              *(_DWORD *)(v17 + 2916) |= 0x80u;
            }
            goto LABEL_59;
          }
        }
        else if ((v19 & 0x10000) == 0)
        {
          goto LABEL_53;
        }
        *(void *)(*a1 + 2784) = *((void *)a5 + 6);
        if ((v19 & 0x80000000) == 0) {
          goto LABEL_54;
        }
        goto LABEL_57;
      }
    }
    else if ((v19 & 0x10) == 0)
    {
      goto LABEL_13;
    }
    *(void *)(v17 + 2720) = *((unsigned int *)a5 + 16);
    if ((v19 & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  unint64_t v21 = 4096;
LABEL_59:
  uint64_t v20 = nghttp2_hd_deflate_init2(v17 + 992, v21, (uint64_t)v16);
  if (v20)
  {
LABEL_70:
    (*(void (**)(uint64_t, void))(v15 + 2584))(*a1, *(void *)(v15 + 2568));
    return v20;
  }
  uint64_t v20 = nghttp2_hd_inflate_init(*a1 + 2104, (uint64_t)v16);
  if (v20)
  {
LABEL_69:
    hd_context_free((uint64_t *)(*a1 + 992));
    goto LABEL_70;
  }
  uint64_t v26 = *a1;
  unint64_t v27 = *(void *)(*a1 + 2768) + 16393;
  if (v27 < 0x400A) {
    unint64_t v28 = 1;
  }
  else {
    unint64_t v28 = v27 / 0x400A;
  }
  if (!v28)
  {
    uint64_t v20 = 4294966795;
    goto LABEL_68;
  }
  uint64_t v47 = 0;
  uint64_t v29 = buf_chain_new(&v47, 16394, v16);
  if (v29)
  {
    uint64_t v20 = v29;
    uint64_t v26 = *a1;
LABEL_68:
    nghttp2_hd_inflate_free((uint64_t *)(v26 + 2104));
    goto LABEL_69;
  }
  *(void *)(v26 + 672) = v16;
  uint64_t v31 = v47;
  *(void *)(v26 + 656) = v47;
  *(void *)(v26 + 664) = v31;
  *(int64x2_t *)(v31 + 24) = vaddq_s64(*(int64x2_t *)(v31 + 24), vdupq_n_s64(0xAuLL));
  *(void *)(v26 + 680) = 16394;
  *(void *)(v26 + 696) = 1;
  *(void *)(v26 + 688) = v28;
  *(_OWORD *)(v26 + 704) = xmmword_20DB44440;
  uint64_t v32 = (void *)*a1;
  void *v32 = 0;
  v32[1] = v16;
  v32[2] = 0;
  v32[3] = 0;
  active_outbound_item_reset((uint64_t *)(*a1 + 648), v16);
  unint64_t v33 = (_OWORD *)(*a1 + 2344);
  long long v34 = a2[1];
  *unint64_t v33 = *a2;
  v33[1] = v34;
  long long v35 = a2[2];
  long long v36 = a2[3];
  long long v37 = a2[5];
  v33[4] = a2[4];
  v33[5] = v37;
  v33[2] = v35;
  v33[3] = v36;
  long long v38 = a2[6];
  long long v39 = a2[7];
  long long v40 = a2[9];
  v33[8] = a2[8];
  v33[9] = v40;
  v33[6] = v38;
  v33[7] = v39;
  long long v41 = a2[10];
  long long v42 = a2[11];
  long long v43 = a2[13];
  v33[12] = a2[12];
  v33[13] = v43;
  v33[10] = v41;
  v33[11] = v42;
  *(void *)(*a1 + 2608) = a3;
  session_inbound_frame_reset(*a1);
  uint64_t v44 = *a1;
  if (a4)
  {
    if ((*(unsigned char *)(v44 + 2916) & 2) != 0)
    {
      *(_DWORD *)(v44 + 952) = 1;
    }
    else
    {
      *(_DWORD *)(v44 + 952) = 0;
      *(void *)(v44 + 936) = 24;
    }
  }
  else
  {
    *(_DWORD *)(v44 + 952) = 1;
    *(_DWORD *)(v44 + 720) = 3;
    nghttp2_bufs_add(v44 + 656, "PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n", 0x18uLL);
  }
  for (uint64_t i = 328; i != 648; i += 40)
  {
    uint64_t v20 = 0;
    unint64_t v46 = (void *)(*a1 + i);
    void *v46 = 0;
    v46[1] = v16;
    v46[2] = 0;
    v46[3] = 0;
    v46[4] = stream_less_215;
  }
  return v20;
}

uint64_t nghttp2_session_on_settings_received(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a2;
  uint64_t v4 = a1;
  if (*(_DWORD *)(a2 + 8))
  {
    int v5 = "SETTINGS: stream_id != 0";
LABEL_3:
    uint64_t v6 = 4294966791;
LABEL_4:
    return session_handle_invalid_connection(a1, a2, v6, v5);
  }
  if (*(unsigned char *)(a2 + 13))
  {
    if (*(void *)(a2 + 16))
    {
      int v5 = "SETTINGS: ACK and payload != 0";
      uint64_t v6 = 4294966774;
      goto LABEL_4;
    }
    uint64_t v31 = *(void **)(a1 + 2648);
    if (!v31)
    {
      int v5 = "SETTINGS: unexpected ACK";
      goto LABEL_3;
    }
    uint64_t v32 = v31[2];
    if (!v32) {
      goto LABEL_91;
    }
    unsigned int v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = v31[1];
    unsigned int v36 = -1;
    char v37 = 1;
    int v38 = -1;
LABEL_59:
    long long v39 = (int *)(v35 + 4 + 8 * v34);
    while (1)
    {
      int v40 = *(v39 - 1);
      if (v40 == 4)
      {
        int v38 = *v39;
      }
      else if (v40 == 1)
      {
        char v37 = 0;
        unsigned int v33 = *(_DWORD *)(v35 + 8 * v34 + 4);
        if (v36 >= v33) {
          unsigned int v36 = *(_DWORD *)(v35 + 8 * v34 + 4);
        }
        if (++v34 == v32)
        {
LABEL_75:
          if (v36 >= v33 || (uint64_t v20 = nghttp2_hd_inflate_change_table_size(a1 + 2104, v36), !v20))
          {
            uint64_t v20 = nghttp2_hd_inflate_change_table_size(v4 + 2104, v33);
            if (!v20) {
              goto LABEL_78;
            }
          }
          goto LABEL_92;
        }
        goto LABEL_59;
      }
      ++v34;
      v39 += 2;
      if (v32 == v34)
      {
        if ((v37 & 1) == 0) {
          goto LABEL_75;
        }
LABEL_78:
        if (v38 == -1
          || (int v41 = *(_DWORD *)(v4 + 2896),
              uint64_t v46 = v4,
              int v47 = v38,
              int v48 = v41,
              uint64_t v20 = nghttp2_map_each(v4, (uint64_t (*)(uint64_t, uint64_t))update_local_initial_window_size_func, (uint64_t)&v46), !v20))
        {
          long long v42 = (_DWORD *)(v35 + 4);
          do
          {
            long long v43 = (_DWORD *)(v4 + 2884);
            switch(*(v42 - 1))
            {
              case 1:
                goto LABEL_89;
              case 2:
                long long v43 = (_DWORD *)(v4 + 2888);
                goto LABEL_89;
              case 3:
                long long v43 = (_DWORD *)(v4 + 2892);
                goto LABEL_89;
              case 4:
                long long v43 = (_DWORD *)(v4 + 2896);
                goto LABEL_89;
              case 5:
                long long v43 = (_DWORD *)(v4 + 2900);
                goto LABEL_89;
              case 6:
                long long v43 = (_DWORD *)(v4 + 2904);
                goto LABEL_89;
              case 8:
                long long v43 = (_DWORD *)(v4 + 2908);
                goto LABEL_89;
              case 9:
                long long v43 = (_DWORD *)(v4 + 2912);
LABEL_89:
                *long long v43 = *v42;
                break;
              default:
                break;
            }
            v42 += 2;
            --v32;
          }
          while (v32);
LABEL_91:
          uint64_t v20 = 0;
        }
LABEL_92:
        *(void *)(v4 + 2648) = *v31;
        (*(void (**)(void, void))(v4 + 2584))(v31[1], *(void *)(v4 + 2568));
        (*(void (**)(void *, void))(v4 + 2584))(v31, *(void *)(v4 + 2568));
        if (v20)
        {
          if ((int)v20 < -900) {
            return v20;
          }
          a1 = v4;
          a2 = v3;
          uint64_t v6 = v20;
          int v5 = 0;
          goto LABEL_4;
        }
LABEL_95:
        uint64_t v44 = *(unsigned int (**)(uint64_t, uint64_t, void))(v4 + 2376);
        if (v44 && v44(v4, v3, *(void *)(v4 + 2608))) {
          return 4294966394;
        }
        else {
          return 0;
        }
      }
    }
  }
  if (!*(unsigned char *)(a1 + 2848))
  {
    *(_DWORD *)(a1 + 2860) = -1;
    *(unsigned char *)(a1 + 2848) = 1;
  }
  if (!*(void *)(a2 + 16))
  {
LABEL_48:
    if (*(_DWORD *)(v4 + 2880) == -1)
    {
      *(_DWORD *)(v4 + 2880) = 0;
      if (*(unsigned char *)(v4 + 2932))
      {
        if (*(unsigned char *)(v4 + 2930) && (*(unsigned char *)(v4 + 2916) & 0x20) != 0) {
          *(unsigned char *)(v4 + 2931) = 1;
        }
      }
    }
    if (!a3 && !session_is_closing(v4))
    {
      uint64_t v27 = nghttp2_session_add_settings(v4, 1, 0, 0);
      if (v27)
      {
        uint64_t v20 = v27;
        if ((int)v27 >= -900)
        {
          uint64_t v28 = v4;
          uint64_t v29 = v3;
          uint64_t v30 = 4294966762;
          goto LABEL_107;
        }
        return v20;
      }
    }
    goto LABEL_95;
  }
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  while (1)
  {
    uint64_t v11 = *(void *)(v3 + 24);
    switch(*(_DWORD *)(v11 + v9))
    {
      case 1:
        uint64_t v12 = v11 + v9;
        unint64_t v13 = *(unsigned int *)(v11 + v9 + 4);
        if (v13 >= *(void *)(v4 + 2080)) {
          unint64_t v13 = *(void *)(v4 + 2080);
        }
        *(void *)(v4 + 1040) = v13;
        if (*(void *)(v4 + 2088) < v13) {
          unint64_t v13 = *(void *)(v4 + 2088);
        }
        *(void *)(v4 + 2088) = v13;
        *(unsigned char *)(v4 + 2096) = 1;
        hd_context_shrink_table_size((void *)(v4 + 992), v4 + 1056);
        *(_DWORD *)(v4 + 2852) = *(_DWORD *)(v12 + 4);
        goto LABEL_47;
      case 2:
        unsigned int v14 = *(_DWORD *)(v11 + v9 + 4);
        if (v14 >= 2)
        {
          unint64_t v45 = "SETTINGS: invalid SETTINGS_ENBLE_PUSH";
LABEL_108:
          uint64_t v28 = v4;
          uint64_t v29 = v3;
          uint64_t v30 = 4294966791;
          return session_handle_invalid_connection(v28, v29, v30, v45);
        }
        if (v14) {
          BOOL v15 = *(unsigned char *)(v4 + 2932) == 0;
        }
        else {
          BOOL v15 = 0;
        }
        if (v15)
        {
          unint64_t v45 = "SETTINGS: server attempted to enable push";
          goto LABEL_108;
        }
        *(_DWORD *)(v4 + 2856) = v14;
LABEL_47:
        ++v10;
        v9 += 8;
        if (v10 >= *(void *)(v3 + 16)) {
          goto LABEL_48;
        }
        break;
      case 3:
        *(_DWORD *)(v4 + 2860) = *(_DWORD *)(v11 + v9 + 4);
        goto LABEL_47;
      case 4:
        uint64_t v16 = v11 + v9;
        int v17 = *(_DWORD *)(v11 + v9 + 4);
        if (v17 < 0)
        {
          unint64_t v45 = "SETTINGS: too large SETTINGS_INITIAL_WINDOW_SIZE";
          uint64_t v28 = v4;
          uint64_t v29 = v3;
          uint64_t v30 = 4294966772;
          return session_handle_invalid_connection(v28, v29, v30, v45);
        }
        uint64_t v46 = v4;
        int v18 = *(_DWORD *)(v4 + 2864);
        int v47 = v17;
        int v48 = v18;
        uint64_t v19 = nghttp2_map_each(v4, update_remote_initial_window_size_func, (uint64_t)&v46);
        uint64_t v20 = v19;
        if ((int)v19 < -900) {
          return v20;
        }
        if (!v19)
        {
          *(_DWORD *)(v4 + 2864) = *(_DWORD *)(v16 + 4);
          goto LABEL_47;
        }
        uint64_t v28 = v4;
        uint64_t v29 = v3;
        uint64_t v30 = 4294966772;
LABEL_107:
        unint64_t v45 = 0;
        return session_handle_invalid_connection(v28, v29, v30, v45);
      case 5:
        int v21 = *(_DWORD *)(v11 + v9 + 4);
        if ((v21 - 0x1000000) > 0xFF003FFF)
        {
          *(_DWORD *)(v4 + 2868) = v21;
          goto LABEL_47;
        }
        unint64_t v45 = "SETTINGS: invalid SETTINGS_MAX_FRAME_SIZE";
        goto LABEL_108;
      case 6:
        *(_DWORD *)(v4 + 2872) = *(_DWORD *)(v11 + v9 + 4);
        goto LABEL_47;
      case 8:
        unsigned int v22 = *(_DWORD *)(v11 + v9 + 4);
        if (v22 >= 2)
        {
          unint64_t v45 = "SETTINGS: invalid SETTINGS_ENABLE_CONNECT_PROTOCOL";
        }
        else
        {
          if (*(unsigned char *)(v4 + 2932) || (!v22 ? (BOOL v23 = *(_DWORD *)(v4 + 2876) == 0) : (BOOL v23 = 1), v23))
          {
            *(_DWORD *)(v4 + 2876) = v22;
            goto LABEL_47;
          }
          unint64_t v45 = "SETTINGS: server attempted to disable SETTINGS_ENABLE_CONNECT_PROTOCOL";
        }
        goto LABEL_108;
      case 9:
        unsigned int v24 = *(_DWORD *)(v11 + v9 + 4);
        if (v24 >= 2)
        {
          unint64_t v45 = "SETTINGS: invalid SETTINGS_NO_RFC7540_PRIORITIES";
        }
        else
        {
          int v25 = *(_DWORD *)(v4 + 2880);
          if (v25 == -1 || v25 == v24)
          {
            *(_DWORD *)(v4 + 2880) = v24;
            goto LABEL_47;
          }
          unint64_t v45 = "SETTINGS: SETTINGS_NO_RFC7540_PRIORITIES cannot be changed";
        }
        goto LABEL_108;
      default:
        goto LABEL_47;
    }
  }
}

uint64_t nghttp2_session_predicate_data_send(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 4294966786;
  }
  if (session_is_closing(a1)) {
    return 4294966766;
  }
  if ((*(unsigned char *)(a2 + 217) & 2) != 0) {
    return 4294966784;
  }
  int v5 = *(_DWORD *)(a2 + 168);
  if (v5 && ((v5 ^ (*(unsigned char *)(a1 + 2932) == 0)) & 1) == 0)
  {
    int v8 = *(_DWORD *)(a2 + 204);
    if (v8 == 4) {
      unsigned int v9 = -514;
    }
    else {
      unsigned int v9 = 0;
    }
    if (v8 == 3) {
      return 4294966785;
    }
    else {
      return v9;
    }
  }
  else
  {
    int v6 = *(_DWORD *)(a2 + 204);
    if (v6 == 3) {
      unsigned int v7 = -511;
    }
    else {
      unsigned int v7 = -514;
    }
    if (v6 == 2) {
      return 0;
    }
    else {
      return v7;
    }
  }
}

uint64_t nghttp2_session_send(void *a1)
{
  uint64_t v8 = 0;
  while (1)
  {
    uint64_t v2 = nghttp2_session_mem_send_internal((uint64_t)a1, &v8, 0);
    if (v2 <= 0) {
      break;
    }
    uint64_t v3 = (uint64_t (*)(void *, uint64_t, uint64_t, void, void))a1[294];
    if (!v3) {
      uint64_t v3 = (uint64_t (*)(void *, uint64_t, uint64_t, void, void))a1[293];
    }
    uint64_t v4 = v3(a1, v8, v2, 0, a1[326]);
    if (v4 < 0)
    {
      if (v4 != -504) {
        return 4294966394;
      }
      uint64_t v5 = a1[83];
      uint64_t v6 = *(void *)(v5 + 24) - v2;
      uint64_t v2 = 0;
      *(void *)(v5 + 24) = v6;
      return v2;
    }
    *(void *)(a1[83] + 24) += v4 - v2;
  }
  return v2;
}

uint64_t nghttp2_session_mem_send2(uint64_t a1, void *a2)
{
  *a2 = 0;
  uint64_t v3 = nghttp2_session_mem_send_internal(a1, a2, 1);
  if (v3 >= 1)
  {
    if (*(void *)(a1 + 648))
    {
      session_after_frame_sent1(a1);
      if ((v4 & 0x80000000) != 0)
      {
        if (v4 >= 0xFFFFFC7C) {
          __assert_rtn("nghttp2_session_mem_send2", "nghttp2_session.c", 3589, "nghttp2_is_fatal(rv)");
        }
        return (int)v4;
      }
    }
  }
  return v3;
}

uint64_t nghttp2_session_mem_send_internal(uint64_t a1, void *a2, uint64_t a3)
{
  nghttp2_session_adjust_idle_stream(a1);
  if ((int)result < -900) {
    return (int)result;
  }
  BOOL v118 = (uint64_t *)(a1 + 656);
  uint64_t v117 = a1 + 992;
  while (2)
  {
    switch(*(_DWORD *)(a1 + 720))
    {
      case 0:
        uint64_t v7 = *(void *)(a1 + 256);
        if (v7)
        {
          uint64_t v8 = *(void *)(v7 + 144);
          *(void *)(a1 + 256) = v8;
          *(void *)(v7 + 144) = 0;
          unsigned int v9 = (void *)(a1 + 272);
          unint64_t v10 = (void *)(a1 + 264);
          if (v8)
          {
LABEL_7:
            --*v9;
            *(unsigned char *)(v7 + 152) = 0;
            goto LABEL_8;
          }
LABEL_6:
          *unint64_t v10 = 0;
          goto LABEL_7;
        }
        uint64_t v7 = *(void *)(a1 + 280);
        if (v7)
        {
          uint64_t v23 = *(void *)(v7 + 144);
          *(void *)(a1 + 280) = v23;
          *(void *)(v7 + 144) = 0;
          unsigned int v9 = (void *)(a1 + 296);
          unint64_t v10 = (void *)(a1 + 288);
          if (v23) {
            goto LABEL_7;
          }
          goto LABEL_6;
        }
        if (*(void *)(a1 + 2696) < (unint64_t)*(unsigned int *)(a1 + 2860))
        {
          uint64_t v7 = *(void *)(a1 + 304);
          if (v7)
          {
            uint64_t v24 = *(void *)(v7 + 144);
            *(void *)(a1 + 304) = v24;
            *(void *)(v7 + 144) = 0;
            unsigned int v9 = (void *)(a1 + 320);
            unint64_t v10 = (void *)(a1 + 312);
            if (v24) {
              goto LABEL_7;
            }
            goto LABEL_6;
          }
        }
        if (*(int *)(a1 + 2828) < 1) {
          return 0;
        }
        uint64_t v25 = a1 + 32;
        do
        {
          uint64_t v7 = *(void *)(v25 + 152);
          if (v7 && (*(unsigned char *)(v25 + 216) & 0xC) == 0)
          {
            for (uint64_t i = *(void *)(v25 + 96); i; uint64_t i = *(void *)(i + 96))
            {
              *(void *)(i + 64) = *(void *)(v25 + 72);
              uint64_t v25 = i;
            }
            goto LABEL_8;
          }
          if (!*(void *)(v25 + 24)) {
            break;
          }
          uint64_t v25 = **(void **)(v25 + 8);
        }
        while (v25);
        uint64_t v26 = 0;
        while (1)
        {
          if (*(void *)(a1 + v26 + 344))
          {
            uint64_t v27 = **(void **)(a1 + v26 + 328);
            if (v27) {
              break;
            }
          }
          v26 += 40;
          if (v26 == 320) {
            return 0;
          }
        }
        uint64_t v7 = *(void *)(v27 + 152);
        if (v7)
        {
LABEL_8:
          int v11 = *(unsigned __int8 *)(v7 + 12);
          switch(*(unsigned char *)(v7 + 12))
          {
            case 0:
              int v12 = *(_DWORD *)(v7 + 8);
              uint64_t v13 = nghttp2_map_find((uint64_t *)a1, v12);
              if (!v13 || (uint64_t v14 = v13, (*(unsigned char *)(v13 + 216) & 2) != 0) || *(_DWORD *)(v13 + 204) == 5)
              {
                uint64_t v15 = 4294966786;
LABEL_13:
                uint64_t v14 = nghttp2_map_find((uint64_t *)a1, v12);
                if (!v14) {
                  goto LABEL_252;
                }
LABEL_14:
                session_detach_stream_item(a1, v14);
                goto LABEL_252;
              }
              if (*(void *)(v13 + 152) != v7) {
                __assert_rtn("session_prep_frame", "nghttp2_session.c", 2367, "stream->item == item");
              }
              uint64_t v15 = nghttp2_session_predicate_data_send(a1, v13);
              if (v15) {
                goto LABEL_13;
              }
              int v81 = *(_DWORD *)(v14 + 172);
              int v82 = *(_DWORD *)(a1 + 2828);
              if (v81 >= v82) {
                int v81 = *(_DWORD *)(a1 + 2828);
              }
              if (v81 >= *(_DWORD *)(a1 + 2868)) {
                int v81 = *(_DWORD *)(a1 + 2868);
              }
              if (v81 >= 0x4000) {
                unint64_t v83 = 0x4000;
              }
              else {
                unint64_t v83 = v81;
              }
              if ((int)v83 <= 0)
              {
                if (v82 <= 0) {
                  __assert_rtn("session_prep_frame", "nghttp2_session.c", 2390, "session->remote_window_size > 0");
                }
                uint64_t v85 = a1;
                uint64_t v86 = v14;
                char v87 = 4;
LABEL_248:
                session_defer_stream_item(v85, v86, v87);
                *(void *)(a1 + 648) = 0;
                goto LABEL_27;
              }
              uint64_t v84 = nghttp2_session_pack_data(a1, v118, v83, v7, v7 + 96, v14);
              uint64_t v15 = v84;
              if ((int)v84 > -509)
              {
                if (!v84) {
                  goto LABEL_139;
                }
                if (v84 != -508) {
                  goto LABEL_14;
                }
                uint64_t v85 = a1;
                uint64_t v86 = v14;
                char v87 = 8;
                goto LABEL_248;
              }
              if (v84 != -521)
              {
                if (v84 == -526) {
                  return 0;
                }
                goto LABEL_14;
              }
              session_detach_stream_item(a1, v14);
              uint64_t v15 = nghttp2_session_add_rst_stream(a1, *(_DWORD *)(v7 + 8), 2);
              if ((int)v15 <= -901) {
                goto LABEL_252;
              }
              uint64_t v15 = 4294966775;
              goto LABEL_255;
            case 1:
              int v31 = *(_DWORD *)(v7 + 8);
              if (*(_DWORD *)(v7 + 56))
              {
                uint64_t v32 = a3;
                uint64_t v33 = nghttp2_map_find((uint64_t *)a1, v31);
                if (!v33 || (uint64_t v34 = v33, (*(unsigned char *)(v33 + 216) & 2) != 0) || (v35 = *(_DWORD *)(v33 + 204), v35 == 5))
                {
                  *(_DWORD *)(v7 + 56) = 3;
                  goto LABEL_118;
                }
                if (v35 == 4)
                {
                  uint64_t v15 = session_predicate_push_response_headers_send(a1, v33);
                  a3 = v32;
                  if (v15) {
                    goto LABEL_252;
                  }
                  *(_DWORD *)(v7 + 56) = 2;
                  uint64_t v36 = *(void *)(v7 + 120);
                  if (v36) {
                    *(void *)(v34 + 144) = v36;
                  }
                }
                else if (session_is_closing(a1) {
                       || (*(unsigned char *)(v34 + 217) & 2) != 0
                }
                       || !*(unsigned char *)(a1 + 2932) && (~*(_DWORD *)(a1 + 2916) & 0x84) != 0
                       || *(_DWORD *)(v34 + 168) && (*(unsigned char *)(a1 + 2932) == 0) == (*(_DWORD *)(v34 + 168) & 1)
                       || v35 != 1)
                {
                  *(_DWORD *)(v7 + 56) = 3;
                  if (session_is_closing(a1)) {
                    goto LABEL_112;
                  }
                  a3 = v32;
                  if ((*(unsigned char *)(v34 + 217) & 2) != 0)
                  {
                    uint64_t v15 = 4294966784;
                    goto LABEL_255;
                  }
                  int v100 = *(_DWORD *)(v34 + 204);
                  if (v100 != 2)
                  {
                    if (v100 == 3) {
                      goto LABEL_129;
                    }
                    int v101 = *(_DWORD *)(v34 + 168);
                    if (!v101 || ((v101 ^ (*(unsigned char *)(a1 + 2932) == 0)) & 1) != 0) {
                      goto LABEL_224;
                    }
                  }
                }
                else
                {
                  *(_DWORD *)(v7 + 56) = 1;
                  a3 = v32;
                }
              }
              else
              {
                uint64_t v66 = nghttp2_session_open_stream(a1, v31, (uint64_t *)(v7 + 24), 0, *(void *)(v7 + 120));
                if (!v66)
                {
                  uint64_t v15 = 4294966395;
                  goto LABEL_255;
                }
                if (*(unsigned char *)(v7 + 132)) {
                  goto LABEL_129;
                }
                if ((*(unsigned char *)(a1 + 2933) & 8) != 0) {
                  goto LABEL_245;
                }
                uint64_t v88 = v66;
                if (session_is_closing(a1)) {
                  goto LABEL_245;
                }
                if ((*(unsigned char *)(a1 + 2916) & 4) == 0) {
                  nghttp2_http_record_request_method(v88, v7);
                }
              }
              uint64_t v102 = *(void *)(v7 + 48);
              uint64_t v103 = 12 * v102 + 12;
              if (v102)
              {
                unint64_t v104 = (void *)(*(void *)(v7 + 40) + 24);
                do
                {
                  v103 += *(v104 - 1) + *v104;
                  v104 += 5;
                  --v102;
                }
                while (v102);
              }
              if ((unint64_t)(v103 + 5) > *(void *)(a1 + 2768)) {
                goto LABEL_229;
              }
              uint64_t v15 = nghttp2_frame_pack_headers((uint64_t)v118, v7, v117);
              if (v15) {
                goto LABEL_252;
              }
              uint64_t v15 = session_headers_add_pad((void *)a1, (uint64_t *)v7);
              if (v15) {
                goto LABEL_252;
              }
              if (*(_DWORD *)(v7 + 56)) {
                goto LABEL_139;
              }
              int v105 = *(_DWORD *)(v7 + 8);
              if (*(_DWORD *)(a1 + 2804) >= v105) {
                __assert_rtn("session_prep_frame", "nghttp2_session.c", 2518, "session->last_sent_stream_id < frame->hd.stream_id");
              }
              goto LABEL_244;
            case 2:
              if (session_is_closing(a1))
              {
                int v37 = 2;
                goto LABEL_69;
              }
              long long v39 = *(void **)(a1 + 656);
              if (v39 != *(void **)(a1 + 664)) {
                __assert_rtn("nghttp2_frame_pack_priority", "nghttp2_frame.c", 436, "bufs->head == bufs->cur");
              }
              if (v39[2] - v39[4] <= 4uLL) {
                __assert_rtn("nghttp2_frame_pack_priority", "nghttp2_frame.c", 440, "nghttp2_buf_avail(buf) >= NGHTTP2_PRIORITY_SPECLEN");
              }
              uint64_t v67 = v39[3];
              v39[3] = v67 - 9;
              *(_DWORD *)(v67 - 9) = bswap32(*(_DWORD *)v7) >> 8;
              *(unsigned char *)(v67 - 6) = *(unsigned char *)(v7 + 12);
              *(unsigned char *)(v67 - 5) = *(unsigned char *)(v7 + 13);
              *(_DWORD *)(v67 - 4) = bswap32(*(_DWORD *)(v7 + 8));
              uint64_t v68 = v39[4];
              unsigned int v69 = bswap32(*(_DWORD *)(v7 + 16));
              *(_DWORD *)uint64_t v68 = v69;
              if (*(unsigned char *)(v7 + 24)) {
                *(unsigned char *)uint64_t v68 = v69 | 0x80;
              }
              *(unsigned char *)(v68 + 4) = *(unsigned char *)(v7 + 20) - 1;
              uint64_t v47 = v39[4] + 5;
              goto LABEL_138;
            case 3:
              if (session_is_closing(a1))
              {
                int v37 = 3;
LABEL_69:
                uint64_t v15 = 4294966766;
                goto LABEL_256;
              }
              long long v39 = *(void **)(a1 + 656);
              if (v39 != *(void **)(a1 + 664)) {
                __assert_rtn("nghttp2_frame_pack_rst_stream", "nghttp2_frame.c", 460, "bufs->head == bufs->cur");
              }
              if (v39[2] - v39[4] <= 3uLL) {
                __assert_rtn("nghttp2_frame_pack_rst_stream", "nghttp2_frame.c", 464, "nghttp2_buf_avail(buf) >= 4");
              }
LABEL_137:
              uint64_t v70 = v39[3];
              v39[3] = v70 - 9;
              *(_DWORD *)(v70 - 9) = bswap32(*(_DWORD *)v7) >> 8;
              *(unsigned char *)(v70 - 6) = *(unsigned char *)(v7 + 12);
              *(unsigned char *)(v70 - 5) = *(unsigned char *)(v7 + 13);
              *(_DWORD *)(v70 - 4) = bswap32(*(_DWORD *)(v7 + 8));
              *(_DWORD *)v39[4] = bswap32(*(_DWORD *)(v7 + 16));
              uint64_t v47 = v39[4] + 4;
LABEL_138:
              v39[4] = v47;
              goto LABEL_139;
            case 4:
              if (*(unsigned char *)(v7 + 13))
              {
                uint64_t v38 = *(void *)(a1 + 2752);
                if (!v38) {
                  __assert_rtn("session_prep_frame", "nghttp2_session.c", 2546, "session->obq_flood_counter_ > 0");
                }
                *(void *)(a1 + 2752) = v38 - 1;
                if (session_is_closing(a1)) {
                  goto LABEL_168;
                }
              }
              long long v39 = *(void **)(a1 + 656);
              if (v39 != *(void **)(a1 + 664)) {
                __assert_rtn("nghttp2_frame_pack_settings", "nghttp2_frame.c", 482, "bufs->head == bufs->cur");
              }
              uint64_t v40 = *(void *)v7;
              if (v39[2] - v39[4] < *(void *)v7) {
                goto LABEL_229;
              }
              uint64_t v41 = v39[3];
              v39[3] = v41 - 9;
              *(_DWORD *)(v41 - 9) = bswap32(v40) >> 8;
              *(unsigned char *)(v41 - 6) = *(unsigned char *)(v7 + 12);
              *(unsigned char *)(v41 - 5) = *(unsigned char *)(v7 + 13);
              *(_DWORD *)(v41 - 4) = bswap32(*(_DWORD *)(v7 + 8));
              uint64_t v42 = v39[4];
              uint64_t v43 = *(void *)(v7 + 16);
              if (v43)
              {
                uint64_t v44 = (unsigned int *)(*(void *)(v7 + 24) + 4);
                uint64_t v45 = *(void *)(v7 + 16);
                do
                {
                  *(_WORD *)uint64_t v42 = bswap32(*((unsigned __int16 *)v44 - 2)) >> 16;
                  unsigned int v46 = *v44;
                  v44 += 2;
                  *(_DWORD *)(v42 + 2) = bswap32(v46);
                  v42 += 6;
                  --v45;
                }
                while (v45);
                uint64_t v42 = v39[4];
              }
              uint64_t v47 = v42 + 6 * v43;
              goto LABEL_138;
            case 5:
              uint64_t v48 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(v7 + 8));
              uint64_t v32 = a3;
              if (!v48 || (*(unsigned char *)(v48 + 216) & 2) != 0)
              {
                uint64_t v49 = 0;
              }
              else if (*(_DWORD *)(v48 + 204) == 5)
              {
                uint64_t v49 = 0;
              }
              else
              {
                uint64_t v49 = v48;
              }
              if (!*(unsigned char *)(a1 + 2932))
              {
                uint64_t v15 = 4294966791;
                goto LABEL_153;
              }
              if (!v49)
              {
LABEL_118:
                uint64_t v15 = 4294966786;
                goto LABEL_153;
              }
              if (session_is_closing(a1))
              {
LABEL_112:
                uint64_t v15 = 4294966766;
LABEL_153:
                a3 = v32;
                goto LABEL_255;
              }
              if ((*(unsigned char *)(v49 + 217) & 2) != 0)
              {
                uint64_t v15 = 4294966784;
                goto LABEL_153;
              }
              if (!*(_DWORD *)(a1 + 2856))
              {
                uint64_t v15 = 4294966768;
                goto LABEL_153;
              }
              if (*(_DWORD *)(v49 + 204) == 3)
              {
                uint64_t v15 = 4294966785;
                goto LABEL_153;
              }
              a3 = v32;
              if ((*(unsigned char *)(a1 + 2933) & 8) != 0)
              {
LABEL_245:
                uint64_t v15 = 4294966780;
                goto LABEL_255;
              }
              uint64_t v106 = *(void *)(v7 + 32);
              unint64_t v107 = 12 * v106 + 12;
              if (v106)
              {
                size_t v108 = (void *)(*(void *)(v7 + 24) + 24);
                do
                {
                  v107 += *(v108 - 1) + *v108;
                  v108 += 5;
                  --v106;
                }
                while (v106);
              }
              if (v107 > *(void *)(a1 + 2768))
              {
LABEL_229:
                uint64_t v15 = 4294966774;
LABEL_255:
                int v37 = *(unsigned __int8 *)(v7 + 12);
                if (!*(unsigned char *)(v7 + 12)) {
                  goto LABEL_266;
                }
LABEL_256:
                size_t v109 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 2416);
                if (v109 && v15 >= 0xFFFFFC7D && v37 != 8)
                {
                  if (!v109(a1, v7, v15, *(void *)(a1 + 2608)))
                  {
                    int v37 = *(unsigned __int8 *)(v7 + 12);
                    goto LABEL_261;
                  }
                  nghttp2_outbound_item_free(v7, (uint64_t *)(a1 + 2568));
                  (*(void (**)(uint64_t, void))(a1 + 2584))(v7, *(void *)(a1 + 2568));
                  return -902;
                }
LABEL_261:
                if (v37 == 5)
                {
                  uint64_t v110 = *(unsigned int *)(v7 + 40);
                  uint64_t v111 = 2;
                  if (!v110) {
                    goto LABEL_266;
                  }
                }
                else
                {
                  if (v37 != 1 || *(_DWORD *)(v7 + 56))
                  {
LABEL_266:
                    int v112 = 0;
                    goto LABEL_267;
                  }
                  uint64_t v110 = *(unsigned int *)(v7 + 8);
                  if (*(unsigned char *)(v7 + 132))
                  {
                    uint64_t v111 = *(unsigned int *)(v7 + 128);
                    if (!v110) {
                      goto LABEL_266;
                    }
                  }
                  else
                  {
                    uint64_t v111 = 7;
                    if (!v110) {
                      goto LABEL_266;
                    }
                  }
                }
                nghttp2_session_close_stream(a1, v110, v111);
                int v112 = v113;
LABEL_267:
                nghttp2_outbound_item_free(v7, (uint64_t *)(a1 + 2568));
                (*(void (**)(uint64_t, void))(a1 + 2584))(v7, *(void *)(a1 + 2568));
                active_outbound_item_reset((uint64_t *)(a1 + 648), (uint64_t *)(a1 + 2568));
                if (v112 <= -901) {
                  return v112;
                }
                if (v15 == -523) {
                  LODWORD(v15) = session_terminate_session(a1, *(_DWORD *)(a1 + 2812), 2, 0);
                }
                if ((int)v15 <= -901) {
                  return (int)v15;
                }
                continue;
              }
              uint64_t v15 = nghttp2_frame_pack_push_promise((uint64_t)v118, v7, v117);
              if (v15 || (uint64_t v15 = session_headers_add_pad((void *)a1, (uint64_t *)v7), v15))
              {
LABEL_252:
                if (v15 == -508) {
                  continue;
                }
                if (v15 == -526) {
                  return 0;
                }
                if ((v15 & 0x80000000) != 0) {
                  goto LABEL_255;
                }
              }
              else
              {
                int v105 = *(_DWORD *)(v7 + 40);
                if (*(_DWORD *)(a1 + 2804) + 2 > v105) {
                  __assert_rtn("session_prep_frame", "nghttp2_session.c", 2597, "session->last_sent_stream_id + 2 <= frame->push_promise.promised_stream_id");
                }
LABEL_244:
                *(_DWORD *)(a1 + 2804) = v105;
              }
LABEL_139:
              *(void *)(a1 + 648) = v7;
              *(void *)(a1 + 664) = *(void *)(a1 + 656);
              if (!*(unsigned char *)(v7 + 12))
              {
                if (*(unsigned char *)(v7 + 122))
                {
                  *(_DWORD *)(a1 + 720) = 2;
                  continue;
                }
LABEL_151:
                *(_DWORD *)(a1 + 720) = 1;
                continue;
              }
              uint64_t v71 = *(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 2400);
              if (!v71) {
                goto LABEL_151;
              }
              int v72 = v71(a1, v7, *(void *)(a1 + 2608));
              if (!v72) {
                goto LABEL_151;
              }
              if (v72 != -535) {
                return -902;
              }
              unsigned int v73 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 2416);
              if (v73)
              {
                if (v73(a1, v7, 4294966761, *(void *)(a1 + 2608))) {
                  return -902;
                }
              }
              int v74 = *(unsigned __int8 *)(v7 + 12);
              if (v74 == 5)
              {
                uint64_t v75 = (unsigned int *)(v7 + 40);
                uint64_t v76 = 2;
              }
              else
              {
                if (v74 != 1 || *(_DWORD *)(v7 + 56)) {
                  goto LABEL_27;
                }
                uint64_t v75 = (unsigned int *)(v7 + 8);
                uint64_t v76 = 7;
              }
              uint64_t v80 = *v75;
              if (!v80) {
                goto LABEL_27;
              }
              nghttp2_session_close_stream(a1, v80, v76);
              break;
            case 6:
              if (*(unsigned char *)(v7 + 13))
              {
                uint64_t v50 = *(void *)(a1 + 2752);
                if (!v50) {
                  __assert_rtn("session_prep_frame", "nghttp2_session.c", 2604, "session->obq_flood_counter_ > 0");
                }
                *(void *)(a1 + 2752) = v50 - 1;
              }
              if (*(unsigned char *)(a1 + 2933)) {
                goto LABEL_168;
              }
              long long v39 = *(void **)(a1 + 656);
              if (v39 != *(void **)(a1 + 664)) {
                __assert_rtn("nghttp2_frame_pack_ping", "nghttp2_frame.c", 600, "bufs->head == bufs->cur");
              }
              if (v39[2] - v39[4] <= 7uLL) {
                __assert_rtn("nghttp2_frame_pack_ping", "nghttp2_frame.c", 604, "nghttp2_buf_avail(buf) >= 8");
              }
              uint64_t v51 = v39[3];
              v39[3] = v51 - 9;
              *(_DWORD *)(v51 - 9) = bswap32(*(_DWORD *)v7) >> 8;
              *(unsigned char *)(v51 - 6) = *(unsigned char *)(v7 + 12);
              *(unsigned char *)(v51 - 5) = *(unsigned char *)(v7 + 13);
              *(_DWORD *)(v51 - 4) = bswap32(*(_DWORD *)(v7 + 8));
              uint64_t v52 = (void *)v39[4];
              *uint64_t v52 = *(void *)(v7 + 16);
              uint64_t v47 = (uint64_t)(v52 + 1);
              goto LABEL_138;
            case 7:
              uint64_t v53 = *(void *)(a1 + 656);
              if (v53 != *(void *)(a1 + 664)) {
                __assert_rtn("nghttp2_frame_pack_goaway", "nghttp2_frame.c", 623, "bufs->head == bufs->cur");
              }
              uint64_t v54 = *(void *)(v53 + 24);
              *(void *)(v53 + 24) = v54 - 9;
              *(_DWORD *)(v54 - 9) = bswap32(*(_DWORD *)v7) >> 8;
              *(unsigned char *)(v54 - 6) = *(unsigned char *)(v7 + 12);
              *(unsigned char *)(v54 - 5) = *(unsigned char *)(v7 + 13);
              *(_DWORD *)(v54 - 4) = bswap32(*(_DWORD *)(v7 + 8));
              **(_DWORD **)(v53 + 32) = bswap32(*(_DWORD *)(v7 + 16));
              uint64_t v55 = *(void *)(v53 + 32);
              *(void *)(v53 + 32) = v55 + 4;
              *(_DWORD *)(v55 + 4) = bswap32(*(_DWORD *)(v7 + 20));
              *(void *)(v53 + 32) += 4;
              uint64_t v56 = nghttp2_bufs_add((uint64_t)v118, *(char **)(v7 + 24), *(void *)(v7 + 32));
              if (v56 == -502) {
                goto LABEL_229;
              }
              uint64_t v15 = v56;
              if (v56) {
                goto LABEL_252;
              }
              *(_DWORD *)(a1 + 2820) = *(_DWORD *)(v7 + 16);
              goto LABEL_139;
            case 8:
              int v57 = *(_DWORD *)(v7 + 8);
              if (session_is_closing(a1)) {
                goto LABEL_168;
              }
              if (!v57) {
                goto LABEL_105;
              }
              uint64_t v58 = nghttp2_map_find((uint64_t *)a1, v57);
              if (!v58 || (*(unsigned char *)(v58 + 216) & 2) != 0) {
                goto LABEL_159;
              }
              int v59 = *(_DWORD *)(v58 + 204);
              switch(v59)
              {
                case 3:
                  goto LABEL_129;
                case 5:
                  goto LABEL_159;
                case 4:
                  int v60 = *(_DWORD *)(v58 + 168);
                  if (v60)
                  {
                    if (((v60 ^ (*(unsigned char *)(a1 + 2932) == 0)) & 1) == 0) {
                      goto LABEL_224;
                    }
                  }
                  break;
              }
LABEL_105:
              long long v39 = *(void **)(a1 + 656);
              if (v39 != *(void **)(a1 + 664)) {
                __assert_rtn("nghttp2_frame_pack_window_update", "nghttp2_frame.c", 695, "bufs->head == bufs->cur");
              }
              if (v39[2] - v39[4] <= 3uLL) {
                __assert_rtn("nghttp2_frame_pack_window_update", "nghttp2_frame.c", 699, "nghttp2_buf_avail(buf) >= 4");
              }
              goto LABEL_137;
            case 9:
              __assert_rtn("session_prep_frame", "nghttp2_session.c", 2632, "0");
            default:
              if (!*(unsigned char *)(v7 + 96))
              {
                if (session_is_closing(a1)) {
                  goto LABEL_168;
                }
                BOOL v61 = *(uint64_t (**)(uint64_t))(a1 + 2528);
                if (!v61)
                {
                  BOOL v61 = *(uint64_t (**)(uint64_t))(a1 + 2520);
                  if (!v61) {
                    __assert_rtn("session_pack_extension", "nghttp2_session.c", 2311, "session->callbacks.pack_extension_callback2 || session->callbacks.pack_extension_callback");
                  }
                }
                size_t v62 = *(void **)(a1 + 656);
                size_t v63 = v62 + 4;
                if (v62[2] - v62[4] >= 0x4000uLL) {
                  unint64_t v64 = 0x4000;
                }
                else {
                  unint64_t v64 = v62[2] - v62[4];
                }
                unint64_t v65 = v61(a1);
                if (v65 == -535)
                {
                  uint64_t v15 = 4294966761;
                  goto LABEL_255;
                }
                uint64_t v15 = 4294966394;
                if ((v65 & 0x8000000000000000) == 0 && v65 <= v64)
                {
                  *(void *)uint64_t v7 = v65;
                  uint64_t v99 = v62[3];
                  if (v99 != *v63) {
                    __assert_rtn("session_pack_extension", "nghttp2_session.c", 2335, "buf->pos == buf->last");
                  }
                  *size_t v63 = v99 + v65;
                  v62[3] = v99 - 9;
                  *(_DWORD *)(v99 - 9) = bswap32(v65) >> 8;
                  *(unsigned char *)(v99 - 6) = *(unsigned char *)(v7 + 12);
                  *(unsigned char *)(v99 - 5) = *(unsigned char *)(v7 + 13);
                  *(_DWORD *)(v99 - 4) = bswap32(*(_DWORD *)(v7 + 8));
                  goto LABEL_139;
                }
                goto LABEL_255;
              }
              if (v11 == 16)
              {
                if (session_is_closing(a1)) {
                  goto LABEL_168;
                }
                uint64_t v78 = nghttp2_map_find((uint64_t *)a1, **(_DWORD **)(v7 + 16));
                if (!v78 || (*(unsigned char *)(v78 + 216) & 2) != 0) {
                  goto LABEL_166;
                }
                int v79 = *(_DWORD *)(v78 + 204);
                if (v79 == 3)
                {
LABEL_129:
                  uint64_t v15 = 4294966785;
                  goto LABEL_255;
                }
                if (v79 == 5 || (*(unsigned char *)(v78 + 217) & 1) == 0)
                {
LABEL_166:
                  nghttp2_frame_pack_priority_update((uint64_t)v118, v7);
                  goto LABEL_139;
                }
LABEL_224:
                uint64_t v15 = 4294966782;
                goto LABEL_255;
              }
              if (v11 != 12)
              {
                if (v11 != 10) {
                  __assert_rtn("session_prep_frame", "nghttp2_session.c", 2685, "0");
                }
                int v28 = *(_DWORD *)(v7 + 8);
                if (session_is_closing(a1))
                {
LABEL_168:
                  uint64_t v15 = 4294966766;
                  goto LABEL_255;
                }
                if (!v28) {
                  goto LABEL_56;
                }
                uint64_t v29 = nghttp2_map_find((uint64_t *)a1, v28);
                if (v29 && (*(unsigned char *)(v29 + 216) & 2) == 0)
                {
                  int v30 = *(_DWORD *)(v29 + 204);
                  if (v30 == 3) {
                    goto LABEL_129;
                  }
                  if (v30 != 5)
                  {
LABEL_56:
                    nghttp2_frame_pack_altsvc((uint64_t)v118, v7);
                    goto LABEL_139;
                  }
                }
LABEL_159:
                uint64_t v15 = 4294966786;
                goto LABEL_255;
              }
              if (session_is_closing(a1)) {
                goto LABEL_168;
              }
              uint64_t v89 = *v118;
              uint64_t v90 = *(void *)v7;
              if (*(void *)(*v118 + 16) - *(void *)(*v118 + 32) >= *(void *)v7)
              {
                unsigned int v115 = a3;
                uint64_t v116 = a2;
                unint64_t v91 = *(unint64_t **)(v7 + 16);
                uint64_t v92 = *(void *)(v89 + 24);
                *(void *)(v89 + 24) = v92 - 9;
                *(_DWORD *)(v92 - 9) = bswap32(v90) >> 8;
                *(unsigned char *)(v92 - 6) = *(unsigned char *)(v7 + 12);
                *(unsigned char *)(v92 - 5) = *(unsigned char *)(v7 + 13);
                *(_DWORD *)(v92 - 4) = bswap32(*(_DWORD *)(v7 + 8));
                unsigned int v93 = *(_WORD **)(v89 + 32);
                if (*v91)
                {
                  uint64_t v94 = 0;
                  unint64_t v95 = 0;
                  do
                  {
                    unint64_t v96 = v91[1];
                    *unsigned int v93 = bswap32(*(unsigned __int16 *)(v96 + v94 + 8)) >> 16;
                    uint64_t v97 = *(void *)(v89 + 32);
                    unsigned int v93 = (_WORD *)(v97 + 2);
                    *(void *)(v89 + 32) = v97 + 2;
                    uint64_t v98 = *(void *)(v96 + v94 + 8);
                    if (v98)
                    {
                      memcpy((void *)(v97 + 2), *(const void **)(v96 + v94), *(void *)(v96 + v94 + 8));
                      unsigned int v93 = (_WORD *)((char *)v93 + v98);
                    }
                    *(void *)(v89 + 32) = v93;
                    ++v95;
                    v94 += 16;
                  }
                  while (v95 < *v91);
                }
                a2 = v116;
                a3 = v115;
                if ((_WORD *)((char *)v93 - *(void *)(v89 + 24)) != (_WORD *)(*(void *)v7 + 9)) {
                  __assert_rtn("nghttp2_frame_pack_origin", "nghttp2_frame.c", 814, "nghttp2_buf_len(buf) == NGHTTP2_FRAME_HDLEN + frame->hd.length");
                }
                goto LABEL_139;
              }
              goto LABEL_229;
          }
LABEL_172:
          if ((int)result <= -901) {
            return (int)result;
          }
LABEL_27:
          active_outbound_item_reset((uint64_t *)(a1 + 648), (uint64_t *)(a1 + 2568));
          continue;
        }
        return 0;
      case 1:
        uint64_t v21 = *(void *)(a1 + 664);
        uint64_t v22 = *(void *)(v21 + 24);
        if (v22 != *(void *)(v21 + 32)) {
          goto LABEL_279;
        }
        if (!a3)
        {
          session_after_frame_sent1(a1);
          if ((result & 0x80000000) != 0)
          {
            if (result >= 0xFFFFFC7C) {
              __assert_rtn("nghttp2_session_mem_send_internal", "nghttp2_session.c", 3466, "nghttp2_is_fatal(rv)");
            }
            return (int)result;
          }
        }
        session_after_frame_sent2(a1);
        continue;
      case 2:
        uint64_t v16 = *(void *)(a1 + 648);
        uint64_t v17 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(v16 + 8));
        if (!v17) {
          goto LABEL_27;
        }
        uint64_t v18 = v17;
        if ((*(unsigned char *)(v17 + 216) & 2) != 0 || *(_DWORD *)(v17 + 204) == 5) {
          goto LABEL_27;
        }
        int v19 = (*(uint64_t (**)(uint64_t, uint64_t, void, void, uint64_t, void))(a1 + 2512))(a1, v16, *(void *)(*(void *)(a1 + 664) + 24), *(void *)v16 - *(void *)(v16 + 16), v16 + 104, *(void *)(a1 + 2608));
        int v20 = v19;
        if (v19 > -505)
        {
          if (v19)
          {
            if (v19 == -504) {
              return 0;
            }
            return -902;
          }
        }
        else if (v19 != -526)
        {
          if (v19 != -521) {
            return -902;
          }
          session_detach_stream_item(a1, v18);
          LODWORD(result) = nghttp2_session_add_rst_stream(a1, *(_DWORD *)(v16 + 8), 2);
          goto LABEL_172;
        }
        session_after_frame_sent1(a1);
        if ((result & 0x80000000) != 0)
        {
          if (result >= 0xFFFFFC7C) {
            __assert_rtn("nghttp2_session_mem_send_internal", "nghttp2_session.c", 3529, "nghttp2_is_fatal(rv)");
          }
          return (int)result;
        }
        session_after_frame_sent2(a1);
        if (v20 == -526) {
          return 0;
        }
        continue;
      case 3:
        uint64_t v21 = *(void *)(a1 + 664);
        uint64_t v22 = *(void *)(v21 + 24);
        if (v22 == *(void *)(v21 + 32)) {
          goto LABEL_27;
        }
LABEL_279:
        *a2 = v22;
        uint64_t v114 = *(void *)(v21 + 32);
        uint64_t result = v114 - *(void *)(v21 + 24);
        *(void *)(v21 + 24) = v114;
        return result;
      default:
        continue;
    }
  }
}

uint64_t active_outbound_item_reset(uint64_t *a1, uint64_t *a2)
{
  nghttp2_outbound_item_free(*a1, a2);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))a2[2])(*a1, *a2);
  *a1 = 0;
  uint64_t v5 = a1 + 1;
  uint64_t v6 = a1[7];
  uint64_t v7 = v6;
  while (1)
  {
    uint64_t v5 = (void *)*v5;
    if (!v5) {
      break;
    }
    uint64_t v8 = v5[1];
    v5[5] = v8;
    uint64_t v9 = v8 + a1[8];
    v5[3] = v9;
    v5[4] = v9;
    if (!--v7)
    {
      unint64_t v10 = (void *)*v5;
      *uint64_t v5 = 0;
      if (v10)
      {
        do
        {
          int v11 = (void *)a1[3];
          int v12 = (void *)*v10;
          ((void (*)(void, void))v11[2])(v10[1], *v11);
          v10[1] = 0;
          uint64_t result = ((uint64_t (*)(void *, void))v11[2])(v10, *v11);
          unint64_t v10 = v12;
        }
        while (v12);
        uint64_t v6 = a1[7];
      }
      a1[6] = v6;
      break;
    }
  }
  a1[2] = a1[1];
  *((_DWORD *)a1 + 18) = 0;
  return result;
}

uint64_t nghttp2_outbound_item_free(uint64_t result, uint64_t *a2)
{
  if (!result) {
    return result;
  }
  int v2 = *(unsigned __int8 *)(result + 12);
  switch(*(unsigned char *)(result + 12))
  {
    case 0:
    case 2:
    case 3:
    case 6:
    case 8:
      return result;
    case 1:
      uint64_t v3 = (uint64_t *)(result + 40);
      goto LABEL_14;
    case 4:
    case 5:
    case 7:
      uint64_t v3 = (uint64_t *)(result + 24);
      goto LABEL_14;
    default:
      if (!*(unsigned char *)(result + 96)) {
        return result;
      }
      if (v2 == 16 || v2 == 12)
      {
        uint64_t v4 = *(void *)(result + 16);
        if (!v4) {
          return result;
        }
        uint64_t v3 = (uint64_t *)(v4 + 8);
        goto LABEL_14;
      }
      if (v2 != 10) {
        __assert_rtn("nghttp2_outbound_item_free", "nghttp2_outbound_item.c", 122, "0");
      }
      uint64_t v3 = *(uint64_t **)(result + 16);
      if (v3)
      {
LABEL_14:
        uint64_t v5 = *v3;
        uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))a2[2];
        uint64_t v7 = *a2;
        return v6(v5, v7);
      }
      return result;
  }
}

BOOL session_is_closing(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 2933)) {
    return 1;
  }
  if ((*(unsigned char *)(a1 + 2933) & 2) == 0
    && (*(void *)(a1 + 16) != *(void *)(a1 + 2736) + *(void *)(a1 + 2728) || (*(unsigned char *)(a1 + 2933) & 0xC) == 0))
  {
    return 0;
  }
  return !nghttp2_session_want_write(a1);
}

uint64_t session_after_frame_sent2(uint64_t result)
{
  uint64_t v1 = result;
  int v2 = (uint64_t *)(result + 648);
  uint64_t v3 = *(void *)(result + 648);
  uint64_t v4 = (uint64_t *)(result + 2568);
  int v5 = *(unsigned __int8 *)(v3 + 12);
  if (*(unsigned char *)(v3 + 12))
  {
    if (v5 == 5 || v5 == 1)
    {
      uint64_t v7 = **(void **)(result + 664);
      if (v7)
      {
        if (*(void *)(v7 + 32) != *(void *)(v7 + 24))
        {
          *(void *)(result + 664) = v7;
          return result;
        }
      }
    }
  }
  else if (!*(unsigned char *)(v3 + 121))
  {
    *(unsigned char *)(v3 + 122) = 0;
    uint64_t v8 = nghttp2_map_find((uint64_t *)result, *(_DWORD *)(v3 + 8));
    if (!v8 || (*(unsigned char *)(v8 + 216) & 2) != 0)
    {
      uint64_t v9 = 0;
    }
    else if (*(_DWORD *)(v8 + 204) == 5)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = v8;
    }
    if (nghttp2_session_predicate_data_send(v1, v9))
    {
      if (v9) {
        session_detach_stream_item(v1, v9);
      }
    }
    else
    {
      uint64_t *v2 = 0;
    }
  }

  return active_outbound_item_reset(v2, v4);
}

void session_after_frame_sent1(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 648);
  int v3 = *(unsigned __int8 *)(v2 + 12);
  if (v3 == 5 || v3 == 1)
  {
    uint64_t v5 = **(void **)(a1 + 664);
    if (v5 && *(void *)(v5 + 32) != *(void *)(v5 + 24)) {
      return;
    }
    goto LABEL_16;
  }
  if (*(unsigned char *)(v2 + 12))
  {
LABEL_16:
    uint64_t v9 = *(unsigned int (**)(uint64_t, void, void))(a1 + 2408);
    if (v9)
    {
      if (v9(a1, *(void *)(a1 + 648), *(void *)(a1 + 2608))) {
        return;
      }
      int v3 = *(unsigned __int8 *)(v2 + 12);
    }
    switch(v3)
    {
      case 1:
        uint64_t v10 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(v2 + 8));
        if (v10 && (*(unsigned char *)(v10 + 216) & 2) == 0 && *(_DWORD *)(v10 + 204) != 5)
        {
          switch(*(_DWORD *)(v2 + 56))
          {
            case 0:
              int v11 = 1;
              goto LABEL_56;
            case 1:
              goto LABEL_55;
            case 2:
              *(unsigned char *)(v10 + 216) &= ~1u;
              ++*(void *)(a1 + 2696);
LABEL_55:
              int v11 = 2;
LABEL_56:
              *(_DWORD *)(v10 + 204) = v11;
              break;
            case 3:
              break;
            default:
              __assert_rtn("session_after_frame_sent1", "nghttp2_session.c", 3047, "0");
          }
          int v24 = *(unsigned __int8 *)(v10 + 217);
          if (*(unsigned char *)(v2 + 13))
          {
            v24 |= 2u;
            *(unsigned char *)(v10 + 217) = v24;
          }
          if ((~v24 & 3) != 0 || (nghttp2_session_close_stream(a1, *(unsigned int *)(v10 + 168), 0), v25 >= -900))
          {
            if (*(void *)(v2 + 112)) {
              nghttp2_submit_data_shared(a1, 1, *(_DWORD *)(v2 + 8), (long long *)(v2 + 96));
            }
          }
        }
        return;
      case 2:
        if (*(unsigned char *)(a1 + 2932) || *(unsigned char *)(a1 + 2930) == 1) {
          return;
        }
        int v12 = *(_DWORD *)(v2 + 8);
        uint64_t v13 = nghttp2_map_find((uint64_t *)a1, v12);
        if (v13)
        {
          if ((int)nghttp2_session_reprioritize_stream(a1, v13, (int *)(v2 + 16)) < -900) {
            return;
          }
        }
        else
        {
          if (!v12) {
            return;
          }
          int v23 = (v12 & 1) != 0 ? *(_DWORD *)(a1 + 2804) : *(_DWORD *)(a1 + 2808);
          if (v23 >= v12 || !nghttp2_session_open_stream(a1, v12, (uint64_t *)(v2 + 16), 5, 0)) {
            return;
          }
        }
        nghttp2_session_adjust_idle_stream(a1);
        return;
      case 3:
        nghttp2_session_close_stream(a1, *(unsigned int *)(v2 + 8), *(unsigned int *)(v2 + 16));
        return;
      case 7:
        if ((*(unsigned char *)(v2 + 96) & 2) == 0)
        {
          *(unsigned char *)(a1 + 2933) |= (2 * (*(unsigned char *)(v2 + 96) & 1)) | 4;
          session_close_stream_on_goaway(a1, *(_DWORD *)(v2 + 16), 1);
        }
        return;
      case 8:
        int v14 = *(_DWORD *)(v2 + 8);
        if (v14)
        {
          uint64_t v15 = nghttp2_map_find((uint64_t *)a1, v14);
          if (!v15) {
            return;
          }
          if ((*(unsigned char *)(v15 + 216) & 2) != 0) {
            return;
          }
          if (*(_DWORD *)(v15 + 204) == 5) {
            return;
          }
          *(unsigned char *)(v15 + 219) = 0;
          if (*(unsigned char *)(v15 + 217)) {
            return;
          }
          if ((*(unsigned char *)(a1 + 2916) & 1) == 0)
          {
            nghttp2_session_update_recv_stream_window_size(a1, v15, 0, 1);
            return;
          }
          uint64_t v18 = (int *)(v15 + 180);
          int v19 = (int *)(v15 + 176);
          int v22 = *(_DWORD *)(v15 + 168);
          int v20 = *(_DWORD *)(v15 + 188);
          uint64_t v21 = a1;
        }
        else
        {
          *(unsigned char *)(a1 + 2934) = 0;
          if ((*(unsigned char *)(a1 + 2916) & 1) == 0)
          {
            nghttp2_session_update_recv_connection_window_size(a1, 0);
            return;
          }
          uint64_t v18 = (int *)(a1 + 2836);
          int v19 = (int *)(a1 + 2832);
          int v20 = *(_DWORD *)(a1 + 2844);
          uint64_t v21 = a1;
          int v22 = 0;
        }
        session_update_consumed_size(v21, v18, v19, 0, v22, 0, v20);
        return;
      default:
        return;
    }
  }
  uint64_t v6 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(v2 + 8));
  if (!v6 || (uint64_t v7 = v6, (*(unsigned char *)(v6 + 216) & 2) != 0) || *(_DWORD *)(v6 + 204) == 5)
  {
    *(_DWORD *)(a1 + 2828) -= *(_DWORD *)v2;
    goto LABEL_14;
  }
  *(_DWORD *)(a1 + 2828) -= *(_DWORD *)v2;
  *(_DWORD *)(v6 + 172) -= *(_DWORD *)v2;
  if (!*(unsigned char *)(v2 + 121))
  {
LABEL_14:
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 2408);
    if (v8) {
      v8(a1, v2, *(void *)(a1 + 2608));
    }
    return;
  }
  session_detach_stream_item(a1, v6);
  uint64_t v16 = *(unsigned int (**)(uint64_t, uint64_t, void))(a1 + 2408);
  if (!v16 || !v16(a1, v2, *(void *)(a1 + 2608))) && (*(unsigned char *)(v2 + 13))
  {
    char v17 = *(unsigned char *)(v7 + 217);
    *(unsigned char *)(v7 + 217) = v17 | 2;
    if (v17) {
      nghttp2_session_close_stream(a1, *(unsigned int *)(v7 + 168), 0);
    }
  }
}

uint64_t nghttp2_map_each(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  if (*(void *)(a1 + 16))
  {
    unint64_t v4 = *(unsigned int *)(a1 + 24);
    if (v4)
    {
      unint64_t v7 = 0;
      uint64_t v8 = 8;
      do
      {
        uint64_t v9 = *(void *)(*(void *)a1 + v8);
        if (v9)
        {
          uint64_t result = a2(v9, a3);
          if (result) {
            return result;
          }
          unint64_t v4 = *(unsigned int *)(a1 + 24);
        }
        ++v7;
        v8 += 16;
      }
      while (v7 < v4);
    }
  }
  return 0;
}

uint64_t nghttp2_session_add_settings(uint64_t a1, char a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  int v8 = *(unsigned __int8 *)(a1 + 2930);
  if (a2)
  {
    if (!a4)
    {
      if (*(void *)(a1 + 2752) >= *(void *)(a1 + 2760)) {
        return 4294966392;
      }
      goto LABEL_14;
    }
    return 4294966795;
  }
  if (!nghttp2_iv_check((uint64_t)a3, a4)) {
    return 4294966795;
  }
  if (!v4)
  {
LABEL_14:
    char v11 = 1;
    goto LABEL_15;
  }
  uint64_t v9 = a3 + 1;
  uint64_t v10 = v4;
  do
  {
    if (*(v9 - 1) == 9)
    {
      if (v8 == 255)
      {
        int v8 = *(unsigned __int8 *)v9;
      }
      else if (*v9 != v8)
      {
        return 4294966795;
      }
    }
    v9 += 2;
    --v10;
  }
  while (v10);
  char v11 = 0;
LABEL_15:
  uint64_t v13 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
  if (!v13) {
    return 4294966395;
  }
  uint64_t v14 = v13;
  if (v11)
  {
    uint64_t v15 = 0;
    if ((a2 & 1) == 0) {
      goto LABEL_18;
    }
LABEL_24:
    char v17 = 0;
    goto LABEL_30;
  }
  if ((unint64_t)(v4 - 1) > 0x1FFFFFFFFFFFFFFELL) {
    goto LABEL_58;
  }
  int v19 = (void *)(*(uint64_t (**)(uint64_t, void))(a1 + 2576))(8 * v4, *(void *)(a1 + 2568));
  if (!v19) {
    goto LABEL_58;
  }
  uint64_t v15 = v19;
  memcpy(v19, a3, 8 * v4);
  if (a2) {
    goto LABEL_24;
  }
LABEL_18:
  uint64_t v16 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(24, *(void *)(a1 + 2568));
  if (!v16)
  {
LABEL_57:
    (*(void (**)(void *, void))(a1 + 2584))(v15, *(void *)(a1 + 2568));
LABEL_58:
    (*(void (**)(uint64_t, void))(a1 + 2584))(v14, *(void *)(a1 + 2568));
    return 4294966395;
  }
  char v17 = (void *)v16;
  if ((v11 & 1) == 0)
  {
    if ((unint64_t)(v4 - 1) <= 0x1FFFFFFFFFFFFFFELL)
    {
      int v20 = (void *)(*(uint64_t (**)(uint64_t, void))(a1 + 2576))(8 * v4, *(void *)(a1 + 2568));
      if (v20)
      {
        uint64_t v18 = v20;
        memcpy(v20, a3, 8 * v4);
        goto LABEL_29;
      }
    }
    v17[1] = 0;
    (*(void (**)(void *, void))(a1 + 2584))(v17, *(void *)(a1 + 2568));
    goto LABEL_57;
  }
  uint64_t v18 = 0;
LABEL_29:
  v17[1] = v18;
  v17[2] = v4;
  *char v17 = 0;
LABEL_30:
  *(_OWORD *)(v14 + 137) = 0u;
  *(_OWORD *)(v14 + 112) = 0u;
  *(_OWORD *)(v14 + 128) = 0u;
  *(_OWORD *)(v14 + 96) = 0u;
  *(void *)uint64_t v14 = 6 * v4;
  *(unsigned char *)(v14 + 12) = 4;
  *(unsigned char *)(v14 + 13) = a2;
  *(_DWORD *)(v14 + 8) = 0;
  *(unsigned char *)(v14 + 14) = 0;
  *(void *)(v14 + 16) = v4;
  *(void *)(v14 + 24) = v15;
  uint64_t v21 = nghttp2_session_add_item(a1, v14);
  if (v21)
  {
    uint64_t v12 = v21;
    if ((int)v21 >= -900) {
      __assert_rtn("nghttp2_session_add_settings", "nghttp2_session.c", 7673, "nghttp2_is_fatal(rv)");
    }
    if (v17)
    {
      (*(void (**)(void, void))(a1 + 2584))(v17[1], *(void *)(a1 + 2568));
      (*(void (**)(void *, void))(a1 + 2584))(v17, *(void *)(a1 + 2568));
    }
    (*(void (**)(void, void))(a1 + 2584))(*(void *)(v14 + 24), *(void *)(a1 + 2568));
    (*(void (**)(uint64_t, void))(a1 + 2584))(v14, *(void *)(a1 + 2568));
  }
  else
  {
    if (a2)
    {
      ++*(void *)(a1 + 2752);
    }
    else
    {
      int v22 = (void *)(a1 + 2648);
      do
      {
        int v23 = v22;
        int v22 = (void *)*v22;
      }
      while (v22);
      *int v23 = v17;
    }
    int v24 = &a3[2 * v4 - 2];
    uint64_t v25 = v4;
    while (v25)
    {
      --v25;
      int v26 = *v24;
      v24 -= 2;
      if (v26 == 3)
      {
        *(_DWORD *)(a1 + 2920) = a3[2 * v25 + 1];
        break;
      }
    }
    uint64_t v27 = &a3[2 * v4 - 2];
    uint64_t v28 = v4;
    while (v28)
    {
      --v28;
      int v29 = *v27;
      v27 -= 2;
      if (v29 == 2)
      {
        *(unsigned char *)(a1 + 2928) = a3[2 * v28 + 1];
        break;
      }
    }
    int v30 = &a3[2 * v4 - 2];
    while (v4)
    {
      --v4;
      int v31 = *v30;
      v30 -= 2;
      if (v31 == 8)
      {
        *(unsigned char *)(a1 + 2929) = a3[2 * v4 + 1];
        break;
      }
    }
    uint64_t v12 = 0;
    if (v8 == 255) {
      char v32 = 0;
    }
    else {
      char v32 = v8;
    }
    *(unsigned char *)(a1 + 2930) = v32;
  }
  return v12;
}

void *default_calloc(size_t a1, size_t a2)
{
  return malloc_type_calloc(a1, a2, 0x17A2610EuLL);
}

uint64_t nghttp2_session_consume_stream(uint64_t a1, int a2, uint64_t a3)
{
  if (!a2) {
    return 4294966795;
  }
  if ((*(unsigned char *)(a1 + 2916) & 1) == 0) {
    return 4294966777;
  }
  uint64_t result = nghttp2_map_find((uint64_t *)a1, a2);
  if (result)
  {
    if ((*(unsigned char *)(result + 216) & 2) != 0 || *(_DWORD *)(result + 204) == 5)
    {
      return 0;
    }
    else
    {
      LODWORD(result) = session_update_consumed_size(a1, (int *)(result + 180), (int *)(result + 176), *(unsigned __int8 *)(result + 219), *(_DWORD *)(result + 168), a3, *(_DWORD *)(result + 188));
      if ((int)result <= -901) {
        return result;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

uint64_t nghttp2_session_consume_connection(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a1 + 2916) & 1) == 0) {
    return 4294966777;
  }
  LODWORD(result) = session_update_consumed_size(a1, (int *)(a1 + 2836), (int *)(a1 + 2832), *(unsigned __int8 *)(a1 + 2934), 0, a2, *(_DWORD *)(a1 + 2844));
  if ((int)result <= -901) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t session_update_consumed_size(uint64_t a1, int *a2, int *a3, int a4, int a5, uint64_t a6, int a7)
{
  unint64_t v7 = *a2;
  if (0x7FFFFFFF - a6 >= v7)
  {
    int v11 = v7 + a6;
    *a2 = v11;
    if (!a4
      && (v11 >= *a3 ? (int v13 = *a3) : (int v13 = v11),
          a7 >= 0 ? (int v14 = a7) : (int v14 = a7 + 1),
          (int v15 = v14 >> 1, v13 >= 1) ? (v16 = v15 <= v13) : (v16 = 0),
          v16))
    {
      uint64_t result = nghttp2_session_add_window_update(a1, a5, v13);
      if (!result)
      {
        *a3 -= v13;
        *a2 -= v13;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    int v8 = *(_DWORD *)(a1 + 2812);
    return session_terminate_session(a1, v8, 3, 0);
  }
  return result;
}

uint64_t session_detach_stream_item(uint64_t a1, uint64_t a2)
{
  uint64_t result = nghttp2_stream_detach_item(a2);
  if ((*(unsigned char *)(a2 + 216) & 0x10) != 0 && *(unsigned char *)(a2 + 218))
  {
    return session_ob_data_remove(a1, a2);
  }
  return result;
}

uint64_t nghttp2_stream_detach_item(uint64_t result)
{
  *(void *)(result + 152) = 0;
  char v1 = *(unsigned char *)(result + 216);
  *(unsigned char *)(result + 216) = v1 & 0xF3;
  if ((v1 & 0x10) == 0 && !*(void *)(result + 24)) {
    return stream_obq_remove(result);
  }
  return result;
}

uint64_t session_headers_add_pad(void *a1, uint64_t *a2)
{
  if ((unint64_t)(*a2 + 256) >= 0x4000) {
    unint64_t v4 = 0x4000;
  }
  else {
    unint64_t v4 = *a2 + 256;
  }
  uint64_t result = session_call_select_padding(a1, a2, v4);
  if ((int)result >= -900)
  {
    uint64_t v6 = a1 + 82;
    uint64_t v7 = result - *a2;
    nghttp2_frame_add_pad(v6, (uint64_t)a2, v7, 0);
    uint64_t result = 0;
    a2[2] = v7;
  }
  return result;
}

uint64_t nghttp2_session_pack_data(uint64_t a1, uint64_t *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = (void *)*a2;
  if (*a2 != a2[1]) {
    __assert_rtn("nghttp2_session_pack_data", "nghttp2_session.c", 7734, "bufs->head == bufs->cur");
  }
  int v13 = *(uint64_t (**)(uint64_t, void, void, void, void, void, void))(a1 + 2496);
  if (v13
    || (int v13 = *(uint64_t (**)(uint64_t, void, void, void, void, void, void))(a1 + 2488)) != 0)
  {
    int v14 = v13(a1, *(unsigned __int8 *)(a4 + 12), *(unsigned int *)(a6 + 168), *(unsigned int *)(a1 + 2828), *(unsigned int *)(a6 + 172), *(unsigned int *)(a1 + 2868), *(void *)(a1 + 2608));
    int v15 = *(_DWORD *)(a6 + 172);
    if (v14 < v15) {
      int v15 = v14;
    }
    if (v15 >= *(_DWORD *)(a1 + 2828)) {
      int v15 = *(_DWORD *)(a1 + 2828);
    }
    if (v15 >= *(_DWORD *)(a1 + 2868)) {
      int v15 = *(_DWORD *)(a1 + 2868);
    }
    if (v15 < 1) {
      return 4294966394;
    }
    unint64_t v16 = v15;
    if (v6[2] - v6[4] >= (unint64_t)v15) {
      goto LABEL_16;
    }
    if (*(void *)(a1 + 712) <= (unint64_t)(v15 + 10))
    {
      uint64_t v31 = 0;
      if (!buf_chain_new(&v31, v15 + 10, *(void **)(a1 + 672)))
      {
        nghttp2_bufs_free((void **)(a1 + 656));
        uint64_t v17 = v31;
        *(void *)(a1 + 656) = v31;
        *(void *)(a1 + 664) = v17;
        uint64_t v18 = *(void *)(a1 + 712);
        uint64_t v19 = *(void *)(v17 + 24) + v18;
        uint64_t v20 = *(void *)(v17 + 32) + v18;
        *(void *)(v17 + 24) = v19;
        *(void *)(v17 + 32) = v20;
        *(void *)(a1 + 680) = v16 + 10;
        *(void *)(a1 + 696) = 1;
        if ((uint64_t *)(a1 + 656) != a2) {
          __assert_rtn("nghttp2_session_pack_data", "nghttp2_session.c", 7777, "&session->aob.framebufs == bufs");
        }
        uint64_t v6 = (void *)a2[1];
LABEL_16:
        a3 = v16;
      }
    }
  }
  if (v6[2] - v6[4] < a3) {
    __assert_rtn("nghttp2_session_pack_data", "nghttp2_session.c", 7786, "nghttp2_buf_avail(buf) >= datamax");
  }
  int v30 = 0;
  if ((*(_DWORD *)a5 - 1) >= 2) {
    __assert_rtn("nghttp2_session_pack_data", "nghttp2_session.c", 7803, "0");
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, void, void, unint64_t, int *, uint64_t, void))(a5 + 16))(a1, *(unsigned int *)(a4 + 8), v6[3], a3, &v30, a5 + 8, *(void *)(a1 + 2608));
  unint64_t v22 = result;
  if ((unint64_t)(result + 526) > 0x12 || ((1 << (result + 14)) & 0x40021) == 0)
  {
    uint64_t result = 4294966394;
    if ((v22 & 0x8000000000000000) == 0 && a3 >= v22)
    {
      uint64_t v24 = v6[3];
      v6[3] = v24 - 9;
      v6[4] = v24 + v22;
      *(unsigned char *)(a4 + 13) = 0;
      char v25 = v30;
      if (v30)
      {
        *(unsigned char *)(a5 + 25) = 1;
        if (v25 & 2) == 0 && (*(unsigned char *)(a5 + 24)) {
          *(unsigned char *)(a4 + 13) |= 1u;
        }
      }
      if ((v25 & 4) == 0) {
        goto LABEL_33;
      }
      if (*(void *)(a1 + 2512))
      {
        *(unsigned char *)(a5 + 26) = 1;
LABEL_33:
        *(void *)a4 = v22;
        *(void *)(a4 + 16) = 0;
        if (a3 >= v22 + 256) {
          unint64_t v26 = v22 + 256;
        }
        else {
          unint64_t v26 = a3;
        }
        uint64_t result = session_call_select_padding((void *)a1, (uint64_t *)a4, v26);
        if ((int)result >= -900)
        {
          *(void *)(a4 + 16) = result - v22;
          uint64_t v27 = v6[3];
          *(_DWORD *)uint64_t v27 = bswap32(*(_DWORD *)a4) >> 8;
          *(unsigned char *)(v27 + 3) = *(unsigned char *)(a4 + 12);
          *(unsigned char *)(v27 + 4) = *(unsigned char *)(a4 + 13);
          *(_DWORD *)(v27 + 5) = bswap32(*(_DWORD *)(a4 + 8));
          nghttp2_frame_add_pad(a2, a4, *(void *)(a4 + 16), *(unsigned __int8 *)(a5 + 26));
          uint64_t v28 = **(void **)(a6 + 152);
          *(void *)(a6 + 160) = v28;
          if ((*(unsigned char *)(a6 + 216) & 0x10) != 0)
          {
            if (*(unsigned char *)(a1 + 2932))
            {
              if ((*(unsigned char *)(a6 + 220) & 0x7Fu) >= 8) {
                __assert_rtn("session_sched_reschedule_stream", "nghttp2_session.c", 1100, "urgency < NGHTTP2_EXTPRI_URGENCY_LEVELS");
              }
              if ((*(unsigned char *)(a6 + 220) & 0x80) != 0)
              {
                int v29 = (uint64_t *)(a1 + 40 * (*(unsigned char *)(a6 + 220) & 0x7F) + 328);
                if (v29[2] != 1)
                {
                  nghttp2_pq_remove((uint64_t)v29, (unint64_t *)a6);
                  *(void *)(a6 + 72) += v28;
                  if (nghttp2_pq_push(v29, (unint64_t *)a6)) {
                    __assert_rtn("session_sched_reschedule_stream", "nghttp2_session.c", 1114, "0 == rv");
                  }
                }
              }
            }
          }
          else
          {
            nghttp2_stream_reschedule(a6);
          }
          if (*(void *)a4 || (~v30 & 3) != 0) {
            return 0;
          }
          else {
            return 4294966761;
          }
        }
        return result;
      }
      return 4294966394;
    }
  }
  return result;
}

uint64_t session_call_select_padding(void *a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v3 = *a2;
  if (*a2 < a3)
  {
    uint64_t v5 = (uint64_t (*)(void *, uint64_t *, uint64_t, void))a1[310];
    if (v5 || (uint64_t v5 = (uint64_t (*)(void *, uint64_t *, uint64_t, void))a1[309]) != 0)
    {
      unint64_t v6 = v3 + 256;
      if (v6 >= a3) {
        uint64_t v7 = a3;
      }
      else {
        uint64_t v7 = v6;
      }
      uint64_t v8 = v5(a1, a2, v7, a1[326]);
      BOOL v9 = v8 >= *a2 && v8 <= v7;
      uint64_t v3 = -902;
      if (v9) {
        return v8;
      }
    }
  }
  return v3;
}

void nghttp2_frame_add_pad(uint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a3)
  {
    uint64_t v5 = *a1;
    uint64_t v6 = a3 - 1;
    if (*(void *)(*a1 + 16) - *(void *)(*a1 + 32) < (unint64_t)(a3 - 1)) {
      __assert_rtn("nghttp2_frame_add_pad", "nghttp2_frame.c", 1214, "nghttp2_buf_avail(buf) >= padlen - 1");
    }
    uint64_t v8 = *(void *)(v5 + 24);
    *(void *)(v8 - 1) = *(void *)v8;
    *(unsigned char *)(v8 + 7) = *(unsigned char *)(v8 + 8);
    uint64_t v9 = *(void *)(v5 + 24);
    *(void *)(v5 + 24) = v9 - 1;
    *(unsigned char *)(v9 + 3) |= 8u;
    **(_DWORD **)(v5 + 24) = bswap32((bswap32(**(_DWORD **)(v5 + 24)) + (a3 << 8)) & 0xFFFFFF00 | HIBYTE(**(_DWORD **)(v5 + 24)));
    if (!a4)
    {
      *(unsigned char *)(*(void *)(v5 + 24) + 9) = v6;
      bzero(*(void **)(v5 + 32), a3 - 1);
      *(void *)(v5 + 32) += v6;
    }
    *(void *)a2 += a3;
    *(unsigned char *)(a2 + 13) |= 8u;
  }
}

uint64_t nghttp2_stream_reschedule(uint64_t result)
{
  if (!*(unsigned char *)(result + 218)) {
    __assert_rtn("nghttp2_stream_reschedule", "nghttp2_stream.c", 229, "stream->queued");
  }
  char v1 = (unint64_t *)result;
  for (i = *(void **)(result + 96); i; char v1 = v3)
  {
    uint64_t v3 = i;
    unint64_t v4 = i + 1;
    nghttp2_pq_remove((uint64_t)(i + 1), v1);
    unint64_t v5 = *((unsigned int *)v1 + 48);
    unint64_t v6 = *((unsigned int *)v1 + 49) + (v1[20] << 8);
    v1[9] = v6 / v5 + v3[8];
    *((_DWORD *)v1 + 49) = v6 % v5;
    unint64_t v7 = v3[10];
    v3[10] = v7 + 1;
    v1[11] = v7;
    uint64_t result = nghttp2_pq_push(v4, v1);
    v3[20] = v1[20];
    uint64_t i = (void *)v3[12];
  }
  return result;
}

uint64_t stream_obq_push(uint64_t result, uint64_t *a2)
{
  if (result)
  {
    uint64_t v3 = (uint64_t *)result;
    do
    {
      if (*((unsigned char *)a2 + 218)) {
        break;
      }
      unint64_t v4 = *((unsigned int *)a2 + 48);
      unint64_t v5 = *((unsigned int *)a2 + 49) + (a2[20] << 8);
      a2[9] = v5 / v4 + v3[8];
      *((_DWORD *)a2 + 49) = v5 % v4;
      uint64_t v6 = v3[10];
      v3[10] = v6 + 1;
      a2[11] = v6;
      uint64_t result = nghttp2_pq_push(v3 + 1, (unint64_t *)a2);
      if (result) {
        return result;
      }
      *((unsigned char *)a2 + 218) = 1;
      a2 = v3;
      uint64_t v3 = (uint64_t *)v3[12];
    }
    while (v3);
    return 0;
  }
  return result;
}

uint64_t nghttp2_pq_push(uint64_t *a1, unint64_t *a2)
{
  unint64_t v4 = a1[2];
  unint64_t v5 = a1[3];
  if (v5 > v4)
  {
    uint64_t v6 = *a1;
LABEL_9:
    *(void *)(v6 + 8 * v4) = a2;
    *a2 = v4;
    a1[2] = v4 + 1;
    bubble_up((uint64_t)a1, v4);
    return 0;
  }
  unint64_t v7 = 2 * v5;
  if (v7 <= 4) {
    unint64_t v8 = 4;
  }
  else {
    unint64_t v8 = v7;
  }
  if (!(v8 >> 61))
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, unint64_t, void))(a1[1] + 32))(*a1, 8 * v8, *(void *)a1[1]);
    if (v6)
    {
      a1[3] = v8;
      *a1 = v6;
      unint64_t v4 = a1[2];
      goto LABEL_9;
    }
  }
  return 4294966395;
}

uint64_t bubble_up(uint64_t result, unint64_t a2)
{
  if (a2)
  {
    unint64_t v2 = a2;
    uint64_t v3 = result;
    do
    {
      unint64_t v4 = v2 - 1;
      unint64_t v5 = (v2 - 1) >> 1;
      uint64_t result = (*(uint64_t (**)(void, void))(v3 + 32))(*(void *)(*(void *)v3 + 8 * v2), *(void *)(*(void *)v3 + 8 * v5));
      if (!result) {
        break;
      }
      uint64_t v6 = *(unint64_t **)(*(void *)v3 + 8 * v5);
      unint64_t v7 = *(unint64_t **)(*(void *)v3 + 8 * v2);
      *(void *)(*(void *)v3 + 8 * v5) = v7;
      *unint64_t v7 = v5;
      *(void *)(*(void *)v3 + 8 * v2) = v6;
      *uint64_t v6 = v2;
      unint64_t v2 = (v2 - 1) >> 1;
    }
    while (v4 > 1);
  }
  return result;
}

uint64_t stream_obq_remove(uint64_t result)
{
  if (*(unsigned char *)(result + 218))
  {
    uint64_t v1 = result;
    do
    {
      uint64_t v2 = *(void *)(v1 + 96);
      if (!v2) {
        break;
      }
      uint64_t result = nghttp2_pq_remove(v2 + 8, (unint64_t *)v1);
      if (!*(unsigned char *)(v1 + 218)) {
        __assert_rtn("stream_obq_remove", "nghttp2_stream.c", 191, "stream->queued");
      }
      *(unsigned char *)(v1 + 218) = 0;
      *(_DWORD *)(v1 + 196) = 0;
      *(void *)(v1 + 160) = 0;
      *(void *)(v1 + 64) = 0;
      *(void *)(v1 + 72) = 0;
      if (*(void *)(v2 + 152))
      {
        if ((*(unsigned char *)(v2 + 216) & 0xC) == 0) {
          break;
        }
      }
      uint64_t v1 = v2;
    }
    while (!*(void *)(v2 + 24));
  }
  return result;
}

uint64_t nghttp2_pq_remove(uint64_t result, unint64_t *a2)
{
  uint64_t v2 = *(void **)result;
  unint64_t v3 = *a2;
  if (*(unint64_t **)(*(void *)result + 8 * *a2) != a2) {
    __assert_rtn("nghttp2_pq_remove", "nghttp2_pq.c", 134, "pq->q[item->index] == item");
  }
  uint64_t v4 = result;
  uint64_t v5 = *(void *)(result + 16);
  if (!v3)
  {
    if (!v5) {
      return result;
    }
    void *v2 = v2[v5 - 1];
    ***(void ***)uint64_t result = 0;
    *(void *)(result + 16) = v5 - 1;
    unint64_t v7 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = v5 - 1;
  if (v3 == v6)
  {
    *(void *)(result + 16) = v3;
    return result;
  }
  v2[v3] = v2[v6];
  uint64_t v9 = *(void **)result;
  **(void **)(*(void *)result + 8 * v3) = v3;
  *(void *)(result + 16) = v6;
  int v10 = (*(uint64_t (**)(unint64_t *, void))(result + 32))(a2, v9[*a2]);
  unint64_t v7 = *a2;
  if (v10)
  {
    uint64_t result = v4;
LABEL_10:
    return bubble_down(result, v7);
  }

  return bubble_up(v4, v7);
}

uint64_t bubble_down(uint64_t result, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = result;
  for (unint64_t i = a2; ; v2 = i)
  {
    char v5 = 1;
    unint64_t v6 = (2 * v2) | 1;
    do
    {
      char v7 = v5;
      if (v6 >= *(void *)(v3 + 16)) {
        break;
      }
      uint64_t result = (*(uint64_t (**)(void, void))(v3 + 32))(*(void *)(*(void *)v3 + 8 * v6), *(void *)(*(void *)v3 + 8 * i));
      char v5 = 0;
      if (result) {
        unint64_t i = v6;
      }
      ++v6;
    }
    while ((v7 & 1) != 0);
    if (i == v2) {
      break;
    }
    unint64_t v8 = *(unint64_t **)(*(void *)v3 + 8 * v2);
    uint64_t v9 = *(unint64_t **)(*(void *)v3 + 8 * i);
    *(void *)(*(void *)v3 + 8 * v2) = v9;
    *uint64_t v9 = v2;
    *(void *)(*(void *)v3 + 8 * i) = v8;
    *unint64_t v8 = i;
  }
  return result;
}

uint64_t nghttp2_session_open_stream(uint64_t a1, int a2, uint64_t *a3, int a4, uint64_t a5)
{
  uint64_t v10 = nghttp2_map_find((uint64_t *)a1, a2);
  uint64_t v11 = v10;
  char v12 = *(unsigned char *)(a1 + 2916);
  if (v10)
  {
    if (*(_DWORD *)(v10 + 204) != 5) {
      __assert_rtn("nghttp2_session_open_stream", "nghttp2_session.c", 1340, "stream->state == NGHTTP2_STREAM_IDLE");
    }
    char v13 = *(unsigned char *)(v10 + 216);
    if ((v13 & 0x10) == 0
      && !*(void *)(v10 + 96)
      && !*(void *)(v10 + 104)
      && !*(void *)(v10 + 112)
      && !*(void *)(v10 + 120))
    {
      __assert_rtn("nghttp2_session_open_stream", "nghttp2_session.c", 1342, "(stream->flags & NGHTTP2_STREAM_FLAG_NO_RFC7540_PRIORITIES) || nghttp2_stream_in_dep_tree(stream)");
    }
    uint64_t v14 = *(void *)(v10 + 128);
    uint64_t v15 = *(void *)(v10 + 136);
    unint64_t v16 = (void *)(a1 + 2632);
    if (v14) {
      unint64_t v16 = (void *)(v14 + 136);
    }
    *unint64_t v16 = v15;
    if (v15) {
      uint64_t v17 = (void *)(v15 + 128);
    }
    else {
      uint64_t v17 = (void *)(a1 + 2640);
    }
    *uint64_t v17 = v14;
    *(void *)(v10 + 128) = 0;
    *(void *)(v10 + 136) = 0;
    --*(void *)(a1 + 2736);
    if (*(void *)(v10 + 96)
      || *(void *)(v10 + 104)
      || *(void *)(v10 + 112)
      || (uint64_t v18 = v10, *(void *)(v10 + 120)))
    {
      if ((v13 & 0x10) != 0) {
        __assert_rtn("nghttp2_session_open_stream", "nghttp2_session.c", 1347, "!(stream->flags & NGHTTP2_STREAM_FLAG_NO_RFC7540_PRIORITIES)");
      }
      nghttp2_stream_dep_remove(v10);
      if (v19) {
        return 0;
      }
      uint64_t v18 = v11;
      if (*(unsigned char *)(a1 + 2930) == 1)
      {
        uint64_t v18 = v11;
        if (!*(unsigned char *)(a1 + 2931))
        {
          *(unsigned char *)(v11 + 216) |= 0x10u;
          uint64_t v18 = v11;
        }
      }
    }
  }
  else
  {
    uint64_t v18 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(224, *(void *)(a1 + 2568));
    if (!v18) {
      return v18;
    }
  }
  char v20 = v12 & 0x40;
  int v40 = 0;
  uint64_t v39 = 0;
  int v21 = *(unsigned __int8 *)(a1 + 2930);
  if (v21 == 1 && !*(unsigned char *)(a1 + 2931) || *(_DWORD *)(a1 + 2880) == 1)
  {
    if (*(unsigned char *)(a1 + 2932) || *(_DWORD *)(a1 + 2880) == 1)
    {
      uint64_t v39 = 0x1000000000;
      a3 = &v39;
    }
    uint64_t v22 = 0;
    if (v21 == 1) {
      v20 |= 0x10u;
    }
    goto LABEL_48;
  }
  uint64_t v23 = *(unsigned int *)a3;
  if (!v23)
  {
    uint64_t v22 = 0;
    goto LABEL_48;
  }
  uint64_t v24 = (void *)nghttp2_map_find((uint64_t *)a1, *(_DWORD *)a3);
  uint64_t v22 = (uint64_t)v24;
  if (v24)
  {
    if (v24[12] || v24[13] || v24[14] || v24[15]) {
      goto LABEL_48;
    }
LABEL_47:
    uint64_t v39 = 0x1000000000;
    a3 = &v39;
    goto LABEL_48;
  }
  if ((v23 & 1) == (*(unsigned char *)(a1 + 2932) == 0)) {
    int v25 = *(_DWORD *)(a1 + 2804);
  }
  else {
    int v25 = *(_DWORD *)(a1 + 2808);
  }
  if (v25 >= (int)v23) {
    goto LABEL_47;
  }
  uint64_t v39 = 0x1000000000;
  uint64_t v22 = nghttp2_session_open_stream(a1, v23, &v39, 5, 0);
  if (!v22)
  {
    if (v11) {
      return 0;
    }
LABEL_93:
    (*(void (**)(uint64_t, void))(a1 + 2584))(v18, *(void *)(a1 + 2568));
    return 0;
  }
LABEL_48:
  char v26 = v20 | (a4 == 4);
  if (v11)
  {
    *(unsigned char *)(v18 + 216) = v26;
    *(_DWORD *)(v18 + 204) = a4;
    *(_DWORD *)(v18 + 192) = *((_DWORD *)a3 + 1);
    *(void *)(v18 + 144) = a5;
    goto LABEL_50;
  }
  int v27 = *((_DWORD *)a3 + 1);
  int v28 = *(_DWORD *)(a1 + 2864);
  int v29 = *(_DWORD *)(a1 + 2896);
  *(void *)(v18 + 8) = 0;
  *(void *)(v18 + 16) = a1 + 2568;
  *(void *)(v18 + 24) = 0;
  *(void *)(v18 + 32) = 0;
  *(void *)(v18 + 40) = stream_less;
  *(unsigned char *)(v18 + 216) = v26;
  *(_DWORD *)(v18 + 204) = a4;
  *(void *)(v18 + 144) = a5;
  *(void *)(v18 + 152) = 0;
  *(_DWORD *)(v18 + 168) = a2;
  *(_DWORD *)(v18 + 172) = v28;
  *(void *)(v18 + 176) = 0;
  *(_DWORD *)(v18 + 184) = 0;
  *(_DWORD *)(v18 + 188) = v29;
  *(_OWORD *)(v18 + 112) = 0u;
  *(_OWORD *)(v18 + 128) = 0u;
  *(_DWORD *)(v18 + 192) = v27;
  *(_DWORD *)(v18 + 212) = 0;
  *(_WORD *)(v18 + 208) = -1;
  *(void *)(v18 + 196) = 0;
  *(void *)(v18 + 160) = 0;
  *(_OWORD *)(v18 + 80) = 0u;
  *(_OWORD *)(v18 + 96) = 0u;
  *(_OWORD *)(v18 + 48) = xmmword_20DB443D0;
  *(_OWORD *)(v18 + 64) = 0u;
  *(unsigned char *)(v18 + 221) = 3;
  *(_DWORD *)(v18 + 217) = 50331648;
  if (*(unsigned char *)(a1 + 2930) == 1 && !*(unsigned char *)(a1 + 2931))
  {
    uint64_t v30 = *(void *)(a1 + 2688);
    *(void *)(a1 + 2688) = v30 + 1;
    *(void *)(v18 + 88) = v30;
  }
  int v31 = *(_DWORD *)(a1 + 24);
  if (4 * *(void *)(a1 + 16) + 4 > (unint64_t)(3 * v31))
  {
    if (v31)
    {
      if (v31 < 0) {
        goto LABEL_92;
      }
      unsigned int v32 = 2 * v31;
      int v33 = *(_DWORD *)(a1 + 28) + 1;
      uint64_t v34 = a1;
    }
    else
    {
      uint64_t v34 = a1;
      unsigned int v32 = 16;
      int v33 = 4;
    }
    if (!map_resize(v34, v32, v33)) {
      goto LABEL_91;
    }
LABEL_92:
    (*(void (**)(void, void))(*(void *)(v18 + 16) + 16))(*(void *)(v18 + 8), **(void **)(v18 + 16));
    *(void *)(v18 + 8) = 0;
    goto LABEL_93;
  }
LABEL_91:
  if (insert(*(void *)a1, *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 28), -1640531527 * a2, a2, v18)) {
    goto LABEL_92;
  }
  ++*(void *)(a1 + 16);
LABEL_50:
  if (a4 == 5)
  {
    uint64_t v35 = *(void *)(a1 + 2640);
    if (v35)
    {
      *(void *)(v35 + 136) = v18;
      *(void *)(v18 + 128) = v35;
    }
    else
    {
      *(void *)(a1 + 2632) = v18;
    }
    *(void *)(a1 + 2640) = v18;
    ++*(void *)(a1 + 2736);
  }
  else if (a4 == 4)
  {
    if (a2 && ((a2 ^ (*(unsigned char *)(a1 + 2932) == 0)) & 1) == 0)
    {
      *(unsigned char *)(v18 + 217) |= 1u;
    }
    else
    {
      *(unsigned char *)(v18 + 217) |= 2u;
      ++*(void *)(a1 + 2712);
    }
  }
  else if (a2 && ((a2 ^ (*(unsigned char *)(a1 + 2932) == 0)) & 1) == 0)
  {
    ++*(void *)(a1 + 2696);
  }
  else
  {
    ++*(void *)(a1 + 2704);
  }
  if ((*(unsigned char *)(v18 + 216) & 0x10) == 0)
  {
    if (*(_DWORD *)a3) {
      uint64_t v36 = v22;
    }
    else {
      uint64_t v36 = a1 + 32;
    }
    if (!v36) {
      __assert_rtn("nghttp2_session_open_stream", "nghttp2_session.c", 1478, "dep_stream");
    }
    if (*((unsigned char *)a3 + 8))
    {
      *(_DWORD *)(v18 + 200) = *(_DWORD *)(v36 + 200);
      *(_DWORD *)(v36 + 200) = *(_DWORD *)(v18 + 192);
      uint64_t v37 = *(void *)(v36 + 104);
      if (v37)
      {
        while (1)
        {
          *(void *)(v37 + 96) = v18;
          if (*(unsigned char *)(v37 + 218))
          {
            if (stream_obq_move(v18, v36, v37)) {
              return 0;
            }
          }
          uint64_t v37 = *(void *)(v37 + 120);
          if (!v37)
          {
            if ((!*(void *)(v18 + 152) || (*(unsigned char *)(v18 + 216) & 0xC) != 0) && !*(void *)(v18 + 24)
              || !stream_obq_push(v36, (uint64_t *)v18))
            {
              *(void *)(v18 + 104) = *(void *)(v36 + 104);
              goto LABEL_88;
            }
            return 0;
          }
        }
      }
      goto LABEL_88;
    }
    *(_DWORD *)(v36 + 200) += *(_DWORD *)(v18 + 192);
    if (!*(void *)(v36 + 104))
    {
LABEL_88:
      *(void *)(v36 + 104) = v18;
      *(void *)(v18 + 96) = v36;
      return v18;
    }
    insert_link_dep(v36, (void *)v18);
  }
  return v18;
}

uint64_t nghttp2_http_record_request_method(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 12);
  if (v2 == 5)
  {
    uint64_t v3 = (uint64_t *)(a2 + 24);
    uint64_t v4 = (uint64_t *)(a2 + 32);
  }
  else
  {
    if (v2 != 1) {
      return result;
    }
    uint64_t v3 = (uint64_t *)(a2 + 40);
    uint64_t v4 = (uint64_t *)(a2 + 48);
  }
  uint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *v3;
    for (unint64_t i = (void *)(v7 + 16); ; i += 5)
    {
      if (*i == 7)
      {
        uint64_t v9 = (int *)*(i - 2);
        if (*((unsigned char *)v9 + 6) == 100)
        {
          int v10 = *v9;
          int v11 = *((unsigned __int16 *)v9 + 2);
          if (v10 == 1952804154 && v11 == 28520) {
            break;
          }
        }
      }
      if (v5 == ++v6) {
        return result;
      }
    }
    uint64_t v13 = *(void *)(v7 + 40 * v6 + 24);
    if (v13 == 4)
    {
      if (**(_DWORD **)(v7 + 40 * v6 + 8) != 1145128264) {
        return result;
      }
      int v18 = 256;
    }
    else
    {
      if (v13 != 7) {
        return result;
      }
      uint64_t v14 = *(int **)(v7 + 40 * v6 + 8);
      int v15 = *v14;
      int v16 = *(int *)((char *)v14 + 3);
      if (v15 != 1313754947 || v16 != 1413694798) {
        return result;
      }
      int v18 = 128;
    }
    *(_DWORD *)(result + 212) |= v18;
  }
  return result;
}

uint64_t nghttp2_frame_pack_headers(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t ***)a1;
  if (*(void *)a1 != *(void *)(a1 + 8)) {
    __assert_rtn("nghttp2_frame_pack_headers", "nghttp2_frame.c", 367, "bufs->head == bufs->cur");
  }
  if ((*(unsigned char *)(a2 + 13) & 0x20) != 0) {
    uint64_t v6 = -5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = 5;
  if ((*(unsigned char *)(a2 + 13) & 0x20) == 0) {
    uint64_t v7 = 0;
  }
  unint64_t v8 = (uint64_t *)((char *)v3[3] + v7);
  v3[3] = v8;
  v3[4] = v8;
  unsigned int v9 = nghttp2_hd_deflate_hd_bufs(a3, a1, *(void *)(a2 + 40), *(void *)(a2 + 48));
  if (v9 == -502) {
    uint64_t v10 = 4294966773;
  }
  else {
    uint64_t v10 = v9;
  }
  int v11 = (uint64_t *)((char *)v3[3] + v6);
  v3[3] = v11;
  if (!v10)
  {
    if ((*(unsigned char *)(a2 + 13) & 0x20) != 0)
    {
      unsigned int v12 = bswap32(*(_DWORD *)(a2 + 24));
      *(_DWORD *)int v11 = v12;
      if (*(unsigned char *)(a2 + 32)) {
        *(unsigned char *)int v11 = v12 | 0x80;
      }
      *((unsigned char *)v11 + 4) = *(unsigned char *)(a2 + 28) - 1;
    }
    *(void *)(a2 + 16) = 0;
    uint64_t v13 = *(uint64_t ***)a1;
    if (*(void *)a1)
    {
      int64_t v14 = 0;
      do
      {
        int64_t v14 = (char *)v13[4] + v14 - (char *)v13[3];
        uint64_t v13 = (uint64_t **)*v13;
      }
      while (v13);
    }
    else
    {
      int64_t v14 = 0;
    }
    *(void *)a2 = v14;
    frame_pack_headers_shared((uint64_t ***)a1, a2);
  }
  return v10;
}

uint64_t insert(uint64_t a1, int a2, char a3, unsigned int a4, int a5, uint64_t a6)
{
  uint64_t v6 = a4 >> -a3;
  uint64_t v7 = (unsigned int *)(a1 + 16 * v6);
  uint64_t v8 = *((void *)v7 + 1);
  if (v8)
  {
    unint64_t v9 = 0;
    char v10 = 32 - a3;
    unsigned int v11 = a2 - 1;
    do
    {
      unsigned int v12 = *v7;
      uint64_t v13 = a1 + 16 * v6;
      int v16 = *(_DWORD *)(v13 + 4);
      int64_t v14 = (_DWORD *)(v13 + 4);
      int v15 = v16;
      if (v9 <= ((v6 - (*v7 >> v10)) & v11))
      {
        if (v15 == a5) {
          return 4294966795;
        }
      }
      else
      {
        *uint64_t v7 = a4;
        _DWORD *v14 = a5;
        a4 = v12;
        a5 = v15;
        *(void *)(a1 + 16 * v6 + 8) = a6;
        a6 = v8;
        unint64_t v9 = (v6 - (v12 >> v10)) & v11;
      }
      ++v9;
      uint64_t v6 = (v6 + 1) & v11;
      uint64_t v7 = (unsigned int *)(a1 + 16 * v6);
      uint64_t v8 = *((void *)v7 + 1);
    }
    while (v8);
  }
  uint64_t v17 = 0;
  *uint64_t v7 = a4;
  uint64_t v18 = a1 + 16 * v6;
  *(_DWORD *)(v18 + 4) = a5;
  *(void *)(v18 + 8) = a6;
  return v17;
}

uint64_t ***frame_pack_headers_shared(uint64_t ***result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a2 + 8);
  char v3 = *(unsigned char *)(a2 + 12);
  char v4 = *(unsigned char *)(a2 + 13);
  uint64_t v5 = (*result)[3];
  unsigned int v6 = *((_DWORD *)*result + 8) - v5;
  if (*result != result[1]) {
    v4 &= ~4u;
  }
  (*result)[3] = (uint64_t *)((char *)v5 - 9);
  *(_DWORD *)((char *)v5 - 9) = bswap32(v6) >> 8;
  *((unsigned char *)v5 - 6) = v3;
  *((unsigned char *)v5 - 5) = v4;
  unsigned int v7 = bswap32(v2);
  *((_DWORD *)v5 - 1) = v7;
  uint64_t v8 = (uint64_t *)result[1];
  if (*result != (uint64_t **)v8)
  {
    for (unint64_t i = **result; i != v8; unint64_t i = (uint64_t *)*i)
    {
      uint64_t v10 = i[3];
      unsigned int v11 = *((_DWORD *)i + 8) - v10;
      i[3] = v10 - 9;
      *(_DWORD *)(v10 - 9) = bswap32(v11) >> 8;
      *(_WORD *)(v10 - 6) = 9;
      *(_DWORD *)(v10 - 4) = v7;
    }
    uint64_t v12 = v8[3];
    unsigned int v13 = *((_DWORD *)v8 + 8) - v12;
    v8[3] = v12 - 9;
    *(_DWORD *)(v12 - 9) = bswap32(v13) >> 8;
    *(unsigned char *)(v12 - 6) = 9;
    *(unsigned char *)(v12 - 5) = 4;
    *(_DWORD *)(v12 - 4) = v7;
  }
  return result;
}

uint64_t update_local_initial_window_size_func(uint64_t a1, int *a2)
{
  uint64_t v3 = *(int *)(a1 + 188);
  uint64_t v4 = a2[2] - (uint64_t)a2[3];
  int v5 = v4 + v3;
  if (v4 + v3 == v4 + v3)
  {
    *(_DWORD *)(a1 + 188) = v5;
    if (*(unsigned char *)(a1 + 219)) {
      return 0;
    }
    uint64_t v9 = *(void *)a2;
    if (*(unsigned char *)(*(void *)a2 + 2916))
    {
      int v14 = *(_DWORD *)(a1 + 168);
      return session_update_consumed_size(v9, (int *)(a1 + 180), (int *)(a1 + 176), 0, v14, 0, v5);
    }
    else
    {
      int v10 = *(_DWORD *)(a1 + 176);
      if (v5 >= 0) {
        int v11 = v4 + v3;
      }
      else {
        int v11 = v5 + 1;
      }
      int v12 = v11 >> 1;
      if (v10 < 1 || v12 > v10) {
        return 0;
      }
      uint64_t result = nghttp2_session_add_window_update(v9, *(_DWORD *)(a1 + 168), v10);
      if (!result) {
        *(_DWORD *)(a1 + 176) = 0;
      }
    }
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    int v8 = *(_DWORD *)(a1 + 168);
    return nghttp2_session_add_rst_stream(v7, v8, 3);
  }
  return result;
}

uint64_t nghttp2_iv_check(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    unsigned int v2 = (_DWORD *)(a1 + 4);
    while (2)
    {
      switch(*(v2 - 1))
      {
        case 2:
        case 8:
          if (*v2 < 2u) {
            goto LABEL_11;
          }
          return 0;
        case 4:
          if ((*v2 & 0x80000000) != 0) {
            return 0;
          }
          goto LABEL_11;
        case 5:
          if ((*v2 - 0x1000000) < 0xFF004000) {
            return 0;
          }
          goto LABEL_11;
        case 9:
          if (*v2 <= 1u) {
            goto LABEL_11;
          }
          return 0;
        default:
LABEL_11:
          v2 += 2;
          if (!--a2) {
            return 1;
          }
          continue;
      }
    }
  }
  return 1;
}

uint64_t nghttp2_hd_inflate_init(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = a2;
  *(unsigned char *)(a1 + 60) = 0;
  *(void *)(a1 + 48) = 4096;
  uint64_t v3 = (*(uint64_t (**)(uint64_t, void))(a2 + 8))(1024, *(void *)a2);
  *(void *)a1 = v3;
  if (!v3) {
    return 4294966395;
  }
  uint64_t result = 0;
  *(_OWORD *)(a1 + 200) = xmmword_20DB443B0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = 127;
  *(void *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0;
  *(void *)(a1 + 224) = 0x100000000;
  *(unsigned char *)(a1 + 232) = 0;
  *(void *)(a1 + 216) = 0;
  *(_WORD *)(a1 + 233) = 0;
  *(void *)(a1 + 184) = 0;
  *(void *)(a1 + 192) = 0;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  return result;
}

uint64_t nghttp2_hd_deflate_init2(uint64_t a1, unint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 32) = a3;
  *(unsigned char *)(a1 + 60) = 0;
  *(void *)(a1 + 48) = 4096;
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void))(a3 + 8))(1024, *(void *)a3);
  *(void *)a1 = v5;
  if (!v5) {
    return 4294966395;
  }
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = 127;
  *(void *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  bzero((void *)(a1 + 64), 0x400uLL);
  char v6 = 0;
  if (a2 <= 0xFFF)
  {
    *(void *)(a1 + 48) = a2;
    char v6 = 1;
  }
  uint64_t result = 0;
  *(unsigned char *)(a1 + 1104) = v6;
  *(void *)(a1 + 1088) = a2;
  *(void *)(a1 + 1096) = 0xFFFFFFFFLL;
  return result;
}

uint64_t map_resize(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v6 = (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 8) + 24))(a2, 16, **(void **)(a1 + 8));
  if (!v6) {
    return 4294966395;
  }
  uint64_t v7 = v6;
  unint64_t v8 = *(unsigned int *)(a1 + 24);
  if (v8)
  {
    uint64_t v9 = 0;
    for (unint64_t i = 0; i < v8; ++i)
    {
      uint64_t v11 = *(void *)a1 + v9;
      uint64_t v12 = *(void *)(v11 + 8);
      if (v12)
      {
        if (insert(v7, a2, a3, *(_DWORD *)v11, *(_DWORD *)(v11 + 4), v12)) {
          __assert_rtn("map_resize", "nghttp2_map.c", 207, "0 == rv");
        }
        unint64_t v8 = *(unsigned int *)(a1 + 24);
      }
      v9 += 16;
    }
  }
  (*(void (**)(void, void))(*(void *)(a1 + 8) + 16))(*(void *)a1, **(void **)(a1 + 8));
  uint64_t result = 0;
  *(_DWORD *)(a1 + 24) = a2;
  *(_DWORD *)(a1 + 28) = a3;
  *(void *)a1 = v7;
  return result;
}

uint64_t session_defer_stream_item(uint64_t result, uint64_t a2, char a3)
{
  if (!*(void *)(a2 + 152)) {
    __assert_rtn("nghttp2_stream_defer_item", "nghttp2_stream.c", 518, "stream->item");
  }
  uint64_t v4 = result;
  char v5 = *(unsigned char *)(a2 + 216) | a3;
  *(unsigned char *)(a2 + 216) = v5;
  if ((v5 & 0x10) != 0 || !*(void *)(a2 + 24) && (uint64_t result = stream_obq_remove(a2), (*(unsigned char *)(a2 + 216) & 0x10) != 0))
  {
    if (*(unsigned char *)(a2 + 218))
    {
      return session_ob_data_remove(v4, a2);
    }
  }
  return result;
}

uint64_t update_remote_initial_window_size_func(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(int *)(a2 + 8) - (uint64_t)*(int *)(a2 + 12) + *(int *)(a1 + 172);
  if (v3 == (int)v3)
  {
    *(_DWORD *)(a1 + 172) = v3;
    if ((int)v3 < 1) {
      return 0;
    }
    if (!*(void *)(a1 + 152)) {
      return 0;
    }
    if ((*(unsigned char *)(a1 + 216) & 4) == 0) {
      return 0;
    }
    uint64_t result = session_resume_deferred_stream_item(*(void *)a2, a1, 4);
    if ((int)result >= -900) {
      return 0;
    }
  }
  else
  {
    uint64_t v5 = *(void *)a2;
    int v6 = *(_DWORD *)(a1 + 168);
    return nghttp2_session_add_rst_stream(v5, v6, 3);
  }
  return result;
}

uint64_t insert_link_dep(uint64_t result, void *a2)
{
  if (a2[14]) {
    __assert_rtn("insert_link_dep", "nghttp2_stream.c", 668, "stream->sib_prev == NULL");
  }
  uint64_t v2 = *(void *)(result + 104);
  a2[15] = v2;
  if (v2) {
    *(void *)(v2 + 112) = a2;
  }
  *(void *)(result + 104) = a2;
  a2[12] = result;
  return result;
}

void *hd_context_shrink_table_size(void *result, uint64_t a2)
{
  if (result[5] > result[6])
  {
    uint64_t v3 = result;
    uint64_t v4 = result[4];
    do
    {
      uint64_t v5 = v3[3];
      if (!v5) {
        break;
      }
      int v6 = (uint64_t *)hd_ringbuf_get(v3, v5 - 1);
      uint64_t v7 = v6[1];
      v3[5] = v3[5] - (*(void *)(*v6 + 24) + *(void *)(v7 + 24)) - 32;
      uint64_t v8 = v3[3];
      if (!v8) {
        __assert_rtn("hd_ringbuf_pop_back", "nghttp2_hd.c", 671, "ringbuf->len > 0");
      }
      v3[3] = v8 - 1;
      if (a2)
      {
        uint64_t v9 = (uint64_t **)(a2 + 8 * (*((_DWORD *)v6 + 19) & 0x7F));
        int v10 = *v9;
        if (*v9)
        {
          if (v10 == v6)
          {
LABEL_11:
            *uint64_t v9 = (uint64_t *)v6[8];
            v6[8] = 0;
            uint64_t v7 = v6[1];
          }
          else
          {
            while (1)
            {
              uint64_t v11 = v10;
              int v10 = (uint64_t *)v10[8];
              if (!v10) {
                break;
              }
              if (v10 == v6)
              {
                uint64_t v9 = (uint64_t **)(v11 + 8);
                goto LABEL_11;
              }
            }
          }
        }
      }
      nghttp2_rcbuf_decref(v7);
      nghttp2_rcbuf_decref(*v6);
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t *, void))(v4 + 16))(v6, *(void *)v4);
    }
    while (v3[5] > v3[6]);
  }
  return result;
}

void session_close_stream_on_goaway(uint64_t a1, int a2, int a3)
{
  uint64_t v8 = a1;
  uint64_t v9 = 0;
  int v10 = a2;
  int v11 = a3;
  if (nghttp2_map_each(a1, find_stream_on_goaway_func, (uint64_t)&v8)) {
    __assert_rtn("session_close_stream_on_goaway", "nghttp2_session.c", 2838, "rv == 0");
  }
  uint64_t v4 = v9;
  while (v4)
  {
    uint64_t v5 = *(void *)(v4 + 136);
    *(void *)(v4 + 136) = 0;
    nghttp2_session_close_stream(a1, *(unsigned int *)(v4 + 168), 7);
    uint64_t v4 = v5;
    if (v6 <= -901)
    {
      if (v5)
      {
        do
        {
          uint64_t v7 = *(void *)(v5 + 136);
          *(void *)(v5 + 136) = 0;
          uint64_t v5 = v7;
        }
        while (v7);
      }
      return;
    }
  }
}

uint64_t nghttp2_session_client_new2(uint64_t *a1, _OWORD *a2, uint64_t a3, long long *a4)
{
  uint64_t v7 = 0;
  uint64_t result = session_new(&v7, a2, a3, 0, a4, 0);
  if (!result)
  {
    uint64_t v6 = v7;
    *(_DWORD *)(v7 + 2800) = 1;
    *a1 = v6;
  }
  return result;
}

uint64_t nghttp2_session_terminate_session(uint64_t a1, int a2)
{
  return session_terminate_session(a1, *(_DWORD *)(a1 + 2812), a2, 0);
}

uint64_t nghttp2_submit_window_update(uint64_t a1, uint64_t a2, int a3, int a4)
{
  int v10 = a4;
  if (!a4) {
    return 0;
  }
  if (!a3)
  {
    uint64_t result = nghttp2_adjust_local_window_size((int *)(a1 + 2844), (int *)(a1 + 2832), (int *)(a1 + 2840), &v10);
    if (result) {
      return result;
    }
    int v8 = v10;
    if (v10 > 0)
    {
      uint64_t v9 = (int *)(a1 + 2836);
      goto LABEL_12;
    }
    return 0;
  }
  uint64_t result = nghttp2_map_find((uint64_t *)a1, a3);
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  if ((*(unsigned char *)(result + 216) & 2) != 0 || *(_DWORD *)(result + 204) == 5) {
    return 0;
  }
  uint64_t result = nghttp2_adjust_local_window_size((int *)(result + 188), (int *)(result + 176), (int *)(result + 184), &v10);
  if (result) {
    return result;
  }
  int v8 = v10;
  if (v10 <= 0) {
    return 0;
  }
  uint64_t v9 = (int *)(v7 + 180);
LABEL_12:
  *uint64_t v9 = (*v9 - v8) & ~((*v9 - v8) >> 31);

  return nghttp2_session_add_window_update(a1, a3, v8);
}

uint64_t nghttp2_adjust_local_window_size(int *a1, int *a2, int *a3, int *a4)
{
  int v5 = *a4;
  if (*a4 < 1)
  {
    int v8 = *a1 + v5;
    if (v8 >= 0 && *a2 >= (int)(0x80000000 - v5) && *a3 <= v5 + 0x7FFFFFFF)
    {
      uint64_t result = 0;
      *a1 = v8;
      *a2 += *a4;
      *a3 -= *a4;
      *a4 = 0;
      return result;
    }
    return 4294966772;
  }
  int v6 = (*a2 & ~(*a2 >> 31)) - v5;
  if (v6 >= 0)
  {
    uint64_t result = 0;
    *a2 = v6;
    return result;
  }
  int v9 = *a1;
  if (*a1 > v6 + 0x7FFFFFFF) {
    return 4294966772;
  }
  uint64_t result = 0;
  *a1 = v9 - v6;
  if (*a3 >= -v6) {
    int v10 = -v6;
  }
  else {
    int v10 = *a3;
  }
  *a3 -= v10;
  *a2 = (*a2 & (*a2 >> 31)) + v10;
  *a4 -= v10;
  return result;
}

uint64_t nghttp2_session_callbacks_new(void *a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0xE0uLL, 0x800401140A6BDuLL);
  *a1 = v2;
  if (v2) {
    return 0;
  }
  else {
    return 4294966395;
  }
}

uint64_t nghttp2_submit_rst_stream(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a3) {
    return nghttp2_session_add_rst_stream(a1, a3, a4);
  }
  else {
    return 4294966795;
  }
}

BOOL stream_less(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 72) - *(void *)(a1 + 72);
  if (v2) {
    return HIDWORD(v2) == 0;
  }
  else {
    return *(void *)(a1 + 88) < *(void *)(a2 + 88);
  }
}

void *nghttp2_session_callbacks_set_send_callback(void *result, uint64_t a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_send_callback2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 8) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_recv_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_recv_callback2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_header_callback2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 104) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_invalid_header_callback2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 120) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_select_padding_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 128) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_select_padding_callback2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 136) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_data_source_read_length_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 144) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_data_source_read_length_callback2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 152) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_begin_frame_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 160) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_send_data_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 168) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_pack_extension_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 176) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_pack_extension_callback2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 184) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_unpack_extension_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 192) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_on_extension_chunk_recv_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 200) = a2;
  return result;
}

uint64_t nghttp2_session_callbacks_set_error_callback(uint64_t result, uint64_t a2)
{
  *(void *)(result + 208) = a2;
  return result;
}

uint64_t nghttp2_option_set_peer_max_concurrent_streams(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 2u;
  *(_DWORD *)(result + 60) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_recv_client_magic(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 4u;
  *(_DWORD *)(result + 76) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_http_messaging(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 8u;
  *(_DWORD *)(result + 80) = a2;
  return result;
}

uint64_t nghttp2_option_set_max_reserved_remote_streams(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x10u;
  *(_DWORD *)(result + 64) = a2;
  return result;
}

uint64_t nghttp2_option_set_user_recv_extension_type(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xA)
  {
    *(_DWORD *)(result + 56) |= 0x20u;
    *(unsigned char *)(result + ((unint64_t)a2 >> 3) + 104) |= 1 << (a2 & 7);
  }
  return result;
}

uint64_t nghttp2_option_set_builtin_recv_extension_type(uint64_t result, int a2)
{
  switch(a2)
  {
    case 10:
      int v2 = 1;
      break;
    case 16:
      int v2 = 4;
      break;
    case 12:
      int v2 = 2;
      break;
    default:
      return result;
  }
  *(_DWORD *)(result + 56) |= 0x80u;
  *(_DWORD *)(result + 68) |= v2;
  return result;
}

uint64_t nghttp2_option_set_no_auto_ping_ack(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x40u;
  *(_DWORD *)(result + 84) = a2;
  return result;
}

uint64_t nghttp2_option_set_max_send_header_block_length(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 56) |= 0x100u;
  *(void *)(result + 16) = a2;
  return result;
}

uint64_t nghttp2_option_set_max_deflate_dynamic_table_size(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 56) |= 0x200u;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_closed_streams(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x400u;
  *(_DWORD *)(result + 88) = a2;
  return result;
}

uint64_t nghttp2_option_set_max_outbound_ack(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 56) |= 0x800u;
  *(void *)(result + 32) = a2;
  return result;
}

uint64_t nghttp2_option_set_max_settings(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 56) |= 0x1000u;
  *(void *)(result + 40) = a2;
  return result;
}

uint64_t nghttp2_option_set_server_fallback_rfc7540_priorities(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x2000u;
  *(_DWORD *)(result + 96) = a2;
  return result;
}

uint64_t nghttp2_option_set_stream_reset_rate_limit(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(result + 56) |= 0x8000u;
  *(void *)uint64_t result = a2;
  *(void *)(result + 8) = a3;
  return result;
}

uint64_t nghttp2_option_set_max_continuations(uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 56) |= 0x10000u;
  *(void *)(result + 48) = a2;
  return result;
}

uint64_t nghttp2_option_set_no_http_semantics(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) |= 0x80000000;
  *(_DWORD *)(result + 92) = a2;
  return result;
}

uint64_t stream_obq_move(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a3 + 218)) {
    return 0;
  }
  nghttp2_pq_remove(a2 + 8, (unint64_t *)a3);
  *(unsigned char *)(a3 + 218) = 0;

  return stream_obq_push(a1, (uint64_t *)a3);
}

uint64_t nghttp2_stream_dep_add_subtree(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 200) += *(_DWORD *)(a2 + 192);
  if (*(void *)(a1 + 104))
  {
    insert_link_dep(a1, (void *)a2);
  }
  else
  {
    *(void *)(a1 + 104) = a2;
    *(void *)(a2 + 96) = a1;
  }
  if ((!*(void *)(a2 + 152) || (*(unsigned char *)(a2 + 216) & 0xC) != 0) && !*(void *)(a2 + 24)) {
    return 0;
  }
  uint64_t result = stream_obq_push(a1, (uint64_t *)a2);
  if (!result) {
    return 0;
  }
  return result;
}

uint64_t nghttp2_stream_dep_remove_subtree(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 96);
  if (!v1) {
    __assert_rtn("nghttp2_stream_dep_remove_subtree", "nghttp2_stream.c", 904, "stream->dep_prev");
  }
  uint64_t v2 = result;
  uint64_t v4 = *(void *)(result + 112);
  uint64_t v3 = *(void *)(result + 120);
  int v5 = (void *)(result + 112);
  if (!v4)
  {
    *(void *)(v1 + 104) = v3;
    if (!v3) {
      goto LABEL_8;
    }
    uint64_t v4 = 0;
    *(void *)(v3 + 96) = v1;
    goto LABEL_7;
  }
  *(void *)(v4 + 120) = v3;
  if (v3) {
LABEL_7:
  }
    *(void *)(v3 + 112) = v4;
LABEL_8:
  *(_DWORD *)(v1 + 200) -= *(_DWORD *)(result + 192);
  if (*(unsigned char *)(result + 218)) {
    uint64_t result = stream_obq_remove(result);
  }
  *(void *)(v2 + 96) = 0;
  *int v5 = 0;
  v5[1] = 0;
  return result;
}

uint64_t nghttp2_stream_get_state(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 216) & 2) != 0) {
    return 7;
  }
  if (*(unsigned char *)(a1 + 216))
  {
    if (*(unsigned char *)(a1 + 217)) {
      return 3;
    }
    if ((*(unsigned char *)(a1 + 217) & 2) != 0) {
      return 4;
    }
  }
  else if (*(unsigned char *)(a1 + 217))
  {
    return 6;
  }
  if ((*(unsigned char *)(a1 + 217) & 2) != 0) {
    return 5;
  }
  if (*(_DWORD *)(a1 + 204) == 5) {
    return 1;
  }
  return 2;
}

uint64_t nghttp2_stream_get_parent(uint64_t a1)
{
  return *(void *)(a1 + 96);
}

uint64_t nghttp2_stream_get_next_sibling(uint64_t a1)
{
  return *(void *)(a1 + 120);
}

uint64_t nghttp2_stream_get_previous_sibling(uint64_t a1)
{
  return *(void *)(a1 + 112);
}

uint64_t nghttp2_stream_get_first_child(uint64_t a1)
{
  return *(void *)(a1 + 104);
}

uint64_t nghttp2_stream_get_weight(uint64_t a1)
{
  return *(unsigned int *)(a1 + 192);
}

uint64_t nghttp2_stream_get_sum_dependency_weight(uint64_t a1)
{
  return *(unsigned int *)(a1 + 200);
}

uint64_t nghttp2_stream_get_stream_id(uint64_t a1)
{
  return *(unsigned int *)(a1 + 168);
}

uint64_t nghttp2_frame_pack_push_promise(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(uint64_t ***)a1;
  if (*(void *)a1 != *(void *)(a1 + 8)) {
    __assert_rtn("nghttp2_frame_pack_push_promise", "nghttp2_frame.c", 561, "bufs->head == bufs->cur");
  }
  uint64_t v6 = (uint64_t)v3[3] + 4;
  v3[3] = (uint64_t *)v6;
  v3[4] = (uint64_t *)v6;
  unsigned int v7 = nghttp2_hd_deflate_hd_bufs(a3, a1, *(void *)(a2 + 24), *(void *)(a2 + 32));
  if (v7 == -502) {
    uint64_t v8 = 4294966773;
  }
  else {
    uint64_t v8 = v7;
  }
  int v9 = (uint64_t *)((char *)v3[3] - 4);
  v3[3] = v9;
  if (!v8)
  {
    *(_DWORD *)int v9 = bswap32(*(_DWORD *)(a2 + 40));
    *(void *)(a2 + 16) = 0;
    int v10 = *(uint64_t ***)a1;
    if (*(void *)a1)
    {
      int64_t v11 = 0;
      do
      {
        int64_t v11 = (char *)v10[4] + v11 - (char *)v10[3];
        int v10 = (uint64_t **)*v10;
      }
      while (v10);
    }
    else
    {
      int64_t v11 = 0;
    }
    *(void *)a2 = v11;
    frame_pack_headers_shared((uint64_t ***)a1, a2);
  }
  return v8;
}

uint64_t nghttp2_frame_pack_altsvc(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)a1;
  if (*(void *)(*(void *)a1 + 16) - *(void *)(*(void *)a1 + 32) < (unint64_t)(*(void *)(v2 + 8)
                                                                                                + *(void *)(v2 + 24)
                                                                                                + 2))
    __assert_rtn("nghttp2_frame_pack_altsvc", "nghttp2_frame.c", 728, "nghttp2_buf_avail(buf) >= 2 + altsvc->origin_len + altsvc->field_value_len");
  uint64_t v5 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v5 - 9;
  *(_DWORD *)(v5 - 9) = bswap32(*(_DWORD *)a2) >> 8;
  *(unsigned char *)(v5 - 6) = *(unsigned char *)(a2 + 12);
  *(unsigned char *)(v5 - 5) = *(unsigned char *)(a2 + 13);
  *(_DWORD *)(v5 - 4) = bswap32(*(_DWORD *)(a2 + 8));
  **(_WORD **)(v3 + 32) = bswap32(*(unsigned __int16 *)(v2 + 8)) >> 16;
  *(void *)(v3 + 32) += 2;
  if (nghttp2_bufs_add(a1, *(char **)v2, *(void *)(v2 + 8))) {
    __assert_rtn("nghttp2_frame_pack_altsvc", "nghttp2_frame.c", 739, "rv == 0");
  }
  uint64_t result = nghttp2_bufs_add(a1, *(char **)(v2 + 16), *(void *)(v2 + 24));
  if (result) {
    __assert_rtn("nghttp2_frame_pack_altsvc", "nghttp2_frame.c", 743, "rv == 0");
  }
  return result;
}

uint64_t nghttp2_frame_pack_priority_update(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  uint64_t v3 = *(void *)a1;
  if (*(void *)(*(void *)a1 + 16) - *(void *)(*(void *)a1 + 32) < (unint64_t)(*(void *)(v2 + 16)
                                                                                                + 4))
    __assert_rtn("nghttp2_frame_pack_priority_update", "nghttp2_frame.c", 904, "nghttp2_buf_avail(buf) >= 4 + priority_update->field_value_len");
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 - 9;
  *(_DWORD *)(v4 - 9) = bswap32(*(_DWORD *)a2) >> 8;
  *(unsigned char *)(v4 - 6) = *(unsigned char *)(a2 + 12);
  *(unsigned char *)(v4 - 5) = *(unsigned char *)(a2 + 13);
  *(_DWORD *)(v4 - 4) = bswap32(*(_DWORD *)(a2 + 8));
  **(_DWORD **)(v3 + 32) = bswap32(*(_DWORD *)v2);
  *(void *)(v3 + 32) += 4;
  uint64_t result = nghttp2_bufs_add(a1, *(char **)(v2 + 8), *(void *)(v2 + 16));
  if (result) {
    __assert_rtn("nghttp2_frame_pack_priority_update", "nghttp2_frame.c", 916, "rv == 0");
  }
  return result;
}

uint64_t nghttp2_nv_compare_name(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(const void **)a1;
  size_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(const void **)a2;
  size_t v7 = *(void *)(a2 + 16);
  if (v5 == v7)
  {
    return memcmp(v4, v6, v5);
  }
  else if (v5 >= v7)
  {
    LODWORD(result) = memcmp(v4, v6, v7);
    if (result <= 1) {
      return 1;
    }
    else {
      return result;
    }
  }
  else
  {
    LODWORD(result) = memcmp(v4, v6, v5);
    if (result) {
      return result;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
}

uint64_t nghttp2_hd_deflate_change_table_size(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 1088);
  if (a2 < v2) {
    unint64_t v2 = a2;
  }
  *(void *)(a1 + 48) = v2;
  if (*(void *)(a1 + 1096) < v2) {
    unint64_t v2 = *(void *)(a1 + 1096);
  }
  *(void *)(a1 + 1096) = v2;
  *(unsigned char *)(a1 + 1104) = 1;
  hd_context_shrink_table_size((void *)a1, a1 + 64);
  return 0;
}

uint64_t nghttp2_hd_inflate_change_table_size(uint64_t a1, unint64_t a2)
{
  if (*(_DWORD *)(a1 + 228) > 1u) {
    return 4294966777;
  }
  *(void *)(a1 + 200) = a2;
  if (*(void *)(a1 + 48) > a2)
  {
    *(_DWORD *)(a1 + 228) = 0;
    *(void *)(a1 + 208) = a2;
    *(void *)(a1 + 48) = a2;
    hd_context_shrink_table_size((void *)a1, 0);
  }
  return 0;
}

uint64_t emit_table_size(uint64_t a1, unint64_t a2)
{
  *(void *)&v11[15] = *MEMORY[0x263EF8340];
  if (a2 > 0x1E)
  {
    unint64_t v3 = a2 - 31;
    if (a2 - 31 < 0x80)
    {
      char __src = 63;
      uint64_t v8 = v11;
      unint64_t v2 = 2;
    }
    else
    {
      unint64_t v4 = 0;
      unint64_t v5 = a2 - 31;
      do
      {
        unint64_t v6 = v5 >> 14;
        v5 >>= 7;
        ++v4;
      }
      while (v6);
      if (v4 > 0xE) {
        return 4294966773;
      }
      char __src = 63;
      uint64_t v8 = v11;
      do
      {
        *v8++ = v3 | 0x80;
        unint64_t v9 = v3 >> 14;
        v3 >>= 7;
      }
      while (v9);
      unint64_t v2 = v4 + 2;
    }
    *uint64_t v8 = v3;
  }
  else
  {
    char __src = a2 | 0x20;
    unint64_t v2 = 1;
  }
  return nghttp2_bufs_add(a1, &__src, v2);
}

uint64_t nghttp2_hd_deflate_hd2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(a1 + 32);
  int64_t v11 = (void *)(*(uint64_t (**)(uint64_t, void))(v10 + 8))(48, *(void *)v10);
  if (!v11) {
    return -901;
  }
  v11[4] = a2;
  v11[5] = a2;
  v11[2] = a2;
  v11[3] = a2;
  *int64_t v11 = 0;
  v11[1] = a2;
  if (a3) {
    v11[2] = a2 + a3;
  }
  v17[0] = v11;
  v17[1] = v11;
  uint64_t v18 = v10;
  uint64_t v19 = a3;
  int64x2_t v20 = vdupq_n_s64(1uLL);
  long long v21 = xmmword_20DB443C0;
  int v12 = nghttp2_hd_deflate_hd_bufs(a1, (uint64_t)v17, a4, a5);
  if (v17[0])
  {
    uint64_t v13 = 0;
    int v14 = (void *)v17[0];
    do
    {
      uint64_t v13 = v13 + v14[4] - v14[3];
      int v14 = (void *)*v14;
    }
    while (v14);
    (*(void (**)(void))(v18 + 16))();
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v16 = v12;
  if (!v12) {
    uint64_t v16 = v13;
  }
  if (v12 == -502) {
    return -525;
  }
  else {
    return v16;
  }
}

uint64_t nghttp2_hd_deflate_hd_vec2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int64x2_t v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = *(void **)(a1 + 32);
  if (a3)
  {
    uint64_t v31 = ((uint64_t (*)(uint64_t, void))v8[1])(48 * a3, *v8);
    if (v31)
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = (uint64_t *)(a2 + 8);
      int v14 = &v31;
      uint64_t v15 = a3;
      do
      {
        uint64_t v16 = v31;
        uint64_t v17 = (int64x2_t *)(v31 + v11);
        v17->i64[0] = 0;
        unint64_t v18 = *(v13 - 1);
        uint64_t v19 = *v13;
        int64x2_t v20 = vdupq_n_s64(v18);
        v17[1] = v20;
        void v17[2] = v20;
        v17->i64[1] = v18;
        if (v19) {
          v17[1].i64[0] = v18 + v19;
        }
        uint64_t *v14 = (uint64_t)v17;
        int v14 = (uint64_t *)(v16 + 48 * v12);
        v13 += 2;
        ++v12;
        v11 += 48;
        --v15;
      }
      while (v15);
      *(void *)&long long v27 = v31;
      *((void *)&v27 + 1) = v31;
      long long v28 = (unint64_t)v8;
      v29.i64[0] = a3;
      v29.i64[1] = a3;
      long long v30 = (unint64_t)a3;
      goto LABEL_10;
    }
    return -901;
  }
  long long v21 = (_OWORD *)((uint64_t (*)(uint64_t, void))v8[1])(48, *v8);
  if (!v21) {
    return -901;
  }
  v21[1] = 0u;
  v21[2] = 0u;
  *long long v21 = 0u;
  *(void *)&long long v27 = v21;
  *((void *)&v27 + 1) = v21;
  long long v28 = (unint64_t)v8;
  int64x2_t v29 = vdupq_n_s64(1uLL);
  long long v30 = xmmword_20DB443C0;
LABEL_10:
  int v22 = nghttp2_hd_deflate_hd_bufs(a1, (uint64_t)&v27, a4, a5);
  if ((void)v27)
  {
    uint64_t v23 = 0;
    uint64_t v24 = (void *)v27;
    do
    {
      uint64_t v23 = v23 + v24[4] - v24[3];
      uint64_t v24 = (void *)*v24;
    }
    while (v24);
    (*(void (**)(void))(v28 + 16))();
  }
  else
  {
    uint64_t v23 = 0;
  }
  uint64_t v26 = v22;
  if (!v22) {
    uint64_t v26 = v23;
  }
  if (v22 == -502) {
    return -525;
  }
  else {
    return v26;
  }
}

uint64_t nghttp2_hd_deflate_bound(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 12 * a3 + 12;
  if (a3)
  {
    unint64_t v4 = (void *)(a2 + 24);
    do
    {
      result += *(v4 - 1) + *v4;
      v4 += 5;
      --a3;
    }
    while (a3);
  }
  return result;
}

uint64_t nghttp2_hd_deflate_new(uint64_t *a1, unint64_t a2)
{
  return nghttp2_hd_deflate_new2(a1, a2, 0);
}

uint64_t nghttp2_hd_deflate_new2(uint64_t *a1, unint64_t a2, void *a3)
{
  if (a3) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = &mem_default;
  }
  uint64_t v6 = ((uint64_t (*)(uint64_t, void))v5[1])(1112, *v5);
  if (!v6) {
    return 4294966395;
  }
  uint64_t v7 = v6;
  uint64_t v8 = nghttp2_hd_deflate_init2(v6, a2, (uint64_t)v5);
  if (v8) {
    ((void (*)(uint64_t, void))v5[2])(v7, *v5);
  }
  else {
    *a1 = v7;
  }
  return v8;
}

uint64_t nghttp2_hd_deflate_del(uint64_t *a1)
{
  unint64_t v2 = (uint64_t *)a1[4];
  hd_context_free(a1);
  unint64_t v3 = (uint64_t (*)(uint64_t *, uint64_t))v2[2];
  uint64_t v4 = *v2;

  return v3(a1, v4);
}

uint64_t nghttp2_hd_inflate_hd3(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned __int8 *a4, uint64_t a5, int a6)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t result = nghttp2_hd_inflate_hd_nv(a1, (uint64_t)&v11, a3, a4, a5, a6);
  if ((result & 0x8000000000000000) == 0 && (*(unsigned char *)a3 & 2) != 0)
  {
    uint64_t v9 = v11;
    uint64_t v10 = v12;
    *(void *)a2 = *(void *)(v11 + 16);
    *(void *)(a2 + 16) = *(void *)(v9 + 24);
    *(void *)(a2 + 8) = *(void *)(v10 + 16);
    *(void *)(a2 + 24) = *(void *)(v10 + 24);
    *(unsigned char *)(a2 + 32) = BYTE4(v13);
  }
  return result;
}

uint64_t nghttp2_hd_inflate_end_headers(uint64_t a1)
{
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0;
  *(_DWORD *)(a1 + 228) = 1;
  return 0;
}

uint64_t nghttp2_hd_inflate_new(uint64_t *a1)
{
  return nghttp2_hd_inflate_new2(a1, 0);
}

uint64_t nghttp2_hd_inflate_new2(uint64_t *a1, void *a2)
{
  if (a2) {
    unint64_t v3 = a2;
  }
  else {
    unint64_t v3 = &mem_default;
  }
  uint64_t v4 = ((uint64_t (*)(uint64_t, void))v3[1])(240, *v3);
  if (!v4) {
    return 4294966395;
  }
  uint64_t v5 = v4;
  uint64_t v6 = nghttp2_hd_inflate_init(v4, (uint64_t)v3);
  if (v6) {
    ((void (*)(uint64_t, void))v3[2])(v5, *v3);
  }
  else {
    *a1 = v5;
  }
  return v6;
}

uint64_t nghttp2_hd_inflate_del(uint64_t *a1)
{
  unint64_t v2 = (uint64_t *)a1[4];
  nghttp2_hd_inflate_free(a1);
  unint64_t v3 = (uint64_t (*)(uint64_t *, uint64_t))v2[2];
  uint64_t v4 = *v2;

  return v3(a1, v4);
}

uint64_t nghttp2_hd_deflate_get_num_table_entries(uint64_t a1)
{
  return *(void *)(a1 + 24) + 61;
}

_DWORD *hd_get_table_entry(void *a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  unint64_t v2 = a2 - 1;
  if (a2 - 1 >= (unint64_t)(a1[3] + 61)) {
    return 0;
  }
  if (v2 < 0x3D) {
    return &static_table[32 * v2 + 20];
  }
  return (_DWORD *)(hd_ringbuf_get(a1, a2 - 62) + 24);
}

uint64_t nghttp2_hd_deflate_get_dynamic_table_size(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t nghttp2_hd_deflate_get_max_dynamic_table_size(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t nghttp2_hd_inflate_get_num_table_entries(uint64_t a1)
{
  return *(void *)(a1 + 24) + 61;
}

uint64_t nghttp2_hd_inflate_get_dynamic_table_size(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t nghttp2_hd_inflate_get_max_dynamic_table_size(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t nghttp2_select_next_protocol(void *a1, unsigned char *a2, uint64_t a3, unsigned int a4)
{
  if (!select_alpn(a1, a2, a3, a4, "\x02h2", 3uLL)) {
    return 1;
  }
  if (select_alpn(a1, a2, a3, a4, "\bhttp/1.1", 9uLL)) {
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t select_alpn(void *a1, unsigned char *a2, uint64_t a3, unsigned int a4, void *__s2, size_t __n)
{
  if (__n > a4) {
    return 0xFFFFFFFFLL;
  }
  int v7 = __n;
  unsigned int v13 = 0;
  size_t v14 = __n;
  while (1)
  {
    uint64_t v15 = (unsigned char *)(a3 + v13);
    uint64_t result = memcmp(v15, __s2, v14);
    if (!result) {
      break;
    }
    v13 += *v15 + 1;
    if (v13 + v7 > a4) {
      return 0xFFFFFFFFLL;
    }
  }
  *a1 = a3 + v13 + 1;
  *a2 = *v15;
  return result;
}

uint64_t nghttp2_select_alpn(void *a1, unsigned char *a2, uint64_t a3, unsigned int a4)
{
  if (!select_alpn(a1, a2, a3, a4, "\x02h2", 3uLL)) {
    return 1;
  }
  if (select_alpn(a1, a2, a3, a4, "\bhttp/1.1", 9uLL)) {
    return 0xFFFFFFFFLL;
  }
  return 0;
}

double nghttp2_priority_spec_default_init(uint64_t a1)
{
  *(void *)&double result = 0x1000000000;
  *(void *)a1 = 0x1000000000;
  *(unsigned char *)(a1 + 8) = 0;
  return result;
}

BOOL nghttp2_priority_spec_check_default(uint64_t a1)
{
  return !*(_DWORD *)a1 && *(_DWORD *)(a1 + 4) == 16 && *(unsigned char *)(a1 + 8) == 0;
}

uint64_t parser_skip_inner_list(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 16) & 3;
LABEL_2:
  if (v2 == 3) {
    goto LABEL_10;
  }
  if (v2 != 1)
  {
    if (v2) {
      __assert_rtn("sf_parser_inner_list", "sfparse.c", 746, "0");
    }
    unint64_t v3 = *(unsigned __int8 **)a1;
    uint64_t v4 = *(unsigned __int8 **)(a1 + 8);
    while (v3 != v4)
    {
      int v5 = *v3;
      if (v5 != 32)
      {
        if (v3 == v4) {
          return 0xFFFFFFFFLL;
        }
        goto LABEL_17;
      }
      *(void *)a1 = ++v3;
    }
    return 0xFFFFFFFFLL;
  }
  if (!parser_skip_params(a1))
  {
LABEL_10:
    unint64_t v3 = *(unsigned __int8 **)a1;
    uint64_t v6 = *(unsigned __int8 **)(a1 + 8);
    if (*(unsigned __int8 **)a1 != v6)
    {
      int v7 = *v3;
      if (v7 == 32)
      {
        uint64_t v8 = v3 + 1;
        while (1)
        {
          *(void *)a1 = v8;
          if (v8 == v6) {
            break;
          }
          int v9 = *v8++;
          int v5 = v9;
          if (v9 != 32)
          {
            unint64_t v3 = v8 - 1;
LABEL_17:
            if (v5 == 41) {
              goto LABEL_21;
            }
            if (parser_bare_item((uint64_t *)a1, 0)) {
              return 0xFFFFFFFFLL;
            }
            *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 16) & 0xFFFFFFFC | 1;
            int v2 = 1;
            goto LABEL_2;
          }
        }
      }
      else if (v7 == 41)
      {
LABEL_21:
        uint64_t result = 0;
        *(void *)a1 = v3 + 1;
        *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 16) & 0xFFFFFFF8 | 1;
        return result;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t parser_key(unsigned __int8 **a1, void *a2)
{
  uint64_t v2 = (uint64_t)*a1;
  int v3 = **a1;
  if ((v3 - 97) >= 0x1A && v3 != 42) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = a1[1];
  int v5 = (unsigned __int8 *)(v2 + 1);
  while (2)
  {
    *a1 = v5;
    if (v5 == v4)
    {
      int v5 = v4;
    }
    else
    {
      switch(*v5)
      {
        case '*':
        case '-':
        case '.':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case '_':
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'q':
        case 'r':
        case 's':
        case 't':
        case 'u':
        case 'v':
        case 'w':
        case 'x':
        case 'y':
        case 'z':
          ++v5;
          continue;
        default:
          goto LABEL_7;
      }
    }
    break;
  }
LABEL_7:
  uint64_t result = 0;
  if (a2)
  {
    *a2 = v2;
    a2[1] = &v5[-v2];
  }
  return result;
}

uint64_t parser_bare_item(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = 0xFFFFFFFFLL;
  switch(*(unsigned char *)*a1)
  {
    case '""':
      uint64_t result = parser_string(a1, (uint64_t)a2);
      break;
    case '*':
    case 'A':
    case 'B':
    case 'C':
    case 'D':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'S':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case 'Z':
    case 'a':
    case 'b':
    case 'c':
    case 'd':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 's':
    case 't':
    case 'u':
    case 'v':
    case 'w':
    case 'x':
    case 'y':
    case 'z':
      uint64_t v4 = (unsigned char *)a1[1];
      int v5 = (unsigned char *)(v2 + 1);
      while (2)
      {
        *a1 = (uint64_t)v5;
        if (v5 != v4)
        {
          switch(*v5)
          {
            case '!':
            case '#':
            case '$':
            case '%':
            case '&':
            case '\'':
            case '*':
            case '+':
            case '-':
            case '.':
            case '/':
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
            case ':':
            case 'A':
            case 'B':
            case 'C':
            case 'D':
            case 'E':
            case 'F':
            case 'G':
            case 'H':
            case 'I':
            case 'J':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'O':
            case 'P':
            case 'Q':
            case 'R':
            case 'S':
            case 'T':
            case 'U':
            case 'V':
            case 'W':
            case 'X':
            case 'Y':
            case 'Z':
            case '^':
            case '_':
            case 'a':
            case 'b':
            case 'c':
            case 'd':
            case 'e':
            case 'f':
            case 'g':
            case 'h':
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'n':
            case 'o':
            case 'p':
            case 'q':
            case 'r':
            case 's':
            case 't':
            case 'u':
            case 'v':
            case 'w':
            case 'x':
            case 'y':
            case 'z':
            case '|':
            case '~':
              ++v5;
              continue;
            default:
              goto LABEL_6;
          }
        }
        break;
      }
LABEL_6:
      uint64_t v3 = 0;
      if (a2)
      {
        *a2 = 4;
        a2[1] = v2;
        a2[2] = *a1 - v2;
      }
      goto LABEL_8;
    case '-':
    case '0':
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
      uint64_t result = parser_number(a1, a2);
      break;
    case ':':
      uint64_t result = parser_byteseq(a1, a2);
      break;
    case '?':
      uint64_t result = parser_BOOLean(a1, (uint64_t)a2);
      break;
    case '@':
      uint64_t result = parser_date(a1, (uint64_t)a2);
      break;
    default:
LABEL_8:
      uint64_t result = v3;
      break;
  }
  return result;
}

uint64_t parser_string(void *a1, uint64_t a2)
{
  uint64_t v2 = (unsigned char *)*a1;
  if (*(unsigned char *)*a1 != 34) {
    __assert_rtn("parser_string", "sfparse.c", 380, "'\"' == *sfp->pos");
  }
  uint64_t v3 = v2 + 1;
  uint64_t v4 = (unsigned char *)a1[1];
  *a1 = v2 + 1;
  if (v2 + 1 != v4)
  {
    int v5 = 0;
    uint64_t v6 = 1;
    int v7 = v2 + 1;
    while (2)
    {
      switch(v2[v6])
      {
        case ' ':
        case '!':
        case '#':
        case '$':
        case '%':
        case '&':
        case '\'':
        case '(':
        case ')':
        case '*':
        case '+':
        case ',':
        case '-':
        case '.':
        case '/':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case ':':
        case ';':
        case '<':
        case '=':
        case '>':
        case '?':
        case '@':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'L':
        case 'M':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'S':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
        case 'Z':
        case '[':
        case ']':
        case '^':
        case '_':
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'q':
        case 'r':
        case 's':
        case 't':
        case 'u':
        case 'v':
        case 'w':
        case 'x':
        case 'y':
        case 'z':
        case '{':
        case '|':
        case '}':
        case '~':
          goto LABEL_5;
        case '""':
          if (a2)
          {
            *(_DWORD *)a2 = 3;
            *(_DWORD *)(a2 + 4) = v5;
            if (v6 == 1) {
              uint64_t v3 = 0;
            }
            *(void *)(a2 + 8) = v3;
            *(void *)(a2 + 16) = v6 - 1;
            int v7 = (unsigned char *)*a1;
          }
          uint64_t v9 = 0;
          *a1 = v7 + 1;
          return v9;
        case '\\':
          *a1 = &v2[++v6];
          if (&v2[v6] == v4) {
            return 0xFFFFFFFFLL;
          }
          int v8 = v2[v6];
          int v5 = 1;
          if (v8 != 34 && v8 != 92) {
            return 0xFFFFFFFFLL;
          }
LABEL_5:
          int v7 = &v2[++v6];
          *a1 = &v2[v6];
          if (&v2[v6] == v4) {
            return 0xFFFFFFFFLL;
          }
          continue;
        default:
          return 0xFFFFFFFFLL;
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t parser_number(uint64_t *a1, void *a2)
{
  unint64_t v2 = *a1;
  if (*(unsigned char *)*a1 != 45)
  {
    uint64_t v3 = (unsigned char *)a1[1];
    uint64_t v4 = 1;
    goto LABEL_5;
  }
  *a1 = ++v2;
  uint64_t v3 = (unsigned char *)a1[1];
  if ((unsigned char *)v2 != v3)
  {
    uint64_t v4 = -1;
LABEL_5:
    if ((unsigned char *)v2 == v3) {
      __assert_rtn("parser_number", "sfparse.c", 259, "!parser_eof(sfp)");
    }
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      int v7 = (unsigned char *)(v2 + v5);
      uint64_t v8 = *(unsigned __int8 *)(v2 + v5);
      if ((v8 - 48) > 9) {
        break;
      }
      if (v5 == 15) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v9 = (unsigned char *)(v2 + v5++);
      uint64_t v6 = v8 + 10 * v6 - 48;
      *a1 = (uint64_t)(v9 + 1);
      if ((unsigned char *)(v2 + v5) == v3) {
        goto LABEL_20;
      }
    }
    if (!v5) {
      return 0xFFFFFFFFLL;
    }
    if (v8 == 46)
    {
      if (v5 > 0xC) {
        return 0xFFFFFFFFLL;
      }
      *a1 = (uint64_t)(v7 + 1);
      if (v7 + 1 == v3)
      {
        unint64_t v11 = v5;
      }
      else
      {
        uint64_t v10 = 0;
        unint64_t v11 = (unint64_t)&v3[~v2];
        while (1)
        {
          uint64_t v12 = *(unsigned __int8 *)(v2 + v10 + v5 + 1);
          if ((v12 - 48) > 9) {
            break;
          }
          if (v5 + v10 == 15) {
            return 0xFFFFFFFFLL;
          }
          uint64_t v6 = v12 + 10 * v6 - 48;
          uint64_t v13 = v2 + v5 + v10 + 2;
          *a1 = v13;
          ++v10;
          if ((unsigned char *)v13 == v3) {
            goto LABEL_24;
          }
        }
        unint64_t v11 = v5 + v10;
      }
LABEL_24:
      unint64_t v15 = v11 - v5;
      if (v11 == v5 || v15 > 3) {
        return 0xFFFFFFFFLL;
      }
      if (a2)
      {
        *a2 = 2;
        a2[1] = v6 * v4;
        switch(v15)
        {
          case 3uLL:
            uint64_t result = 0;
            uint64_t v16 = 1000;
            goto LABEL_36;
          case 2uLL:
            uint64_t result = 0;
            uint64_t v16 = 100;
            goto LABEL_36;
          case 1uLL:
            uint64_t result = 0;
            uint64_t v16 = 10;
LABEL_36:
            a2[2] = v16;
            return result;
        }
      }
    }
    else
    {
LABEL_20:
      if (a2)
      {
        uint64_t result = 0;
        *a2 = 1;
        a2[1] = v6 * v4;
        return result;
      }
    }
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t parser_date(uint64_t *a1, uint64_t a2)
{
  long long v6 = 0uLL;
  uint64_t v7 = 0;
  if (*(unsigned char *)*a1 != 64) {
    __assert_rtn("parser_date", "sfparse.c", 350, "'@' == *sfp->pos");
  }
  uint64_t v2 = *a1 + 1;
  *a1 = v2;
  if (v2 == a1[1]) {
    return 0xFFFFFFFFLL;
  }
  int v4 = parser_number(a1, &v6);
  uint64_t result = 0xFFFFFFFFLL;
  if (!v4 && v6 == 1)
  {
    uint64_t result = 0;
    if (a2)
    {
      *(_OWORD *)a2 = v6;
      *(void *)(a2 + 16) = v7;
      *(_DWORD *)a2 = 7;
    }
  }
  return result;
}

uint64_t parser_byteseq(void *a1, void *a2)
{
  uint64_t v2 = (unsigned char *)*a1;
  if (*(unsigned char *)*a1 != 58) {
    __assert_rtn("parser_byteseq", "sfparse.c", 473, "':' == *sfp->pos");
  }
  uint64_t v3 = (unsigned char *)a1[1];
  *a1 = v2 + 1;
  if (v2 + 1 == v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = 1;
  while (2)
  {
    uint64_t v5 = 0xFFFFFFFFLL;
    switch(v2[v4])
    {
      case '+':
      case '/':
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case 'A':
      case 'B':
      case 'C':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'M':
      case 'N':
      case 'O':
      case 'P':
      case 'Q':
      case 'R':
      case 'S':
      case 'T':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
      case 'a':
      case 'b':
      case 'c':
      case 'd':
      case 'e':
      case 'f':
      case 'g':
      case 'h':
      case 'i':
      case 'j':
      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'q':
      case 'r':
      case 's':
      case 't':
      case 'u':
      case 'v':
      case 'w':
      case 'x':
      case 'y':
      case 'z':
        *a1 = &v2[++v4];
        if (v3 - v2 == v4) {
          return 0xFFFFFFFFLL;
        }
        continue;
      case ':':
        if ((((_BYTE)v4 - 1) & 3) != 0) {
          return 0xFFFFFFFFLL;
        }
        goto LABEL_16;
      case '=':
        unint64_t v7 = ((int)v4 - 1) & 3;
        if (v7 < 2) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v8 = &v2[v4];
        if (v7 == 3)
        {
          int v9 = *(v8 - 1);
          if (((v9 - 48) > 0x3F || ((1 << (v9 - 48)) & 0x8888022222220111) == 0)
            && v9 != 115
            && v9 != 119)
          {
            return 0xFFFFFFFFLL;
          }
        }
        else
        {
          int v12 = *(v8 - 1);
          uint64_t v5 = 0xFFFFFFFFLL;
          unsigned int v13 = v12 - 65;
          if (v13 > 0x36 || ((1 << v13) & 0x40004000010001) == 0) {
            return v5;
          }
          *a1 = &v2[++v4];
          if (&v2[v4] == v3 || v2[v4] != 61) {
            return 0xFFFFFFFFLL;
          }
        }
        *a1 = &v2[++v4];
        if (&v2[v4] == v3 || v2[v4] != 58) {
          return 0xFFFFFFFFLL;
        }
LABEL_16:
        if (a2)
        {
          *a2 = 5;
          if (v4 == 1) {
            uint64_t v10 = 0;
          }
          else {
            uint64_t v10 = v2 + 1;
          }
          a2[1] = v10;
          a2[2] = v4 - 1;
          unint64_t v11 = (unsigned char *)*a1;
        }
        else
        {
          unint64_t v11 = &v2[v4];
        }
        uint64_t v5 = 0;
        *a1 = v11 + 1;
        break;
      default:
        return v5;
    }
    return v5;
  }
}

uint64_t parser_BOOLean(void *a1, uint64_t a2)
{
  uint64_t v2 = (unsigned char *)*a1;
  if (*(unsigned char *)*a1 != 63) {
    __assert_rtn("parser_BOOLean", "sfparse.c", 570, "'?' == *sfp->pos");
  }
  *a1 = v2 + 1;
  if (v2 + 1 == (unsigned char *)a1[1]) {
    return 0xFFFFFFFFLL;
  }
  int v3 = v2[1];
  if (v3 != 48)
  {
    if (v3 == 49)
    {
      int v4 = 1;
      goto LABEL_8;
    }
    return 0xFFFFFFFFLL;
  }
  int v4 = 0;
LABEL_8:
  *a1 = v2 + 2;
  uint64_t result = 0;
  if (a2)
  {
    *(void *)a2 = 0;
    *(_DWORD *)(a2 + 8) = v4;
  }
  return result;
}

uint64_t parser_skip_params(uint64_t a1)
{
LABEL_1:
  unsigned int v2 = *(_DWORD *)(a1 + 16);
  if ((v2 & 3) != 2)
  {
    if ((v2 & 3) != 1)
    {
      if ((v2 & 3) != 0) {
        __assert_rtn("sf_parser_param", "sfparse.c", 643, "0");
      }
      if (parser_skip_inner_list(a1)) {
        return 0xFFFFFFFFLL;
      }
      unsigned int v2 = *(_DWORD *)(a1 + 16);
    }
    unsigned int v2 = v2 & 0xFFFFFFFC | 2;
    *(_DWORD *)(a1 + 16) = v2;
  }
  int v4 = *(unsigned __int8 **)a1;
  int v3 = *(unsigned char **)(a1 + 8);
  if (*(unsigned char **)a1 == v3 || *v4 != 59)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 16) = v2 | 3;
    return result;
  }
  for (unint64_t i = v4 + 1; ; ++i)
  {
    *(void *)a1 = i;
    if (i == v3) {
      break;
    }
    if (*i != 32)
    {
      if (i == v3 || parser_key((unsigned __int8 **)a1, 0)) {
        return 0xFFFFFFFFLL;
      }
      unint64_t v7 = *(unsigned __int8 **)a1;
      long long v6 = *(unsigned __int8 **)(a1 + 8);
      if (*(unsigned __int8 **)a1 != v6 && *v7 == 61)
      {
        uint64_t v8 = v7 + 1;
        *(void *)a1 = v8;
        if (v8 == v6) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = parser_bare_item((uint64_t *)a1, 0);
        if (result)
        {
          if (result != -1) {
            __assert_rtn("parser_skip_params", "sfparse.c", 697, "0");
          }
          return result;
        }
      }
      goto LABEL_1;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t bufs_alloc_chain(uint64_t a1)
{
  uint64_t v2 = **(void **)(a1 + 8);
  if (v2)
  {
    uint64_t result = 0;
    *(void *)(a1 + 8) = v2;
  }
  else if (*(void *)(a1 + 32) == *(void *)(a1 + 40))
  {
    return 4294966794;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t result = buf_chain_new(&v8, *(void *)(a1 + 24), *(void **)(a1 + 16));
    if (!result)
    {
      ++*(void *)(a1 + 40);
      uint64_t v4 = v8;
      **(void **)(a1 + 8) = v8;
      *(void *)(a1 + 8) = v4;
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(v4 + 24) + v5;
      uint64_t v7 = *(void *)(v4 + 32) + v5;
      *(void *)(v4 + 24) = v6;
      *(void *)(v4 + 32) = v7;
    }
  }
  return result;
}

uint64_t nghttp2_http_parse_priority(int *a1, unsigned __int8 *a2, uint64_t a3)
{
  int v4 = 0;
  int v6 = *a1;
  int v5 = a1[1];
  long long v21 = 0;
  uint64_t v22 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v7 = &a2[a3];
  if (a3)
  {
    uint64_t v8 = a2;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v24 = v7;
  uint64_t v25 = 0;
  uint64_t v23 = v8;
LABEL_5:
  if (v4 > 10)
  {
    if (parser_skip_inner_list((uint64_t)&v23)) {
      return 4294966795;
    }
  }
  else if (!v4)
  {
    for (unint64_t i = v23; i != v24; ++i)
    {
      if (*i != 32)
      {
        uint64_t v23 = i;
        if (i == v24) {
          goto LABEL_50;
        }
LABEL_32:
        if (parser_key(&v23, &v21)) {
          return 4294966795;
        }
        unint64_t v15 = v23;
        if (v23 == v24 || *v23 != 61)
        {
          uint64_t v18 = 0;
          int v4 = 9;
          LODWORD(v19) = 1;
        }
        else
        {
          ++v23;
          if (v15 + 1 == v24) {
            return 4294966795;
          }
          if (v15[1] == 40)
          {
            uint64_t v18 = 6;
            uint64_t v23 = v15 + 2;
            int v4 = 12;
          }
          else
          {
            if (parser_bare_item((uint64_t *)&v23, &v18)) {
              return 4294966795;
            }
            int v4 = 9;
          }
        }
        LODWORD(v25) = v4;
        if (v22 != 1) {
          goto LABEL_5;
        }
        int v16 = *v21;
        if (v16 != 117)
        {
          if (v16 != 105) {
            goto LABEL_5;
          }
          if (!v18)
          {
            int v5 = v19;
            goto LABEL_5;
          }
          return 4294966795;
        }
        uint64_t result = 4294966795;
        if (v18 == 1)
        {
          int v6 = v19;
          if ((v19 & 0x8000000000000000) == 0 && v19 <= 7) {
            goto LABEL_5;
          }
        }
        return result;
      }
    }
    goto LABEL_50;
  }
  if (!parser_skip_params((uint64_t)&v23))
  {
    for (j = v23; j != v24; ++j)
    {
      int v10 = *j;
      if (v10 != 32 && v10 != 9)
      {
        if (j == v24) {
          break;
        }
        if (v10 == 44)
        {
          while (1)
          {
            uint64_t v23 = ++j;
            if (j == v24) {
              break;
            }
            int v13 = *j;
            if (v13 != 32 && v13 != 9)
            {
              if (j != v24) {
                goto LABEL_32;
              }
              return 4294966795;
            }
          }
        }
        return 4294966795;
      }
    }
LABEL_50:
    uint64_t result = 0;
    *a1 = v6;
    a1[1] = v5;
    return result;
  }
  return 4294966795;
}

uint64_t nghttp2_http_on_request_headers(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 212);
  if ((v2 & 0x8080) != 0x80)
  {
    BOOL v4 = (~v2 & 0xE) != 0 || (v2 & 0x11) == 0;
    if (!v4 && ((v2 & 0x8000) == 0 || (v2 & 0x81) == 0x81) && ((v2 & 0x2800) != 0x2000 || (v2 & 0x1200) == 0x1200)) {
      goto LABEL_4;
    }
    return 0xFFFFFFFFLL;
  }
  if ((v2 & 0xB) != 1) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 48) = -1;
LABEL_4:
  uint64_t v3 = 0;
  if (*(unsigned char *)(a2 + 12) == 5)
  {
    *(_DWORD *)(a1 + 212) = v2 & 0x780;
    *(void *)(a1 + 48) = -1;
  }
  return v3;
}

uint64_t nghttp2_rcbuf_incref(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 32);
  if (v1 != -1) {
    *(_DWORD *)(result + 32) = v1 + 1;
  }
  return result;
}

uint64_t nghttp2_rcbuf_get_buf(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

BOOL nghttp2_rcbuf_is_static(uint64_t a1)
{
  return *(_DWORD *)(a1 + 32) == -1;
}

void *nghttp2_version(int a1)
{
  if (a1 <= 81664) {
    return &version;
  }
  else {
    return 0;
  }
}

uint64_t nghttp2_submit_trailer(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 < 1) {
    return 4294966795;
  }
  else {
    return submit_headers_shared_nva(a1, 1, a2, 0, a3, a4, 0, 0);
  }
}

uint64_t nghttp2_submit_headers(uint64_t a1, char a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 == -1)
  {
    if (*(unsigned char *)(a1 + 2932) && (~*(_DWORD *)(a1 + 2916) & 0x84) != 0) {
      return 4294966791;
    }
  }
  else if (a3 < 1)
  {
    return 4294966795;
  }
  char v7 = a2 & 1;
  if (a4)
  {
    int v8 = *(_DWORD *)a4;
    if ((*(_DWORD *)a4 || *(_DWORD *)(a4 + 4) != 16 || *(unsigned char *)(a4 + 8)) && *(_DWORD *)(a1 + 2880) != 1)
    {
      if (a3 == -1)
      {
        int v9 = *(_DWORD *)(a1 + 2800);
      }
      else
      {
        int v9 = *(_DWORD *)a4;
        int v8 = a3;
      }
      if (v9 == v8) {
        return 4294966795;
      }
      v7 |= 0x20u;
    }
    else
    {
      a4 = 0;
    }
  }
  return submit_headers_shared_nva(a1, v7, a3, a4, a5, a6, 0, a7);
}

uint64_t nghttp2_submit_ping(uint64_t a1, char a2, uint64_t *a3)
{
  return nghttp2_session_add_ping(a1, a2 & 1, a3);
}

uint64_t nghttp2_submit_priority(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  if (*(_DWORD *)(a1 + 2880) == 1) {
    return 0;
  }
  uint64_t v4 = 4294966795;
  if (a3 && a4)
  {
    int v7 = *a4;
    if (*a4 == a3)
    {
      return 4294966795;
    }
    else
    {
      int v9 = a4[1];
      if (v9 < 1)
      {
        int v9 = 1;
      }
      else if (v9 >= 0x101)
      {
        int v9 = 256;
      }
      int v10 = a4[2];
      uint64_t v11 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
      if (v11)
      {
        uint64_t v12 = v11;
        *(_OWORD *)(v11 + 137) = 0u;
        *(_OWORD *)(v11 + 112) = 0u;
        *(_OWORD *)(v11 + 128) = 0u;
        *(_OWORD *)(v11 + 96) = 0u;
        *(void *)uint64_t v11 = 5;
        *(_WORD *)(v11 + 12) = 2;
        *(_DWORD *)(v11 + 8) = a3;
        *(unsigned char *)(v11 + 14) = 0;
        *(_DWORD *)(v11 + 16) = v7;
        *(_DWORD *)(v11 + 20) = v9;
        *(_DWORD *)(v11 + 24) = v10;
        uint64_t v4 = nghttp2_session_add_item(a1, v11);
        if (v4) {
          (*(void (**)(uint64_t, void))(a1 + 2584))(v12, *(void *)(a1 + 2568));
        }
      }
      else
      {
        return 4294966395;
      }
    }
  }
  return v4;
}

uint64_t nghttp2_submit_goaway(uint64_t a1, uint64_t a2, int a3, int a4, const void *a5, size_t a6)
{
  if (*(unsigned char *)(a1 + 2933)) {
    return 0;
  }
  else {
    return nghttp2_session_add_goaway(a1, a3, a4, a5, a6, 0);
  }
}

uint64_t nghttp2_submit_shutdown_notice(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 2932)) {
    return 4294966777;
  }
  if (*(unsigned char *)(a1 + 2933)) {
    return 0;
  }
  return nghttp2_session_add_goaway(a1, 0x7FFFFFFF, 0, 0, 0, 2);
}

uint64_t nghttp2_submit_push_promise(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = 4294966795;
  if (a3 >= 1)
  {
    uint64_t v6 = ((a3 & 1) == 0) != (*(unsigned char *)(a1 + 2932) == 0) ? 4294966795 : 4294966791;
    if (*(unsigned char *)(a1 + 2932) && (a3 & 1) != 0)
    {
      if ((*(_DWORD *)(a1 + 2800) & 0x80000000) != 0)
      {
        return 4294966787;
      }
      else
      {
        uint64_t v12 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v19 = 0;
          *(_OWORD *)(v12 + 96) = 0u;
          *(_OWORD *)(v12 + 112) = 0u;
          *(_OWORD *)(v12 + 128) = 0u;
          *(_OWORD *)(v12 + 137) = 0u;
          *(void *)(v12 + 120) = a6;
          uint64_t v14 = nghttp2_nv_array_copy(&v19, a4, a5, a1 + 2568);
          if ((v14 & 0x80000000) != 0)
          {
            uint64_t v6 = v14;
            goto LABEL_15;
          }
          uint64_t v6 = *(unsigned int *)(a1 + 2800);
          *(_DWORD *)(a1 + 2800) = v6 + 2;
          uint64_t v15 = v19;
          *(void *)uint64_t v13 = 0;
          *(_WORD *)(v13 + 12) = 1029;
          *(_DWORD *)(v13 + 8) = a3;
          *(unsigned char *)(v13 + 14) = 0;
          *(void *)(v13 + 16) = 0;
          *(void *)(v13 + 24) = v15;
          *(void *)(v13 + 32) = a5;
          *(_DWORD *)(v13 + 40) = v6;
          *(unsigned char *)(v13 + 44) = 0;
          uint64_t v16 = nghttp2_session_add_item(a1, v13);
          if (v16)
          {
            uint64_t v17 = v16;
            (*(void (**)(void, void))(a1 + 2584))(*(void *)(v13 + 24), *(void *)(a1 + 2568));
            uint64_t v6 = v17;
LABEL_15:
            (*(void (**)(uint64_t, void))(a1 + 2584))(v13, *(void *)(a1 + 2568));
          }
        }
        else
        {
          return 4294966395;
        }
      }
    }
  }
  return v6;
}

uint64_t nghttp2_session_set_local_window_size(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a4 < 0) {
    return 4294966795;
  }
  if (a3)
  {
    uint64_t result = nghttp2_map_find((uint64_t *)a1, a3);
    if (!result) {
      return result;
    }
    uint64_t v8 = result;
    if ((*(unsigned char *)(result + 216) & 2) == 0 && *(_DWORD *)(result + 204) != 5)
    {
      int v9 = (int *)(result + 188);
      int v10 = a4 - *(_DWORD *)(v8 + 188);
      int v17 = v10;
      if (v10)
      {
        uint64_t v11 = (int *)(v8 + 176);
        uint64_t v12 = (int *)(v8 + 184);
        if ((v10 & 0x80000000) == 0)
        {
          uint64_t result = nghttp2_increase_local_window_size(v9, v11, v12, &v17);
          if (result) {
            return result;
          }
          int v13 = v17;
          uint64_t v14 = a1;
          if (v17 >= 1)
          {
            int v15 = a3;
LABEL_19:
            return nghttp2_session_add_window_update(v14, v15, v13);
          }
          return nghttp2_session_update_recv_stream_window_size(a1, v8, 0, 1);
        }
        return nghttp2_adjust_local_window_size(v9, v11, v12, &v17);
      }
    }
    return 0;
  }
  int v16 = a4 - *(_DWORD *)(a1 + 2844);
  int v17 = v16;
  if (!v16) {
    return 0;
  }
  int v9 = (int *)(a1 + 2844);
  uint64_t v11 = (int *)(a1 + 2832);
  uint64_t v12 = (int *)(a1 + 2840);
  if (v16 < 0) {
    return nghttp2_adjust_local_window_size(v9, v11, v12, &v17);
  }
  uint64_t result = nghttp2_increase_local_window_size(v9, v11, v12, &v17);
  if (result) {
    return result;
  }
  int v13 = v17;
  uint64_t v14 = a1;
  if (v17 >= 1)
  {
    int v15 = 0;
    goto LABEL_19;
  }

  return nghttp2_session_update_recv_connection_window_size(a1, 0);
}

uint64_t nghttp2_submit_altsvc(uint64_t a1, uint64_t a2, int a3, const void *a4, size_t a5, const void *a6, size_t a7)
{
  if (!*(unsigned char *)(a1 + 2932)) {
    return 4294966777;
  }
  unint64_t v9 = a5 + a7 + 2;
  if (v9 > 0x4000) {
    return 4294966795;
  }
  if (a3)
  {
    if (!a5)
    {
      int v13 = (unsigned char *)(*(uint64_t (**)(size_t, void))(a1 + 2576))(a7 + 2, *(void *)(a1 + 2568));
      uint64_t v14 = v13;
      if (!v13) {
        return 4294966395;
      }
      goto LABEL_11;
    }
    return 4294966795;
  }
  if (!a5) {
    return 4294966795;
  }
  int v17 = (unsigned char *)(*(uint64_t (**)(size_t, void))(a1 + 2576))(a5 + a7 + 2, *(void *)(a1 + 2568));
  if (!v17) {
    return 4294966395;
  }
  int v13 = v17;
  memcpy(v17, a4, a5);
  uint64_t v14 = &v13[a5];
LABEL_11:
  unsigned char *v14 = 0;
  uint64_t v18 = v14 + 1;
  uint64_t v19 = v18;
  if (a7)
  {
    memcpy(v18, a6, a7);
    uint64_t v19 = &v18[a7];
  }
  *uint64_t v19 = 0;
  uint64_t v20 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
  if (!v20)
  {
    free(v13);
    return 4294966395;
  }
  uint64_t v21 = v20;
  *(void *)(v20 + 145) = 0;
  *(_OWORD *)(v20 + 129) = 0u;
  *(_OWORD *)(v20 + 113) = 0u;
  *(_OWORD *)(v20 + 97) = 0u;
  *(unsigned char *)(v20 + 96) = 1;
  *(void *)(v20 + 64) = v13;
  *(void *)(v20 + 16) = v20 + 64;
  *(void *)uint64_t v20 = v9;
  *(_WORD *)(v20 + 12) = 10;
  *(_DWORD *)(v20 + 8) = a3;
  *(unsigned char *)(v20 + 14) = 0;
  *(void *)(v20 + 72) = a5;
  *(void *)(v20 + 80) = v18;
  *(void *)(v20 + 88) = a7;
  uint64_t v15 = nghttp2_session_add_item(a1, v20);
  if (v15)
  {
    uint64_t v22 = *(void **)(v21 + 16);
    if (v22) {
      (*(void (**)(void, void))(a1 + 2584))(*v22, *(void *)(a1 + 2568));
    }
    (*(void (**)(uint64_t, void))(a1 + 2584))(v21, *(void *)(a1 + 2568));
  }
  return v15;
}

uint64_t nghttp2_submit_origin(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(unsigned char *)(a1 + 2932)) {
    return 4294966777;
  }
  if (a4)
  {
    uint64_t v7 = 0;
    uint64_t v8 = (uint64_t *)(a3 + 8);
    uint64_t v9 = a4;
    do
    {
      uint64_t v10 = *v8;
      v8 += 2;
      v7 += v10;
      --v9;
    }
    while (v9);
    if ((unint64_t)(v7 + 2 * a4) > 0x4000) {
      return 4294966795;
    }
    uint64_t v13 = 17 * a4 + v7;
    uint64_t v14 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(v13, *(void *)(a1 + 2568));
    if (!v14) {
      return 4294966395;
    }
    uint64_t v12 = (char *)v14;
    uint64_t v15 = 0;
    int v16 = (unsigned char *)(v14 + 16 * a4);
    uint64_t v17 = a4;
    do
    {
      uint64_t v18 = &v12[v15];
      uint64_t v19 = *(void *)(a3 + v15 + 8);
      *(void *)uint64_t v18 = v16;
      *((void *)v18 + 1) = v19;
      uint64_t v20 = *(void *)(a3 + v15 + 8);
      if (v20)
      {
        memcpy(v16, *(const void **)(a3 + v15), *(void *)(a3 + v15 + 8));
        v16 += v20;
      }
      *v16++ = 0;
      v15 += 16;
      --v17;
    }
    while (v17);
    if (v16 - v12 != v13) {
      __assert_rtn("nghttp2_submit_origin", "nghttp2_submit.c", 634, "(size_t)(p - (uint8_t *)ov_copy) == nov * sizeof(nghttp2_origin_entry) + len + nov");
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v21 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
  if (!v21)
  {
    free(v12);
    return 4294966395;
  }
  uint64_t v22 = v21;
  *(void *)(v21 + 145) = 0;
  *(_OWORD *)(v21 + 129) = 0u;
  *(_OWORD *)(v21 + 113) = 0u;
  *(_OWORD *)(v21 + 97) = 0u;
  *(unsigned char *)(v21 + 96) = 1;
  *(void *)(v21 + 16) = v21 + 64;
  uint64_t v23 = 0;
  if (a4)
  {
    uint64_t v24 = (uint64_t *)(v12 + 8);
    uint64_t v25 = a4;
    do
    {
      uint64_t v26 = *v24;
      v24 += 2;
      v23 += v26 + 2;
      --v25;
    }
    while (v25);
  }
  *(void *)uint64_t v21 = v23;
  *(_WORD *)(v21 + 12) = 12;
  *(_DWORD *)(v21 + 8) = 0;
  *(unsigned char *)(v21 + 14) = 0;
  *(void *)(v21 + 64) = a4;
  *(void *)(v21 + 72) = v12;
  uint64_t v11 = nghttp2_session_add_item(a1, v21);
  if (v11)
  {
    uint64_t v27 = *(void *)(v22 + 16);
    if (v27) {
      (*(void (**)(void, void))(a1 + 2584))(*(void *)(v27 + 8), *(void *)(a1 + 2568));
    }
    (*(void (**)(uint64_t, void))(a1 + 2584))(v22, *(void *)(a1 + 2568));
  }
  return v11;
}

uint64_t nghttp2_submit_priority_update(uint64_t a1, uint64_t a2, int a3, const void *a4, size_t a5)
{
  if (*(unsigned char *)(a1 + 2932)) {
    return 4294966777;
  }
  if (!*(_DWORD *)(a1 + 2880)) {
    return 0;
  }
  uint64_t v5 = 4294966795;
  if (a3 && a5 - 16381 >= 0xFFFFFFFFFFFFBFFFLL)
  {
    if (a5)
    {
      uint64_t v11 = (unsigned char *)(*(uint64_t (**)(size_t, void))(a1 + 2576))(a5 + 1, *(void *)(a1 + 2568));
      if (!v11) {
        return 4294966395;
      }
      uint64_t v12 = v11;
      memcpy(v11, a4, a5);
      v12[a5] = 0;
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v13 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
    if (v13)
    {
      uint64_t v14 = v13;
      *(void *)(v13 + 145) = 0;
      *(_OWORD *)(v13 + 129) = 0u;
      *(_OWORD *)(v13 + 113) = 0u;
      *(_OWORD *)(v13 + 97) = 0u;
      *(unsigned char *)(v13 + 96) = 1;
      *(_DWORD *)(v13 + 64) = a3;
      *(void *)(v13 + 16) = v13 + 64;
      *(void *)uint64_t v13 = a5 + 4;
      *(_WORD *)(v13 + 12) = 16;
      *(_DWORD *)(v13 + 8) = 0;
      *(unsigned char *)(v13 + 14) = 0;
      *(void *)(v13 + 72) = v12;
      *(void *)(v13 + 80) = a5;
      uint64_t v5 = nghttp2_session_add_item(a1, v13);
      if (v5)
      {
        uint64_t v15 = *(void *)(v14 + 16);
        if (v15) {
          (*(void (**)(void, void))(a1 + 2584))(*(void *)(v15 + 8), *(void *)(a1 + 2568));
        }
        (*(void (**)(uint64_t, void))(a1 + 2584))(v14, *(void *)(a1 + 2568));
      }
      return v5;
    }
    free(v12);
    return 4294966395;
  }
  return v5;
}

uint64_t nghttp2_submit_request2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t a6)
{
  uint64_t v7 = 0;
  long long v8 = 0uLL;
  if (a5)
  {
    LODWORD(v7) = 2;
    long long v8 = *a5;
    a5 = (long long *)&v7;
  }
  return submit_request_shared(a1, a2, a3, a4, (uint64_t)a5, a6);
}

uint64_t nghttp2_submit_response(uint64_t a1, int a2, uint64_t a3, uint64_t a4, long long *a5)
{
  uint64_t v6 = 0;
  long long v7 = 0uLL;
  if (a5)
  {
    LODWORD(v6) = 1;
    long long v7 = *a5;
    a5 = (long long *)&v6;
  }
  return submit_response_shared(a1, a2, a3, a4, (uint64_t)a5);
}

uint64_t submit_response_shared(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 < 1) {
    return 4294966795;
  }
  if (!*(unsigned char *)(a1 + 2932)) {
    return 4294966791;
  }
  char v8 = !a5 || !*(void *)(a5 + 16);
  return submit_headers_shared_nva(a1, v8, a2, 0, a3, a4, (long long *)a5, 0);
}

uint64_t nghttp2_submit_response2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, long long *a5)
{
  uint64_t v6 = 0;
  long long v7 = 0uLL;
  if (a5)
  {
    LODWORD(v6) = 2;
    long long v7 = *a5;
    a5 = (long long *)&v6;
  }
  return submit_response_shared(a1, a2, a3, a4, (uint64_t)a5);
}

uint64_t nghttp2_submit_data2(uint64_t a1, char a2, int a3, long long *a4)
{
  if (!a4) {
    __assert_rtn("nghttp2_submit_data2", "nghttp2_submit.c", 911, "data_prd");
  }
  uint64_t v5 = 2;
  long long v6 = *a4;
  return nghttp2_submit_data_shared(a1, a2, a3, (long long *)&v5);
}

uint64_t nghttp2_pack_settings_payload2(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!nghttp2_iv_check(a3, a4)) {
    return -501;
  }
  uint64_t result = 6 * v4;
  if (6 * v4 > a2) {
    return -525;
  }
  if (v4)
  {
    uint64_t v9 = (unsigned int *)(a3 + 4);
    do
    {
      *(_WORD *)a1 = bswap32(*((unsigned __int16 *)v9 - 2)) >> 16;
      unsigned int v10 = *v9;
      v9 += 2;
      *(_DWORD *)(a1 + 2) = bswap32(v10);
      a1 += 6;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t nghttp2_submit_extension(uint64_t a1, unsigned int a2, char a3, int a4, uint64_t a5)
{
  if (a2 < 0xA) {
    return 4294966795;
  }
  char v9 = a2;
  if (!*(void *)(a1 + 2528) && !*(void *)(a1 + 2520)) {
    return 4294966777;
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
  if (!v11) {
    return 4294966395;
  }
  uint64_t v12 = v11;
  *(void *)uint64_t v11 = 0;
  *(_OWORD *)(v11 + 96) = 0u;
  *(_OWORD *)(v11 + 112) = 0u;
  *(_OWORD *)(v11 + 128) = 0u;
  *(_OWORD *)(v11 + 137) = 0u;
  *(unsigned char *)(v11 + 12) = v9;
  *(unsigned char *)(v11 + 13) = a3;
  *(_DWORD *)(v11 + 8) = a4;
  *(unsigned char *)(v11 + 14) = 0;
  *(void *)(v11 + 16) = a5;
  uint64_t v5 = nghttp2_session_add_item(a1, v11);
  if (v5) {
    (*(void (**)(uint64_t, void))(a1 + 2584))(v12, *(void *)(a1 + 2568));
  }
  return v5;
}

BOOL nghttp2_is_fatal(int a1)
{
  return a1 < -900;
}

uint64_t session_ob_data_push(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a2 + 216) & 0x10) == 0) {
    __assert_rtn("session_ob_data_push", "nghttp2_session.c", 952, "stream->flags & NGHTTP2_STREAM_FLAG_NO_RFC7540_PRIORITIES");
  }
  if (*(unsigned char *)(a2 + 218)) {
    __assert_rtn("session_ob_data_push", "nghttp2_session.c", 953, "stream->queued == 0");
  }
  char v3 = *(unsigned char *)(a2 + 220);
  if ((v3 & 0x7Fu) >= 8) {
    __assert_rtn("session_ob_data_push", "nghttp2_session.c", 958, "urgency < NGHTTP2_EXTPRI_URGENCY_LEVELS");
  }
  uint64_t v4 = a1 + 40 * (*(unsigned char *)(a2 + 220) & 0x7F);
  uint64_t v5 = (uint64_t *)(v4 + 328);
  uint64_t v6 = *(void *)(v4 + 344);
  if (v6) {
    uint64_t v6 = *(void *)(*(void *)*v5 + 72);
  }
  *(void *)(a2 + 72) = v6;
  if (v3 < 0) {
    *(void *)(a2 + 72) = *(void *)(a2 + 160) + v6;
  }
  uint64_t result = nghttp2_pq_push(v5, (unint64_t *)a2);
  if (!result) {
    *(unsigned char *)(a2 + 218) = 1;
  }
  return result;
}

uint64_t nghttp2_session_terminate_session2(uint64_t a1, int a2, int a3)
{
  return session_terminate_session(a1, a2, a3, 0);
}

uint64_t nghttp2_session_client_new(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t result = session_new(&v6, a2, a3, 0, 0, 0);
  if (!result)
  {
    uint64_t v5 = v6;
    *(_DWORD *)(v6 + 2800) = 1;
    *a1 = v5;
  }
  return result;
}

BOOL stream_less_215(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 72) - *(void *)(a1 + 72);
  if (v2) {
    return v2 >> 24 == 0;
  }
  else {
    return *(void *)(a1 + 88) < *(void *)(a2 + 88);
  }
}

uint64_t nghttp2_session_client_new3(uint64_t *a1, _OWORD *a2, uint64_t a3, long long *a4, uint64_t (**a5)(uint64_t, uint64_t, void))
{
  uint64_t v8 = 0;
  uint64_t result = session_new(&v8, a2, a3, 0, a4, a5);
  if (!result)
  {
    uint64_t v7 = v8;
    *(_DWORD *)(v8 + 2800) = 1;
    *a1 = v7;
  }
  return result;
}

uint64_t nghttp2_session_server_new(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t result = session_new(&v6, a2, a3, 1, 0, 0);
  if (!result)
  {
    uint64_t v5 = v6;
    *(_DWORD *)(v6 + 2800) = 2;
    *a1 = v5;
  }
  return result;
}

uint64_t nghttp2_session_server_new3(uint64_t *a1, _OWORD *a2, uint64_t a3, long long *a4, uint64_t (**a5)(uint64_t, uint64_t, void))
{
  uint64_t v8 = 0;
  uint64_t result = session_new(&v8, a2, a3, 1, a4, a5);
  if (!result)
  {
    uint64_t v7 = v8;
    *(_DWORD *)(v8 + 2800) = 2;
    *a1 = v7;
  }
  return result;
}

uint64_t nghttp2_session_server_new2(uint64_t *a1, _OWORD *a2, uint64_t a3, long long *a4)
{
  uint64_t v7 = 0;
  uint64_t result = session_new(&v7, a2, a3, 1, a4, 0);
  if (!result)
  {
    uint64_t v6 = v7;
    *(_DWORD *)(v7 + 2800) = 2;
    *a1 = v6;
  }
  return result;
}

uint64_t free_streams(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[19];
  if (v4 && !*(unsigned char *)(v4 + 152) && v4 != *(void *)(a2 + 648))
  {
    nghttp2_outbound_item_free(a1[19], (uint64_t *)(a2 + 2568));
    (*(void (**)(uint64_t, void))(a2 + 2584))(v4, *(void *)(a2 + 2568));
  }
  (*(void (**)(void, void))(a1[2] + 16))(a1[1], *(void *)a1[2]);
  a1[1] = 0;
  (*(void (**)(void *, void))(a2 + 2584))(a1, *(void *)(a2 + 2568));
  return 0;
}

uint64_t nghttp2_session_reprioritize_stream(uint64_t a1, uint64_t a2, int *a3)
{
  char v3 = (uint64_t *)a3;
  int v6 = *(unsigned __int8 *)(a1 + 2932);
  int v7 = *(unsigned __int8 *)(a1 + 2930);
  if (*(unsigned char *)(a1 + 2932))
  {
    if (v7 == 1 && !*(unsigned char *)(a1 + 2931)) {
LABEL_4:
    }
      __assert_rtn("nghttp2_session_reprioritize_stream", "nghttp2_session.c", 866, "(!session->server && session->pending_no_rfc7540_priorities != 1) || (session->server && !session_no_rfc7540_pri_no_fallback(session))");
  }
  else if (v7 == 1)
  {
    goto LABEL_4;
  }
  int v8 = *a3;
  if (*a3 == *(_DWORD *)(a2 + 168)) {
    __assert_rtn("nghttp2_session_reprioritize_stream", "nghttp2_session.c", 867, "pri_spec->stream_id != stream->stream_id");
  }
  if (!*(void *)(a2 + 96) && !*(void *)(a2 + 104) && !*(void *)(a2 + 112) && !*(void *)(a2 + 120)) {
    return 0;
  }
  int v26 = 0;
  uint64_t v25 = 0;
  if (!v8) {
    goto LABEL_31;
  }
  char v9 = (void *)nghttp2_map_find((uint64_t *)a1, v8);
  if (v9)
  {
    uint64_t v10 = (uint64_t)v9;
    if (!v9[12] && !v9[13] && !v9[14] && !v9[15])
    {
LABEL_30:
      uint64_t v25 = 0x1000000000;
      char v3 = &v25;
LABEL_31:
      uint64_t v10 = a1 + 32;
      goto LABEL_32;
    }
  }
  else
  {
    if ((v8 & 1) == (v6 == 0)) {
      int v11 = *(_DWORD *)(a1 + 2804);
    }
    else {
      int v11 = *(_DWORD *)(a1 + 2808);
    }
    if (v11 >= v8) {
      goto LABEL_30;
    }
    uint64_t v25 = 0x1000000000;
    uint64_t v12 = nghttp2_session_open_stream(a1, v8, &v25, 5, 0);
    if (!v12) {
      return 4294966395;
    }
    uint64_t v10 = v12;
    if (!*(_DWORD *)v3) {
      goto LABEL_31;
    }
  }
  uint64_t v13 = v10;
  while (v13 != a2)
  {
    uint64_t v13 = *(void *)(v13 + 96);
    if (!v13) {
      goto LABEL_32;
    }
  }
  nghttp2_stream_dep_remove_subtree(v10);
  uint64_t result = nghttp2_stream_dep_add_subtree(*(void *)(a2 + 96), v10);
  if (!result)
  {
LABEL_32:
    if (v10 == *(void *)(a2 + 96) && !*((unsigned char *)v3 + 8))
    {
      int v19 = *((_DWORD *)v3 + 1);
      unint64_t v20 = *(unsigned int *)(a2 + 192);
      if (v19 != v20)
      {
        *(_DWORD *)(a2 + 192) = v19;
        *(_DWORD *)(v10 + 200) += v19 - v20;
        if (*(unsigned char *)(a2 + 218))
        {
          nghttp2_pq_remove(v10 + 8, (unint64_t *)a2);
          unint64_t v21 = *(unsigned int *)(a2 + 192);
          unint64_t v22 = ((*(_DWORD *)(a2 + 196) + v20)
               + (*(void *)(a2 + 160) << 8) / v20 * v20
               - (*(void *)(a2 + 160) << 8))
              % v20
              + (*(void *)(a2 + 160) << 8);
          unint64_t v23 = v22 / v21 + *(void *)(a2 + 72) - v22 / v20;
          *(void *)(a2 + 72) = v23;
          *(_DWORD *)(a2 + 196) = v22 % v21;
          uint64_t v24 = *(void *)(v10 + 64);
          if (!((v24 - v23) >> 32)) {
            *(void *)(a2 + 72) = v24;
          }
          nghttp2_pq_push((uint64_t *)(v10 + 8), (unint64_t *)a2);
        }
      }
    }
    else
    {
      nghttp2_stream_dep_remove_subtree(a2);
      int v15 = *((_DWORD *)v3 + 1);
      *(_DWORD *)(a2 + 192) = v15;
      if (!*((unsigned char *)v3 + 8))
      {
        return nghttp2_stream_dep_add_subtree(v10, a2);
      }
      *(_DWORD *)(a2 + 200) += *(_DWORD *)(v10 + 200);
      *(_DWORD *)(v10 + 200) = v15;
      uint64_t v16 = *(void *)(v10 + 104);
      *(void *)(v10 + 104) = a2;
      *(void *)(a2 + 96) = v10;
      if (v16)
      {
        uint64_t v17 = *(void *)(a2 + 104);
        if (v17)
        {
          do
          {
            uint64_t v18 = v17;
            uint64_t v17 = *(void *)(v17 + 120);
          }
          while (v17);
          *(void *)(v18 + 120) = v16;
          *(void *)(v16 + 112) = v18;
        }
        else
        {
          *(void *)(a2 + 104) = v16;
          *(void *)(v16 + 96) = a2;
        }
        do
        {
          *(void *)(v16 + 96) = a2;
          if (*(unsigned char *)(v16 + 218))
          {
            uint64_t result = stream_obq_move(a2, v10, v16);
            if (result) {
              return result;
            }
          }
          uint64_t v16 = *(void *)(v16 + 120);
        }
        while (v16);
      }
      if (*(void *)(a2 + 152) && (*(unsigned char *)(a2 + 216) & 0xC) == 0 || *(void *)(a2 + 24))
      {
        uint64_t result = stream_obq_push(v10, (uint64_t *)a2);
        if (result) {
          return result;
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t session_ob_data_remove(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a2 + 216) & 0x10) == 0) {
    __assert_rtn("session_ob_data_remove", "nghttp2_session.c", 981, "stream->flags & NGHTTP2_STREAM_FLAG_NO_RFC7540_PRIORITIES");
  }
  if (*(unsigned char *)(a2 + 218) != 1) {
    __assert_rtn("session_ob_data_remove", "nghttp2_session.c", 982, "stream->queued == 1");
  }
  if ((*(unsigned char *)(a2 + 220) & 0x7Fu) >= 8) {
    __assert_rtn("session_ob_data_remove", "nghttp2_session.c", 986, "urgency < NGHTTP2_EXTPRI_URGENCY_LEVELS");
  }
  uint64_t result = nghttp2_pq_remove(a1 + 40 * (*(unsigned char *)(a2 + 220) & 0x7F) + 328, (unint64_t *)a2);
  *(unsigned char *)(a2 + 218) = 0;
  return result;
}

void nghttp2_session_adjust_closed_stream(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 2892);
  if (v2 == -1) {
    unsigned int v2 = *(_DWORD *)(a1 + 2920);
  }
  uint64_t v3 = *(void *)(a1 + 2728);
  if (v3)
  {
    unint64_t v4 = v2;
    do
    {
      if (*(void *)(a1 + 2704) + v3 <= v4) {
        break;
      }
      uint64_t v5 = *(void *)(a1 + 2616);
      if (!v5) {
        __assert_rtn("nghttp2_session_adjust_closed_stream", "nghttp2_session.c", 1692, "head_stream");
      }
      uint64_t v6 = *(void *)(v5 + 136);
      nghttp2_session_destroy_stream(a1, v5);
      if (v7) {
        break;
      }
      *(void *)(a1 + 2616) = v6;
      int v8 = (void *)(v6 + 128);
      if (!v6) {
        int v8 = (void *)(a1 + 2624);
      }
      *int v8 = 0;
      uint64_t v3 = *(void *)(a1 + 2728) - 1;
      *(void *)(a1 + 2728) = v3;
    }
    while (v3);
  }
}

BOOL nghttp2_session_check_request_allowed(uint64_t a1)
{
  return !*(unsigned char *)(a1 + 2932)
      && (*(_DWORD *)(a1 + 2800) & 0x80000000) == 0
      && (*(unsigned char *)(a1 + 2933) & 8) == 0
      && !session_is_closing(a1);
}

uint64_t find_stream_on_goaway_func(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 168);
  if (v2 && ((v2 ^ (*(unsigned char *)(*(void *)a2 + 2932) == 0)) & 1) == 0)
  {
    if (*(_DWORD *)(a2 + 20)) {
      return 0;
    }
  }
  else if (!*(_DWORD *)(a2 + 20))
  {
    return 0;
  }
  if (*(_DWORD *)(a1 + 204) != 5 && (*(unsigned char *)(a1 + 216) & 2) == 0 && v2 > *(_DWORD *)(a2 + 16))
  {
    if (*(void *)(a1 + 136)) {
      __assert_rtn("find_stream_on_goaway_func", "nghttp2_session.c", 2812, "stream->closed_next == NULL");
    }
    if (*(void *)(a1 + 128)) {
      __assert_rtn("find_stream_on_goaway_func", "nghttp2_session.c", 2813, "stream->closed_prev == NULL");
    }
    uint64_t v3 = *(void *)(a2 + 8);
    if (v3) {
      *(void *)(a1 + 136) = v3;
    }
    *(void *)(a2 + 8) = a1;
  }
  return 0;
}

uint64_t session_predicate_push_response_headers_send(uint64_t a1, uint64_t a2)
{
  if (session_is_closing(a1)) {
    return 4294966766;
  }
  if ((*(unsigned char *)(a2 + 217) & 2) != 0) {
    return 4294966784;
  }
  if (*(unsigned char *)(a1 + 2932) && *(_DWORD *)(a2 + 204) == 4) {
    return (*(unsigned __int8 *)(a1 + 2933) << 28 >> 31) & 0xFFFFFDFC;
  }
  return 4294966791;
}

uint64_t session_handle_invalid_connection(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  int v5 = a3;
  int v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 2384);
  if (v7 && v7(a1, a2, a3, *(void *)(a1 + 2608))) {
    return 4294966394;
  }
  int error_code_from_lib_error_code = get_error_code_from_lib_error_code(v5);
  int v10 = *(_DWORD *)(a1 + 2812);

  return session_terminate_session(a1, v10, error_code_from_lib_error_code, a4);
}

uint64_t session_handle_invalid_stream2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  int error_code_from_lib_error_code = get_error_code_from_lib_error_code(a4);
  uint64_t result = nghttp2_session_add_rst_stream(a1, a2, error_code_from_lib_error_code);
  if (!result)
  {
    int v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 2384);
    if (v10 && v10(a1, a3, a4, *(void *)(a1 + 2608))) {
      return 4294966394;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t get_error_code_from_lib_error_code(int a1)
{
  switch(a1)
  {
    case -533:
      return 7;
    case -532:
    case -531:
      return 1;
    case -530:
    case -529:
    case -528:
    case -527:
    case -526:
    case -525:
      return 2;
    case -524:
      return 3;
    case -523:
      return 9;
    case -522:
      return 6;
    default:
      if (a1 == -510) {
        return 5;
      }
      if (a1 == -505) {
        return 1;
      }
      return 2;
  }
}

uint64_t nghttp2_session_add_ping(uint64_t a1, char a2, uint64_t *a3)
{
  if ((a2 & 1) != 0 && *(void *)(a1 + 2752) >= *(void *)(a1 + 2760)) {
    return 4294966392;
  }
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void))(a1 + 2576))(160, *(void *)(a1 + 2568));
  if (!v6) {
    return 4294966395;
  }
  uint64_t v7 = v6;
  *(_OWORD *)(v6 + 137) = 0u;
  *(_OWORD *)(v6 + 112) = 0u;
  *(_OWORD *)(v6 + 128) = 0u;
  *(_OWORD *)(v6 + 96) = 0u;
  *(void *)uint64_t v6 = 8;
  *(unsigned char *)(v6 + 12) = 6;
  *(unsigned char *)(v6 + 13) = a2;
  *(_DWORD *)(v6 + 8) = 0;
  *(unsigned char *)(v6 + 14) = 0;
  if (a3) {
    uint64_t v8 = *a3;
  }
  else {
    uint64_t v8 = 0;
  }
  *(void *)(v6 + 16) = v8;
  uint64_t v10 = nghttp2_session_add_item(a1, v6);
  if (v10)
  {
    uint64_t v9 = v10;
    (*(void (**)(uint64_t, void))(a1 + 2584))(v7, *(void *)(a1 + 2568));
  }
  else
  {
    uint64_t v9 = 0;
    if (a2) {
      ++*(void *)(a1 + 2752);
    }
  }
  return v9;
}

uint64_t session_update_stream_priority(uint64_t a1, uint64_t a2, int a3)
{
  if (*(unsigned __int8 *)(a2 + 220) == a3) {
    return 0;
  }
  char v3 = a3;
  if (!*(unsigned char *)(a2 + 218))
  {
    *(unsigned char *)(a2 + 220) = a3;
    return 0;
  }
  session_ob_data_remove(a1, a2);
  *(unsigned char *)(a2 + 220) = v3;

  return session_ob_data_push(a1, a2);
}

uint64_t session_call_error_callback(uint64_t a1, uint64_t a2, char *__format, ...)
{
  va_start(va, __format);
  if (*(_OWORD *)(a1 + 2552) == 0) {
    return 0;
  }
  int v6 = vsnprintf(0, 0, __format, va);
  if (v6 < 0) {
    return 4294966395;
  }
  size_t v7 = (v6 + 1);
  uint64_t v8 = (char *)(*(uint64_t (**)(size_t, void))(a1 + 2576))(v7, *(void *)(a1 + 2568));
  if (!v8) {
    return 4294966395;
  }
  uint64_t v9 = v8;
  unsigned int v10 = vsnprintf(v8, v7, __format, va);
  if ((v10 & 0x80000000) != 0)
  {
    (*(void (**)(char *, void))(a1 + 2584))(v9, *(void *)(a1 + 2568));
    return 0;
  }
  int v11 = *(uint64_t (**)(uint64_t, uint64_t, char *, void, void))(a1 + 2560);
  if (v11) {
    int v12 = v11(a1, a2, v9, v10, *(void *)(a1 + 2608));
  }
  else {
    int v12 = (*(uint64_t (**)(uint64_t, char *, void, void))(a1 + 2552))(a1, v9, v10, *(void *)(a1 + 2608));
  }
  int v14 = v12;
  (*(void (**)(char *, void))(a1 + 2584))(v9, *(void *)(a1 + 2568));
  if (v14) {
    return 4294966394;
  }
  else {
    return 0;
  }
}

void session_process_priority_frame(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 2930);
  if (v2 == 1 && !*(unsigned char *)(a1 + 2931)) {
    __assert_rtn("session_process_priority_frame", "nghttp2_session.c", 4526, "!session_no_rfc7540_pri_no_fallback(session)");
  }
  char v3 = *(int **)(a1 + 848);
  int v4 = *v3;
  unsigned int v5 = bswap32(*v3 & 0xFFFFFF7F);
  LODWORD(v3) = *((unsigned __int8 *)v3 + 4) + 1;
  *(_DWORD *)(a1 + 744) = v5;
  *(_DWORD *)(a1 + 748) = v3;
  *(unsigned char *)(a1 + 752) = (v4 & 0x80) != 0;
  if (v2 == 1 && !*(unsigned char *)(a1 + 2931)) {
    __assert_rtn("nghttp2_session_on_priority_received", "nghttp2_session.c", 4467, "!session_no_rfc7540_pri_no_fallback(session)");
  }
  int v6 = *(_DWORD *)(a1 + 736);
  if (v6)
  {
    if (v5 == v6)
    {
      int v7 = *(_DWORD *)(a1 + 2812);
      session_terminate_session(a1, v7, 1, "depend on itself");
      return;
    }
    if (*(unsigned char *)(a1 + 2932))
    {
      uint64_t v8 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)(a1 + 736));
      if (v8)
      {
        if ((int)nghttp2_session_reprioritize_stream(a1, v8, (int *)(a1 + 744)) < -900) {
          return;
        }
        nghttp2_session_adjust_idle_stream(a1);
        if (v9 < -900) {
          return;
        }
      }
      else
      {
        if (v6) {
          int v10 = *(_DWORD *)(a1 + 2808);
        }
        else {
          int v10 = *(_DWORD *)(a1 + 2804);
        }
        if (v10 >= v6) {
          return;
        }
        if (!nghttp2_session_open_stream(a1, v6, (uint64_t *)(a1 + 744), 5, 0)) {
          return;
        }
        nghttp2_session_adjust_idle_stream(a1);
        if (v11 <= -901) {
          return;
        }
      }
    }
    int v12 = *(uint64_t (**)(uint64_t, uint64_t, void))(a1 + 2376);
    if (v12) {
      v12(a1, a1 + 728, *(void *)(a1 + 2608));
    }
  }
  else
  {
    session_handle_invalid_connection(a1, a1 + 728, 4294966791, "PRIORITY: stream_id == 0");
  }
}

void session_process_rst_stream_frame(uint64_t a1)
{
  uint64_t v2 = a1 + 728;
  *(_DWORD *)(a1 + 744) = bswap32(**(_DWORD **)(a1 + 848));
  int v3 = *(_DWORD *)(a1 + 736);
  if (!v3)
  {
    unsigned int v5 = "RST_STREAM: stream_id == 0";
LABEL_8:
    session_handle_invalid_connection(a1, a1 + 728, 4294966791, v5);
    return;
  }
  if ((*(_DWORD *)(a1 + 736) & 1) == (*(unsigned char *)(a1 + 2932) == 0)) {
    int v4 = *(_DWORD *)(a1 + 2804);
  }
  else {
    int v4 = *(_DWORD *)(a1 + 2808);
  }
  if (v4 < v3)
  {
    unsigned int v5 = "RST_STREAM: stream in idle";
    goto LABEL_8;
  }
  uint64_t v6 = nghttp2_map_find((uint64_t *)a1, v3);
  if (v6 && (*(unsigned char *)(v6 + 216) & 2) == 0 && *(_DWORD *)(v6 + 204) != 5) {
    *(unsigned char *)(v6 + 217) |= 1u;
  }
  int v7 = *(unsigned int (**)(uint64_t, uint64_t, void))(a1 + 2376);
  if (!v7 || !v7(a1, v2, *(void *)(a1 + 2608)))
  {
    nghttp2_session_close_stream(a1, *(unsigned int *)(a1 + 736), *(unsigned int *)(a1 + 744));
    if (v8 >= -900 && *(unsigned char *)(a1 + 2932) && (*(unsigned char *)(a1 + 2933) & 0x10) == 0)
    {
      v19.unint64_t tv_sec = 0;
      v19.tv_nsec = 0;
      if (clock_gettime(_CLOCK_MONOTONIC, &v19) == -1)
      {
        time_t v10 = time(0);
        if (v10 == -1) {
          unint64_t tv_sec = 0;
        }
        else {
          unint64_t tv_sec = v10;
        }
      }
      else
      {
        unint64_t tv_sec = v19.tv_sec;
      }
      unint64_t v11 = *(void *)(a1 + 2680);
      BOOL v12 = tv_sec >= v11;
      unint64_t v13 = tv_sec - v11;
      if (v13)
      {
        if (v13 == 0 || !v12) {
          unint64_t v13 = 1;
        }
        *(void *)(a1 + 2680) = tv_sec;
        unint64_t v15 = *(void *)(a1 + 2664);
        if (!is_mul_ok(v13, v15) || (unint64_t v16 = v15 * v13, v17 = *(void *)(a1 + 2672), __CFADD__(v16, v17)))
        {
          unint64_t v14 = *(void *)(a1 + 2656);
        }
        else
        {
          unint64_t v14 = v17 + v16;
          if (v14 >= *(void *)(a1 + 2656)) {
            unint64_t v14 = *(void *)(a1 + 2656);
          }
        }
        *(void *)(a1 + 2672) = v14;
      }
      else
      {
        unint64_t v14 = *(void *)(a1 + 2672);
      }
      if (v14)
      {
        *(void *)(a1 + 2672) = v14 - 1;
      }
      else
      {
        int v18 = *(_DWORD *)(a1 + 2808);
        nghttp2_session_add_goaway(a1, v18, 2, 0, 0, 0);
      }
    }
  }
}

uint64_t session_process_push_promise_frame(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = a1 + 728;
  unsigned int v3 = **(_DWORD **)(a1 + 848) & 0xFFFFFF7F;
  int v4 = bswap32(v3);
  *(_DWORD *)(a1 + 768) = v4;
  *(void *)(a1 + 760) = 0;
  *(void *)(a1 + 752) = 0;
  int v5 = *(_DWORD *)(a1 + 736);
  if (!v5)
  {
    uint64_t v6 = "PUSH_PROMISE: stream_id == 0";
    goto LABEL_5;
  }
  if (*(unsigned char *)(a1 + 2932) || !*(_DWORD *)(a1 + 2888))
  {
    uint64_t v6 = "PUSH_PROMISE: push disabled";
LABEL_5:
    uint64_t v7 = a1 + 728;
    uint64_t v8 = 4294966791;
    goto LABEL_6;
  }
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = "PUSH_PROMISE: invalid stream_id";
    goto LABEL_5;
  }
  if ((*(unsigned char *)(a1 + 2933) & 5) != 0) {
    return 4294967193;
  }
  if (v3) {
    BOOL v10 = (v4 & 1) == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10 || *(_DWORD *)(a1 + 2808) >= v4)
  {
    uint64_t v6 = "PUSH_PROMISE: invalid promised_stream_id";
    goto LABEL_5;
  }
  if (*(_DWORD *)(a1 + 2804) < v5)
  {
    uint64_t v6 = "PUSH_PROMISE: stream in idle";
    goto LABEL_5;
  }
  *(_DWORD *)(a1 + 2808) = v4;
  uint64_t v11 = nghttp2_map_find((uint64_t *)a1, v5);
  if (!v11
    || (*(unsigned char *)(v11 + 216) & 2) != 0
    || (int v12 = *(_DWORD *)(v11 + 204), v12 == 3)
    || v12 == 5
    || !*(unsigned char *)(v1 + 2928)
    || *(void *)(v1 + 2712) >= *(void *)(v1 + 2720))
  {
    LODWORD(result) = nghttp2_session_add_rst_stream(v1, v4, 8);
    if (result) {
      return result;
    }
    else {
      return 4294967193;
    }
  }
  else
  {
    if (*(unsigned char *)(v11 + 217))
    {
      uint64_t v6 = "PUSH_PROMISE: stream closed";
      a1 = v1;
      uint64_t v7 = v2;
      uint64_t v8 = 4294966786;
LABEL_6:
      LODWORD(result) = session_handle_invalid_connection(a1, v7, v8, v6);
      if ((int)result <= -901) {
        return result;
      }
      else {
        return 4294967193;
      }
    }
    int v16 = *(_DWORD *)(v11 + 168);
    uint64_t v17 = 16;
    if (nghttp2_session_open_stream(v1, v4, (uint64_t *)&v16, 4, 0))
    {
      *(_DWORD *)(v1 + 2812) = *(_DWORD *)(v1 + 2808);
      unint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 2432);
      if (v13)
      {
        int v14 = v13(v1, v2, *(void *)(v1 + 2608));
        if (v14) {
          unsigned int v15 = -902;
        }
        else {
          unsigned int v15 = 0;
        }
        if (v14 == -521) {
          return 4294966775;
        }
        else {
          return v15;
        }
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 4294966395;
    }
  }
}

uint64_t session_process_ping_frame(uint64_t a1)
{
  uint64_t v2 = a1 + 728;
  *(void *)(a1 + 744) = **(void **)(a1 + 848);
  if (*(_DWORD *)(a1 + 736))
  {
    return session_handle_invalid_connection(a1, a1 + 728, 4294966791, "PING: stream_id != 0");
  }
  else if ((*(unsigned char *)(a1 + 2916) & 8) != 0 {
         || (*(unsigned char *)(a1 + 741) & 1) != 0
  }
         || session_is_closing(a1)
         || (uint64_t result = nghttp2_session_add_ping(a1, 1, (uint64_t *)(a1 + 744)), !result))
  {
    int v4 = *(unsigned int (**)(uint64_t, uint64_t, void))(a1 + 2376);
    if (v4 && v4(a1, v2, *(void *)(a1 + 2608))) {
      return 4294966394;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t session_process_priority_update_frame(uint64_t a1)
{
  uint64_t v1 = *(int **)(a1 + 848);
  unint64_t v2 = *(void *)(a1 + 856) - (void)v1;
  if (v2 <= 3) {
    __assert_rtn("nghttp2_frame_unpack_priority_update_payload", "nghttp2_frame.c", 924, "payloadlen >= 4");
  }
  uint64_t v4 = *(void *)(a1 + 744);
  int v6 = *v1;
  int v5 = v1 + 1;
  *(_DWORD *)uint64_t v4 = bswap32(v6 & 0xFFFFFF7F);
  unint64_t v7 = v2 - 4;
  if (!v7) {
    int v5 = 0;
  }
  *(void *)(v4 + 8) = v5;
  *(void *)(v4 + 16) = v7;
  if (!*(unsigned char *)(a1 + 2932)) {
    __assert_rtn("nghttp2_session_on_priority_update_received", "nghttp2_session.c", 5337, "session->server");
  }
  if (*(_DWORD *)(a1 + 736))
  {
    uint64_t v8 = "PRIORITY_UPDATE: stream_id == 0";
LABEL_7:
    return session_handle_invalid_connection(a1, a1 + 728, 4294966791, v8);
  }
  uint64_t v10 = *(void *)(a1 + 744);
  int v19 = 0;
  uint64_t v17 = 3;
  int v11 = *(_DWORD *)v10;
  if (*(_DWORD *)v10) {
    BOOL v12 = (*(_DWORD *)v10 & 1) == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    uint64_t v13 = nghttp2_map_find((uint64_t *)a1, *(_DWORD *)v10);
    if (v13)
    {
      uint64_t v14 = v13;
      if ((*(unsigned char *)(v13 + 216) & 0x20) != 0) {
        goto LABEL_29;
      }
    }
    else
    {
      if (!v11) {
        goto LABEL_29;
      }
      int v15 = (v11 & 1) != 0 ? *(_DWORD *)(a1 + 2808) : *(_DWORD *)(a1 + 2804);
      if (v15 >= v11) {
        goto LABEL_29;
      }
      if (*(void *)(a1 + 2704) + *(void *)(a1 + 2736) >= (unint64_t)*(unsigned int *)(a1 + 2892))
      {
        uint64_t v8 = "PRIORITY_UPDATE: max concurrent streams exceeded";
        goto LABEL_7;
      }
      uint64_t v18 = 0x1000000000;
      uint64_t v14 = nghttp2_session_open_stream(a1, v11, &v18, 5, 0);
      if (!v14) {
        return 4294966395;
      }
    }
    if (nghttp2_http_parse_priority((int *)&v17, *(unsigned __int8 **)(v10 + 8), *(void *)(v10 + 16))
      || (int)session_update_stream_priority(a1, v14, ((BYTE4(v17) & 1) << 7) | v17) >= -900)
    {
      goto LABEL_29;
    }
    return 4294966395;
  }
  if (*(_DWORD *)(a1 + 2804) < v11)
  {
    uint64_t v8 = "PRIORITY_UPDATE: prioritizing idle push is not allowed";
    goto LABEL_7;
  }
LABEL_29:
  int v16 = *(unsigned int (**)(uint64_t, uint64_t, void))(a1 + 2376);
  if (v16 && v16(a1, a1 + 728, *(void *)(a1 + 2608))) {
    return 4294966394;
  }
  else {
    return 0;
  }
}

uint64_t nghttp2_session_consume(uint64_t a1, int a2, uint64_t a3)
{
  if (!a2) {
    return 4294966795;
  }
  if ((*(unsigned char *)(a1 + 2916) & 1) == 0) {
    return 4294966777;
  }
  uint64_t result = session_update_consumed_size(a1, (int *)(a1 + 2836), (int *)(a1 + 2832), *(unsigned __int8 *)(a1 + 2934), 0, a3, *(_DWORD *)(a1 + 2844));
  if ((int)result >= -900)
  {
    uint64_t result = nghttp2_map_find((uint64_t *)a1, a2);
    if (result)
    {
      if ((*(unsigned char *)(result + 216) & 2) != 0 || *(_DWORD *)(result + 204) == 5)
      {
        return 0;
      }
      else
      {
        LODWORD(result) = session_update_consumed_size(a1, (int *)(result + 180), (int *)(result + 176), *(unsigned __int8 *)(result + 219), *(_DWORD *)(result + 168), a3, *(_DWORD *)(result + 188));
        if ((int)result <= -901) {
          return result;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t nghttp2_session_recv()
{
  v0 = (void *)MEMORY[0x270FA5388]();
  uint64_t v7 = *MEMORY[0x263EF8340];
  while (1)
  {
    uint64_t v1 = (uint64_t (*)(void *, char *, uint64_t, void, void))v0[296];
    if (!v1) {
      uint64_t v1 = (uint64_t (*)(void *, char *, uint64_t, void, void))v0[295];
    }
    int64_t v2 = v1(v0, v6, 0x4000, 0, v0[326]);
    int64_t v3 = v2;
    if (v2 < 1) {
      break;
    }
    if ((unint64_t)v2 > 0x4000) {
      return 4294966394;
    }
    uint64_t result = nghttp2_session_mem_recv2((uint64_t)v0, v6, v2);
    if (result < 0) {
      return result;
    }
    if (result != v3) {
      __assert_rtn("nghttp2_session_recv", "nghttp2_session.c", 7390, "proclen == readlen");
    }
  }
  if (v2 != -507)
  {
    if (v2 == -504 || v2 == 0) {
      return 0;
    }
    return 4294966394;
  }
  return 4294966789;
}

uint64_t nghttp2_session_get_outbound_queue_size(void *a1)
{
  return a1[37] + a1[34] + a1[40];
}

uint64_t nghttp2_session_get_stream_effective_recv_data_length(uint64_t *a1, int a2)
{
  uint64_t v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(unsigned char *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *(_DWORD *)(v2 + 176) & ~(*(int *)(v2 + 176) >> 31);
  }
}

uint64_t nghttp2_session_get_stream_effective_local_window_size(uint64_t *a1, int a2)
{
  uint64_t v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(unsigned char *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *(unsigned int *)(v2 + 188);
  }
}

uint64_t nghttp2_session_get_stream_local_window_size(uint64_t *a1, int a2)
{
  uint64_t v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(unsigned char *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5) {
    return 0xFFFFFFFFLL;
  }
  int v4 = *(_DWORD *)(v2 + 188) - *(_DWORD *)(v2 + 176);
  return v4 & ~(v4 >> 31);
}

uint64_t nghttp2_session_get_effective_recv_data_length(uint64_t a1)
{
  return *(_DWORD *)(a1 + 2832) & ~(*(int *)(a1 + 2832) >> 31);
}

uint64_t nghttp2_session_get_effective_local_window_size(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2844);
}

uint64_t nghttp2_session_get_remote_settings(unsigned int *a1, int a2)
{
  switch(a2)
  {
    case 1:
      uint64_t v2 = a1 + 713;
      break;
    case 2:
      uint64_t v2 = a1 + 714;
      break;
    case 3:
      uint64_t v2 = a1 + 715;
      break;
    case 4:
      uint64_t v2 = a1 + 716;
      break;
    case 5:
      uint64_t v2 = a1 + 717;
      break;
    case 6:
      uint64_t v2 = a1 + 718;
      break;
    case 8:
      uint64_t v2 = a1 + 719;
      break;
    case 9:
      uint64_t v2 = a1 + 720;
      break;
    default:
      __assert_rtn("nghttp2_session_get_remote_settings", "nghttp2_session.c", 8053, "0");
  }
  return *v2;
}

uint64_t nghttp2_session_get_local_settings(unsigned int *a1, int a2)
{
  switch(a2)
  {
    case 1:
      uint64_t v2 = a1 + 721;
      break;
    case 2:
      uint64_t v2 = a1 + 722;
      break;
    case 3:
      uint64_t v2 = a1 + 723;
      break;
    case 4:
      uint64_t v2 = a1 + 724;
      break;
    case 5:
      uint64_t v2 = a1 + 725;
      break;
    case 6:
      uint64_t v2 = a1 + 726;
      break;
    case 8:
      uint64_t v2 = a1 + 727;
      break;
    case 9:
      uint64_t v2 = a1 + 728;
      break;
    default:
      __assert_rtn("nghttp2_session_get_local_settings", "nghttp2_session.c", 8078, "0");
  }
  return *v2;
}

uint64_t nghttp2_session_upgrade(uint64_t *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v5 = nghttp2_session_upgrade_internal((uint64_t)a1, a2, a3, a4);
  if (!v5)
  {
    uint64_t v6 = nghttp2_map_find(a1, 1);
    if (!v6 || (*(unsigned char *)(v6 + 216) & 2) != 0 || *(_DWORD *)(v6 + 204) == 5) {
      __assert_rtn("nghttp2_session_upgrade", "nghttp2_session.c", 8166, "stream");
    }
    *(_DWORD *)(v6 + 212) |= 0x400u;
  }
  return v5;
}

uint64_t nghttp2_session_upgrade_internal(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(a1 + 2932))
  {
    if (*(int *)(a1 + 2808) > 0) {
      return 4294966791;
    }
  }
  else if (*(_DWORD *)(a1 + 2800) != 1)
  {
    return 4294966791;
  }
  unint64_t v9 = a3 / 6;
  if (a3 % 6) {
    return 4294966795;
  }
  if (v9 > *(void *)(a1 + 2776)) {
    return 4294966759;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v22 = 0;
  if (a3 >= 6)
  {
    uint64_t v11 = (*(uint64_t (**)(unint64_t, void))(a1 + 2576))(8 * v9, *(void *)(a1 + 2568));
    if (!v11) {
      return 4294966395;
    }
    uint64_t v10 = (_DWORD *)v11;
    BOOL v12 = (_DWORD *)(v11 + 4);
    uint64_t v13 = (unsigned int *)(a2 + 2);
    unint64_t v14 = a3 / 6;
    do
    {
      *(v12 - 1) = bswap32(*((unsigned __int16 *)v13 - 1)) >> 16;
      unsigned int v15 = *v13;
      uint64_t v13 = (unsigned int *)((char *)v13 + 6);
      *BOOL v12 = bswap32(v15);
      v12 += 2;
      --v14;
    }
    while (v14);
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (*(unsigned char *)(a1 + 2932))
  {
    *(void *)&long long v23 = a3;
    WORD6(v23) = 4;
    DWORD2(v23) = 0;
    BYTE14(v23) = 0;
    *(void *)&long long v24 = a3 / 6;
    *((void *)&v24 + 1) = v10;
    uint64_t v16 = nghttp2_session_on_settings_received(a1, (uint64_t)&v23, 1);
  }
  else
  {
    uint64_t v16 = nghttp2_session_add_settings(a1, 0, v10, a3 / 6);
  }
  uint64_t v8 = v16;
  (*(void (**)(_DWORD *, void))(a1 + 2584))(v10, *(void *)(a1 + 2568));
  if (!v8)
  {
    uint64_t v21 = 0x1000000000;
    LOBYTE(v22) = 0;
    if (*(unsigned char *)(a1 + 2932)) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = a4;
    }
    uint64_t v18 = nghttp2_session_open_stream(a1, 1, &v21, 1, v17);
    if (v18)
    {
      char v19 = *(unsigned char *)(v18 + 217);
      uint64_t v8 = 0;
      if (*(unsigned char *)(a1 + 2932))
      {
        *(unsigned char *)(v18 + 217) = v19 | 1;
        *(void *)(a1 + 2808) = 0x100000001;
      }
      else
      {
        *(unsigned char *)(v18 + 217) = v19 | 2;
        *(_DWORD *)(a1 + 2804) = 1;
        *(_DWORD *)(a1 + 2800) += 2;
      }
      return v8;
    }
    return 4294966395;
  }
  return v8;
}

uint64_t nghttp2_session_upgrade2(uint64_t *a1, uint64_t a2, unint64_t a3, int a4, uint64_t a5)
{
  uint64_t v7 = nghttp2_session_upgrade_internal((uint64_t)a1, a2, a3, a5);
  if (!v7)
  {
    uint64_t v8 = nghttp2_map_find(a1, 1);
    if (!v8 || (*(unsigned char *)(v8 + 216) & 2) != 0 || *(_DWORD *)(v8 + 204) == 5) {
      __assert_rtn("nghttp2_session_upgrade2", "nghttp2_session.c", 8195, "stream");
    }
    if (a4) {
      *(_DWORD *)(v8 + 212) |= 0x100u;
    }
  }
  return v7;
}

uint64_t nghttp2_session_get_stream_local_close(uint64_t *a1, int a2)
{
  uint64_t v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(unsigned char *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return (*(unsigned __int8 *)(v2 + 217) >> 1) & 1;
  }
}

uint64_t nghttp2_session_get_stream_remote_close(uint64_t *a1, int a2)
{
  uint64_t v2 = nghttp2_map_find(a1, a2);
  if (!v2 || (*(unsigned char *)(v2 + 216) & 2) != 0 || *(_DWORD *)(v2 + 204) == 5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *(unsigned char *)(v2 + 217) & 1;
  }
}

uint64_t nghttp2_session_get_last_proc_stream_id(uint64_t a1)
{
  return *(unsigned int *)(a1 + 2812);
}

uint64_t nghttp2_session_find_stream(uint64_t *a1, int a2)
{
  if (a2) {
    return nghttp2_map_find(a1, a2);
  }
  else {
    return (uint64_t)(a1 + 4);
  }
}

uint64_t nghttp2_session_get_root_stream(uint64_t a1)
{
  return a1 + 32;
}

uint64_t nghttp2_session_check_server_session(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 2932);
}

uint64_t nghttp2_session_change_stream_priority(uint64_t a1, int a2, _DWORD *a3)
{
  if (*(unsigned char *)(a1 + 2930) == 1) {
    return 0;
  }
  if (!a2) {
    return 4294966795;
  }
  if (*a3 == a2) {
    return 4294966795;
  }
  uint64_t v6 = nghttp2_map_find((uint64_t *)a1, a2);
  if (!v6) {
    return 4294966795;
  }
  uint64_t v8 = *(void *)a3;
  int v9 = a3[2];
  if (SHIDWORD(v8) < 1)
  {
    int v7 = 1;
  }
  else
  {
    if (HIDWORD(v8) < 0x101) {
      goto LABEL_13;
    }
    int v7 = 256;
  }
  HIDWORD(v8) = v7;
LABEL_13:
  LODWORD(result) = nghttp2_session_reprioritize_stream(a1, v6, (int *)&v8);
  if ((int)result <= -901) {
    return result;
  }
  else {
    return 0;
  }
}

uint64_t nghttp2_session_create_idle_stream(uint64_t a1, int a2, _DWORD *a3)
{
  if (*(unsigned char *)(a1 + 2930) == 1) {
    return 0;
  }
  if (!a2 || *a3 == a2) {
    return 4294966795;
  }
  int v7 = (a2 & 1) == (*(unsigned char *)(a1 + 2932) == 0) ? *(_DWORD *)(a1 + 2804) : *(_DWORD *)(a1 + 2808);
  if (v7 >= a2 || nghttp2_map_find((uint64_t *)a1, a2)) {
    return 4294966795;
  }
  uint64_t v9 = *(void *)a3;
  int v10 = a3[2];
  if (SHIDWORD(v9) < 1)
  {
    int v8 = 1;
  }
  else
  {
    if (HIDWORD(v9) < 0x101) {
      goto LABEL_17;
    }
    int v8 = 256;
  }
  HIDWORD(v9) = v8;
LABEL_17:
  if (nghttp2_session_open_stream(a1, a2, &v9, 5, 0)) {
    return 0;
  }
  else {
    return 4294966395;
  }
}

uint64_t nghttp2_session_get_hd_inflate_dynamic_table_size(uint64_t a1)
{
  return *(void *)(a1 + 2144);
}

uint64_t nghttp2_session_get_hd_deflate_dynamic_table_size(uint64_t a1)
{
  return *(void *)(a1 + 1032);
}

uint64_t nghttp2_session_set_user_data(uint64_t result, uint64_t a2)
{
  *(void *)(result + 2608) = a2;
  return result;
}

uint64_t nghttp2_session_change_extpri_stream_priority(uint64_t a1, int a2, unint64_t *a3, int a4)
{
  if (!*(unsigned char *)(a1 + 2932)) {
    return 4294966777;
  }
  if (*(unsigned char *)(a1 + 2930) != 1) {
    return 0;
  }
  if (!a2) {
    return 4294966795;
  }
  unint64_t v6 = *a3;
  uint64_t v7 = nghttp2_map_find((uint64_t *)a1, a2);
  if (!v7) {
    return 4294966795;
  }
  if ((v6 & 0xFFFFFFF8) != 0) {
    char v8 = 7;
  }
  else {
    char v8 = v6;
  }
  if (a4) {
    *(unsigned char *)(v7 + 216) |= 0x20u;
  }

  return session_update_stream_priority(a1, v7, (v6 >> 25) & 0x80 | v8);
}

uint64_t nghttp2_session_get_extpri_stream_priority(uint64_t a1, _DWORD *a2, int a3)
{
  if (!*(unsigned char *)(a1 + 2932)) {
    return 4294966777;
  }
  if (*(unsigned char *)(a1 + 2930) != 1) {
    return 0;
  }
  if (!a3) {
    return 4294966795;
  }
  uint64_t v4 = nghttp2_map_find((uint64_t *)a1, a3);
  if (!v4) {
    return 4294966795;
  }
  uint64_t v5 = v4;
  uint64_t result = 0;
  LODWORD(v5) = *(unsigned __int8 *)(v5 + 220);
  *a2 = v5 & 0x7F;
  a2[1] = v5 >> 7;
  return result;
}

uint64_t nghttp2_increase_local_window_size(int *a1, _DWORD *a2, int *a3, int *a4)
{
  int v4 = *a4;
  if (*a4 < 0) {
    __assert_rtn("nghttp2_increase_local_window_size", "nghttp2_helper.c", 225, "delta >= 0");
  }
  int v6 = *a1;
  if (*a1 > (v4 ^ 0x7FFFFFFF)) {
    return 4294966772;
  }
  uint64_t result = 0;
  *a1 = v6 + v4;
  if (*a3 < v4) {
    int v4 = *a3;
  }
  *a3 -= v4;
  *a2 += v4;
  *a4 -= v4;
  return result;
}

const char *nghttp2_strerror(int a1)
{
  switch(a1)
  {
    case -537:
      uint64_t result = "SETTINGS frame contained more than the maximum allowed entries";
      break;
    case -536:
      uint64_t result = "When a local endpoint expects to receive SETTINGS frame, it receives an other type of frame";
      break;
    case -535:
      uint64_t result = "Cancel";
      break;
    case -534:
      uint64_t result = "Internal error";
      break;
    case -533:
      uint64_t result = "Stream was refused";
      break;
    case -532:
      uint64_t result = "Violation in HTTP messaging rule";
      break;
    case -531:
      uint64_t result = "Invalid HTTP header field was received";
      break;
    case -530:
      uint64_t result = "The current session is closing";
      break;
    case -529:
      uint64_t result = "DATA or HEADERS frame has already been submitted for the stream";
      break;
    case -528:
      uint64_t result = "Server push is disabled by peer";
      break;
    case -527:
      uint64_t result = "Too many inflight SETTINGS";
      break;
    case -526:
      uint64_t result = "Callback was paused by the application";
      break;
    case -525:
      uint64_t result = "Insufficient buffer size given to function";
      break;
    case -524:
      uint64_t result = "Flow control error";
      break;
    case -523:
      uint64_t result = "Header compression/decompression error";
      break;
    case -522:
      uint64_t result = "The length of the frame is invalid";
      break;
    case -521:
      uint64_t result = "The user callback function failed due to the temporal error";
      break;
    case -520:
LABEL_7:
      uint64_t result = "Unknown error code";
      break;
    case -519:
      uint64_t result = "Invalid state";
      break;
    case -518:
      uint64_t result = "Invalid header block";
      break;
    case -517:
      uint64_t result = "GOAWAY has already been sent";
      break;
    case -516:
      uint64_t result = "request HEADERS is not allowed";
      break;
    case -515:
      uint64_t result = "Another DATA frame has already been deferred";
      break;
    case -514:
      uint64_t result = "Invalid stream state";
      break;
    case -513:
      uint64_t result = "Stream ID is invalid";
      break;
    case -512:
      uint64_t result = "The transmission is not allowed for this stream";
      break;
    case -511:
      uint64_t result = "Stream is closing";
      break;
    case -510:
      uint64_t result = "Stream was already closed or invalid";
      break;
    case -509:
      uint64_t result = "No more Stream ID available";
      break;
    case -508:
      uint64_t result = "Data transfer deferred";
      break;
    case -507:
      uint64_t result = "EOF";
      break;
    case -506:
      uint64_t result = "Invalid frame octets";
      break;
    case -505:
      uint64_t result = "Protocol error";
      break;
    case -504:
      uint64_t result = "Operation would block";
      break;
    case -503:
      uint64_t result = "Unsupported SPDY version";
      break;
    case -502:
      uint64_t result = "Out of buffer space";
      break;
    case -501:
      uint64_t result = "Invalid argument";
      break;
    default:
      switch(a1)
      {
        case -905:
          uint64_t result = "Too many CONTINUATION frames following a HEADER frame";
          break;
        case -904:
          uint64_t result = "Flooding was detected in this HTTP/2 session, and it must be closed";
          break;
        case -903:
          uint64_t result = "Received bad client magic byte string";
          break;
        case -902:
          uint64_t result = "The user callback function failed";
          break;
        case -901:
          uint64_t result = "Out of memory";
          break;
        default:
          if (a1) {
            goto LABEL_7;
          }
          uint64_t result = "Success";
          break;
      }
      break;
  }
  return result;
}

uint64_t nghttp2_check_header_value_rfc9113(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t v2 = 0;
  int v3 = *a1;
  if (v3 != 9 && v3 != 32)
  {
    uint64_t v2 = 0;
    int v4 = a1[a2 - 1];
    if (v4 != 9 && v4 != 32)
    {
      while (VALID_HD_VALUE_CHARS[*a1])
      {
        ++a1;
        if (!--a2) {
          return 1;
        }
      }
      return 0;
    }
  }
  return v2;
}

uint64_t nghttp2_check_method(unsigned __int8 *a1, uint64_t a2)
{
  if (a2)
  {
    while (VALID_METHOD_CHARS[*a1])
    {
      ++a1;
      if (!--a2) {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t nghttp2_check_path(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  while (VALID_PATH_CHARS[*a1])
  {
    ++a1;
    if (!--a2) {
      return 1;
    }
  }
  return 0;
}

uint64_t nghttp2_check_authority(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  while (VALID_AUTHORITY_CHARS[*a1])
  {
    ++a1;
    if (!--a2) {
      return 1;
    }
  }
  return 0;
}

const char *nghttp2_http2_strerror(unsigned int a1)
{
  if (a1 > 0xD) {
    return "unknown";
  }
  else {
    return (&off_264127070)[a1];
  }
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x270ED8EF0](*(void *)&__clock_id, __tp);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}