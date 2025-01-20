void __xpc_remote_channel_send_block_invoke(void *a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t error_code;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = _log_0();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      v6 = a1[4];
      v7 = a1[8];
      v12 = 134218498;
      v13 = v6;
      v14 = 2048;
      v15 = v7;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_1DC811000, v4, OS_LOG_TYPE_INFO, "[%p] Send of msg_id %llu complete with error=%@.", (uint8_t *)&v12, 0x20u);
    }

    error_code = nw_error_get_error_code(v3);
  }
  else
  {
    if (v5)
    {
      v9 = a1[4];
      v10 = a1[8];
      v12 = 134218240;
      v13 = v9;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_1DC811000, v4, OS_LOG_TYPE_INFO, "[%p] Send of msg_id %llu completed successfully", (uint8_t *)&v12, 0x16u);
    }

    error_code = 0;
  }
  v11 = a1[5];
  if (v11) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, error_code);
  }
}

void ___xpc_remote_connection_send_reply_message_block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = _log();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_send_reply_message_block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1DC811000, v5, OS_LOG_TYPE_INFO, "[%p] Reply send completed", (uint8_t *)&v7, 0xCu);
  }
}

void ___xpc_remote_connection_handle_read_block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = _log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = 134218240;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1DC811000, v2, OS_LOG_TYPE_INFO, "[%p] Handler block for %llx complete, re-arming", (uint8_t *)&v5, 0x16u);
  }

  xpc_remote_channel_arm_read(*(void **)(a1 + 40));
}

void xpc_remote_channel_arm_read(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = v1;
  if (!*((_DWORD *)v1 + 12))
  {
    if (v1[2])
    {
      uint64_t v3 = _log_0();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        xpc_remote_channel_arm_read_cold_3();
      }

      uint64_t v4 = v2[2];
      completion[0] = MEMORY[0x1E4F143A8];
      completion[1] = 3221225472;
      completion[2] = __xpc_remote_channel_arm_read_block_invoke;
      completion[3] = &unk_1E6CA3B70;
      __int16 v7 = v2;
      nw_connection_receive(v4, 0x18u, 0x18u, completion);
      int v5 = v7;
    }
    else
    {
      if (*((_DWORD *)v1 + 10) <= 2u) {
        xpc_remote_channel_arm_read_cold_1(&v8, v9);
      }
      int v5 = _log_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        xpc_remote_channel_arm_read_cold_2();
      }
    }
  }
}

void ___xpc_remote_channel_header_handler_block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = *(unsigned int *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  v15 = *(id *)(a1 + 32);
  v16 = v9;
  v17 = v11;
  if (v17)
  {
    v18 = _log_0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_channel_header_handler_block_invoke_cold_3();
    }

    unsigned int error_code = nw_error_get_error_code(v17);
    v20 = v15;
LABEL_5:
    xpc_remote_channel_cancel(v20, error_code);
    goto LABEL_6;
  }
  if (!v16)
  {
    if ((a4 & 1) == 0) {
      _os_assumes_log();
    }
    v24 = _log_0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_channel_header_handler_block_invoke_cold_1();
    }

    v20 = v15;
    unsigned int error_code = 57;
    goto LABEL_5;
  }
  size_t size = dispatch_data_get_size(v16);
  v22 = _log_0();
  v23 = v22;
  if (size != v12)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v25 = 134218496;
      v26 = v15;
      __int16 v27 = 2048;
      uint64_t v28 = v12;
      __int16 v29 = 2048;
      size_t v30 = dispatch_data_get_size(v16);
      _os_log_error_impl(&dword_1DC811000, v23, OS_LOG_TYPE_ERROR, "[%p] Body read returned with short data (message_size=%llu, data_size=%zu), disconnecting", (uint8_t *)&v25, 0x20u);
    }

    v20 = v15;
    unsigned int error_code = 22;
    goto LABEL_5;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    ___xpc_remote_channel_header_handler_block_invoke_cold_2();
  }

  _xpc_remote_channel_deliver_message(v15, v13, v14, v16);
LABEL_6:
}

void _xpc_remote_channel_deliver_message(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  __int16 v7 = a1[1];
  id v8 = a4;
  id v9 = a1;
  dispatch_assert_queue_V2(v7);
  id v10 = _log_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    uint64_t v13 = a2;
    _os_log_impl(&dword_1DC811000, v10, OS_LOG_TYPE_INFO, "Delivering %llu", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v11 = v9[4];
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v11 + 16))(v11, a2, a3, v8);
}

void _xpc_remote_connection_handle_read(void *a1, void *a2, objc_class *a3, uint64_t a4, void *a5)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  Class v10 = a2;
  uint64_t v11 = a5;
  int v12 = v11;
  if (a4 == 2)
  {
    uint64_t v14 = _log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v9;
      _os_log_impl(&dword_1DC811000, v14, OS_LOG_TYPE_INFO, "[%p] Received a PING", buf, 0xCu);
    }
    goto LABEL_9;
  }
  if (!(_BYTE)a4)
  {
    if ([v9 state] >= 5)
    {
      uint64_t v13 = _log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v9;
        _os_log_impl(&dword_1DC811000, v13, OS_LOG_TYPE_INFO, "[%p] Ignoring HELO received after disconnect", buf, 0xCu);
      }
      goto LABEL_6;
    }
    if (v9[5].isa != v10)
    {
      if (v9[7].isa != v10)
      {
        v15 = _log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          _xpc_remote_connection_handle_read_cold_15();
        }
LABEL_54:

        v32 = v9;
LABEL_55:
        _xpc_remote_connection_disconnect(v32, 53);
        goto LABEL_56;
      }
      if (LOBYTE(v9[6].isa))
      {
        v15 = _log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          _xpc_remote_connection_handle_read_cold_14();
        }
        goto LABEL_54;
      }
      LOBYTE(v9[6].isa) = 1;
      v20 = _log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v9;
        _os_log_impl(&dword_1DC811000, v20, OS_LOG_TYPE_INFO, "[%p] Received reply channel HELO", buf, 0xCu);
      }
LABEL_60:

      uint64_t v14 = v9;
      if ([v14 state] != 3) {
        _xpc_remote_connection_handle_read_cold_9(&size_ptr, buf, v14);
      }
      if (LOBYTE(v14[4].isa))
      {
        if (LOBYTE(v14[6].isa))
        {
          [v14 setState:4];
          _xpc_remote_connection_wakeup(v14);
LABEL_9:

LABEL_10:
          xpc_remote_channel_arm_read(v10);
          goto LABEL_56;
        }
        v33 = _log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          _xpc_remote_connection_handle_read_cold_8();
        }
      }
      else
      {
        v33 = _log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          _xpc_remote_connection_handle_read_cold_7();
        }
      }

      goto LABEL_9;
    }
    if (LOBYTE(v9[4].isa))
    {
      v15 = _log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        _xpc_remote_connection_handle_read_cold_13();
      }
      goto LABEL_54;
    }
    LOBYTE(v9[4].isa) = 1;
    v19 = _log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v9;
      _os_log_impl(&dword_1DC811000, v19, OS_LOG_TYPE_INFO, "[%p] Received root channel HELO", buf, 0xCu);
    }

    v20 = v9;
    if (v12 != MEMORY[0x1E4F14410] && v12)
    {
      *(void *)buf = 0;
      size_t size_ptr = 0;
      dispatch_data_t v21 = dispatch_data_create_map(v12, (const void **)buf, &size_ptr);
      uint64_t v22 = xpc_create_from_serialization();
      v23 = v22;
      if (v22)
      {
        uint64_t v24 = MEMORY[0x1E01A4B40](v22);
        uint64_t v25 = MEMORY[0x1E4F14590];

        if (v24 == v25)
        {
          v26 = (void *)MEMORY[0x1E01A4A70](v23);
          __int16 v27 = _log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            _xpc_remote_connection_handle_read_cold_12();
          }

          free(v26);
          int64_t int64 = xpc_dictionary_get_int64(v23, "ServiceVersion");
          if (int64)
          {
            __int16 v29 = (objc_class *)int64;
            size_t v30 = _log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)&buf[4] = v20;
              __int16 v86 = 2048;
              v87 = v29;
              _os_log_impl(&dword_1DC811000, v30, OS_LOG_TYPE_INFO, "[%p] HELO message specified ServiceVersion %lld", buf, 0x16u);
            }

            v20[21].isa = v29;
          }
LABEL_59:

          goto LABEL_60;
        }
      }
      else
      {
      }
      v53 = _log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        _xpc_remote_connection_handle_read_cold_11();
      }

      v32 = v20;
      goto LABEL_55;
    }
    v23 = _log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_connection_handle_read_cold_10();
    }
    goto LABEL_59;
  }
  if (a4 != 1 || !a3) {
    goto LABEL_10;
  }
  if ((~a4 & 0x30000) == 0)
  {
    v15 = _log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      _xpc_remote_connection_handle_read_cold_1();
    }
    goto LABEL_54;
  }
  if ((a4 & 0x20000) != 0)
  {
    if (v9[7].isa != v10 && ((uint64_t)v9[9].isa & 4) != 0)
    {
      v15 = _log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        _xpc_remote_connection_handle_read_cold_6();
      }
      goto LABEL_54;
    }
    if (!v11)
    {
      v18 = (void *)MEMORY[0x1E4F14520];
      id v34 = MEMORY[0x1E4F14520];
      goto LABEL_67;
    }
  }
  else if (!v11)
  {
    v15 = _log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      _xpc_remote_connection_handle_read_cold_2();
    }
    goto LABEL_54;
  }
  *(void *)buf = 0;
  size_t size_ptr = 0;
  dispatch_data_t v67 = dispatch_data_create_map(v11, (const void **)buf, &size_ptr);
  MEMORY[0x1E01A4B90]();
  uint64_t v79 = MEMORY[0x1E4F143A8];
  uint64_t v80 = 3221225472;
  v81 = ___xpc_remote_connection_handle_read_block_invoke;
  v82 = &unk_1E6CA3948;
  v16 = v9;
  v83 = v16;
  uint64_t v17 = xpc_receive_remote_msg();
  if (!v17)
  {
    v18 = v67;
    uint64_t v31 = _log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      _xpc_remote_connection_handle_read_cold_3();
    }

    _xpc_remote_connection_disconnect(v16, 53);
    goto LABEL_81;
  }
  v18 = (void *)v17;

LABEL_67:
  v35 = _log();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = "(wanting reply)";
    *(_DWORD *)buf = 134218498;
    *(void *)&buf[4] = v9;
    if ((a4 & 0x10000) == 0) {
      v36 = (const char *)&unk_1DC823225;
    }
    __int16 v86 = 2048;
    v87 = a3;
    __int16 v88 = 2082;
    v89 = v36;
    _os_log_impl(&dword_1DC811000, v35, OS_LOG_TYPE_INFO, "[%p] Message %llx received %{public}s, dispatching handler block", buf, 0x20u);
  }

  if ((a4 & 0x20000) != 0)
  {
    v40 = v9;
    v41 = (id *)v40[16];
    if (!v41)
    {
LABEL_77:

      goto LABEL_78;
    }
    v42 = v41;
    while (v42[1] != a3)
    {
      v43 = (id *)v42[4];

      v42 = v43;
      if (!v43) {
        goto LABEL_77;
      }
    }
    v45 = v40;
    v46 = v42;
    v47 = v46;
    v48 = (id *)v40[16];
    if (v48 == v46)
    {
      v54 = v46;
      objc_storeStrong(v40 + 16, v54[4]);
      v55 = (id *)v54[4];
      if (!v55)
      {
        id v56 = v45[17];
        v45[17] = 0;

        v55 = (id *)v54[4];
      }
      v54[4] = 0;
    }
    else
    {
      v49 = v48;
      if (!v49) {
        goto LABEL_103;
      }
      v50 = v49;
      while (1)
      {
        v51 = (id *)v50[4];
        if (v51 == v47) {
          break;
        }
        v52 = v51;

        v50 = v52;
        if (!v52) {
          goto LABEL_103;
        }
      }
      v68 = v45;
      v55 = v50;
      v57 = v50[4];
      if (!v57) {
        _xpc_remote_connection_handle_read_cold_5(&size_ptr, buf);
      }
      v58 = v57;

      v66 = v58;
      v59 = (void *)v58[4];
      id v60 = v59;
      v61 = v59;
      id v62 = v60;
      objc_storeStrong(v50 + 4, v61);
      v63 = v62;
      v45 = v68;
      if (!v63)
      {
        objc_storeStrong(v68 + 17, v50);
        v63 = 0;
      }

      v54 = v55;
    }

LABEL_103:
    if (v47)
    {
      v64 = v47[3];
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = ___xpc_remote_connection_handle_read_block_invoke_244;
      v76[3] = &unk_1E6CA3640;
      v77 = v47;
      id v78 = v18;
      v65 = v47;
      dispatch_async(v64, v76);
      xpc_remote_channel_arm_read(v10);

LABEL_81:
      goto LABEL_56;
    }
LABEL_78:
    v44 = _log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      _xpc_remote_connection_handle_read_cold_4();
    }

    _xpc_remote_connection_disconnect(v40, 53);
    goto LABEL_81;
  }
  v37 = [v9 event_handler];
  v38 = [v9 target_queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___xpc_remote_connection_handle_read_block_invoke_2;
  block[3] = &unk_1E6CA3998;
  v70 = v9;
  id v71 = v18;
  id v73 = v37;
  v74 = a3;
  uint64_t v75 = a4;
  v72 = v10;
  uint64_t v13 = v18;
  id v39 = v37;
  dispatch_async(v38, block);

LABEL_6:
LABEL_56:
}

void __xpc_remote_channel_arm_read_block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  int v12 = (NSObject **)*(id *)(a1 + 32);
  uint64_t v13 = v9;
  uint64_t v14 = v11;
  if (!v14)
  {
    if (!v13)
    {
      if ((a4 & 1) == 0) {
        _os_assumes_log();
      }
      uint64_t v25 = _log_0();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v12;
        _os_log_impl(&dword_1DC811000, v25, OS_LOG_TYPE_INFO, "[%p] Header read returned without data, disconnecting", buf, 0xCu);
      }

      uint64_t v17 = v12;
      unsigned int error_code = 57;
      goto LABEL_5;
    }
    size_t size_ptr = 0;
    buffer_ptr = 0;
    dispatch_data_t v18 = dispatch_data_create_map(v13, (const void **)&buffer_ptr, &size_ptr);
    v19 = _log_0();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      __xpc_remote_channel_arm_read_block_invoke_cold_5();
    }

    if (size_ptr == 24 && *(_DWORD *)buffer_ptr == 699403154)
    {
      if (*((unsigned __int8 *)buffer_ptr + 4) == *((unsigned __int8 *)v12 + 73))
      {
        unint64_t v20 = *((void *)buffer_ptr + 1);
        if (!(v20 >> 27))
        {
          uint64_t v31 = *((void *)buffer_ptr + 2);
          uint64_t v32 = *((unsigned __int8 *)buffer_ptr + 5);
          uint64_t v33 = *((unsigned __int16 *)buffer_ptr + 3);
          uint64_t v34 = v32 | (v33 << 16);
          if (v20)
          {
            if (v12[2])
            {
              v35 = _log_0();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
                __xpc_remote_channel_arm_read_block_invoke_cold_4();
              }

              v36 = v12[2];
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = ___xpc_remote_channel_header_handler_block_invoke;
              *(void *)&buf[24] = &unk_1E6CA3BE8;
              v42 = v12;
              uint64_t v43 = v31;
              uint64_t v44 = v34;
              int v45 = v20;
              nw_connection_receive(v36, v20, v20, buf);
            }
            else
            {
              if (*((_DWORD *)v12 + 10) <= 2u) {
                __xpc_remote_channel_arm_read_block_invoke_cold_2(&v38, buf);
              }
              v37 = _log_0();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
                __xpc_remote_channel_arm_read_block_invoke_cold_3();
              }
            }
          }
          else
          {
            _xpc_remote_channel_deliver_message(v12, v31, v32 | (v33 << 16), 0);
          }
          goto LABEL_19;
        }
        dispatch_data_t v21 = _log_0();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __xpc_remote_channel_arm_read_block_invoke_cold_1();
        }

        uint64_t v22 = v12;
        unsigned int v23 = 40;
LABEL_18:
        xpc_remote_channel_cancel(v22, v23);
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v24 = _log_0();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v26 = *((unsigned __int8 *)buffer_ptr + 4);
        int v27 = *((unsigned __int8 *)v12 + 73);
        *(_DWORD *)buf = 134218496;
        *(void *)&buf[4] = v12;
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = v26;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v27;
        uint64_t v28 = "[%p] Invalid wire version: %d != %d";
        __int16 v29 = v24;
        uint32_t v30 = 24;
LABEL_34:
        _os_log_error_impl(&dword_1DC811000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
      }
    }
    else
    {
      uint64_t v24 = _log_0();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&buf[4] = v12;
        *(_WORD *)&unsigned char buf[12] = 1040;
        *(_DWORD *)&buf[14] = size_ptr;
        *(_WORD *)&buf[18] = 2096;
        *(void *)&buf[20] = buffer_ptr;
        uint64_t v28 = "[%p] Invalid header received: %.*P";
        __int16 v29 = v24;
        uint32_t v30 = 28;
        goto LABEL_34;
      }
    }

    uint64_t v22 = v12;
    unsigned int v23 = 22;
    goto LABEL_18;
  }
  v15 = _log_0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = v12;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v14;
    _os_log_impl(&dword_1DC811000, v15, OS_LOG_TYPE_INFO, "[%p] Header read returned with error=%@, disconnecting", buf, 0x16u);
  }

  unsigned int error_code = nw_error_get_error_code(v14);
  uint64_t v17 = v12;
LABEL_5:
  xpc_remote_channel_cancel(v17, error_code);
LABEL_20:
}

id _log()
{
  if (_log_onceToken != -1) {
    dispatch_once(&_log_onceToken, &__block_literal_global_207);
  }
  v0 = (void *)_log_logger;
  return v0;
}

id _log_0()
{
  if (_log_onceToken_0 != -1) {
    dispatch_once(&_log_onceToken_0, &__block_literal_global_0);
  }
  v0 = (void *)_log_logger_0;
  return v0;
}

void ___xpc_remote_connection_connect_complete_block_invoke_2(uint64_t a1, objc_class *a2, uint64_t a3, void *a4)
{
}

void xpc_remote_connection_send_reply(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  xpc_dictionary_get_remote_connection(v3);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  if (!v1) {
    xpc_remote_connection_send_reply_cold_1(&v4, v5);
  }
  v2 = v1;

  xpc_remote_connection_send_message(v2, v3);
}

void ___xpc_remote_connection_handle_read_block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] <= 5) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  v2 = objc_msgSend(*(id *)(a1 + 32), "internal_queue");
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___xpc_remote_connection_handle_read_block_invoke_3;
  v3[3] = &unk_1E6CA3970;
  id v4 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  dispatch_async(v2, v3);
}

