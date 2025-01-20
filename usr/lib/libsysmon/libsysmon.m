uint64_t sysmon_retain()
{
  return MEMORY[0x270ED8100]();
}

void *sysmon_request_create(uint64_t a1, const void *a2)
{
  internal = _sysmon_request_create_internal(a1);
  internal[3] = _Block_copy(a2);
  return internal;
}

void *_sysmon_request_create_internal(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = (void *)sysmon_request_alloc();
  snprintf(__str, 0x40uLL, "com.apple.sysmon.request.%p", v2);
  v2[2] = dispatch_queue_create(__str, 0);
  v2[6] = xpc_dictionary_create(0, 0, 0);
  v2[9] = a1;
  return v2;
}

void *sysmon_request_create_with_error(uint64_t a1, const void *a2)
{
  internal = _sysmon_request_create_internal(a1);
  internal[4] = _Block_copy(a2);
  return internal;
}

void sysmon_request_add_attribute(void *a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = (unsigned char *)a1[10];
  if (!v4)
  {
    unint64_t v5 = a1[9] - 1;
    if (v5 >= 3)
    {
      __break(1u);
      return;
    }
    size_t v6 = qword_2214B7AA8[v5];
    a1[11] = v6;
    v4 = malloc_type_calloc(v6, 1uLL, 0x100004077774924uLL);
    a1[10] = v4;
  }
  unint64_t v7 = (unint64_t)a2 >> 3;
  unint64_t v8 = a1[11];
  if (v8 <= v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = a2;
      __int16 v10 = 1024;
      int v11 = v7;
      __int16 v12 = 2048;
      unint64_t v13 = v8;
      _os_log_impl(&dword_2214B5000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Error: sysmon_request_add_attribute called with attr: %du. Calculated index %du, while attrslen is %lu", (uint8_t *)v9, 0x18u);
    }
  }
  else
  {
    v4[v7] |= 1 << (a2 & 7);
  }
}

void sysmon_request_add_attributes(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10)
{
  unint64_t v13 = (unsigned int *)&a10;
  unsigned int v10 = a9;
  if (a9)
  {
    do
    {
      sysmon_request_add_attribute(a1, v10);
      __int16 v12 = v13;
      v13 += 2;
      unsigned int v10 = *v12;
    }
    while (*v12);
  }
}

uint64_t sysmon_request_set_flags(uint64_t result, uint64_t a2)
{
  *(void *)(result + 96) = a2;
  return result;
}

uint64_t sysmon_request_set_interval(uint64_t result, unint64_t a2)
{
  if (a2 <= 0x1F3)
  {
    unint64_t v2 = 500;
LABEL_4:
    *(void *)(result + 104) = v2;
    return result;
  }
  unint64_t v2 = 500 * (a2 / 0x1F4);
  if (a2 % 0x1F4 < v2 + 500 - a2) {
    goto LABEL_4;
  }
  *(void *)(result + 104) = v2 + 500;
  return result;
}

void sysmon_request_execute(uint64_t a1)
{
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 48), (const char *)SYSMON_XPC_KEY_TYPE, *(void *)(a1 + 72));
  unint64_t v2 = *(const void **)(a1 + 80);
  if (!v2) {
    sysmon_request_execute_cold_1();
  }
  xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 48), (const char *)SYSMON_XPC_KEY_ATTRIBUTES, v2, *(void *)(a1 + 88));
  uint64_t v3 = *(void *)(a1 + 96);
  if (v3) {
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 48), (const char *)SYSMON_XPC_KEY_FLAGS, v3);
  }
  *(void *)(a1 + 40) = xpc_connection_create_mach_service((const char *)SYSMON_XPC_SERVICE_NAME, *(dispatch_queue_t *)(a1 + 16), 2uLL);
  _os_object_retain_internal();
  v4 = *(_xpc_connection_s **)(a1 + 40);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __sysmon_request_execute_block_invoke;
  handler[3] = &__block_descriptor_tmp;
  handler[4] = a1;
  handler[5] = a1;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
  unint64_t v5 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __sysmon_request_execute_block_invoke_11;
  block[3] = &__block_descriptor_tmp_13;
  block[4] = a1;
  dispatch_sync(v5, block);
}