void xpc_remote_connection_send_message(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (MEMORY[0x1E01A4B40]() != MEMORY[0x1E4F14590]) {
    xpc_remote_connection_send_message_cold_1();
  }
  id v5 = objc_msgSend(v3, "internal_queue");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __xpc_remote_connection_send_message_block_invoke;
  v8[3] = &unk_1E6CA3640;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, v8);
}

void __xpc_remote_connection_send_message_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) type] == 2) {
    __xpc_remote_connection_send_message_block_invoke_cold_1(&v8, buf);
  }
  if ([*(id *)(a1 + 32) state] <= 5)
  {
    uint64_t reply_msg_id = _xpc_dictionary_get_reply_msg_id();
    if (!reply_msg_id || [*(id *)(a1 + 32) state] == 4)
    {
      id v3 = _xpc_remote_message_create(*(void **)(a1 + 32), *(void **)(a1 + 40));
      id v4 = _log();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
      if (reply_msg_id)
      {
        if (v5)
        {
          uint64_t v6 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v6;
          _os_log_impl(&dword_1DC811000, v4, OS_LOG_TYPE_INFO, "[%p] Sending outgoing reply", buf, 0xCu);
        }

        _xpc_remote_connection_send_reply_message(*(void **)(a1 + 32), v3);
      }
      else
      {
        if (v5)
        {
          uint64_t v7 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v7;
          _os_log_impl(&dword_1DC811000, v4, OS_LOG_TYPE_INFO, "[%p] Enqueueing outgoing message", buf, 0xCu);
        }

        _xpc_remote_connection_enqueue_message(*(void **)(a1 + 32), v3);
      }
    }
  }
}

void *_xpc_remote_message_create(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = objc_opt_new();
  uint64_t reply_msg_id = _xpc_dictionary_extract_reply_msg_id();
  v5[1] = reply_msg_id;
  if (reply_msg_id)
  {
    uint64_t v7 = xpc_dictionary_get_remote_connection(v4);

    if (v7 != v3) {
      _xpc_remote_message_create_cold_2();
    }
  }
  else
  {
    v5[1] = v3[18];
    v3[18] += 2;
  }
  size_t v19 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = ___xpc_remote_message_create_block_invoke;
  v16[3] = &unk_1E6CA3AD8;
  uint64_t v8 = v5;
  id v17 = v8;
  id v9 = v3;
  id v18 = v9;
  uint64_t v10 = (const void *)MEMORY[0x1E01A4B70](v4, &v19, v16);
  if (!v10 || !v19) {
    _xpc_remote_message_create_cold_1();
  }
  dispatch_data_t v11 = dispatch_data_create(v10, v19, 0, (dispatch_block_t)*MEMORY[0x1E4F143F0]);
  int v12 = (void *)v8[3];
  v8[3] = v11;

  uint64_t v13 = v18;
  uint64_t v14 = v8;

  return v14;
}

void _xpc_remote_connection_send_reply_message(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (!v4[1] || (v4[1] & 1) != v3[65])
  {
    uint64_t v12 = 0;
    memset(v17, 0, sizeof(v17));
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    uint64_t v9 = v4[1];
    int v13 = 134218240;
    uint64_t v14 = v3;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_6:
    _xpc_remote_connection_send_reply_message_cold_1(&v13, v17);
  }
  if ([v3 state] != 4) {
    goto LABEL_6;
  }
  uint64_t v5 = v4[1];
  _xpc_remote_connection_send_ool_message_content(v3, v4);
  uint64_t v6 = (void *)*((void *)v3 + 7);
  uint64_t v7 = (void *)v4[3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = ___xpc_remote_connection_send_reply_message_block_invoke;
  v10[3] = &unk_1E6CA38D0;
  id v11 = v3;
  uint64_t v8 = v3;
  xpc_remote_channel_send(v6, v5, 131073, v7, v10);
}

void xpc_remote_channel_send(void *a1, uint64_t a2, int a3, void *a4, void *a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a1;
  uint64_t v10 = a4;
  id v11 = a5;
  dispatch_assert_queue_V2(v9[1]);
  if (v11 && *((_DWORD *)v9 + 10) >= 3u) {
    v11[2](v11, 89);
  }
  if (!v10)
  {
    uint64_t v10 = MEMORY[0x1E4F14410];
    id v12 = MEMORY[0x1E4F14410];
  }
  LODWORD(buffer) = 699403154;
  BYTE4(buffer) = *((unsigned char *)v9 + 73);
  BYTE5(buffer) = a3;
  WORD3(buffer) = HIWORD(a3);
  *((void *)&buffer + 1) = dispatch_data_get_size(v10);
  uint64_t v28 = a2;
  int v13 = dispatch_data_create(&buffer, 0x18uLL, 0, 0);
  concat = dispatch_data_create_concat(v13, v10);
  __int16 v15 = _log_0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = v28;
    size_t size = dispatch_data_get_size(v10);
    *(_DWORD *)buf = 134218496;
    uint32_t v30 = v9;
    __int16 v31 = 2048;
    uint64_t v32 = v16;
    __int16 v33 = 2048;
    size_t v34 = size;
    _os_log_impl(&dword_1DC811000, v15, OS_LOG_TYPE_INFO, "[%p] Starting write of msg_id %llu (%zd bytes).", buf, 0x20u);
  }

  uint64_t v18 = v9[2];
  size_t v19 = *MEMORY[0x1E4F38C58];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __xpc_remote_channel_send_block_invoke;
  v22[3] = &unk_1E6CA3B98;
  long long v25 = buffer;
  uint64_t v26 = v28;
  unsigned int v23 = v9;
  uint64_t v24 = v11;
  unint64_t v20 = v11;
  dispatch_data_t v21 = v9;
  nw_connection_send(v18, concat, v19, 1, v22);
}

void _xpc_remote_connection_send_ool_message_content(void *a1, void *a2)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v36 = a1;
  uint64_t v32 = a2;
  if (v32[8] >= 1)
  {
    uint64_t v3 = 0;
    __int16 v33 = v32 + 10;
    do
    {
      id v4 = *(id *)&v33[2 * v3];
      if (MEMORY[0x1E01A4B40]() != MEMORY[0x1E4F145B8]) {
        _xpc_remote_connection_send_ool_message_content_cold_2();
      }
      id v5 = v36;
      id v6 = v4;
      uint64_t transfer_id = xpc_file_transfer_get_transfer_id();
      uint64_t v8 = (void *)xpc_file_transfer_copy_io();
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = ___send_file_transfer_block_invoke;
      v37[3] = &unk_1E6CA39E8;
      id v34 = v6;
      id v38 = v34;
      id v39 = v5;
      uint64_t v9 = v39;
      id v10 = v8;
      uint64_t v35 = v37;
      id v11 = objc_msgSend(v9, "internal_queue");
      dispatch_assert_queue_V2(v11);

      if ([v9 state] != 4) {
        _xpc_remote_connection_send_ool_message_content_cold_1(&v53, buf);
      }
      id v12 = _log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = transfer_id;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v66) = 1;
        _os_log_impl(&dword_1DC811000, v12, OS_LOG_TYPE_DEFAULT, "[%p] Opening stream_id %lld with direction %x", buf, 0x1Cu);
      }

      int v13 = _xpc_remote_connection_create_sub_nw_connection(v9);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v66 = __Block_byref_object_copy__247;
      dispatch_data_t v67 = __Block_byref_object_dispose__248;
      id v68 = 0;
      id v68 = (id)MEMORY[0x1E01A4790](v35);
      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x3032000000;
      id v56 = __Block_byref_object_copy_;
      v57 = __Block_byref_object_dispose_;
      id v58 = 0;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = ___xpc_remote_connection_open_stream_block_invoke;
      v47[3] = &unk_1E6CA3A10;
      v49 = &v53;
      uint64_t v51 = transfer_id;
      int v52 = 1;
      uint64_t v14 = v9;
      id v48 = v14;
      v50 = buf;
      __int16 v15 = (void *)MEMORY[0x1E01A4790](v47);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = ___xpc_remote_connection_open_stream_block_invoke_249;
      v40[3] = &unk_1E6CA3A38;
      uint64_t v16 = v14;
      uint64_t v45 = transfer_id;
      id v41 = v16;
      uint64_t v43 = &v53;
      int v46 = 1;
      id v17 = v10;
      id v42 = v17;
      uint64_t v44 = buf;
      uint64_t v18 = (void *)MEMORY[0x1E01A4790](v40);
      size_t v19 = objc_msgSend(v16, "internal_queue");
      uint64_t v20 = xpc_remote_channel_create(v13, v19, *((unsigned char *)v36 + 66), 0, v15, v18);
      dispatch_data_t v21 = (void *)v54[5];
      v54[5] = v20;

      uint64_t v22 = (id *)objc_opt_new();
      objc_storeStrong(v22 + 1, (id)v54[5]);
      unsigned int v23 = v16;
      uint64_t v24 = v22;
      long long v25 = v24;
      if (*((void *)v36 + 14))
      {
        uint64_t v26 = (id *)*((id *)v36 + 15);
        objc_storeStrong(v26 + 2, v22);
      }
      else
      {
        int v27 = v24;
        uint64_t v26 = (id *)*((void *)v36 + 14);
        *((void *)v36 + 14) = v27;
      }

      uint64_t v28 = (void *)*((void *)v36 + 15);
      *((void *)v36 + 15) = v25;

      __int16 v29 = _log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = v54[5];
        *(_DWORD *)v59 = 134218496;
        id v60 = v36;
        __int16 v61 = 2048;
        uint64_t v62 = transfer_id;
        __int16 v63 = 2048;
        uint64_t v64 = v30;
        _os_log_impl(&dword_1DC811000, v29, OS_LOG_TYPE_DEFAULT, "[%p] Opened stream %lld (%p)", v59, 0x20u);
      }

      _Block_object_dispose(&v53, 8);
      _Block_object_dispose(buf, 8);

      __int16 v31 = *(void **)&v33[2 * v3];
      *(void *)&v33[2 * v3] = 0;

      ++v3;
    }
    while (v3 < v32[8]);
  }
}

void sub_1DC814DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 208), 8);
  _Unwind_Resume(a1);
}

void _xpc_remote_message_create_cold_1()
{
}

unint64_t xpc_remote_connection_get_version_flags()
{
  return ((unint64_t)XPC_REMOTE_CONNECTION_PROTOCOL_VERSION_CURRENT << 56) | 6;
}

uint64_t xpc_remote_connection_get_failsafe_version_flags()
{
  return 0x100000000000000;
}

uint64_t xpc_remote_connection_get_remote_service_version(void *a1)
{
  id v1 = a1;
  if (!v1) {
    xpc_remote_connection_get_remote_service_version_cold_1();
  }
  v2 = v1;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v3 = objc_msgSend(v1, "internal_queue");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __xpc_remote_connection_get_remote_service_version_block_invoke;
  v7[3] = &unk_1E6CA3558;
  id v8 = v2;
  uint64_t v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1DC8150A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __xpc_remote_connection_get_remote_service_version_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 168);
  return result;
}

void xpc_remote_connection_set_local_service_version(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3) {
    xpc_remote_connection_get_remote_service_version_cold_1();
  }
  id v4 = v3;
  uint64_t v5 = objc_msgSend(v3, "internal_queue");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __xpc_remote_connection_set_local_service_version_block_invoke;
  v7[3] = &unk_1E6CA3580;
  id v8 = v4;
  uint64_t v9 = a2;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __xpc_remote_connection_set_local_service_version_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result) {
    __xpc_remote_connection_set_local_service_version_block_invoke_cold_1();
  }
  *(void *)(*(void *)(a1 + 32) + 160) = *(void *)(a1 + 40);
  return result;
}

uint64_t xpc_remote_connection_create_with_remote_service(void *a1, void *a2, char a3)
{
  id v6 = a1;
  id v7 = a2;
  if (!v6) {
    xpc_remote_connection_create_with_remote_service_cold_1();
  }
  id v8 = v7;
  uint64_t v9 = _xpc_remote_connection_alloc();
  [(id)v9 setType:1];
  objc_msgSend((id)v9, "setTarget_queue:", v8);
  objc_storeStrong((id *)(v9 + 184), a1);
  *(void *)(v9 + 168) = remote_service_get_version();
  unint64_t xpc_remote_connection_version_flags = remote_service_get_xpc_remote_connection_version_flags();
  if (!xpc_remote_connection_version_flags) {
    goto LABEL_8;
  }
  unint64_t v11 = xpc_remote_connection_version_flags;
  if (!HIBYTE(xpc_remote_connection_version_flags) || (xpc_remote_connection_version_flags & 1) != 0)
  {
    uint64_t v12 = _log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      xpc_remote_connection_create_with_remote_service_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
    }

LABEL_8:
    unint64_t v11 = 0x100000000000000;
  }
  if (remote_service_xpc_remote_connection_tls_enabled())
  {
    uint64_t v20 = remote_service_copy_xpc_remote_connection_tls_identity();
    if (!v20) {
      xpc_remote_connection_create_with_remote_service_cold_2();
    }
    dispatch_data_t v21 = (void *)v20;
    uint64_t v22 = remote_service_copy_xpc_remote_connection_tls_verify_block();
    unsigned int v23 = objc_msgSend((id)v9, "internal_queue");
    xpc_remote_connection_set_tls((void *)v9, v21, v22, v23);
  }
  uint64_t v24 = (void *)remote_service_copy_device();
  char xpc_remote_connection_mode_flags = remote_device_get_xpc_remote_connection_mode_flags();
  _xpc_remote_connection_parse_flags((void *)v9, v11, xpc_remote_connection_mode_flags | a3);

  return v9;
}

uint64_t _xpc_remote_connection_alloc()
{
  if (install_libxpc_hooks_onceToken != -1) {
    dispatch_once(&install_libxpc_hooks_onceToken, &__block_literal_global_204);
  }
  uint64_t v0 = objc_opt_new();
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.xpc.remote.internal", v1);
  objc_msgSend((id)v0, "setInternal_queue:", v2);

  *(_DWORD *)(v0 + 192) = -1;
  *(void *)(v0 + 144) = 1;
  return v0;
}

void xpc_remote_connection_set_tls(void *a1, void *a2, void *a3, void *a4)
{
  unint64_t v11 = a1;
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v11 state]) {
    xpc_remote_connection_set_tls_cold_3();
  }
  if (![v11 type] && v11[25]) {
    xpc_remote_connection_set_tls_cold_2();
  }
  if (!v7) {
    xpc_remote_connection_set_tls_cold_1();
  }
  objc_msgSend(v11, "setTls_identity:", v7);
  uint64_t v10 = (void *)[v8 copy];
  objc_msgSend(v11, "setTls_verify:", v10);

  objc_msgSend(v11, "setTls_verify_queue:", v9);
}

void _xpc_remote_connection_parse_flags(void *a1, unint64_t a2, char a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  _xpc_remote_connection_parse_mode_flags(v5, a3);
  id v6 = v5;
  unint64_t v7 = HIBYTE(a2);
  if (!HIBYTE(a2) || (a2 & 1) != 0) {
    _xpc_remote_connection_parse_flags_cold_1(&v9, v10);
  }
  if (XPC_REMOTE_CONNECTION_PROTOCOL_VERSION_CURRENT < v7) {
    LOBYTE(v7) = XPC_REMOTE_CONNECTION_PROTOCOL_VERSION_CURRENT;
  }
  v6[66] = v7;
  *((void *)v6 + 9) = a2 & 6;
  id v8 = v6;
}

_DWORD *xpc_remote_connection_create_with_connected_fd(int a1, void *a2, unint64_t a3, char a4)
{
  id v7 = a2;
  id v8 = (_DWORD *)_xpc_remote_connection_alloc();
  [v8 setType:0];
  objc_msgSend(v8, "setTarget_queue:", v7);

  v8[48] = a1;
  _xpc_remote_connection_parse_flags(v8, a3, a4);
  return v8;
}

void *xpc_remote_connection_create_with_nw_connection(void *a1, void *a2, unint64_t a3, char a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = (void *)_xpc_remote_connection_alloc();
  [v9 setType:0];
  objc_msgSend(v9, "setTarget_queue:", v8);

  uint64_t v10 = (void *)v9[25];
  v9[25] = v7;

  _xpc_remote_connection_parse_flags(v9, a3, a4);
  return v9;
}

void *xpc_remote_connection_create_remote_service_listener(const char *a1, void *a2, char a3)
{
  id v5 = a2;
  if (!a1) {
    xpc_remote_connection_create_remote_service_listener_cold_1();
  }
  id v6 = v5;
  id v7 = (void *)_xpc_remote_connection_alloc();
  [v7 setType:2];
  v7[1] = strdup(a1);
  objc_msgSend(v7, "setTarget_queue:", v6);
  _xpc_remote_connection_parse_mode_flags(v7, a3 | 1);

  return v7;
}

void _xpc_remote_connection_parse_mode_flags(void *a1, char a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2)
  {
    v3[65] = 1;
    *((void *)v3 + 18) = 2;
    id v5 = _log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_connection_parse_mode_flags_cold_1();
    }
  }
  if ((a2 & 2) != 0) {
    v4[208] = 1;
  }
  v4[64] = (a2 & 4) != 0;
}

void xpc_remote_connection_create_connected_pair(void *a1, void *a2, void *a3, unint64_t a4, char a5)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10[0] = 0;
  if (!socketpair(1, 1, 0, (int *)v10))
  {
    *a1 = xpc_remote_connection_create_with_connected_fd(v10[0], v9, a4, a5);
    *a2 = xpc_remote_connection_create_with_connected_fd(SHIDWORD(v10[0]), v9, a4, a5 | 1u);
  }
}

uint64_t xpc_remote_connection_create_asymmetric_connected_ipv6_pair(void *a1, unint64_t a2, char a3, void *a4, unint64_t a5, char a6, void *a7)
{
  id v13 = a7;
  uint64_t v14 = _log();
  uint64_t connected_ipv6_pair = remote_socket_create_connected_ipv6_pair();

  if (!connected_ipv6_pair)
  {
    *a1 = xpc_remote_connection_create_with_connected_fd(0, v13, a2, a3);
    *a4 = xpc_remote_connection_create_with_connected_fd(0, v13, a5, a6 | 1u);
  }

  return connected_ipv6_pair;
}

uint64_t xpc_remote_connection_create_connected_ipv6_pair(void *a1, void *a2, void *a3, unint64_t a4, char a5)
{
  return xpc_remote_connection_create_asymmetric_connected_ipv6_pair(a1, a4, a5, a2, a4, a5, a3);
}

uint64_t xpc_remote_connection_copy_remote_address_string(void *a1)
{
  id v1 = a1;
  if (!v1) {
    xpc_remote_connection_get_remote_service_version_cold_1();
  }
  dispatch_queue_t v2 = v1;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v3 = objc_msgSend(v1, "internal_queue");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __xpc_remote_connection_copy_remote_address_string_block_invoke;
  v7[3] = &unk_1E6CA35A8;
  id v8 = v2;
  id v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1DC815A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __xpc_remote_connection_copy_remote_address_string_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    dispatch_queue_t v2 = nw_connection_copy_connected_remote_endpoint();
    if (v2)
    {
      id v3 = v2;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = nw_endpoint_copy_address_string(v2);
      dispatch_queue_t v2 = v3;
    }
  }
}