void __sysmon_request_execute_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x223C82720](a2);
  if (a2 == (void *)MEMORY[0x263EF86A8])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 64))
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
        __sysmon_request_execute_block_invoke_cold_1();
      }
    }
    else
    {
      if (!*(unsigned char *)(v5 + 65))
      {
        _sysmon_request_invoke_client_handler(v5, 0);
        uint64_t v5 = *(void *)(a1 + 32);
      }
      *(unsigned char *)(v5 + 64) = 1;
      MEMORY[0x270ED80F8]();
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    xpc_object_t v6 = _sysmon_build_reply_with_diff(*(void **)(*(void *)(a1 + 40) + 56), a2, *(void *)(*(void *)(a1 + 40) + 72));
    unint64_t v7 = *(void **)(*(void *)(a1 + 40) + 56);
    if (v7) {
      xpc_release(v7);
    }
    *(void *)(*(void *)(a1 + 40) + 56) = xpc_retain(a2);
    unint64_t v8 = (void *)sysmon_table_alloc();
    xpc_object_t value = xpc_dictionary_get_value(v6, SYSMON_XPC_REPLY_KEY_TIMESTAMP);
    v8[2] = value;
    xpc_retain(value);
    xpc_object_t v10 = xpc_dictionary_get_value(v6, SYSMON_XPC_REPLY_KEY_HEADER);
    v8[3] = v10;
    xpc_retain(v10);
    xpc_object_t v11 = xpc_dictionary_get_value(v6, SYSMON_XPC_REPLY_KEY_TABLE);
    size_t count = xpc_array_get_count(v11);
    v8[4] = count;
    v8[5] = malloc_type_malloc(8 * count, 0x2004093837F09uLL);
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 0x40000000;
    applier[2] = ___sysmon_build_table_from_dict_block_invoke;
    applier[3] = &__block_descriptor_tmp_17;
    applier[4] = v8;
    xpc_array_apply(v11, applier);
    _sysmon_request_invoke_client_handler(*(void *)(a1 + 32), (uint64_t)v8);
    _os_object_release();
    xpc_release(v6);
  }
  else
  {
    if (a2 != (void *)MEMORY[0x263EF86A0] && v4 == MEMORY[0x263EF8720]) {
      xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
    }
    uint64_t v13 = *(void *)(a1 + 32);
    _sysmon_request_invoke_client_handler(v13, 0);
  }
}

void _sysmon_request_invoke_client_handler(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 64)) {
    _sysmon_request_invoke_client_handler_cold_1();
  }
  uint64_t v4 = *(void *)(a1 + 24);
  if (v4)
  {
    uint64_t v5 = a2;
    if (!a2)
    {
      uint64_t v5 = sysmon_table_alloc();
      *(void *)(v5 + 16) = xpc_date_create_from_current();
      *(void *)(v5 + 24) = xpc_data_create(0, 0);
      uint64_t v4 = *(void *)(a1 + 24);
    }
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = a2;
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
      uint64_t v5 = a2;
    }
  }
  *(unsigned char *)(a1 + 65) = 1;
  if (!a2 || !*(void *)(a1 + 104))
  {
    unint64_t v7 = *(_xpc_connection_s **)(a1 + 40);
    if (v7) {
      xpc_connection_cancel(v7);
    }
    if (!a2 && v5)
    {
      _os_object_release();
    }
  }
}

void __sysmon_request_execute_block_invoke_11(uint64_t a1)
{
}

void _sysmon_send_message_and_schedule_repeat(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  if (!*(unsigned char *)(a1 + 64))
  {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 48));
    uint64_t v2 = *(void *)(a1 + 104);
    if (v2)
    {
      dispatch_time_t v3 = dispatch_time(0, 1000000 * v2);
      _os_object_retain_internal();
      uint64_t v4 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = ___sysmon_send_message_and_schedule_repeat_block_invoke;
      block[3] = &__block_descriptor_tmp_18;
      block[4] = a1;
      dispatch_after(v3, v4, block);
    }
  }
}

void sysmon_request_cancel(uint64_t a1)
{
  v1 = *(_xpc_connection_s **)(a1 + 40);
  if (v1) {
    xpc_connection_cancel(v1);
  }
}

uint64_t ___sysmon_build_table_from_dict_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sysmon_row_alloc();
  *(void *)(v6 + 16) = xpc_retain(*(xpc_object_t *)(*(void *)(a1 + 32) + 24));
  *(void *)(v6 + 24) = xpc_retain(a3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 40) + 8 * a2) = v6;
  return 1;
}

uint64_t ___sysmon_send_message_and_schedule_repeat_block_invoke(uint64_t a1)
{
  _sysmon_send_message_and_schedule_repeat(*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);

  return MEMORY[0x270ED80F8](v2);
}

uint64_t sysmon_table_get_count(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sysmon_table_get_timestamp(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t sysmon_table_get_row(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a1 + 40) + 8 * a2);
}

uint64_t sysmon_table_copy_row()
{
  return sysmon_retain();
}

uint64_t sysmon_table_apply(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    do
      result = (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(*(void *)(v3 + 40) + 8 * v4++));
    while (v4 < *(void *)(v3 + 32));
  }
  return result;
}

xpc_object_t sysmon_row_get_value(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void **)(a1 + 16);
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = -1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  v6[2] = ___bitarray_index_of_bit_block_invoke;
  v6[3] = &unk_2645B3F58;
  v6[4] = &v7;
  v6[5] = a2;
  _bitarray_apply(v3, (uint64_t)v6);
  size_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  if ((v4 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return xpc_array_get_value(*(xpc_object_t *)(a1 + 24), v4);
  }
}

size_t sysmon_row_apply(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = __sysmon_row_apply_block_invoke;
  v4[3] = &unk_2645B3F30;
  v4[4] = a2;
  v4[5] = a1;
  return _bitarray_apply(v2, (uint64_t)v4);
}

size_t _bitarray_apply(void *a1, uint64_t a2)
{
  bytes_ptr = xpc_data_get_bytes_ptr(a1);
  size_t result = xpc_data_get_length(a1);
  if (result)
  {
    size_t v6 = result;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      unsigned int v9 = bytes_ptr[v7];
      if (bytes_ptr[v7])
      {
        do
        {
          v9 &= ~(1 << __clz(__rbit32(v9)));
          uint64_t v10 = v8 + 1;
          size_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
          uint64_t v8 = v10;
        }
        while ((_BYTE)v9);
      }
      else
      {
        uint64_t v10 = v8;
      }
      ++v7;
      uint64_t v8 = v10;
    }
    while (v7 != v6);
  }
  return result;
}

uint64_t __sysmon_row_apply_block_invoke(uint64_t a1, size_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  xpc_object_t value = xpc_array_get_value(*(xpc_object_t *)(*(void *)(a1 + 40) + 24), a2);
  size_t v6 = *(uint64_t (**)(uint64_t, uint64_t, xpc_object_t))(v4 + 16);

  return v6(v4, a3, value);
}

uint64_t ___bitarray_index_of_bit_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(result + 40) == a3)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(*(void *)(result + 32) + 8);
    if (*(void *)(v5 + 24) != -1)
    {
      size_t result = _os_assumes_log();
      uint64_t v5 = *(void *)(*(void *)(v4 + 32) + 8);
    }
    *(void *)(v5 + 24) = a2;
  }
  return result;
}