id xpc_remote_connection_copy_remote_endpoint(void *a1)
{
  id v1 = a1;
  if (!v1) {
    xpc_remote_connection_get_remote_service_version_cold_1();
  }
  dispatch_queue_t v2 = v1;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v3 = objc_msgSend(v1, "internal_queue");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __xpc_remote_connection_copy_remote_endpoint_block_invoke;
  v7[3] = &unk_1E6CA35A8;
  id v8 = v2;
  id v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_1DC815BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __xpc_remote_connection_copy_remote_endpoint_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = nw_connection_copy_connected_remote_endpoint();
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

void xpc_remote_connection_set_event_handler(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  if ([v4 state]) {
    xpc_remote_connection_set_tls_cold_3();
  }
  objc_msgSend(v4, "setEvent_handler:", v3);
}

void xpc_remote_connection_set_target_queue(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  if ([v4 state]) {
    xpc_remote_connection_set_tls_cold_3();
  }
  objc_msgSend(v4, "setTarget_queue:", v3);
}

void xpc_remote_connection_set_traffic_class(void *a1, int a2)
{
  id v3 = a1;
  if ([v3 state]) {
    xpc_remote_connection_set_tls_cold_3();
  }
  v3[44] = a2;
}

uint64_t xpc_remote_connection_is_server(void *a1)
{
  id v1 = a1;
  if (!v1) {
    xpc_remote_connection_get_remote_service_version_cold_1();
  }
  uint64_t v2 = v1[65];

  return v2;
}

uint64_t xpc_remote_connection_create_configure_tls_block(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __xpc_remote_connection_create_configure_tls_block_block_invoke;
  v13[3] = &unk_1E6CA35D0;
  id v15 = v7;
  id v16 = v6;
  id v14 = v5;
  id v8 = v7;
  id v9 = v6;
  id v10 = v5;
  uint64_t v11 = [v13 copy];

  return v11;
}

void __xpc_remote_connection_create_configure_tls_block_block_invoke(uint64_t a1, id a2)
{
  options = a2;
  sec_protocol_options_set_local_identity(options, *(sec_identity_t *)(a1 + 32));
  sec_protocol_options_set_min_tls_protocol_version(options, tls_protocol_version_TLSv12);
  sec_protocol_options_set_max_tls_protocol_version(options, tls_protocol_version_TLSv12);
  sec_protocol_options_append_tls_ciphersuite_group(options, tls_ciphersuite_group_default);
  sec_protocol_options_set_peer_authentication_required(options, 1);
  id v3 = *(void **)(a1 + 48);
  if (v3)
  {
    id v4 = *(NSObject **)(a1 + 40);
    if (v4) {
      sec_protocol_options_set_verify_block(options, v3, v4);
    }
  }
}

void xpc_remote_connection_setup_nw_parameters(void *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  nw_protocol_http2_transport_identifier();
  id v2 = (id)nw_parameters_create_protocol_parameters();
  if (!v2) {
    xpc_remote_connection_setup_nw_parameters_cold_1(&v5, buf);
  }
  id v3 = v2;

  if (xpc_remote_connection_setup_nw_parameters_pred != -1) {
    dispatch_once(&xpc_remote_connection_setup_nw_parameters_pred, &__block_literal_global);
  }
  if (xpc_remote_connection_setup_nw_parameters_window_size != 0x100000)
  {
    id v4 = _log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = xpc_remote_connection_setup_nw_parameters_window_size;
      _os_log_impl(&dword_1DC811000, v4, OS_LOG_TYPE_DEFAULT, "Using non-default XPC_REMOTE_CONNECTION_H2_WINDOW_SIZE=%d", buf, 8u);
    }
  }
  nw_protocol_http2_transport_parameters_set_stream_receive_window_size();
  nw_protocol_http2_transport_parameters_set_connection_receive_window_size();
  nw_parameters_set_data_mode();
  nw_parameters_set_server_mode();
  nw_parameters_add_protocol_stack_member();
}

const char *__xpc_remote_connection_setup_nw_parameters_block_invoke()
{
  uint64_t result = getenv("XPC_REMOTE_CONNECTION_H2_WINDOW_SIZE");
  if (result)
  {
    uint64_t result = (const char *)strtoul(result, 0, 0);
    if (result) {
      xpc_remote_connection_setup_nw_parameters_window_size_t size = (int)result;
    }
  }
  return result;
}

void xpc_remote_connection_activate(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, "internal_queue");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __xpc_remote_connection_activate_block_invoke;
  block[3] = &unk_1E6CA3618;
  id v5 = v1;
  id v3 = v1;
  dispatch_sync(v2, block);
}

void __xpc_remote_connection_activate_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) state])
  {
    id v2 = objc_msgSend(*(id *)(a1 + 32), "event_handler");

    if (!v2) {
      __xpc_remote_connection_activate_block_invoke_cold_1();
    }
    id v3 = objc_msgSend(*(id *)(a1 + 32), "target_queue");

    if (!v3)
    {
      id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v5 = dispatch_queue_create("com.apple.xpc.remote.target", v4);
      objc_msgSend(*(id *)(a1 + 32), "setTarget_queue:", v5);
    }
    int v6 = [*(id *)(a1 + 32) type];
    uint64_t v7 = *(void **)(a1 + 32);
    if (v6 == 2)
    {
      id v8 = v7;
      id v9 = objc_msgSend(v8, "internal_queue");
      dispatch_assert_queue_V2(v9);

      if ([v8 type] != 2) {
        __xpc_remote_connection_activate_block_invoke_cold_3(&v15, &v16);
      }
      if ([v8 state]) {
        __xpc_remote_connection_activate_block_invoke_cold_2(&v15, &v16);
      }
      [v8 setState:4];
      uint64_t v10 = v8[1];
      uint64_t v11 = objc_msgSend(v8, "internal_queue");
      *(void *)&long long v16 = MEMORY[0x1E4F143A8];
      *((void *)&v16 + 1) = 3221225472;
      uint64_t v17 = ___xpc_remote_connection_listen_block_invoke;
      uint64_t v18 = &unk_1E6CA3730;
      id v19 = v8;
      uint64_t v12 = v8;
      uint64_t v13 = xpc_remote_listener_create_for_remote_service(v10, v11, &v16, &__block_literal_global_215);
      [v12 setListener:v13];
    }
    else
    {
      [v7 setState:1];
      if (![*(id *)(a1 + 32) type])
      {
        id v14 = *(void **)(a1 + 32);
        _xpc_remote_connection_connect(v14);
      }
    }
  }
}

void _xpc_remote_connection_connect(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_msgSend(v1, "internal_queue");
  dispatch_assert_queue_V2(v2);

  if ([v1 state] != 1) {
    _xpc_remote_connection_connect_cold_1(&v7, buf);
  }
  [v1 setState:2];
  id v3 = _log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v1;
    _os_log_impl(&dword_1DC811000, v3, OS_LOG_TYPE_INFO, "[%p] Connecting", buf, 0xCu);
  }

  v1[19] = v1[18];
  int v4 = [v1 type];
  switch(v4)
  {
    case 0:
      goto LABEL_8;
    case 1:
      dispatch_queue_t v5 = objc_msgSend(v1, "internal_queue");
      int v6 = v1;
      remote_service_connect_socket();

      break;
    case 2:
      __break(1u);
LABEL_8:
      _xpc_remote_connection_connect_complete(v1, -1);
      break;
  }
}

void xpc_remote_connection_cancel(void *a1)
{
  id v1 = a1;
  id v2 = objc_msgSend(v1, "internal_queue");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __xpc_remote_connection_cancel_block_invoke;
  block[3] = &unk_1E6CA3618;
  id v5 = v1;
  id v3 = v1;
  dispatch_sync(v2, block);
}

void __xpc_remote_connection_cancel_block_invoke(uint64_t a1)
{
}

void _xpc_remote_connection_cancel(void *a1)
{
  id v2 = a1;
  id v1 = objc_msgSend(v2, "internal_queue");
  dispatch_assert_queue_V2(v1);

  __xpc_remote_connection_teardown(v2, 0, 89);
}

void _xpc_remote_connection_enqueue_message(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_msgSend(v3, "internal_queue");
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = v3[10];
  uint64_t v12 = v3;
  id v7 = v4;
  id v8 = v7;
  if (v3[10])
  {
    uint64_t v9 = (id *)v12[11];
    objc_storeStrong(v9 + 21, a2);
  }
  else
  {
    id v10 = v7;
    uint64_t v9 = (id *)v3[10];
    v3[10] = v10;
  }

  id v11 = v12[11];
  v12[11] = v8;

  if (!v6) {
    _xpc_remote_connection_wakeup(v12);
  }
}

void xpc_remote_connection_send_barrier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_msgSend(v3, "internal_queue");
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __xpc_remote_connection_send_barrier_block_invoke;
  v8[3] = &unk_1E6CA3668;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, v8);
}

void __xpc_remote_connection_send_barrier_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) type] == 2) {
    __xpc_remote_connection_send_message_block_invoke_cold_1(&v8, buf);
  }
  if ([*(id *)(a1 + 32) state] < 6)
  {
    id v2 = objc_opt_new();
    uint64_t v3 = MEMORY[0x1E01A4790](*(void *)(a1 + 40));
    id v4 = (void *)v2[2];
    v2[2] = v3;

    id v5 = _log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_1DC811000, v5, OS_LOG_TYPE_INFO, "[%p] Enqueueing barrier", buf, 0xCu);
    }

    _xpc_remote_connection_enqueue_message(*(void **)(a1 + 32), v2);
  }
  else
  {
    id v7 = objc_msgSend(*(id *)(a1 + 32), "target_queue");
    dispatch_async(v7, *(dispatch_block_t *)(a1 + 40));
  }
}

void xpc_remote_connection_send_message_with_reply(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (MEMORY[0x1E01A4B40](v8) != MEMORY[0x1E4F14590]) {
    xpc_remote_connection_send_message_cold_1();
  }
  id v11 = objc_msgSend(v7, "internal_queue");
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __xpc_remote_connection_send_message_with_reply_block_invoke;
  v16[3] = &unk_1E6CA36B8;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_sync(v11, v16);
}

void __xpc_remote_connection_send_message_with_reply_block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([a1[4] type] == 2) {
    __xpc_remote_connection_send_message_block_invoke_cold_1(&v20, buf);
  }
  if (_xpc_dictionary_get_reply_msg_id()) {
    __xpc_remote_connection_send_message_with_reply_block_invoke_cold_2(&v20, buf);
  }
  id v2 = a1[6];
  if (!v2)
  {
    id v2 = dispatch_get_global_queue(0, 0);
  }
  if ([a1[4] state] < 6)
  {
    uint64_t v3 = _xpc_remote_message_create(a1[4], a1[5]);
    *(unsigned char *)(v3 + 176) = 1;
    id v4 = _log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = a1[4];
      uint64_t v6 = *(void *)(v3 + 8);
      *(_DWORD *)buf = 134218240;
      id v22 = v5;
      __int16 v23 = 2048;
      uint64_t v24 = v6;
      _os_log_impl(&dword_1DC811000, v4, OS_LOG_TYPE_INFO, "[%p] Enqueueing send of %llx", buf, 0x16u);
    }

    _xpc_remote_connection_enqueue_message(a1[4], (void *)v3);
    uint64_t v7 = objc_opt_new();
    *(void *)(v7 + 8) = *(void *)(v3 + 8);
    objc_storeStrong((id *)(v7 + 24), v2);
    uint64_t v8 = MEMORY[0x1E01A4790](a1[7]);
    id v9 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v8;

    id v10 = (void **)a1[4];
    id v11 = (id)v7;
    id v12 = v11;
    id v13 = v10 + 16;
    if (v10[16]) {
      id v13 = (void **)((char *)v10[17] + 32);
    }
    id v14 = *v13;
    *id v13 = v11;
    id v15 = v10;
    id v16 = v12;

    id v17 = v15[17];
    v15[17] = v16;
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __xpc_remote_connection_send_message_with_reply_block_invoke_60;
    v18[3] = &unk_1E6CA3690;
    id v19 = a1[7];
    dispatch_async(v2, v18);
    uint64_t v3 = (uint64_t)v19;
  }
}

uint64_t __xpc_remote_connection_send_message_with_reply_block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id xpc_remote_connection_send_message_with_reply_sync(void *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_msgSend(v3, "internal_queue");
  dispatch_assert_queue_not_V2(v5);

  uint64_t v6 = _log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    xpc_remote_connection_send_message_with_reply_sync_cold_4();
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v20 = 0;
  dispatch_data_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0;
  uint64_t v8 = objc_msgSend(v3, "internal_queue");
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __xpc_remote_connection_send_message_with_reply_sync_block_invoke;
  v16[3] = &unk_1E6CA36E0;
  id v19 = &v20;
  id v9 = v3;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  xpc_remote_connection_send_message_with_reply(v9, v4, v8, v16);

  id v11 = _log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    xpc_remote_connection_send_message_with_reply_sync_cold_3();
  }

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (!v21[5])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    int v26 = 134217984;
    uint64_t v27 = 0;
    _os_log_send_and_compose_impl();
    uint64_t v15 = _os_crash_msg();
    xpc_remote_connection_send_message_with_reply_sync_cold_1(v15);
  }
  id v12 = _log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    xpc_remote_connection_send_message_with_reply_sync_cold_2();
  }

  id v13 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v13;
}

void sub_1DC817018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __xpc_remote_connection_send_message_with_reply_sync_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v5 = _log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __xpc_remote_connection_send_message_with_reply_sync_block_invoke_cold_1();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t _xpc_remote_connection_desc(void *a1, char *a2, size_t a3)
{
  if (a3 < 2) {
    return 1;
  }
  id v5 = a1;
  uint64_t v6 = type2str[[v5 type]];
  dispatch_semaphore_t v7 = state2str[[v5 state]];
  remote_service_name = _xpc_remote_connection_get_remote_service_name(v5);
  LODWORD(a2) = snprintf(a2, a3, "<%s: %p> { type = %s, state = %s, remote service name = %s, server mode = %d, protocol version number = %u, protocol feature flags = 0x%llx, local service version = %llu, remote service version = %llu, traffic class = %u }", "remote connection", v5, v6, v7, remote_service_name, v5[65], v5[66], *((void *)v5 + 9), *((void *)v5 + 20), *((void *)v5 + 21), *((_DWORD *)v5 + 44));

  size_t v9 = (int)a2;
  if ((int)a2 >= a3) {
    size_t v9 = a3 - 1;
  }
  return v9 + 1;
}

uint64_t _xpc_remote_connection_debug_desc(void *a1, char *a2, size_t a3)
{
  if (a3 < 2) {
    return 1;
  }
  id v4 = a1;
  id v10 = type2str[[v4 type]];
  size_t v9 = state2str[[v4 state]];
  remote_service_name = _xpc_remote_connection_get_remote_service_name(v4);
  int v6 = snprintf(a2, a3, "<%s: %p> { type = %s, state = %s, remote service name = %s, server mode = %d, protocol version number = %u, protocol feature flags = 0x%llx, local service version = %llu, remote service version = %llu, traffic class = %u, (root, reply) helo received = (%d, %d), next msg id = %llu, first msg id = %llu, send in progress = %d, preexisting socket = %d", "remote connection", v4, v10, v9, remote_service_name, v4[65], v4[66], *((void *)v4 + 9), *((void *)v4 + 20), *((void *)v4 + 21), *((_DWORD *)v4 + 44), v4[32], v4[48],
         *((void *)v4 + 18),
         *((void *)v4 + 19),
         objc_msgSend(v4, "send_in_progress"),
         *((_DWORD *)v4 + 48));

  size_t v7 = v6;
  if (v6 >= a3) {
    size_t v7 = a3 - 1;
  }
  return v7 + 1;
}

uint64_t __install_libxpc_hooks_block_invoke()
{
  xpc_extension_type_init();
  qword_1EB5AC238 = objc_opt_class();
  return MEMORY[0x1F40CF178](&hooks);
}

void xpc_remote_connection_message_dispose(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(v3, "internal_queue");
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __xpc_remote_connection_message_dispose_block_invoke;
  v6[3] = &unk_1E6CA3580;
  id v7 = v3;
  uint64_t v8 = a2;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __xpc_remote_connection_message_dispose_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) type] == 2) {
    __xpc_remote_connection_send_message_block_invoke_cold_1(&v9, buf);
  }
  if ([*(id *)(a1 + 32) state] == 4)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(id *)(a1 + 32);
    if (!v2) {
      __xpc_remote_connection_message_dispose_block_invoke_cold_2(&v9, buf);
    }
    id v4 = v3;
    uint64_t v5 = objc_opt_new();
    *(void *)(v5 + 8) = v2;
    objc_storeStrong((id *)(v5 + 24), MEMORY[0x1E4F14410]);

    int v6 = _log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218240;
      uint64_t v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1DC811000, v6, OS_LOG_TYPE_INFO, "[%p] Sending error reply for msg_id %llu", buf, 0x16u);
    }

    _xpc_remote_connection_send_reply_message(*(void **)(a1 + 32), (void *)v5);
  }
}

uint64_t ___log_block_invoke()
{
  _log_logger = (uint64_t)os_log_create("com.apple.xpc.remote", "connection");
  return MEMORY[0x1F41817F8]();
}

void ___xpc_remote_connection_listen_block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!v5) {
    ___xpc_remote_connection_listen_block_invoke_cold_1(&v36, v37);
  }
  if (a3 == -1) {
    ___xpc_remote_connection_listen_block_invoke_cold_2(&v36, v37);
  }
  int v6 = v5;
  char v7 = remote_device_get_xpc_remote_connection_mode_flags() | 1;
  unint64_t xpc_remote_connection_version_flags = remote_device_get_xpc_remote_connection_version_flags();
  if (!xpc_remote_connection_version_flags) {
    goto LABEL_9;
  }
  unint64_t v9 = xpc_remote_connection_version_flags;
  if (!HIBYTE(xpc_remote_connection_version_flags) || (xpc_remote_connection_version_flags & 1) != 0)
  {
    id v10 = _log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_listen_block_invoke_cold_4(v10, v11, v12, v13, v14, v15, v16, v17);
    }

LABEL_9:
    unint64_t v9 = 0x100000000000000;
  }
  id v18 = objc_msgSend(*(id *)(a1 + 32), "target_queue");
  id v19 = xpc_remote_connection_create_with_connected_fd(a3, v18, v9, v7);

  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void *)(v20 + 160);
  if (v21)
  {
    xpc_remote_connection_set_local_service_version(v19, v21);
    uint64_t v20 = *(void *)(a1 + 32);
  }
  int v22 = *(_DWORD *)(v20 + 176);
  if (v22) {
    xpc_remote_connection_set_traffic_class(v19, v22);
  }
  if (remote_device_xpc_remote_connection_tls_enabled())
  {
    uint64_t v23 = remote_device_copy_xpc_remote_connection_tls_identity();
    if (!v23) {
      ___xpc_remote_connection_listen_block_invoke_cold_3();
    }
    uint64_t v24 = (void *)v23;
    id v25 = remote_device_copy_xpc_remote_connection_tls_verify_block();
    int v26 = objc_msgSend(*(id *)(a1 + 32), "internal_queue");
    xpc_remote_connection_set_tls(v19, v24, v25, v26);
  }
  uint64_t v27 = objc_msgSend(*(id *)(a1 + 32), "event_handler");
  long long v28 = objc_msgSend(*(id *)(a1 + 32), "target_queue");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___xpc_remote_connection_listen_block_invoke_211;
  block[3] = &unk_1E6CA3708;
  id v29 = *(id *)(a1 + 32);
  id v34 = v19;
  id v35 = v27;
  id v33 = v29;
  long long v30 = v19;
  id v31 = v27;
  dispatch_async(v28, block);
}

uint64_t ___xpc_remote_connection_listen_block_invoke_211(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result <= 5)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

void ___xpc_remote_connection_listen_block_invoke_2()
{
}

void _xpc_remote_connection_connect_complete(void *a1, int a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3 + 5;
  if (v3[5]) {
    _xpc_remote_connection_connect_complete_cold_12(&v35, buf);
  }
  id v5 = v3;
  if ([v3 type])
  {
    if (a2 == -1) {
      _xpc_remote_connection_connect_complete_cold_11(&v35, buf);
    }
  }
  else if (a2 != -1)
  {
    _xpc_remote_connection_connect_complete_cold_10(&v35, buf);
  }
  if ([v5 state] == 2)
  {
    if ([v5 type] || (int v9 = *((_DWORD *)v5 + 48), v9 == -1))
    {
      if (a2 == -1)
      {
        id v6 = v5[25];
        if (!v6) {
          _xpc_remote_connection_connect_complete_cold_1();
        }
        objc_storeStrong(v5 + 2, v6);
        id v7 = v5[25];
        v5[25] = 0;

        goto LABEL_26;
      }
    }
    else
    {
      *((_DWORD *)v5 + 48) = -1;
      a2 = v9;
    }
    if (fcntl(a2, 4, 4) == -1) {
      _xpc_remote_connection_connect_complete_cold_4(&v35, buf);
    }
    if (fcntl(a2, 73, 1) == -1)
    {
      if (*__error() != 22) {
        _xpc_remote_connection_connect_complete_cold_5(&v35, buf);
      }
      int v26 = _log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_impl(&dword_1DC811000, v26, OS_LOG_TYPE_DEFAULT, "[%p] fcntl(F_SETNOSIGPIPE) failed with EINVAL", buf, 0xCu);
      }

      _xpc_remote_connection_connect_doa(v5, a2);
    }
    else if (*((_DWORD *)v5 + 44) && (int v41 = *((_DWORD *)v5 + 44), setsockopt(a2, 0xFFFF, 4230, &v41, 4u) == -1))
    {
      if (*__error() != 22) {
        _xpc_remote_connection_connect_complete_cold_6(&v35, buf);
      }
      long long v28 = _log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_impl(&dword_1DC811000, v28, OS_LOG_TYPE_DEFAULT, "[%p] fcntl(SO_TRAFFIC_CLASS) failed with EINVAL", buf, 0xCu);
      }

      _xpc_remote_connection_connect_doa(v5, a2);
    }
    else
    {
      id v10 = _xpc_remote_connection_create_nw_parameters(v5);
      uint64_t v11 = nw_connection_create_with_connected_socket_and_parameters();
      if (v11)
      {
        id v12 = v5[2];
        v5[2] = (id)v11;

LABEL_26:
        if (!*((unsigned char *)v5 + 208))
        {
          uint64_t v13 = _log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DC811000, v13, OS_LOG_TYPE_DEFAULT, "xpc_remote_connection_connect_complete setup_nw_listener", buf, 2u);
          }

          _xpc_remote_connection_setup_nw_listener(v5);
        }
        uint64_t v35 = 0;
        uint64_t v36 = &v35;
        uint64_t v37 = 0x3032000000;
        uint64_t v38 = __Block_byref_object_copy_;
        id v39 = __Block_byref_object_dispose_;
        id v40 = 0;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = ___xpc_remote_connection_connect_complete_block_invoke;
        v32[3] = &unk_1E6CA37E0;
        uint64_t v14 = v5;
        id v33 = v14;
        id v34 = &v35;
        uint64_t v15 = (void *)MEMORY[0x1E01A4790](v32);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = ___xpc_remote_connection_connect_complete_block_invoke_2;
        v30[3] = &unk_1E6CA3808;
        uint64_t v16 = v14;
        id v31 = v16;
        uint64_t v17 = (void *)MEMORY[0x1E01A4790](v30);
        int v18 = v16[64];
        id v19 = (void *)*((void *)v16 + 2);
        uint64_t v20 = objc_msgSend(v16, "internal_queue");
        if (v18) {
          char v21 = 2;
        }
        else {
          char v21 = 3;
        }
        uint64_t v22 = xpc_remote_channel_create(v19, v20, v16[66], v21, v15, v17);
        uint64_t v23 = (void *)v36[5];
        v36[5] = v22;

        uint64_t v24 = (void *)v36[5];
        if (!v24)
        {
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          *(_OWORD *)buf = 0u;
          os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          int v41 = 134217984;
          uint64_t v42 = 0;
          _os_log_send_and_compose_impl();
          uint64_t v29 = _os_crash_msg();
          xpc_remote_connection_send_message_with_reply_sync_cold_1(v29);
        }
        objc_storeStrong(v4, v24);
        id v25 = _log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          _xpc_remote_connection_connect_complete_cold_3();
        }

        v16[32] = 0;
        v16[48] = 0;

        _Block_object_dispose(&v35, 8);
        goto LABEL_48;
      }
      uint64_t v27 = _log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_impl(&dword_1DC811000, v27, OS_LOG_TYPE_DEFAULT, "[%p] Couldn't create nw_connection", buf, 0xCu);
      }

      _xpc_remote_connection_connect_doa(v5, a2);
    }
  }
  else
  {
    if ([v5 state] <= 5) {
      _xpc_remote_connection_connect_complete_cold_7(&v35, buf, v5);
    }
    uint64_t v8 = _log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_connection_connect_complete_cold_9();
    }

    if (a2 != -1 && close(a2) == -1) {
      _xpc_remote_connection_connect_complete_cold_8();
    }
  }
LABEL_48:
}

void sub_1DC81804C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___xpc_remote_connection_connect_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = _log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (a2 == -1)
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 134218240;
      uint64_t v11 = v9;
      __int16 v12 = 1024;
      int v13 = a3;
      _os_log_impl(&dword_1DC811000, v6, OS_LOG_TYPE_INFO, "[%p] remote_service_connect_socket: %{errno}d", (uint8_t *)&v10, 0x12u);
    }

    _xpc_remote_connection_connect_failed(*(void **)(a1 + 32), a3);
  }
  else
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 134217984;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1DC811000, v6, OS_LOG_TYPE_INFO, "[%p] Got socket to Remote Service.", (uint8_t *)&v10, 0xCu);
    }

    _xpc_remote_connection_connect_complete(*(void **)(a1 + 32), a2);
  }
}

void _xpc_remote_connection_connect_failed(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (v3[5]) {
    _xpc_remote_connection_connect_failed_cold_5(&v6, v7);
  }
  id v4 = v3;
  if (v3[2]) {
    _xpc_remote_connection_connect_failed_cold_4(&v6, v7);
  }
  if ([v3 state] == 2)
  {
    if (a2 == 83)
    {
      if ([v4 type] != 1) {
        _xpc_remote_connection_connect_failed_cold_1(&v6, v7);
      }
      _xpc_remote_connection_cancel(v4);
    }
    else
    {
      _xpc_remote_connection_disconnect(v4, a2);
    }
  }
  else
  {
    if ([v4 state] <= 5) {
      _xpc_remote_connection_connect_failed_cold_2(&v6, v7, v4);
    }
    id v5 = _log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_connection_connect_failed_cold_3();
    }
  }
}

void _xpc_remote_connection_connect_doa(void *a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = _log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl(&dword_1DC811000, v4, OS_LOG_TYPE_DEFAULT, "[%p] fd is DOA; connect failed", buf, 0xCu);
  }

  if (v3[2]) {
    _xpc_remote_connection_connect_failed_cold_4(&v5, buf);
  }
  if (v3[3]) {
    _xpc_remote_connection_connect_doa_cold_3(&v5, buf);
  }
  if (v3[5]) {
    _xpc_remote_connection_connect_failed_cold_5(&v5, buf);
  }
  if (close(a2) == -1) {
    _xpc_remote_connection_connect_complete_cold_8();
  }
  _xpc_remote_connection_connect_failed(v3, 22);
}

nw_parameters_t _xpc_remote_connection_create_nw_parameters(void *a1)
{
  id v1 = a1;
  nw_parameters_t v2 = nw_parameters_create();
  xpc_remote_connection_setup_nw_parameters(v2);
  id v3 = objc_msgSend(v1, "tls_identity");

  if (v3)
  {
    id v4 = objc_msgSend(v1, "tls_identity");
    uint64_t v5 = objc_msgSend(v1, "tls_verify");
    uint64_t v6 = objc_msgSend(v1, "tls_verify_queue");
    id v7 = v4;
    id v8 = v5;
    nw_protocol_options_t options = nw_tls_create_options();
    configure_tls_block = (void (**)(void, void))xpc_remote_connection_create_configure_tls_block(v7, v8, v6);

    ((void (**)(void, nw_protocol_options_t))configure_tls_block)[2](configure_tls_block, options);
    nw_parameters_add_protocol_stack_member();
  }
  return v2;
}

void _xpc_remote_connection_setup_nw_listener(void *a1)
{
  id v1 = a1;
  nw_parameters_t v2 = _xpc_remote_connection_create_nw_parameters(v1);
  id v3 = nw_listener_create_with_connection(v1[2], v2);
  id v4 = [(nw_connection_t *)v1 internal_queue];
  nw_listener_set_queue(v3, v4);

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___xpc_remote_connection_setup_nw_listener_block_invoke;
  v11[3] = &unk_1E6CA3830;
  uint64_t v5 = v1;
  __int16 v12 = v5;
  MEMORY[0x1E01A4540](v3, v11);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___xpc_remote_connection_setup_nw_listener_block_invoke_230;
  v9[3] = &unk_1E6CA3858;
  int v10 = v5;
  uint64_t v6 = v5;
  nw_listener_set_new_connection_handler(v3, v9);
  nw_listener_start(v3);
  nw_connection_t v7 = v6[3];
  v6[3] = v3;
  id v8 = v3;
}

void ___xpc_remote_connection_connect_complete_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v6 = *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = objc_msgSend(v6, "internal_queue");
  dispatch_assert_queue_V2(v8);

  if ((id)v6[5] != v7) {
    ___xpc_remote_connection_connect_complete_block_invoke_cold_4(&size, &buf);
  }
  if (a2 == 2)
  {
    if ([v6 state] < 2 || objc_msgSend(v6, "state") >= 7) {
      ___xpc_remote_connection_connect_complete_block_invoke_cold_3(&size, &buf, v6);
    }
    uint64_t v15 = _log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1DC811000, v15, OS_LOG_TYPE_INFO, "[%p] Root channel received canceled event", (uint8_t *)&buf, 0xCu);
    }

    uint64_t v16 = (void *)v6[2];
    v6[2] = 0;

    uint64_t v17 = (void *)v6[5];
    v6[5] = 0;

    _xpc_remote_connection_disconnect(v6, a3);
  }
  else if (a2 == 1)
  {
    uint64_t v9 = _log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1DC811000, v9, OS_LOG_TYPE_INFO, "[%p] Root channel ready, sending HELO", (uint8_t *)&buf, 0xCu);
    }

    int v10 = v6;
    if ([v10 state] <= 4)
    {
      if ([v10 state] == 2)
      {
        [v10 setState:3];
        if (*((unsigned char *)v10 + 208))
        {
          uint64_t v11 = _log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1DC811000, v11, OS_LOG_TYPE_DEFAULT, "_xpc_remote_connection_ready setup_nw_listener", (uint8_t *)&buf, 2u);
          }

          _xpc_remote_connection_setup_nw_listener(v10);
        }
        id v12 = MEMORY[0x1E4F14410];
        xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
        int64_t v14 = v10[20];
        if (v14) {
          xpc_dictionary_set_int64(v13, "ServiceVersion", v14);
        }
        size_t size = 0;
        xpc_make_serialization();
        ___xpc_remote_connection_connect_complete_block_invoke_cold_1(&v18, &buf);
      }
      ___xpc_remote_connection_connect_complete_block_invoke_cold_2(&size, &buf);
    }
  }
}

void ___xpc_remote_connection_setup_nw_listener_block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  uint64_t v6 = v5;
  if (v5 && nw_error_get_error_domain(v5) == nw_error_domain_posix)
  {
    uint64_t error_code = nw_error_get_error_code(v6);
    id v8 = _log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_setup_nw_listener_block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t error_code = 0;
  }
  uint64_t v9 = _log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v13 = 134218240;
    uint64_t v14 = v10;
    __int16 v15 = 1024;
    unsigned int v16 = a2;
    _os_log_impl(&dword_1DC811000, v9, OS_LOG_TYPE_INFO, "[%p] listener moved to state %d", (uint8_t *)&v13, 0x12u);
  }

  if (a2 >= 3)
  {
    if (a2 == 4)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 24);
      *(void *)(v11 + 24) = 0;
    }
    _xpc_remote_connection_disconnect(*(void **)(a1 + 32), error_code);
  }
}

void _xpc_remote_connection_disconnect(void *a1, uint64_t a2)
{
  id v4 = a1;
  id v3 = objc_msgSend(v4, "internal_queue");
  dispatch_assert_queue_V2(v3);

  __xpc_remote_connection_teardown(v4, 1, a2);
}

void ___xpc_remote_connection_setup_nw_listener_block_invoke_230(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "internal_queue");
  dispatch_assert_queue_V2(v6);

  if ([v4 state] < 5)
  {
    id v7 = _log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1DC811000, v7, OS_LOG_TYPE_DEFAULT, "[%p] Got incoming h2 stream", (uint8_t *)&buf, 0xCu);
    }

    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = __Block_byref_object_copy_;
    long long v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    v32[3] = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v34 = ___xpc_remote_connection_handle_new_channel_block_invoke;
    uint64_t v35 = &unk_1E6CA38A8;
    id v8 = v4;
    id v36 = v8;
    uint64_t v37 = &v26;
    uint64_t v38 = v32;
    uint64_t v9 = (void *)MEMORY[0x1E01A4790](&buf);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = ___xpc_remote_connection_handle_new_channel_block_invoke_234;
    v22[3] = &unk_1E6CA38F8;
    id v10 = v8;
    id v23 = v10;
    uint64_t v24 = &v26;
    id v25 = v32;
    uint64_t v11 = (void *)MEMORY[0x1E01A4790](v22);
    id v12 = objc_msgSend(v10, "internal_queue");
    uint64_t v13 = xpc_remote_channel_create(v5, v12, *((unsigned char *)v10 + 66), 0, v9, v11);
    uint64_t v14 = (void *)v27[5];
    v27[5] = v13;

    if (*((unsigned char *)v10 + 65) && !*((void *)v10 + 7))
    {
      objc_storeStrong((id *)v10 + 7, (id)v27[5]);
    }
    else
    {
      __int16 v15 = (id *)objc_opt_new();
      objc_storeStrong(v15 + 1, (id)v27[5]);
      id v16 = v10;
      uint64_t v17 = v15;
      uint64_t v18 = v17;
      if (*((void *)v16 + 14))
      {
        id v19 = (id *)*((id *)v16 + 15);
        objc_storeStrong(v19 + 2, v15);
      }
      else
      {
        uint64_t v20 = v17;
        id v19 = (id *)*((void *)v16 + 14);
        *((void *)v16 + 14) = v20;
      }

      uint64_t v21 = (void *)*((void *)v16 + 15);
      *((void *)v16 + 15) = v18;
    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(v32, 8);
  }
  else
  {
    nw_connection_cancel(v5);
  }
}

void sub_1DC818FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __xpc_remote_connection_teardown(void *a1, int a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  uint64_t v6 = objc_msgSend(v5, "internal_queue");
  dispatch_assert_queue_V2(v6);

  if ([v5 state] != 7)
  {
    if (!a2 && [v5 state] == 5)
    {
      [v5 setState:6];
      id v7 = _log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134217984;
        id v34 = v5;
        _os_log_impl(&dword_1DC811000, v7, OS_LOG_TYPE_INFO, "[%p] disconnect => cancel promotion", buf, 0xCu);
      }
    }
    if ([v5 state] < 5)
    {
      if (a2 == 1)
      {
        uint64_t v9 = _log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = state2str[[v5 state]];
          *(_DWORD *)long long buf = 134218498;
          id v34 = v5;
          __int16 v35 = 2082;
          id v36 = v11;
          __int16 v37 = 1024;
          int v38 = a3;
          _os_log_impl(&dword_1DC811000, v9, OS_LOG_TYPE_DEFAULT, "[%p] Connection Disconnected (state: %{public}s, error %{errno}d)", buf, 0x1Cu);
        }
      }
      else
      {
        if (a2) {
          __xpc_remote_connection_teardown_cold_2(&v32, buf);
        }
        uint64_t v9 = _log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = state2str[[v5 state]];
          *(_DWORD *)long long buf = 134218242;
          id v34 = v5;
          __int16 v35 = 2082;
          id v36 = v10;
          _os_log_impl(&dword_1DC811000, v9, OS_LOG_TYPE_DEFAULT, "[%p] Connection Canceled (state: %{public}s)", buf, 0x16u);
        }
        a3 = 89;
      }

      *((_DWORD *)v5 + 45) = a3;
      if ([v5 type]) {
        BOOL v12 = a2 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12) {
        uint64_t v13 = 6;
      }
      else {
        uint64_t v13 = 5;
      }
      [v5 setState:v13];
      uint64_t v14 = *((void *)v5 + 3);
      if (v14) {
        nw_listener_cancel(v14);
      }
      uint64_t v15 = (void *)*((void *)v5 + 5);
      if (v15)
      {
        xpc_remote_channel_cancel(v15, a3);
      }
      else if (![v5 type])
      {
        int v16 = *((_DWORD *)v5 + 48);
        if (v16 != -1)
        {
          if (close(v16) == -1) {
            _xpc_remote_connection_connect_complete_cold_8();
          }
          *((_DWORD *)v5 + 48) = -1;
        }
      }
      uint64_t v17 = (void *)*((void *)v5 + 7);
      if (v17) {
        xpc_remote_channel_cancel(v17, a3);
      }
      id v18 = v5;
      id v19 = (void *)*((void *)v18 + 12);
      if (v19)
      {
        uint64_t v20 = 0;
        do
        {
          uint64_t v21 = v19;
          objc_storeStrong((id *)v18 + 12, v21[7]);
          id v22 = v21[7];
          if (!v22)
          {
            id v23 = (void *)*((void *)v18 + 13);
            *((void *)v18 + 13) = 0;

            id v22 = v21[7];
          }
          v21[7] = 0;

          uint64_t v24 = (void (**)(id, uint64_t))v21[5];
          if (v24) {
            v24[2](v24, a3);
          }
          id v25 = v18;
          id v19 = (void *)*((void *)v18 + 12);
          uint64_t v20 = v21;
        }
        while (v19);
      }
      else
      {
        uint64_t v21 = 0;
      }

      unsigned int v26 = *((_DWORD *)v5 + 45);
      id v8 = v18;
      uint64_t v27 = v8[14].isa;
      if (v27)
      {
        uint64_t v28 = (void **)v27;
        do
        {
          uint64_t v29 = _log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            id v31 = (char *)v28[1];
            *(_DWORD *)long long buf = 134218240;
            id v34 = v8;
            __int16 v35 = 2048;
            id v36 = v31;
            _os_log_debug_impl(&dword_1DC811000, v29, OS_LOG_TYPE_DEBUG, "[%p] Canceling channel (%p)", buf, 0x16u);
          }

          xpc_remote_channel_cancel(v28[1], v26);
          long long v30 = v28[2];

          uint64_t v28 = v30;
        }
        while (v30);
      }
    }
    else
    {
      id v8 = _log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_connection_teardown_cold_1();
      }
    }

    __xpc_remote_connection_teardown_continue(v5);
  }
}