uint64_t sysmon_request_alloc()
{
  uint64_t v0 = objc_opt_class();

  return MEMORY[0x270ED80E0](v0, 112);
}

uint64_t sysmon_table_alloc()
{
  uint64_t v0 = objc_opt_class();

  return MEMORY[0x270ED80E0](v0, 48);
}

uint64_t sysmon_row_alloc()
{
  uint64_t v0 = objc_opt_class();

  return MEMORY[0x270ED80E0](v0, 32);
}

xpc_object_t _sysmon_build_reply_with_diff(void *a1, xpc_object_t object, uint64_t a3)
{
  if (a1)
  {
    if (a3 == 1)
    {
      xpc_object_t value = xpc_dictionary_get_value(object, SYSMON_XPC_REPLY_KEY_HEADER);
      uint64_t v17 = _sysmon_attr_index(value, 51);
      uint64_t v18 = _sysmon_attr_index(value, 52);
      int64_t elapsed_ns = _get_elapsed_ns(object, a1);
      if (elapsed_ns)
      {
        int64_t v20 = elapsed_ns;
        if ((v17 & 0x8000000000000000) == 0 || (v18 & 0x8000000000000000) == 0)
        {
          xpc_object_t v10 = xpc_copy(object);
          uint64_t v21 = _sysmon_attr_index(value, 4);
          uint64_t v22 = _sysmon_attr_index(value, 23);
          uint64_t v23 = _sysmon_attr_index(value, 24);
          uint64_t v24 = _sysmon_attr_index(value, 60);
          xpc_object_t v14 = xpc_dictionary_get_value(v10, SYSMON_XPC_REPLY_KEY_TABLE);
          uint64_t v25 = MEMORY[0x263EF8330];
          uint64_t v26 = 0x40000000;
          v27 = ___sysmon_build_reply_with_diff_process_block_invoke;
          v28 = &__block_descriptor_tmp_4;
          uint64_t v29 = v21;
          uint64_t v30 = v17;
          uint64_t v31 = v22;
          v32 = a1;
          uint64_t v33 = v23;
          uint64_t v34 = v20;
          uint64_t v35 = v18;
          uint64_t v36 = v24;
          goto LABEL_16;
        }
      }
      return xpc_retain(object);
    }
    if (a3 == 3)
    {
      xpc_object_t v5 = xpc_dictionary_get_value(object, SYSMON_XPC_REPLY_KEY_HEADER);
      uint64_t v6 = _sysmon_attr_index(v5, 10);
      uint64_t v7 = _sysmon_attr_index(v5, 11);
      int64_t v8 = _get_elapsed_ns(object, a1);
      if (v8)
      {
        int64_t v9 = v8;
        if ((v6 & 0x8000000000000000) == 0 || (v7 & 0x8000000000000000) == 0)
        {
          xpc_object_t v10 = xpc_copy(object);
          uint64_t v11 = _sysmon_attr_index(v5, 1);
          uint64_t v12 = _sysmon_attr_index(v5, 5);
          uint64_t v13 = _sysmon_attr_index(v5, 12);
          xpc_object_t v14 = xpc_dictionary_get_value(v10, SYSMON_XPC_REPLY_KEY_TABLE);
          uint64_t v25 = MEMORY[0x263EF8330];
          uint64_t v26 = 0x40000000;
          v27 = ___sysmon_build_reply_with_diff_coalition_block_invoke;
          v28 = &__block_descriptor_tmp_1;
          uint64_t v29 = v11;
          uint64_t v30 = v6;
          uint64_t v31 = v12;
          v32 = a1;
          uint64_t v33 = v9;
          uint64_t v34 = v7;
          uint64_t v35 = v13;
LABEL_16:
          xpc_array_apply(v14, &v25);
          return v10;
        }
      }
      return xpc_retain(object);
    }
  }

  return xpc_retain(object);
}

uint64_t _sysmon_attr_index(void *a1, int a2)
{
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2000000000;
  v21[3] = -1;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000;
  uint64_t v20 = -1;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  uint64_t v12 = ___sysmon_attr_index_block_invoke;
  uint64_t v13 = &unk_2645B3FA0;
  int v16 = a2;
  xpc_object_t v14 = v21;
  v15 = &v17;
  bytes_ptr = xpc_data_get_bytes_ptr(a1);
  size_t length = xpc_data_get_length(a1);
  if (length)
  {
    size_t v5 = length;
    for (uint64_t i = 0; i != v5; ++i)
    {
      unsigned int v7 = bytes_ptr[i];
      if (bytes_ptr[i])
      {
        do
        {
          unsigned int v8 = __clz(__rbit32(v7));
          v7 &= ~(1 << v8);
          v12((uint64_t)v11, (8 * i) | v8);
        }
        while ((_BYTE)v7);
      }
    }
  }
  uint64_t v9 = v18[3];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);
  return v9;
}

int64_t _get_elapsed_ns(void *a1, void *a2)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, SYSMON_XPC_REPLY_KEY_TIMESTAMP);
  xpc_object_t v4 = xpc_dictionary_get_value(a2, SYSMON_XPC_REPLY_KEY_TIMESTAMP);
  int64_t v5 = xpc_date_get_value(value);
  return v5 - xpc_date_get_value(v4);
}

uint64_t ___sysmon_build_reply_with_diff_coalition_block_invoke(uint64_t a1, int a2, xpc_object_t xarray)
{
  uint64_t uint64 = xpc_array_get_uint64(xarray, *(void *)(a1 + 32));
  if ((*(void *)(a1 + 40) & 0x8000000000000000) == 0)
  {
    uint64_t v6 = xpc_array_get_uint64(xarray, *(void *)(a1 + 48));
    value_for_row = (void *)_reply_get_value_for_row(*(void **)(a1 + 56), 1, uint64, 5);
    if (value_for_row)
    {
      uint64_t value = xpc_uint64_get_value(value_for_row);
      if (v6)
      {
        if (value) {
          xpc_array_set_double(xarray, *(void *)(a1 + 40), (double)(v6 - value) * 100.0 / (double)*(unint64_t *)(a1 + 64));
        }
      }
    }
  }
  if ((*(void *)(a1 + 72) & 0x8000000000000000) == 0)
  {
    double v9 = xpc_array_get_double(xarray, *(void *)(a1 + 80));
    xpc_object_t v10 = (void *)_reply_get_value_for_row(*(void **)(a1 + 56), 1, uint64, 12);
    if (v10) {
      double v11 = xpc_double_get_value(v10);
    }
    else {
      double v11 = 0.0;
    }
    xpc_array_set_double(xarray, *(void *)(a1 + 72), (v9 - v11) * 100.0 / (double)(*(void *)(a1 + 64) / 0x3B9ACA00uLL));
  }
  return 1;
}