void __xpc_remote_connection_teardown_continue(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  nw_parameters_t v2 = objc_msgSend(v1, "internal_queue");
  dispatch_assert_queue_V2(v2);

  if ([v1 state] != 5 && objc_msgSend(v1, "state") != 6) {
    __xpc_remote_connection_teardown_continue_cold_7(&v16, buf, v1);
  }
  if (*((void *)v1 + 5))
  {
    id v3 = _log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __xpc_remote_connection_teardown_continue_cold_6();
    }
  }
  else if (*((void *)v1 + 7))
  {
    id v3 = _log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __xpc_remote_connection_teardown_continue_cold_5();
    }
  }
  else if (*((void *)v1 + 3))
  {
    id v3 = _log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __xpc_remote_connection_teardown_continue_cold_4();
    }
  }
  else if (*((void *)v1 + 14))
  {
    id v3 = _log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __xpc_remote_connection_teardown_continue_cold_3();
    }
  }
  else
  {
    id v4 = objc_msgSend(v1, "event_handler");
    if ([v1 state] == 5)
    {
      id v5 = _log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v1;
        _os_log_impl(&dword_1DC811000, v5, OS_LOG_TYPE_DEFAULT, "[%p] Disconnect complete, delivering XPC_ERROR_CONNECTION_INTERRUTPED", buf, 0xCu);
      }

      [v1 setState:1];
      uint64_t v6 = (void *)MEMORY[0x1E4F14520];
      id v7 = MEMORY[0x1E4F14520];
    }
    else
    {
      if ([v1 state] != 6) {
        __xpc_remote_connection_teardown_continue_cold_2();
      }
      id v8 = _log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v1;
        _os_log_impl(&dword_1DC811000, v8, OS_LOG_TYPE_DEFAULT, "[%p] Cancel complete, delivering XPC_ERROR_CONNECTION_INVALID", buf, 0xCu);
      }

      [v1 setState:7];
      uint64_t v6 = (void *)MEMORY[0x1E4F14528];
      id v9 = MEMORY[0x1E4F14528];
      objc_msgSend(v1, "setEvent_handler:", 0);
    }
    _xpc_remote_connection_flush(v1, v6);
    if (*((void *)v1 + 12)) {
      __xpc_remote_connection_teardown_continue_cold_1(&v16, buf);
    }
    *((_DWORD *)v1 + 45) = 0;
    uint64_t v10 = objc_msgSend(v1, "target_queue");
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ____xpc_remote_connection_teardown_continue_block_invoke;
    v12[3] = &unk_1E6CA3880;
    id v15 = v4;
    id v13 = v6;
    id v14 = v1;
    id v11 = v6;
    id v3 = v4;
    dispatch_async(v10, v12);
  }
}

void _xpc_remote_connection_flush(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_msgSend(v3, "internal_queue");
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = _xpc_remote_connection_dequeue_message(v3);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = MEMORY[0x1E4F145B8];
    do
    {
      if (*(int *)(v7 + 32) >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v10 = v7 + 40;
        do
        {
          id v11 = *(id *)(v10 + 8 * v9);
          if (MEMORY[0x1E01A4B40]() != v8) {
            _xpc_remote_connection_flush_cold_1();
          }
          id v12 = v3;
          id v13 = v11;
          id v14 = xpc_file_transfer_copy_io();
          dispatch_io_close(v14, 0);
          id v15 = objc_msgSend(v12, "target_queue");

          xpc_file_transfer_send_finished();
          uint64_t v16 = *(void **)(v10 + 8 * v9);
          *(void *)(v10 + 8 * v9) = 0;

          ++v9;
        }
        while (v9 < *(int *)(v7 + 32));
      }
      if (*(void *)(v7 + 16))
      {
        uint64_t v17 = objc_msgSend(v3, "target_queue");
        dispatch_async(v17, *(dispatch_block_t *)(v7 + 16));
      }
      uint64_t v18 = _xpc_remote_connection_dequeue_message(v3);

      uint64_t v7 = v18;
    }
    while (v18);
  }
  id v19 = v3;
  uint64_t v20 = (void *)*((void *)v19 + 16);
  if (v20)
  {
    id v21 = 0;
    do
    {
      id v22 = v20;
      objc_storeStrong((id *)v19 + 16, *((id *)v22 + 4));
      id v23 = (void *)*((void *)v22 + 4);
      if (!v23)
      {
        uint64_t v24 = (void *)*((void *)v19 + 17);
        *((void *)v19 + 17) = 0;

        id v23 = (void *)*((void *)v22 + 4);
      }
      *((void *)v22 + 4) = 0;

      id v25 = *((void *)v22 + 3);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = ___xpc_remote_connection_flush_block_invoke;
      v27[3] = &unk_1E6CA3640;
      id v21 = v22;
      id v28 = v21;
      id v29 = v4;
      dispatch_async(v25, v27);

      id v26 = v19;
      uint64_t v20 = (void *)*((void *)v19 + 16);
    }
    while (v20);
  }
  else
  {
    id v21 = 0;
  }
}

void ____xpc_remote_connection_teardown_continue_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    id v3 = *(void (**)(void))(v2 + 16);
    v3();
  }
  else
  {
    id v4 = _log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 134217984;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1DC811000, v4, OS_LOG_TYPE_DEFAULT, "[%p] No event handler to deliver teardown complete", (uint8_t *)&v6, 0xCu);
    }
  }
}

id _xpc_remote_connection_dequeue_message(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "internal_queue");
  dispatch_assert_queue_V2(v2);

  id v3 = v1;
  id v4 = (void *)*((void *)v3 + 10);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_storeStrong((id *)v3 + 10, v5[21]);
    id v6 = v5[21];
    if (!v6)
    {
      uint64_t v7 = (void *)*((void *)v3 + 11);
      *((void *)v3 + 11) = 0;

      id v6 = v5[21];
    }
    v5[21] = 0;
  }
  return v4;
}

uint64_t ___xpc_remote_connection_flush_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

void ___xpc_remote_connection_handle_new_channel_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a2 == 2)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (id *)(a1 + 32);
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v8 == (void *)v6[7])
    {
      v6[7] = 0;

      if ([*v7 state] < 2 || objc_msgSend(*v7, "state") >= 7) {
        ___xpc_remote_connection_handle_new_channel_block_invoke_cold_2(&v19, buf, (id *)(a1 + 32));
      }
      id v15 = _log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = *v7;
        *(_DWORD *)long long buf = 134218240;
        id v21 = v16;
        __int16 v22 = 1024;
        LODWORD(v23) = a3;
        _os_log_impl(&dword_1DC811000, v15, OS_LOG_TYPE_INFO, "[%p] Reply channel received CANCELED event with error %{errno}d", buf, 0x12u);
      }

      _xpc_remote_connection_disconnect(*v7, a3);
    }
    else
    {
      uint64_t v9 = _xpc_remote_pending_stream_find(v6, *(id **)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
      uint64_t v10 = _log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (v9)
      {
        if (v11)
        {
          id v12 = *(void **)(a1 + 32);
          uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          *(_DWORD *)long long buf = 134218496;
          id v21 = v12;
          __int16 v22 = 2048;
          uint64_t v23 = v13;
          __int16 v24 = 1024;
          int v25 = a3;
          _os_log_impl(&dword_1DC811000, v10, OS_LOG_TYPE_INFO, "[%p] Stream %llu canceled with error %d, leaving tombstone", buf, 0x1Cu);
        }

        id v14 = *(void **)(v9 + 16);
        *(void *)(v9 + 16) = 0;

        *(_DWORD *)(v9 + 48) = a3;
        _xpc_remote_pending_stream_insert((id *)*v7, (void *)v9);
      }
      else
      {
        if (v11)
        {
          uint64_t v17 = *(void **)(a1 + 32);
          uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          *(_DWORD *)long long buf = 134218240;
          id v21 = v17;
          __int16 v22 = 2048;
          uint64_t v23 = v18;
          _os_log_impl(&dword_1DC811000, v10, OS_LOG_TYPE_INFO, "[%p] Stream %llu canceled but not pending", buf, 0x16u);
        }
      }
      _xpc_remote_stream_remove(*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      if ([*(id *)(a1 + 32) state] >= 5) {
        __xpc_remote_connection_teardown_continue(*v7);
      }
    }
  }
  else if (a2 == 1)
  {
    id v4 = _log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      ___xpc_remote_connection_handle_new_channel_block_invoke_cold_1();
    }
  }
}

id *_xpc_remote_pending_stream_find(void *a1, id *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (a2)
  {
    uint64_t v5 = (id *)v3[12];
    if (!v5)
    {
LABEL_6:
      a2 = 0;
      goto LABEL_24;
    }
    id v6 = v5;
    while (v6[1] != a2)
    {
      uint64_t v7 = (id *)v6[7];

      id v6 = v7;
      if (!v7) {
        goto LABEL_6;
      }
    }
    uint64_t v8 = v4;
    a2 = v6;
    uint64_t v9 = (id *)v4[12];
    if (v9 == a2)
    {
      if (!v9)
      {
LABEL_22:

        goto LABEL_23;
      }
      uint64_t v9 = v9;
      objc_storeStrong(v4 + 12, v9[7]);
      id v14 = (id *)v9[7];
      if (!v14)
      {
        id v15 = v8[13];
        v8[13] = 0;

        id v14 = (id *)v9[7];
      }
      v9[7] = 0;
    }
    else
    {
      uint64_t v10 = v9;
      if (!v10)
      {
LABEL_23:

        goto LABEL_24;
      }
      BOOL v11 = v10;
      while (1)
      {
        id v12 = (id *)v11[7];
        if (v12 == a2) {
          break;
        }
        uint64_t v13 = v12;

        BOOL v11 = v13;
        if (!v13) {
          goto LABEL_23;
        }
      }
      id v14 = v11;
      id v16 = v11[7];
      if (!v16) {
        _xpc_remote_connection_handle_read_cold_5(&v21, v22);
      }
      uint64_t v17 = v16;

      uint64_t v18 = (void *)v17[7];
      id v19 = v18;
      objc_storeStrong(v11 + 7, v18);
      if (!v19) {
        objc_storeStrong(v8 + 13, v11);
      }

      uint64_t v9 = v14;
    }

    goto LABEL_22;
  }
LABEL_24:

  return a2;
}

void _xpc_remote_pending_stream_insert(id *a1, void *a2)
{
  id v7 = a2;
  id v4 = a1 + 12;
  if (a1[12]) {
    id v4 = (id *)((char *)a1[13] + 56);
  }
  objc_storeStrong(v4, a2);
  uint64_t v5 = a1;
  id v6 = v5[13];
  v5[13] = v7;
}

void _xpc_remote_stream_remove(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = a1;
  id v3 = a2;
  id v4 = (id *)v20[14];
  if (v4)
  {
    uint64_t v5 = v4;
    while (v5[1] != v3)
    {
      id v6 = (id *)v5[2];

      uint64_t v5 = v6;
      if (!v6) {
        goto LABEL_23;
      }
    }
    id v7 = v20;
    uint64_t v8 = v5;
    uint64_t v9 = (id *)v20[14];
    if (v9 == v8)
    {
      if (!v9)
      {
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v9 = v9;
      objc_storeStrong(v20 + 14, v9[2]);
      id v14 = (id *)v9[2];
      if (!v14)
      {
        id v15 = v7[15];
        v7[15] = 0;

        id v14 = (id *)v9[2];
      }
      v9[2] = 0;
    }
    else
    {
      uint64_t v10 = v9;
      if (!v10)
      {
LABEL_22:

        goto LABEL_23;
      }
      BOOL v11 = v10;
      while (1)
      {
        id v12 = (id *)v11[2];
        if (v12 == v8) {
          break;
        }
        uint64_t v13 = v12;

        BOOL v11 = v13;
        if (!v13) {
          goto LABEL_22;
        }
      }
      id v14 = v11;
      id v16 = v11[2];
      if (!v16) {
        _xpc_remote_connection_handle_read_cold_5(&v21, v22);
      }
      uint64_t v17 = v16;

      uint64_t v18 = (void *)v17[2];
      id v19 = v18;
      objc_storeStrong(v11 + 2, v18);
      if (!v19) {
        objc_storeStrong(v7 + 15, v11);
      }

      uint64_t v9 = v14;
    }

    goto LABEL_21;
  }
LABEL_23:
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_234(uint64_t a1, objc_class *a2, unint64_t a3, void *a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint64_t v9 = (void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 48))
  {
    uint64_t v10 = *(void **)(v8 + 56);
    if (v10 == *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      _xpc_remote_connection_handle_read((void *)v8, v10, a2, a3, v7);
      goto LABEL_10;
    }
  }
  if ([(id)v8 state] <= 4)
  {
    if ((_BYTE)a3)
    {
      BOOL v11 = _log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_6();
      }
LABEL_7:

LABEL_8:
      _xpc_remote_connection_disconnect(*v9, 53);
      goto LABEL_10;
    }
    unint64_t v12 = a3 >> 16;
    if (((a3 >> 16) & 0x40) != 0)
    {
      uint64_t v27 = _log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = *v9;
        *(_DWORD *)long long buf = 134217984;
        long long v46 = v28;
        _os_log_impl(&dword_1DC811000, v27, OS_LOG_TYPE_INFO, "[%p] Got HEADER for reply channel", buf, 0xCu);
      }

      id v29 = *v9;
      if (*((unsigned char *)*v9 + 65))
      {
        long long v30 = (void *)v29[7];
        uint64_t v32 = *(void *)(a1 + 40);
        uint64_t v31 = a1 + 40;
        if (v30 == *(void **)(*(void *)(v32 + 8) + 40))
        {
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = ___xpc_remote_connection_handle_new_channel_block_invoke_235;
          v43[3] = &unk_1E6CA38D0;
          long long v44 = v29;
          xpc_remote_channel_send(v30, 0, 0x400000, MEMORY[0x1E4F14410], v43);
          _xpc_remote_connection_handle_read(*v9, *(void **)(*(void *)(*(void *)v31 + 8) + 40), a2, a3, v7);

          goto LABEL_10;
        }
        id v33 = _log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_5();
        }

        xpc_remote_channel_cancel(*(void **)(*(void *)(*(void *)v31 + 8) + 40), 0x35u);
      }
      else
      {
        id v34 = _log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_4();
        }
      }
      goto LABEL_8;
    }
    int v13 = WORD1(a3);
    if (*(void *)(*(void *)(a1 + 32) + 56) == *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v14 = _log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_3();
      }
    }
    id v15 = _log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = *(void **)(a1 + 32);
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)long long buf = 134218496;
      long long v46 = v16;
      __int16 v47 = 2048;
      *(void *)uint64_t v48 = v17;
      *(_WORD *)&v48[8] = 1024;
      int v49 = v13;
      _os_log_impl(&dword_1DC811000, v15, OS_LOG_TYPE_INFO, "[%p] Got HEADER for stream %lld, flags = 0x%x", buf, 0x1Cu);
    }

    unsigned int v18 = (v12 >> 3) & 2 | (v12 >> 5) & 1;
    if (!v18)
    {
      BOOL v11 = _log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_1();
      }
      goto LABEL_7;
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
    id v19 = *(id **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (!v19)
    {
      BOOL v11 = _log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_2();
      }
      goto LABEL_7;
    }
    uint64_t v20 = _xpc_remote_pending_stream_find(*v9, v19);
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)(v20 + 24);
      uint64_t v23 = _log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v22)
      {
        if (v24)
        {
          int v25 = *(void **)(a1 + 32);
          uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          *(_DWORD *)long long buf = 134218240;
          long long v46 = v25;
          __int16 v47 = 2048;
          *(void *)uint64_t v48 = v26;
          _os_log_impl(&dword_1DC811000, v23, OS_LOG_TYPE_INFO, "[%p] Found pending stream ID for %lld", buf, 0x16u);
        }

        if (*(_DWORD *)(v21 + 32) == v18)
        {
          _xpc_remote_channel_send_stream_header(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v18);
          xpc_remote_channel_attach_stream(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(_DWORD *)(v21 + 32), *(void **)(v21 + 24), *(void **)(v21 + 40));
        }
        else
        {
          id v40 = _log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            int v41 = *v9;
            int v42 = *(_DWORD *)(v21 + 32);
            *(_DWORD *)long long buf = 134218496;
            long long v46 = v41;
            __int16 v47 = 1024;
            *(_DWORD *)uint64_t v48 = v42;
            *(_WORD *)&v48[4] = 1024;
            *(_DWORD *)&v48[6] = v18;
            _os_log_error_impl(&dword_1DC811000, v40, OS_LOG_TYPE_ERROR, "[%p] Pending stream direction mismatch: %d != %d", buf, 0x18u);
          }

          _xpc_remote_connection_disconnect(*v9, 53);
        }
      }
      else
      {
        if (v24)
        {
          int v38 = *(void **)(a1 + 32);
          uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          *(_DWORD *)long long buf = 134218240;
          long long v46 = v38;
          __int16 v47 = 2048;
          *(void *)uint64_t v48 = v39;
          _os_log_impl(&dword_1DC811000, v23, OS_LOG_TYPE_INFO, "[%p] Found pending tombstone ID for %lld", buf, 0x16u);
        }

        xpc_remote_channel_cancel(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0x59u);
      }
    }
    else
    {
      __int16 v35 = _log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        id v36 = *(void **)(a1 + 32);
        uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        *(_DWORD *)long long buf = 134218240;
        long long v46 = v36;
        __int16 v47 = 2048;
        *(void *)uint64_t v48 = v37;
        _os_log_impl(&dword_1DC811000, v35, OS_LOG_TYPE_INFO, "[%p] Pending incoming stream %lld", buf, 0x16u);
      }

      uint64_t v21 = objc_opt_new();
      *(void *)(v21 + 8) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)(v21 + 32) = v18;
      objc_storeStrong((id *)(v21 + 16), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      _xpc_remote_pending_stream_insert(*(id **)(a1 + 32), (void *)v21);
    }
  }