uint64_t _reply_get_value_for_row(void *a1, int a2, uint64_t a3, int a4)
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000;
  uint64_t v20 = 0;
  xpc_object_t value = xpc_dictionary_get_value(a1, SYSMON_XPC_REPLY_KEY_HEADER);
  uint64_t v9 = _sysmon_attr_index(value, a2);
  uint64_t v10 = _sysmon_attr_index(value, a4);
  uint64_t v11 = 0;
  if (v9 != -1 && v10 != -1)
  {
    uint64_t v13 = v10;
    xpc_object_t v14 = xpc_dictionary_get_value(a1, SYSMON_XPC_REPLY_KEY_TABLE);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 0x40000000;
    v16[2] = ___reply_get_value_for_row_block_invoke;
    v16[3] = &unk_2645B3FC8;
    v16[4] = &v17;
    v16[5] = v9;
    v16[6] = a3;
    v16[7] = v13;
    xpc_array_apply(v14, v16);
    uint64_t v11 = v18[3];
  }
  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t ___sysmon_attr_index_block_invoke(uint64_t result, int a2)
{
  ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  if (*(_DWORD *)(result + 48) == a2)
  {
    uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
    if (*(void *)(v2 + 24) != -1) {
      sysmon_request_execute_cold_1();
    }
    *(void *)(v2 + 24) = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

BOOL ___reply_get_value_for_row_block_invoke(void *a1, int a2, xpc_object_t xarray)
{
  uint64_t uint64 = xpc_array_get_uint64(xarray, a1[5]);
  uint64_t v6 = a1[6];
  if (uint64 == v6) {
    *(void *)(*(void *)(a1[4] + 8) + 24) = xpc_array_get_value(xarray, a1[7]);
  }
  return uint64 != v6;
}

uint64_t ___sysmon_build_reply_with_diff_process_block_invoke(uint64_t a1, int a2, xpc_object_t xarray)
{
  uint64_t uint64 = (int)xpc_array_get_uint64(xarray, *(void *)(a1 + 32));
  if ((*(void *)(a1 + 40) & 0x8000000000000000) == 0)
  {
    uint64_t v6 = xpc_array_get_uint64(xarray, *(void *)(a1 + 48));
    value_for_row = (void *)_reply_get_value_for_row(*(void **)(a1 + 56), 4, uint64, 23);
    if (value_for_row) {
      uint64_t value = xpc_uint64_get_value(value_for_row);
    }
    else {
      uint64_t value = 0;
    }
    uint64_t v9 = xpc_array_get_uint64(xarray, *(void *)(a1 + 64));
    uint64_t v10 = _reply_get_value_for_row(*(void **)(a1 + 56), 4, uint64, 24);
    if (v10) {
      uint64_t v10 = xpc_uint64_get_value((xpc_object_t)v10);
    }
    if (value | v10) {
      xpc_array_set_double(xarray, *(void *)(a1 + 40), (double)(v6 + v9 - (value + v10)) * 100.0 / (double)*(unint64_t *)(a1 + 72));
    }
  }
  if ((*(void *)(a1 + 80) & 0x8000000000000000) == 0)
  {
    uint64_t v11 = xpc_array_get_uint64(xarray, *(void *)(a1 + 88));
    uint64_t v12 = (void *)_reply_get_value_for_row(*(void **)(a1 + 56), 4, uint64, 60);
    if (v12)
    {
      uint64_t v13 = xpc_uint64_get_value(v12);
      if (v11)
      {
        if (v13) {
          xpc_array_set_double(xarray, *(void *)(a1 + 80), (double)(v11 - v13) / (double)*(unint64_t *)(a1 + 72));
        }
      }
    }
  }
  return 1;
}

void sysmon_request_execute_cold_1()
{
}

void __sysmon_request_execute_block_invoke_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl(&dword_2214B5000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "Error: libsysmon got XPC_ERROR_CONNECTION_INVALID with self->_done as true", v0, 2u);
}

void _sysmon_request_invoke_client_handler_cold_1()
{
  uint64_t v0 = (const void *)_os_crash();
  __break(1u);
  _Block_copy(v0);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_object_release()
{
  return MEMORY[0x270ED80F0]();
}

uint64_t _os_object_retain_internal()
{
  return MEMORY[0x270ED8108]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

double xpc_array_get_double(xpc_object_t xarray, size_t index)
{
  MEMORY[0x270EDBD60](xarray, index);
  return result;
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x270EDBD78](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

void xpc_array_set_double(xpc_object_t xarray, size_t index, double value)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDBF20](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_date_create_from_current(void)
{
  return (xpc_object_t)MEMORY[0x270EDBFD0]();
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x270EDBFD8](xdate);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x270EDC170](xdouble);
  return result;
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