LABEL_10:
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_235(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = _log();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_handle_new_channel_block_invoke_235_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1DC811000, v5, OS_LOG_TYPE_INFO, "[%p] Successfully sent reply HELO", (uint8_t *)&v7, 0xCu);
  }
}

void _xpc_remote_channel_send_stream_header(void *a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (!a2) {
    _xpc_remote_channel_send_stream_header_cold_1(&v8, buf);
  }
  if (!a3) {
    _xpc_remote_channel_send_stream_header_cold_2(&v8, buf);
  }
  uint64_t v6 = v5;
  int v7 = _log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218240;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    _os_log_impl(&dword_1DC811000, v7, OS_LOG_TYPE_INFO, "[%p] Sending HEADER for stream %lld", buf, 0x16u);
  }

  xpc_remote_channel_send(v6, a2, (a3 & 3) << 20, MEMORY[0x1E4F14410], 0);
}

void ___xpc_remote_connection_ready_block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = _log();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_ready_block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1DC811000, v5, OS_LOG_TYPE_INFO, "[%p] Successfully sent root channel HELO", (uint8_t *)&v7, 0xCu);
  }
}

id _xpc_remote_connection_create_sub_nw_connection(void *a1)
{
  id v1 = a1[2];
  uint64_t v2 = a1;
  id v3 = nw_connection_copy_parameters(v1);
  nw_parameters_t v4 = nw_parameters_copy(v3);

  nw_parameters_set_data_mode();
  nw_parameters_set_server_mode();

  id v5 = (void *)nw_connection_create_with_connection();
  return v5;
}

void ___xpc_remote_connection_ready_block_invoke_239(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 == 2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = (id *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = 0;

    if ([*v6 state] <= 4)
    {
      uint64_t v9 = _log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ___xpc_remote_connection_ready_block_invoke_239_cold_1();
      }
    }
    _xpc_remote_connection_disconnect(*v6, a3);
  }
  else if (a2 == 1)
  {
    id v3 = *(void **)(a1 + 32);
    nw_parameters_t v4 = (void *)v3[7];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = ___xpc_remote_connection_ready_block_invoke_2;
    v10[3] = &unk_1E6CA38D0;
    __int16 v11 = v3;
    xpc_remote_channel_send(v4, 0, 0x400000, MEMORY[0x1E4F14410], v10);
  }
}

void ___xpc_remote_connection_ready_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  nw_parameters_t v4 = _log();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_handle_new_channel_block_invoke_235_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1DC811000, v5, OS_LOG_TYPE_INFO, "[%p] Successfully sent reply channel HELO", (uint8_t *)&v7, 0xCu);
  }
}

void ___xpc_remote_connection_ready_block_invoke_240(uint64_t a1, objc_class *a2, uint64_t a3, void *a4)
{
}

void ___xpc_remote_connection_handle_read_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x1E01A4B40]() != MEMORY[0x1E4F145B8]) {
    ___xpc_remote_connection_handle_read_block_invoke_cold_1();
  }
  id v5 = *(id *)(a1 + 32);
  id v4 = v5;
  xpc_file_transfer_set_transport_writing_callbacks();
}

uint64_t ___xpc_remote_connection_handle_read_block_invoke_244(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

void _xpc_remote_connection_wakeup(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "internal_queue");
  dispatch_assert_queue_V2(v2);

  if ((objc_msgSend(v1, "send_in_progress") & 1) == 0)
  {
    switch([v1 state])
    {
      case 0u:
        _xpc_remote_connection_wakeup_cold_1();
      case 1u:
        _xpc_remote_connection_connect(v1);
        goto LABEL_4;
      case 2u:
      case 3u:
LABEL_4:
        id v3 = _log();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          _xpc_remote_connection_wakeup_cold_2();
        }
        goto LABEL_6;
      case 5u:
      case 6u:
      case 7u:
        break;
      default:
        uint64_t v4 = _xpc_remote_connection_dequeue_message(v1);
        id v3 = v4;
        if (v4)
        {
          uint64_t v5 = *(void *)(v4 + 8);
          if (v5 && (*(void *)(v4 + 8) & 1) == *((unsigned char *)v1 + 65))
          {
            uint64_t v16 = 0;
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            *(_OWORD *)long long buf = 0u;
            os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            Class isa = v3[1].isa;
            int v17 = 134218240;
            id v18 = v1;
            __int16 v19 = 2048;
            Class v20 = isa;
            _os_log_send_and_compose_impl();
            _os_crash_msg();
            __break(1u);
          }
          if (*(unsigned char *)(v4 + 176)) {
            int v6 = 65537;
          }
          else {
            int v6 = 1;
          }
          int v7 = _log();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 134217984;
            *(void *)&uint8_t buf[4] = v1;
            _os_log_impl(&dword_1DC811000, v7, OS_LOG_TYPE_INFO, "[%p] Send initiated", buf, 0xCu);
          }

          objc_msgSend(v1, "setSend_in_progress:", 1);
          _xpc_remote_connection_send_ool_message_content(v1, v3);
          uint64_t v8 = (void *)MEMORY[0x1E01A4790](v3[2].isa);
          uint64_t v9 = (void *)*((void *)v1 + 5);
          Class v10 = v3[3].isa;
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = ___xpc_remote_connection_wakeup_block_invoke;
          v13[3] = &unk_1E6CA39C0;
          id v14 = v1;
          id v15 = v8;
          id v11 = v8;
          xpc_remote_channel_send(v9, v5, v6, v10, v13);
        }
LABEL_6:

        break;
    }
  }
}

void ___xpc_remote_connection_wakeup_block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setSend_in_progress:", 0);
  if (v4[1])
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "target_queue");
    dispatch_async(v5, *(dispatch_block_t *)(a1 + 40));
  }
  int v6 = _log();
  int v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_wakeup_block_invoke_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *v4;
      int v9 = 134217984;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1DC811000, v7, OS_LOG_TYPE_INFO, "[%p] Send completed", (uint8_t *)&v9, 0xCu);
    }

    _xpc_remote_connection_wakeup(*v4);
  }
}

void ___send_file_transfer_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "target_queue");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  xpc_file_transfer_send_finished();
}

uint64_t __Block_byref_object_copy__247(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1E01A4790](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__248(uint64_t a1)
{
}

void ___xpc_remote_connection_open_stream_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2 == 2)
  {
    uint64_t v8 = _log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 56);
      int v14 = 134218240;
      uint64_t v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1DC811000, v8, OS_LOG_TYPE_INFO, "[%p] Got CANCELED for stream %lld", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void *)(v11 + 40);
    if (v12)
    {
      (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, a3);
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v13 = *(void **)(v11 + 40);
    }
    else
    {
      uint64_t v13 = 0;
    }
    *(void *)(v11 + 40) = 0;

    _xpc_remote_stream_remove(*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    if ([*(id *)(a1 + 32) state] >= 5) {
      __xpc_remote_connection_teardown_continue(*(void **)(a1 + 32));
    }
  }
  else if (a2 == 1)
  {
    uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v5 = *(void *)(a1 + 56);
    int v6 = *(_DWORD *)(a1 + 64);
    _xpc_remote_channel_send_stream_header(v4, v5, v6);
  }
}

void ___xpc_remote_connection_open_stream_block_invoke_249(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 64);
    int v7 = 134218240;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1DC811000, v2, OS_LOG_TYPE_INFO, "[%p] Got HEADER for stream %lld", (uint8_t *)&v7, 0x16u);
  }

  xpc_remote_channel_attach_stream(*(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(_DWORD *)(a1 + 72), *(void **)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void ___recv_file_transfer_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = objc_msgSend(*(id *)(a1 + 32), "internal_queue");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___recv_file_transfer_block_invoke_2;
  block[3] = &unk_1E6CA3A60;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void ___recv_file_transfer_block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] < 5)
  {
    uint64_t transfer_id = (id *)xpc_file_transfer_get_transfer_id();
    uint64_t v3 = *(void **)(a1 + 48);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    __int16 v19 = ___recv_file_transfer_block_invoke_3;
    Class v20 = &unk_1E6CA39E8;
    uint64_t v4 = *(void **)(a1 + 32);
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 32);
    id v5 = v4;
    id v6 = v3;
    int v7 = v18;
    id v8 = objc_msgSend(v5, "internal_queue");
    dispatch_assert_queue_V2(v8);

    if ([v5 state] >= 5) {
      ___recv_file_transfer_block_invoke_2_cold_2(&v23, buf);
    }
    uint64_t v9 = _xpc_remote_pending_stream_find(v5, transfer_id);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)(v9 + 16);
      id v12 = _log();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v11)
      {
        if (v13)
        {
          *(_DWORD *)long long buf = 134218240;
          id v25 = v5;
          __int16 v26 = 2048;
          uint64_t v27 = transfer_id;
          _os_log_impl(&dword_1DC811000, v12, OS_LOG_TYPE_INFO, "[%p] Found pending stream channel for %lld", buf, 0x16u);
        }

        if (*(_DWORD *)(v10 + 32) != 2) {
          ___recv_file_transfer_block_invoke_2_cold_1(&v23, buf);
        }
        _xpc_remote_channel_send_stream_header(*(void **)(v10 + 16), (uint64_t)transfer_id, 2);
        xpc_remote_channel_attach_stream(*(void **)(v10 + 16), 2, v6, v7);
      }
      else
      {
        if (v13)
        {
          *(_DWORD *)long long buf = 134218240;
          id v25 = v5;
          __int16 v26 = 2048;
          uint64_t v27 = transfer_id;
          _os_log_impl(&dword_1DC811000, v12, OS_LOG_TYPE_INFO, "[%p] Found pending tombstone channel for %lld", buf, 0x16u);
        }

        ((void (*)(void *, void))v19)(v7, *(unsigned int *)(v10 + 48));
      }
    }
    else
    {
      int v14 = _log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218240;
        id v25 = v5;
        __int16 v26 = 2048;
        uint64_t v27 = transfer_id;
        _os_log_impl(&dword_1DC811000, v14, OS_LOG_TYPE_INFO, "[%p] Pending future stream %lld", buf, 0x16u);
      }

      uint64_t v10 = objc_opt_new();
      *(void *)(v10 + 8) = transfer_id;
      *(_DWORD *)(v10 + 32) = 2;
      objc_storeStrong((id *)(v10 + 24), v3);
      uint64_t v15 = MEMORY[0x1E01A4790](v7);
      __int16 v16 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v15;

      _xpc_remote_pending_stream_insert((id *)v5, (void *)v10);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "target_queue");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    xpc_file_transfer_write_finished();
  }
}

void ___recv_file_transfer_block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "target_queue");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  xpc_file_transfer_write_finished();
}

void ___recv_file_transfer_block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "internal_queue");
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___recv_file_transfer_block_invoke_5;
  v5[3] = &unk_1E6CA3580;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a2;
  dispatch_async(v4, v5);
}

void ___recv_file_transfer_block_invoke_5(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state] <= 4)
  {
    uint64_t v2 = *(id **)(a1 + 40);
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = objc_msgSend(v3, "internal_queue");
    dispatch_assert_queue_V2(v4);

    uint64_t v5 = _xpc_remote_pending_stream_find(v3, v2);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)(v5 + 16);
      id v8 = _log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (v7)
      {
        if (v9)
        {
          *(_DWORD *)long long buf = 134218240;
          id v13 = v3;
          __int16 v14 = 2048;
          uint64_t v15 = v2;
          _os_log_impl(&dword_1DC811000, v8, OS_LOG_TYPE_INFO, "[%p] Found pending stream channel for canceling %lld", buf, 0x16u);
        }

        if (*(_DWORD *)(v6 + 32) != 2) {
          ___recv_file_transfer_block_invoke_5_cold_1(&v11, buf);
        }
        xpc_remote_channel_cancel(*(void **)(v6 + 16), 0x59u);
      }
      else
      {
        if (v9)
        {
          *(_DWORD *)long long buf = 134218240;
          id v13 = v3;
          __int16 v14 = 2048;
          uint64_t v15 = v2;
          _os_log_impl(&dword_1DC811000, v8, OS_LOG_TYPE_INFO, "[%p] Found pending tombstone for canceling %lld", buf, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v10 = _log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218240;
        id v13 = v3;
        __int16 v14 = 2048;
        uint64_t v15 = v2;
        _os_log_impl(&dword_1DC811000, v10, OS_LOG_TYPE_INFO, "[%p] Leaving stream tombstone %lld", buf, 0x16u);
      }

      uint64_t v6 = objc_opt_new();
      *(void *)(v6 + 8) = v2;
      _xpc_remote_pending_stream_insert((id *)v3, (void *)v6);
    }
  }
}

uint64_t ___xpc_remote_message_create_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (*(int *)(*(void *)(a1 + 32) + 32) < 16)
  {
    if (MEMORY[0x1E01A4B40](v4) == MEMORY[0x1E4F145B8])
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(int *)(v16 + 32);
      *(_DWORD *)(v16 + 32) = v17 + 1;
      objc_storeStrong((id *)(v16 + 8 * v17 + 40), a2);
      uint64_t v14 = 1;
      goto LABEL_10;
    }
    if (MEMORY[0x1E01A4B40](v5) == MEMORY[0x1E4F14580]
      && (*(unsigned char *)(*(void *)(a1 + 40) + 72) & 2) == 0
      && xpc_data_get_length(v5) > 0x4000)
    {
      ___xpc_remote_message_create_block_invoke_cold_2();
    }
  }
  else
  {
    uint64_t v6 = _log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_message_create_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  uint64_t v14 = 0;
LABEL_10:

  return v14;
}

const char *_xpc_remote_connection_get_remote_service_name(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  name = v1[1];
  if (!name)
  {
    if (v1[23]) {
      name = (const char *)remote_service_get_name();
    }
    else {
      name = "(null)";
    }
  }

  return name;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

double OUTLINED_FUNCTION_3(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_5()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return _os_crash_msg();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return _os_log_send_and_compose_impl();
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_14(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

BOOL OUTLINED_FUNCTION_15()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void OUTLINED_FUNCTION_16(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_22(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_23(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id xpc_remote_channel_create(void *a1, void *a2, char a3, char a4, void *a5, void *a6)
{
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  id v13 = a6;
  id v14 = a5;
  uint64_t v15 = objc_opt_new();
  objc_storeStrong((id *)(v15 + 8), a2);
  *(unsigned char *)(v15 + 73) = a3;
  uint64_t v16 = MEMORY[0x1E01A4790](v14);

  uint64_t v17 = *(void **)(v15 + 24);
  *(void *)(v15 + 24) = v16;

  uint64_t v18 = MEMORY[0x1E01A4790](v13);
  __int16 v19 = *(void **)(v15 + 32);
  *(void *)(v15 + 32) = v18;

  nw_connection_set_queue(v11, v12);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __xpc_remote_channel_create_block_invoke;
  v50[3] = &unk_1E6CA3830;
  id v20 = (id)v15;
  id v51 = v20;
  MEMORY[0x1E01A4480](v11, v50);
  uint64_t v45 = MEMORY[0x1E4F143A8];
  uint64_t v46 = 3221225472;
  __int16 v47 = __xpc_remote_channel_create_block_invoke_22;
  uint64_t v48 = &unk_1E6CA3618;
  id v49 = v20;
  nw_connection_set_read_close_handler();
  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  int v42 = __xpc_remote_channel_create_block_invoke_24;
  uint64_t v43 = &unk_1E6CA3618;
  id v44 = v49;
  nw_connection_set_write_close_handler();
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  uint64_t v37 = __xpc_remote_channel_create_block_invoke_25;
  int v38 = &unk_1E6CA3618;
  id v21 = v44;
  id v39 = v21;
  nw_connection_set_cancel_handler();
  if (a4)
  {
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    uint64_t v32 = __xpc_remote_channel_create_block_invoke_26;
    id v33 = &unk_1E6CA3618;
    id v34 = v21;
    nw_connection_set_adaptive_write_handler();
  }
  if ((a4 & 2) != 0)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __xpc_remote_channel_create_block_invoke_27;
    v28[3] = &unk_1E6CA3B20;
    id v29 = v21;
    nw_connection_set_viability_changed_handler(v11, v28);
  }
  nw_connection_start(v11);
  id v22 = (void *)*((void *)v21 + 2);
  *((void *)v21 + 2) = v11;
  uint64_t v23 = v11;

  *((_DWORD *)v21 + 10) = 1;
  long long v24 = _log_0();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    xpc_remote_channel_create_cold_1();
  }

  id v25 = v39;
  id v26 = v21;

  return v26;
}

void __xpc_remote_channel_create_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    CFErrorRef v7 = nw_error_copy_cf_error(v5);
    if (nw_error_get_error_domain(v6) == nw_error_domain_posix)
    {
      int error_code = nw_error_get_error_code(v6);
      goto LABEL_6;
    }
  }
  else
  {
    CFErrorRef v7 = 0;
  }
  int error_code = 0;
LABEL_6:
  switch(a2)
  {
    case 2:
    case 5:
      break;
    case 3:
      uint64_t v9 = _log_0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_channel_create_block_invoke_cold_5();
      }

      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = v10;
      unsigned int v12 = *((_DWORD *)v10 + 10);
      if (v12 <= 2)
      {
        if (v12 != 1) {
          __xpc_remote_channel_create_block_invoke_cold_4(&v18, v19);
        }
        *((_DWORD *)v10 + 10) = 2;
        id v13 = _log_0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          __xpc_remote_channel_create_block_invoke_cold_3();
        }

        (*(void (**)(void))(v11[3] + 16))();
        xpc_remote_channel_arm_read(v11);
      }

      break;
    case 4:
      uint64_t v15 = _log_0();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_channel_create_block_invoke_cold_2();
      }

      uint64_t v16 = *(unsigned char **)(a1 + 32);
      if (v16[72]) {
        unsigned int v17 = 0;
      }
      else {
        unsigned int v17 = error_code;
      }
      xpc_remote_channel_cancel(v16, v17);
      break;
    default:
      id v14 = _log_0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __xpc_remote_channel_create_block_invoke_cold_1();
      }

      break;
  }
}

void xpc_remote_channel_cancel(void *a1, unsigned int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  dispatch_assert_queue_V2(v3[1]);
  unsigned int v4 = *((_DWORD *)v3 + 10);
  if (v4 != 4)
  {
    if (v4 <= 2)
    {
      uint64_t v5 = _log_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = state2str_0[*((unsigned int *)v3 + 10)];
        int v16 = 134218498;
        unsigned int v17 = v3;
        __int16 v18 = 1024;
        unsigned int v19 = a2;
        __int16 v20 = 2082;
        id v21 = v6;
        _os_log_impl(&dword_1DC811000, v5, OS_LOG_TYPE_INFO, "[%p] Canceling with error %d (from state %{public}s)", (uint8_t *)&v16, 0x1Cu);
      }

      *((_DWORD *)v3 + 10) = 3;
      *((_DWORD *)v3 + 11) = a2;
    }
    if (v3[2])
    {
      CFErrorRef v7 = _log_0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        xpc_remote_channel_cancel_cold_3();
      }

      nw_connection_cancel(v3[2]);
    }
    else
    {
      uint64_t v8 = v3[8];
      if (v8)
      {
        dispatch_io_close(v8, 0);
        dispatch_queue_t v9 = v3[8];
        v3[8] = 0;

        id v10 = _log_0();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          xpc_remote_channel_cancel_cold_2();
        }
      }
      dispatch_queue_t v11 = v3[7];
      unsigned int v12 = _log_0();
      id v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          xpc_remote_channel_cancel_cold_1();
        }

        dispatch_io_close(v3[7], 1uLL);
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v16 = 134217984;
          unsigned int v17 = v3;
          _os_log_impl(&dword_1DC811000, v13, OS_LOG_TYPE_INFO, "[%p] Cancelation complete", (uint8_t *)&v16, 0xCu);
        }

        *((_DWORD *)v3 + 10) = 4;
        ((void (*)(void))v3[3][2].isa)();
        dispatch_queue_t v14 = v3[3];
        v3[3] = 0;

        dispatch_queue_t v15 = v3[4];
        void v3[4] = 0;
      }
    }
  }
}

void __xpc_remote_channel_create_block_invoke_22(uint64_t a1)
{
  uint64_t v2 = _log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __xpc_remote_channel_create_block_invoke_22_cold_4();
  }

  id v3 = *(id *)(a1 + 32);
  int v4 = v3[12];
  switch(v4)
  {
    case 2:
      uint64_t v6 = _log_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_channel_create_block_invoke_22_cold_3();
      }
      goto LABEL_13;
    case 1:
      uint64_t v6 = _log_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_channel_create_block_invoke_22_cold_1();
      }
LABEL_13:

      break;
    case 0:
      uint64_t v5 = _log_0();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_channel_create_block_invoke_22_cold_2();
      }

      xpc_remote_channel_cancel(v3, 0);
      break;
  }
}

void __xpc_remote_channel_create_block_invoke_24()
{
  uint64_t v0 = _log_0();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __xpc_remote_channel_create_block_invoke_24_cold_1();
  }
}

void __xpc_remote_channel_create_block_invoke_25(uint64_t a1)
{
  uint64_t v2 = _log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __xpc_remote_channel_create_block_invoke_25_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  xpc_remote_channel_cancel(*(void **)(a1 + 32), 0x59u);
}

void __xpc_remote_channel_create_block_invoke_26(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134218240;
    uint64_t v5 = v3;
    __int16 v6 = 1024;
    int v7 = 5;
    _os_log_impl(&dword_1DC811000, v2, OS_LOG_TYPE_INFO, "[%p] aborting connection after %d retransmits", (uint8_t *)&v4, 0x12u);
  }

  xpc_remote_channel_cancel(*(void **)(a1 + 32), 0x3Cu);
}

void __xpc_remote_channel_create_block_invoke_27(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v4 = _log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = "not viable";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v5 = "viable";
    }
    *(_DWORD *)long long buf = 134218242;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = v5;
    _os_log_impl(&dword_1DC811000, v4, OS_LOG_TYPE_INFO, "[%p] connection viability changed: %s", buf, 0x16u);
  }

  if (a2)
  {
    int v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __xpc_remote_channel_create_block_invoke_30;
    v8[3] = &unk_1E6CA38D0;
    id v9 = v7;
    xpc_remote_channel_send(v9, 0, 2, MEMORY[0x1E4F14410], v8);
  }
}

void __xpc_remote_channel_create_block_invoke_30(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = _log_0();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __xpc_remote_channel_create_block_invoke_30_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1DC811000, v5, OS_LOG_TYPE_INFO, "[%p] Successfully sent PING", (uint8_t *)&v7, 0xCu);
  }
}

void xpc_remote_channel_attach_stream(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  uint64_t v8 = a3;
  id v9 = a4;
  int v10 = *((_DWORD *)v7 + 10);
  if (v10 == 4) {
    xpc_remote_channel_attach_stream_cold_1(&v28, v29);
  }
  if (*((_DWORD *)v7 + 12)) {
    xpc_remote_channel_attach_stream_cold_7(&v28, v29);
  }
  if (a2 == 3) {
    xpc_remote_channel_attach_stream_cold_2(&v28, v29);
  }
  uint64_t v11 = v9;
  __int16 v12 = _log_0();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v10 == 3)
  {
    if (v13) {
      xpc_remote_channel_attach_stream_cold_3();
    }

    dispatch_io_close(v8, 0);
    uint64_t v14 = *((void *)v7 + 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __xpc_remote_channel_attach_stream_block_invoke;
    block[3] = &unk_1E6CA3BC0;
    dispatch_queue_t v15 = &v27;
    id v27 = v11;
    int v16 = &v26;
    id v26 = v7;
    dispatch_async(v14, block);
  }
  else
  {
    if (v13) {
      xpc_remote_channel_attach_stream_cold_6();
    }

    *((_DWORD *)v7 + 12) = a2;
    objc_storeStrong((id *)v7 + 8, a3);
    unsigned int v17 = *((void *)v7 + 1);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __xpc_remote_channel_attach_stream_block_invoke_35;
    v22[3] = &unk_1E6CA39C0;
    __int16 v18 = (dispatch_io_t *)v7;
    uint64_t v23 = v18;
    id v24 = v11;
    dispatch_io_t v19 = dispatch_io_create_with_io(0, v8, v17, v22);
    dispatch_io_t v20 = v18[7];
    v18[7] = v19;

    dispatch_io_set_low_water(v18[7], 1uLL);
    if (!v18[7]) {
      xpc_remote_channel_attach_stream_cold_4(&v28, v29);
    }
    dispatch_queue_t v15 = (id *)&v23;
    int v16 = &v24;
    int v21 = *((_DWORD *)v7 + 12);
    if (v21 == 2)
    {
      _xpc_remote_channel_enqueue_rx(v18);
    }
    else
    {
      if (v21 != 1) {
        xpc_remote_channel_attach_stream_cold_5();
      }
      _xpc_remote_channel_enqueue_tx(v18);
    }
  }
}

uint64_t __xpc_remote_channel_attach_stream_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(*(void *)(a1 + 32) + 44));
}

uint64_t __xpc_remote_channel_attach_stream_block_invoke_35(uint64_t a1, unsigned int a2)
{
  int v4 = _log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __xpc_remote_channel_attach_stream_block_invoke_35_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = 0;

  xpc_remote_channel_cancel(*(void **)(a1 + 32), a2);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void _xpc_remote_channel_enqueue_tx(void *a1)
{
  id v1 = a1;
  if (*((_DWORD *)v1 + 10) <= 2u)
  {
    uint64_t v2 = _log_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_channel_enqueue_tx_cold_1();
    }

    uint64_t v3 = *((void *)v1 + 7);
    int v4 = *((void *)v1 + 1);
    io_handler[0] = MEMORY[0x1E4F143A8];
    io_handler[1] = 3221225472;
    io_handler[2] = ___xpc_remote_channel_enqueue_tx_block_invoke;
    io_handler[3] = &unk_1E6CA3C60;
    id v6 = v1;
    dispatch_io_read(v3, 0, 0x20000uLL, v4, io_handler);
  }
}

void _xpc_remote_channel_enqueue_rx(void *a1)
{
  id v1 = a1;
  if (*((_DWORD *)v1 + 10) <= 2u)
  {
    uint64_t v2 = _log_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_channel_enqueue_rx_cold_1((uint64_t)v1, v2);
    }

    uint64_t v3 = *((void *)v1 + 2);
    completion[0] = MEMORY[0x1E4F143A8];
    completion[1] = 3221225472;
    completion[2] = ___xpc_remote_channel_enqueue_rx_block_invoke;
    completion[3] = &unk_1E6CA3B70;
    id v5 = v1;
    nw_connection_receive(v3, 1u, 0x20000u, completion);
  }
}

uint64_t ___log_block_invoke_0()
{
  _log_logger_0 = (uint64_t)os_log_create("com.apple.xpc.remote", "channel");
  return MEMORY[0x1F41817F8]();
}

void ___xpc_remote_channel_enqueue_tx_block_invoke(uint64_t a1, int a2, void *a3, unsigned int a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = (void **)(a1 + 32);
  unsigned int v10 = *(_DWORD *)(v9 + 40);
  uint64_t v11 = _log_0();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10 < 3)
  {
    if (v12)
    {
      id v24 = *v8;
      if (v7) {
        size_t size = dispatch_data_get_size(v7);
      }
      else {
        size_t size = 0;
      }
      id v26 = "false";
      *(_DWORD *)long long buf = 134218754;
      id v33 = v24;
      __int16 v34 = 2048;
      if (a2) {
        id v26 = "true";
      }
      size_t v35 = size;
      __int16 v36 = 1024;
      unsigned int v37 = a4;
      __int16 v38 = 2080;
      id v39 = v26;
      _os_log_debug_impl(&dword_1DC811000, v11, OS_LOG_TYPE_DEBUG, "[%p] IO read returned %zd bytes, error = %{errno}d, done = %s", buf, 0x26u);
    }

    BOOL v13 = MEMORY[0x1E4F14410];
    uint64_t v14 = _log_0();
    dispatch_queue_t v15 = v14;
    if (v7 == v13 && !a4 && a2)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = *v8;
        *(_DWORD *)long long buf = 134217984;
        id v33 = v16;
        _os_log_impl(&dword_1DC811000, v15, OS_LOG_TYPE_INFO, "[%p] IO read returned EOF, calling write_close", buf, 0xCu);
      }

      unsigned int v17 = *v8;
      __int16 v18 = *((void *)*v8 + 2);
      dispatch_io_t v19 = *MEMORY[0x1E4F38C68];
      completion[0] = MEMORY[0x1E4F143A8];
      completion[1] = 3221225472;
      completion[2] = ___xpc_remote_channel_enqueue_tx_block_invoke_46;
      completion[3] = &unk_1E6CA3C10;
      uint64_t v31 = v17;
      nw_connection_send(v18, 0, v19, 1, completion);
      uint64_t v11 = v31;
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        ___xpc_remote_channel_enqueue_tx_block_invoke_cold_3();
      }

      dispatch_io_t v20 = *v8;
      int v21 = *((void *)*v8 + 2);
      uint64_t v22 = *MEMORY[0x1E4F38C58];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = ___xpc_remote_channel_enqueue_tx_block_invoke_47;
      v27[3] = &unk_1E6CA3C38;
      uint64_t v28 = v20;
      char v29 = a2;
      nw_connection_send(v21, v7, v22, 1, v27);
      if (a4)
      {
        uint64_t v23 = _log_0();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          ___xpc_remote_channel_enqueue_tx_block_invoke_cold_2();
        }

        xpc_remote_channel_cancel(*v8, a4);
      }
      uint64_t v11 = v28;
    }
  }
  else if (v12)
  {
    ___xpc_remote_channel_enqueue_tx_block_invoke_cold_1();
  }
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _log_0();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_channel_enqueue_tx_block_invoke_46_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134217984;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1DC811000, v5, OS_LOG_TYPE_INFO, "[%p] write-close succeeded, marking successful Tx", (uint8_t *)&v7, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
  }
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = _log_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v11 = 134218242;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v3;
      _os_log_impl(&dword_1DC811000, v4, OS_LOG_TYPE_INFO, "[%p] Connection write returned error %@", (uint8_t *)&v11, 0x16u);
    }

    uint64_t v6 = *(void **)(a1 + 32);
    unsigned int error_code = nw_error_get_error_code(v3);
    xpc_remote_channel_cancel(v6, error_code);
  }
  else
  {
    int v8 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v9 = _log_0();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        ___xpc_remote_channel_enqueue_tx_block_invoke_47_cold_2();
      }

      _xpc_remote_channel_enqueue_tx(*(void *)(a1 + 32));
    }
    else
    {
      if (v10) {
        ___xpc_remote_channel_enqueue_tx_block_invoke_47_cold_1();
      }
    }
  }
}

void ___xpc_remote_channel_enqueue_rx_block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a2;
  id v10 = a3;
  int v11 = a5;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v12 = a1 + 32;
  if (*(_DWORD *)(v13 + 40) >= 3u)
  {
    uint64_t v14 = _log_0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_channel_enqueue_rx_block_invoke_cold_3(v12, v9, v14);
    }
  }
  if (!v9 || v11)
  {
    if (v9 || !a4 || v11)
    {
      if (!v11) {
        ___xpc_remote_channel_enqueue_rx_block_invoke_cold_2();
      }
      uint64_t v23 = _log_0();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = *(void **)v12;
        *(_DWORD *)long long buf = 134218242;
        char v29 = v24;
        __int16 v30 = 2112;
        uint64_t v31 = v11;
        _os_log_impl(&dword_1DC811000, v23, OS_LOG_TYPE_INFO, "[%p] Connection read got error %@. Canceling remote channel.", buf, 0x16u);
      }

      id v25 = *(void **)v12;
      unsigned int error_code = nw_error_get_error_code(v11);
      int v21 = v25;
    }
    else
    {
      dispatch_io_t v19 = _log_0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        dispatch_io_t v20 = *(void **)v12;
        *(_DWORD *)long long buf = 134217984;
        char v29 = v20;
        _os_log_impl(&dword_1DC811000, v19, OS_LOG_TYPE_INFO, "[%p] Connection read got EOF. Canceling remote channel.", buf, 0xCu);
      }

      int v21 = *(void **)v12;
      unsigned int error_code = 0;
    }
    xpc_remote_channel_cancel(v21, error_code);
  }
  else
  {
    uint64_t v15 = _log_0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      ___xpc_remote_channel_enqueue_rx_block_invoke_cold_1(v12, v9);
    }

    int v16 = *(void **)v12;
    unsigned int v17 = *(NSObject **)(*(void *)v12 + 56);
    __int16 v18 = v16[1];
    io_handler[0] = MEMORY[0x1E4F143A8];
    io_handler[1] = 3221225472;
    io_handler[2] = ___xpc_remote_channel_enqueue_rx_block_invoke_49;
    io_handler[3] = &unk_1E6CA3C60;
    id v27 = v16;
    dispatch_io_write(v17, 0, v9, v18, io_handler);
  }
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_49(uint64_t a1, int a2, void *a3, unsigned int a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  int v8 = (void **)(a1 + 32);
  if (*(_DWORD *)(v9 + 40) <= 2u)
  {
    if (a4)
    {
      if ((a2 & 1) == 0) {
        ___xpc_remote_channel_enqueue_rx_block_invoke_49_cold_2(&v13, buf);
      }
      id v10 = _log_0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = *v8;
        *(_DWORD *)long long buf = 134218240;
        uint64_t v15 = v11;
        __int16 v16 = 1024;
        unsigned int v17 = a4;
        _os_log_impl(&dword_1DC811000, v10, OS_LOG_TYPE_INFO, "[%p] IO write got error %d", buf, 0x12u);
      }

      xpc_remote_channel_cancel(*v8, a4);
LABEL_10:
      _xpc_remote_channel_enqueue_rx(*v8);
      goto LABEL_11;
    }
    uint64_t v12 = _log_0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      ___xpc_remote_channel_enqueue_rx_block_invoke_49_cold_1((int)v8, v7);
    }

    if (a2) {
      goto LABEL_10;
    }
  }
LABEL_11:
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_16_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void *xpc_remote_listener_create_for_remote_service(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  int v11 = (void *)v10[1];
  v10[1] = v7;
  id v12 = v7;

  uint64_t v13 = MEMORY[0x1E01A4790](v9);
  uint64_t v14 = (void *)v10[3];
  v10[3] = v13;

  uint64_t v15 = MEMORY[0x1E01A4790](v8);
  __int16 v16 = (void *)v10[4];
  void v10[4] = v15;

  if (_log_onceToken_1 != -1) {
    dispatch_once(&_log_onceToken_1, &__block_literal_global_1);
  }
  unsigned int v17 = _log_logger_1;
  if (os_log_type_enabled((os_log_t)_log_logger_1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v21 = a1;
    _os_log_impl(&dword_1DC811000, v17, OS_LOG_TYPE_DEFAULT, "Checking in for remote service: %s", buf, 0xCu);
  }
  dispatch_io_t v19 = v10;
  remote_service_listen_with_device();

  return v19;
}

uint64_t __xpc_remote_listener_create_for_remote_service_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
}

void xpc_remote_listener_cancel(void *a1)
{
  id v1 = a1;
  dispatch_assert_queue_V2(v1[1]);
  if (*((_DWORD *)v1 + 4) != 1)
  {
    *((unsigned char *)v1 + 40) = 1;
    _os_crash();
    __break(1u);
  }
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

uint64_t ___log_block_invoke_1()
{
  _log_logger_1 = (uint64_t)os_log_create("com.apple.xpc.remote", "listener");
  return MEMORY[0x1F41817F8]();
}

void xpc_remote_connection_get_remote_service_version_cold_1()
{
}

void __xpc_remote_connection_set_local_service_version_block_invoke_cold_1()
{
}

void xpc_remote_connection_create_with_remote_service_cold_1()
{
}

void xpc_remote_connection_create_with_remote_service_cold_2()
{
}

void xpc_remote_connection_create_with_remote_service_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void xpc_remote_connection_set_tls_cold_1()
{
}

void xpc_remote_connection_set_tls_cold_2()
{
}

void xpc_remote_connection_set_tls_cold_3()
{
}

void _xpc_remote_connection_parse_flags_cold_1(void *a1, _OWORD *a2)
{
}

void xpc_remote_connection_create_remote_service_listener_cold_1()
{
}

void _xpc_remote_connection_parse_mode_flags_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] RemoteXPC in server mode", v2, v3, v4, v5, v6);
}

void xpc_remote_connection_setup_nw_parameters_cold_1(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_activate_block_invoke_cold_1()
{
}

void __xpc_remote_connection_activate_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_activate_block_invoke_cold_3(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_cold_1(void *a1, _OWORD *a2)
{
}

void xpc_remote_connection_send_message_cold_1()
{
}

void __xpc_remote_connection_send_message_block_invoke_cold_1(void *a1, _OWORD *a2)
{
}

void _xpc_remote_message_create_cold_2()
{
}

void _xpc_remote_connection_send_reply_message_cold_1(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_send_message_with_reply_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void xpc_remote_connection_send_message_with_reply_sync_cold_2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Semaphore signaled. Returning reply.", v2, v3, v4, v5, v6);
}

void xpc_remote_connection_send_message_with_reply_sync_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Waiting on semaphore", v2, v3, v4, v5, v6);
}

void xpc_remote_connection_send_message_with_reply_sync_cold_4()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Doing synchronous message-send with reply...", v2, v3, v4, v5, v6);
}

void __xpc_remote_connection_send_message_with_reply_sync_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Received reply", v2, v3, v4, v5, v6);
}

void xpc_remote_connection_send_reply_cold_1(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_message_dispose_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_listen_block_invoke_cold_1(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_listen_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_listen_block_invoke_cold_3()
{
}

void ___xpc_remote_connection_listen_block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _xpc_remote_connection_connect_complete_cold_1()
{
}

void _xpc_remote_connection_connect_complete_cold_3()
{
  OUTLINED_FUNCTION_10();
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_23(&dword_1DC811000, v1, v2, "[%p] root channel (%p) created", v3, v4);
}

void _xpc_remote_connection_connect_complete_cold_4(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_complete_cold_5(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_complete_cold_6(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_complete_cold_7(void *a1, _OWORD *a2, void *a3)
{
}

uint64_t _xpc_remote_connection_connect_complete_cold_8()
{
  return _os_assumes_log();
}

void _xpc_remote_connection_connect_complete_cold_9()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] connect completed after connection got cancelled", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_connect_complete_cold_10(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_complete_cold_11(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_complete_cold_12(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_failed_cold_1(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_failed_cold_2(void *a1, _OWORD *a2, void *a3)
{
}

void _xpc_remote_connection_connect_failed_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] connect failed after connection got cancelled", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_connect_failed_cold_4(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_failed_cold_5(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_doa_cold_3(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_1(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_3(void *a1, _OWORD *a2, void *a3)
{
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_4(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_handle_read_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12(&dword_1DC811000, v0, v1, "[%p] Received inconsistent msg_flags", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_handle_read_cold_2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12(&dword_1DC811000, v0, v1, "[%p] Invalid send-once notification received", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_handle_read_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12(&dword_1DC811000, v0, v1, "[%p] Invalid message received", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_handle_read_cold_4()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_13(&dword_1DC811000, v0, v1, "[%p] Received bogus reply message %llu", v2, v3);
}

void _xpc_remote_connection_handle_read_cold_5(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_handle_read_cold_6()
{
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_13(&dword_1DC811000, v0, v1, "[%p] Received reply on a non-reply channel (%p) from a peer that should know better", v2, v3);
}

void _xpc_remote_connection_handle_read_cold_7()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] connection_connected: still waiting on root channel HELO", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_handle_read_cold_8()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] connection_connected: still waiting on reply channel HELO", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_handle_read_cold_9(void *a1, _OWORD *a2, void *a3)
{
}

void _xpc_remote_connection_handle_read_cold_10()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] empty HELO message received", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_handle_read_cold_11()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12(&dword_1DC811000, v0, v1, "[%p] Root channel invalid HELO received", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_handle_read_cold_12()
{
  OUTLINED_FUNCTION_10();
  WORD2(v3) = 2080;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_23(&dword_1DC811000, v0, v1, "[%p] HELO message received: %s", v2, v3);
}

void _xpc_remote_connection_handle_read_cold_13()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12(&dword_1DC811000, v0, v1, "[%p] Root channel duplicate HELO received", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_handle_read_cold_14()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12(&dword_1DC811000, v0, v1, "[%p] Reply channel duplicate HELO received", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_handle_read_cold_15()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12(&dword_1DC811000, v0, v1, "[%p] Received HELO for unknown channel", v2, v3, v4, v5, v6);
}

void ___xpc_remote_connection_setup_nw_listener_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_1DC811000, v0, v1, "[%p] listener got error %{errno}d");
}

void __xpc_remote_connection_teardown_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] disconnect: already disconnecting", v2, v3, v4, v5, v6);
}

void __xpc_remote_connection_teardown_cold_2(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_teardown_continue_cold_1(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_teardown_continue_cold_2()
{
}

void __xpc_remote_connection_teardown_continue_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] disconnect_continue: at least one stream channel still present", v2, v3, v4, v5, v6);
}

void __xpc_remote_connection_teardown_continue_cold_4()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] disconnect_continue: root_listener still present", v2, v3, v4, v5, v6);
}

void __xpc_remote_connection_teardown_continue_cold_5()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] disconnect_continue: reply_channel still present", v2, v3, v4, v5, v6);
}

void __xpc_remote_connection_teardown_continue_cold_6()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] disconnect_continue: root_channel still present", v2, v3, v4, v5, v6);
}

void __xpc_remote_connection_teardown_continue_cold_7(void *a1, _OWORD *a2, void *a3)
{
}

void _xpc_remote_connection_flush_cold_1()
{
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Got READY for incoming stream", v2, v3, v4, v5, v6);
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_cold_2(void *a1, _OWORD *a2, id *a3)
{
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_1DC811000, v0, v1, "[%p] Got HEADER with invalid msg_flags %hu", v2, v3);
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_2()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_12(&dword_1DC811000, v0, v1, "[%p] Got HEADER with invalid msg_id 0", v2, v3, v4, v5, v6);
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_3()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_12(&dword_1DC811000, v0, v1, "[%p] First message server reply channel not OPENS_REPLY_CHANNEL", v2, v3, v4, v5, v6);
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_4()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_13(&dword_1DC811000, v0, v1, "[%p] Remote server attempted to open a reply channel (channel %p)", v2, v3);
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_5()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_13(&dword_1DC811000, v0, v1, "[%p] Remote peer attempted to open multiple reply channels (channel %p)", v2, v3);
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_234_cold_6()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_12(&dword_1DC811000, v0, v1, "[%p] Unexpected non-HEADER message", v2, v3, v4, v5, v6);
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_235_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_1DC811000, v0, v1, "[%p] Got error %{errno}d on reply HELO send");
}

void _xpc_remote_channel_send_stream_header_cold_1(void *a1, _OWORD *a2)
{
}

void _xpc_remote_channel_send_stream_header_cold_2(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_ready_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_1DC811000, v0, v1, "[%p] Got error %{errno}d on HELO send");
}

void ___xpc_remote_connection_ready_block_invoke_239_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_1DC811000, v0, v1, "[%p] Got CANCELED with error %{errno}d on reply channel");
}

void ___xpc_remote_connection_handle_read_block_invoke_cold_1()
{
}

void _xpc_remote_connection_wakeup_cold_1()
{
}

void _xpc_remote_connection_wakeup_cold_2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] wakeup while connecting, ignoring", v2, v3, v4, v5, v6);
}

void _xpc_remote_connection_send_ool_message_content_cold_1(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_send_ool_message_content_cold_2()
{
}

void ___xpc_remote_connection_wakeup_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_1DC811000, v0, v1, "[%p] Send failed with %{errno}d, not triggering wakeup");
}

void ___recv_file_transfer_block_invoke_2_cold_1(void *a1, _OWORD *a2)
{
}

void ___recv_file_transfer_block_invoke_2_cold_2(void *a1, _OWORD *a2)
{
}

void ___recv_file_transfer_block_invoke_5_cold_1(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_message_create_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___xpc_remote_message_create_block_invoke_cold_2()
{
}

void ___xpc_remote_connection_send_reply_message_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_1DC811000, v0, v1, "[%p] Reply send failed with %{errno}d");
}

void xpc_remote_channel_create_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Channel Starting", v2, v3, v4, v5, v6);
}

void __xpc_remote_channel_create_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_1DC811000, v0, v1, "[%p] Unexpected nw_connection state: %d", v2, v3);
}

void __xpc_remote_channel_create_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1DC811000, v1, OS_LOG_TYPE_DEBUG, "[%p] Got nw_connection failed with error %{public}@", v2, 0x16u);
}

void __xpc_remote_channel_create_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Channel Ready", v2, v3, v4, v5, v6);
}

void __xpc_remote_channel_create_block_invoke_cold_4(void *a1, _OWORD *a2)
{
}

void __xpc_remote_channel_create_block_invoke_cold_5()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Got nw_connection ready", v2, v3, v4, v5, v6);
}

void xpc_remote_channel_cancel_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] channel_cancel: closing stream_io", v2, v3, v4, v5, v6);
}

void xpc_remote_channel_cancel_cold_2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] channel_cancel: closing parent_io", v2, v3, v4, v5, v6);
}

void xpc_remote_channel_cancel_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] channel_cancel: canceling nw_connection_t", v2, v3, v4, v5, v6);
}

void __xpc_remote_channel_create_block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Tx stream got read closed, waiting for state_failed", v2, v3, v4, v5, v6);
}

void __xpc_remote_channel_create_block_invoke_22_cold_2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Got read closed, CANCELING", v2, v3, v4, v5, v6);
}

void __xpc_remote_channel_create_block_invoke_22_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Rx stream got read closed, reading until error", v2, v3, v4, v5, v6);
}

void __xpc_remote_channel_create_block_invoke_22_cold_4()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Got nw_connection read close", v2, v3, v4, v5, v6);
}

void __xpc_remote_channel_create_block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Got nw_connection write close", v2, v3, v4, v5, v6);
}

void __xpc_remote_channel_create_block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Got nw_connection cancel handler", v2, v3, v4, v5, v6);
}

void __xpc_remote_channel_create_block_invoke_30_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_1DC811000, v0, v1, "[%p] Got error %{errno}d on PING send");
}

void xpc_remote_channel_arm_read_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_9();
  _os_crash_msg();
  __break(1u);
}

void xpc_remote_channel_arm_read_cold_2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Not arming header read on connectionless channel", v2, v3, v4, v5, v6);
}

void xpc_remote_channel_arm_read_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Arming read", v2, v3, v4, v5, v6);
}

void __xpc_remote_channel_arm_read_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_1DC811000, v0, OS_LOG_TYPE_ERROR, "[%p] Invalid message size received, disconnecting", v1, 0xCu);
}

void __xpc_remote_channel_arm_read_block_invoke_cold_2(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  OUTLINED_FUNCTION_9();
  _os_crash_msg();
  __break(1u);
}

void __xpc_remote_channel_arm_read_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Not arming body read on connectionless channel", v2, v3, v4, v5, v6);
}

void __xpc_remote_channel_arm_read_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_7_0(&dword_1DC811000, v0, v1, "[%p] Enqueueing body read of %u bytes", v2, v3);
}

void __xpc_remote_channel_arm_read_block_invoke_cold_5()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_10();
  __int16 v3 = 1040;
  int v4 = 24;
  __int16 v5 = 2096;
  uint64_t v6 = v0;
  _os_log_debug_impl(&dword_1DC811000, v1, OS_LOG_TYPE_DEBUG, "[%p] Header recieved. %{struct:remote_wire_header}.*P", v2, 0x1Cu);
}

void xpc_remote_channel_attach_stream_cold_1(void *a1, _OWORD *a2)
{
}

void xpc_remote_channel_attach_stream_cold_2(void *a1, _OWORD *a2)
{
}

void xpc_remote_channel_attach_stream_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] not attaching", v2, v3, v4, v5, v6);
}

void xpc_remote_channel_attach_stream_cold_4(void *a1, _OWORD *a2)
{
}

void xpc_remote_channel_attach_stream_cold_5()
{
}

void xpc_remote_channel_attach_stream_cold_6()
{
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_7_0(&dword_1DC811000, v0, v1, "[%p] attaching channel to stream (direction=%d)...", v2, v3);
}

void xpc_remote_channel_attach_stream_cold_7(void *a1, _OWORD *a2)
{
}

void __xpc_remote_channel_attach_stream_block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1DC811000, v0, v1, "[%p] IO cleanup handler called with error = %{errno}d");
}

void _xpc_remote_channel_enqueue_tx_cold_1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Enqueueing IO read", v2, v3, v4, v5, v6);
}

void _xpc_remote_channel_enqueue_rx_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 134218496;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = 1;
  __int16 v6 = 1024;
  int v7 = 0x20000;
  _os_log_debug_impl(&dword_1DC811000, a2, OS_LOG_TYPE_DEBUG, "[%p] Enqueueing connection read for %d to %d bytes", (uint8_t *)&v2, 0x18u);
}

void ___xpc_remote_channel_header_handler_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_1DC811000, v0, OS_LOG_TYPE_ERROR, "[%p] Body read returned without data, disconnecting", v1, 0xCu);
}

void ___xpc_remote_channel_header_handler_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Body received.", v2, v3, v4, v5, v6);
}

void ___xpc_remote_channel_header_handler_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_1DC811000, v0, v1, "[%p] Body read returned with error=%@, disconnecting");
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] IO read returned post-cancel, ignoring", v2, v3, v4, v5, v6);
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1DC811000, v0, v1, "[%p] IO read got error %d", v2, v3);
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Enqueueing conn write", v2, v3, v4, v5, v6);
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_46_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_13(&dword_1DC811000, v0, v1, "[%p] write close failed with error %@");
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_47_cold_1()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Connection write completed, more writes expected", v2, v3, v4, v5, v6);
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_47_cold_2()
{
  OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_6(&dword_1DC811000, v0, v1, "[%p] Connection write completed, reenqueueing", v2, v3, v4, v5, v6);
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_cold_1(int a1, dispatch_data_t data)
{
  dispatch_data_get_size(data);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_16_0(&dword_1DC811000, v2, v3, "[%p] Connection read succeeded for %zd bytes. Enqueueing IO write.", v4, v5, v6, v7, v8);
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_cold_2()
{
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_cold_3(int a1, dispatch_data_t data, NSObject *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (data) {
    dispatch_data_get_size(data);
  }
  OUTLINED_FUNCTION_9_0();
  _os_log_error_impl(&dword_1DC811000, a3, OS_LOG_TYPE_ERROR, "[%p] DROPPING %zu bytes on canceled stream", v4, 0x16u);
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_49_cold_1(int a1, dispatch_data_t data)
{
  if (data) {
    dispatch_data_get_size(data);
  }
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_16_0(&dword_1DC811000, v2, v3, "[%p] IO write complete, %zd bytes remaining", v4, v5, v6, v7, v8);
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_49_cold_2(void *a1, _OWORD *a2)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1F40C9F98]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1F40C9FA8]();
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

uint64_t _xpc_dictionary_extract_reply_msg_id()
{
  return MEMORY[0x1F40CA1C8]();
}

uint64_t _xpc_dictionary_get_reply_msg_id()
{
  return MEMORY[0x1F40CA1D0]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA20](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA30](data, buffer_ptr, size_ptr);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1F40CBA48](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
}

dispatch_io_t dispatch_io_create_with_io(dispatch_io_type_t type, dispatch_io_t io, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1F40CBAE0](type, io, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
}

void dispatch_io_write(dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x1F40F2A88]();
}

nw_parameters_t nw_connection_copy_parameters(nw_connection_t connection)
{
  return (nw_parameters_t)MEMORY[0x1F40F2AC0](connection);
}

uint64_t nw_connection_create_with_connected_socket_and_parameters()
{
  return MEMORY[0x1F40F2B08]();
}

uint64_t nw_connection_create_with_connection()
{
  return MEMORY[0x1F40F2B10]();
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

uint64_t nw_connection_set_adaptive_write_handler()
{
  return MEMORY[0x1F40F2C48]();
}

uint64_t nw_connection_set_cancel_handler()
{
  return MEMORY[0x1F40F2C58]();
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x1F40F2C60]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x1F40F2C88]();
}

void nw_connection_set_viability_changed_handler(nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x1F40F2CA0]();
}

void nw_connection_start(nw_connection_t connection)
{
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1F40F2E38](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1F40F2F60](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x1F40F2F68](error);
}

void nw_listener_cancel(nw_listener_t listener)
{
}

nw_listener_t nw_listener_create_with_connection(nw_connection_t connection, nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1F40F3328](connection, parameters);
}

uint64_t nw_listener_set_event_handler()
{
  return MEMORY[0x1F40F3348]();
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

uint64_t nw_parameters_add_protocol_stack_member()
{
  return MEMORY[0x1F40F33E0]();
}

nw_parameters_t nw_parameters_copy(nw_parameters_t parameters)
{
  return (nw_parameters_t)MEMORY[0x1F40F3408](parameters);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1F40F3488]();
}

uint64_t nw_parameters_create_protocol_parameters()
{
  return MEMORY[0x1F40F34A8]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x1F40F35E8]();
}

uint64_t nw_parameters_set_server_mode()
{
  return MEMORY[0x1F40F3770]();
}

uint64_t nw_protocol_http2_transport_identifier()
{
  return MEMORY[0x1F40F3AC0]();
}

uint64_t nw_protocol_http2_transport_parameters_set_connection_receive_window_size()
{
  return MEMORY[0x1F40F3AC8]();
}

uint64_t nw_protocol_http2_transport_parameters_set_stream_receive_window_size()
{
  return MEMORY[0x1F40F3AD0]();
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x1F40F3F58](options);
}

nw_protocol_options_t nw_tls_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x1F40F3F60]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t remote_device_copy_xpc_remote_connection_tls_identity()
{
  return MEMORY[0x1F41496F0]();
}

uint64_t remote_device_copy_xpc_remote_connection_tls_verify_block()
{
  return MEMORY[0x1F41496F8]();
}

uint64_t remote_device_get_xpc_remote_connection_mode_flags()
{
  return MEMORY[0x1F4149730]();
}

uint64_t remote_device_get_xpc_remote_connection_version_flags()
{
  return MEMORY[0x1F4149738]();
}

uint64_t remote_device_xpc_remote_connection_tls_enabled()
{
  return MEMORY[0x1F4149790]();
}

uint64_t remote_service_connect_socket()
{
  return MEMORY[0x1F4149798]();
}

uint64_t remote_service_copy_device()
{
  return MEMORY[0x1F41497A0]();
}

uint64_t remote_service_copy_xpc_remote_connection_tls_identity()
{
  return MEMORY[0x1F41497A8]();
}

uint64_t remote_service_copy_xpc_remote_connection_tls_verify_block()
{
  return MEMORY[0x1F41497B0]();
}

uint64_t remote_service_get_name()
{
  return MEMORY[0x1F41497B8]();
}

uint64_t remote_service_get_version()
{
  return MEMORY[0x1F41497C0]();
}

uint64_t remote_service_get_xpc_remote_connection_version_flags()
{
  return MEMORY[0x1F41497C8]();
}

uint64_t remote_service_listen_with_device()
{
  return MEMORY[0x1F41497D0]();
}

uint64_t remote_service_xpc_remote_connection_tls_enabled()
{
  return MEMORY[0x1F41497D8]();
}

uint64_t remote_socket_create_connected_ipv6_pair()
{
  return MEMORY[0x1F41497E0]();
}

void sec_protocol_options_append_tls_ciphersuite_group(sec_protocol_options_t options, tls_ciphersuite_group_t group)
{
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
}

void sec_protocol_options_set_max_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
}

void sec_protocol_options_set_min_tls_protocol_version(sec_protocol_options_t options, tls_protocol_version_t version)
{
}

void sec_protocol_options_set_peer_authentication_required(sec_protocol_options_t options, BOOL peer_authentication_required)
{
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40CDFC0](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return MEMORY[0x1F40CE098](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

uint64_t xpc_create_from_serialization()
{
  return MEMORY[0x1F40CED80]();
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_extension_type_init()
{
  return MEMORY[0x1F40CF0B0]();
}

uint64_t xpc_file_transfer_copy_io()
{
  return MEMORY[0x1F40CF0D8]();
}

uint64_t xpc_file_transfer_get_transfer_id()
{
  return MEMORY[0x1F40CF0F8]();
}

uint64_t xpc_file_transfer_send_finished()
{
  return MEMORY[0x1F40CF100]();
}

uint64_t xpc_file_transfer_set_transport_writing_callbacks()
{
  return MEMORY[0x1F40CF108]();
}

uint64_t xpc_file_transfer_write_finished()
{
  return MEMORY[0x1F40CF110]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_make_serialization()
{
  return MEMORY[0x1F40CF1F8]();
}

uint64_t xpc_make_serialization_with_ool()
{
  return MEMORY[0x1F40CF200]();
}

uint64_t xpc_receive_remote_msg()
{
  return MEMORY[0x1F40CF238]();
}

void xpc_transaction_begin(void)
{
}