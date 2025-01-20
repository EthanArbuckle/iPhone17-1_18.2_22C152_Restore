@interface RESET
@end

@implementation RESET

uint64_t __quic_frame_acknowledged_RESET_STREAM_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v4 = (unsigned char *)(a2 + 250);
  if (*(unsigned char *)(a2 + 250) == 2
    && (qlog_debug_enabled
     || (qlog_nwlog_enabled & 1) != 0
     || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEFAULT))
    && *(void *)(*(void *)(a1 + 32) + 1112))
  {
    uint64_t v5 = _os_log_pack_size();
    v30 = &v28;
    v6 = (char *)&v28 - ((MEMORY[0x270FA5388](v5, v5) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v7 = _os_log_pack_fill();
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v29 = v8 + 976;
    uint64_t v9 = *(void *)(v8 + 1112);
    if (quic_cid_describe_state % 3 == 2) {
      v10 = &quic_cid_describe_cid_buf2;
    }
    else {
      v10 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      v11 = v10;
    }
    else {
      v11 = &quic_cid_describe_cid_buf1;
    }
    int v12 = ++quic_cid_describe_state;
    unsigned int v13 = *(unsigned __int8 *)(v9 + 38);
    long long v14 = 0uLL;
    *(_OWORD *)((char *)v11 + 25) = 0u;
    if (v13 >= 0x14) {
      uint64_t v15 = 20;
    }
    else {
      uint64_t v15 = v13;
    }
    _OWORD *v11 = 0uLL;
    v11[1] = 0uLL;
    if (v15)
    {
      v16 = (unsigned __int8 *)(v9 + 39);
      do
      {
        int v17 = *v16++;
        snprintf((char *)v11, 0x29uLL, "%s%02x", (const char *)v11, v17);
        --v15;
      }
      while (v15);
      int v12 = quic_cid_describe_state;
      long long v14 = 0uLL;
    }
    uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 1112);
    if (v12 % 3 == 2) {
      v19 = &quic_cid_describe_cid_buf2;
    }
    else {
      v19 = &quic_cid_describe_cid_buf3;
    }
    if (v12 % 3) {
      v20 = v19;
    }
    else {
      v20 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_state = v12 + 1;
    if (*(unsigned __int8 *)(v18 + 17) >= 0x14u) {
      uint64_t v21 = 20;
    }
    else {
      uint64_t v21 = *(unsigned __int8 *)(v18 + 17);
    }
    _OWORD *v20 = v14;
    v20[1] = v14;
    *(_OWORD *)((char *)v20 + 25) = v14;
    if (v21)
    {
      v22 = (unsigned __int8 *)(v18 + 18);
      do
      {
        int v23 = *v22++;
        snprintf((char *)v20, 0x29uLL, "%s%02x", (const char *)v20, v23);
        --v21;
      }
      while (v21);
    }
    uint64_t v24 = *(void *)a2;
    int v25 = (*(_DWORD *)(a2 + 352) >> 15) & 1;
    *(_DWORD *)uint64_t v7 = 136447490;
    *(void *)(v7 + 4) = "quic_frame_acknowledged_RESET_STREAM_block_invoke";
    *(_WORD *)(v7 + 12) = 2082;
    *(void *)(v7 + 14) = v29;
    *(_WORD *)(v7 + 22) = 2082;
    *(void *)(v7 + 24) = v11;
    *(_WORD *)(v7 + 32) = 2082;
    *(void *)(v7 + 34) = v20;
    *(_WORD *)(v7 + 42) = 2048;
    *(void *)(v7 + 44) = v24;
    *(_WORD *)(v7 + 52) = 1024;
    *(_DWORD *)(v7 + 54) = v25;
    qlog_internal(0, (uint64_t)v6, 590);
  }
  quic_fsm_send_stream_change(v4, 6u);
  posix_error = (void *)nw_error_create_posix_error();
  quic_stream_close(*(void *)(a1 + 32), a2);
  if (posix_error) {
    nw_release(posix_error);
  }
  return 1;
}

BOOL __quic_frame_process_RESET_STREAM_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  quic_stream_set_application_error(a2);
  if ((qlog_debug_enabled || (qlog_nwlog_enabled & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
    && *(void *)(*(void *)(a1 + 40) + 1112))
  {
    uint64_t v4 = _os_log_pack_size();
    v78 = &v76;
    uint64_t v5 = (char *)&v76 - ((MEMORY[0x270FA5388](v4, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    uint64_t v6 = _os_log_pack_fill();
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v77 = v7 + 976;
    uint64_t v8 = *(void *)(v7 + 1112);
    if (quic_cid_describe_state % 3 == 2) {
      uint64_t v9 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v9 = &quic_cid_describe_cid_buf3;
    }
    if (quic_cid_describe_state % 3) {
      v10 = v9;
    }
    else {
      v10 = &quic_cid_describe_cid_buf1;
    }
    int v11 = ++quic_cid_describe_state;
    unsigned int v12 = *(unsigned __int8 *)(v8 + 38);
    long long v13 = 0uLL;
    *(_OWORD *)((char *)v10 + 25) = 0u;
    if (v12 >= 0x14) {
      uint64_t v14 = 20;
    }
    else {
      uint64_t v14 = v12;
    }
    _OWORD *v10 = 0uLL;
    v10[1] = 0uLL;
    if (v14)
    {
      uint64_t v15 = (unsigned __int8 *)(v8 + 39);
      do
      {
        int v16 = *v15++;
        snprintf((char *)v10, 0x29uLL, "%s%02x", (const char *)v10, v16);
        --v14;
      }
      while (v14);
      int v11 = quic_cid_describe_state;
      long long v13 = 0uLL;
    }
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 1112);
    if (v11 % 3 == 2) {
      uint64_t v18 = &quic_cid_describe_cid_buf2;
    }
    else {
      uint64_t v18 = &quic_cid_describe_cid_buf3;
    }
    if (v11 % 3) {
      v19 = v18;
    }
    else {
      v19 = &quic_cid_describe_cid_buf1;
    }
    quic_cid_describe_state = v11 + 1;
    if (*(unsigned __int8 *)(v17 + 17) >= 0x14u) {
      uint64_t v20 = 20;
    }
    else {
      uint64_t v20 = *(unsigned __int8 *)(v17 + 17);
    }
    _OWORD *v19 = v13;
    v19[1] = v13;
    *(_OWORD *)((char *)v19 + 25) = v13;
    if (v20)
    {
      uint64_t v21 = (unsigned __int8 *)(v17 + 18);
      do
      {
        int v22 = *v21++;
        snprintf((char *)v19, 0x29uLL, "%s%02x", (const char *)v19, v22);
        --v20;
      }
      while (v20);
    }
    uint64_t v23 = *(void *)a2;
    int v24 = *(unsigned __int8 *)(a2 + 251);
    uint64_t v25 = *(void *)(a1 + 40);
    uint64_t v26 = *(void *)(v25 + 928);
    uint64_t v27 = *(void *)(v25 + 936);
    uint64_t v28 = *(void *)(a2 + 160);
    uint64_t v29 = *(void *)(a2 + 168);
    uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 32);
    *(_DWORD *)uint64_t v6 = 136448770;
    *(void *)(v6 + 4) = "quic_frame_process_RESET_STREAM_block_invoke";
    *(_WORD *)(v6 + 12) = 2082;
    *(void *)(v6 + 14) = v77;
    *(_WORD *)(v6 + 22) = 2082;
    *(void *)(v6 + 24) = v10;
    *(_WORD *)(v6 + 32) = 2082;
    *(void *)(v6 + 34) = v19;
    *(_WORD *)(v6 + 42) = 2048;
    *(void *)(v6 + 44) = v23;
    *(_WORD *)(v6 + 52) = 1024;
    *(_DWORD *)(v6 + 54) = v24;
    *(_WORD *)(v6 + 58) = 2048;
    *(void *)(v6 + 60) = v26;
    *(_WORD *)(v6 + 68) = 2048;
    *(void *)(v6 + 70) = v27;
    *(_WORD *)(v6 + 78) = 2048;
    *(void *)(v6 + 80) = v28;
    *(_WORD *)(v6 + 88) = 2048;
    *(void *)(v6 + 90) = v29;
    *(_WORD *)(v6 + 98) = 2048;
    *(void *)(v6 + 100) = v30;
    qlog_internal(1, (uint64_t)v5, 493);
  }
  *(_DWORD *)(a2 + 352) |= 0x10000u;
  unint64_t v31 = *(void *)(a2 + 160);
  unint64_t v32 = *(void *)(*(void *)(a1 + 32) + 32);
  unint64_t v33 = v32 - v31;
  if (v32 > v31)
  {
    uint64_t v34 = *(void *)(a1 + 40);
    uint64_t v35 = *(void *)(v34 + 928);
    int v36 = qlog_debug_enabled;
    char v37 = qlog_nwlog_enabled;
    *(void *)(v34 + 928) = v35 + v33;
    if (__CFADD__(v35, v33))
    {
      if (v36) {
        char v37 = 1;
      }
      if ((v37 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_FAULT))
      {
        uint64_t v38 = _os_log_pack_size();
        v39 = (char *)&v76 - ((MEMORY[0x270FA5388](v38, v38) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v40 = _os_log_pack_fill();
        uint64_t v41 = *(void *)(*(void *)(a1 + 40) + 928);
        *(_DWORD *)uint64_t v40 = 136447234;
        *(void *)(v40 + 4) = "quic_frame_process_RESET_STREAM_block_invoke";
        *(_WORD *)(v40 + 12) = 2082;
        *(void *)(v40 + 14) = "conn->inorder_offset";
        *(_WORD *)(v40 + 22) = 2048;
        *(void *)(v40 + 24) = v41 - v33;
        *(_WORD *)(v40 + 32) = 2048;
        *(void *)(v40 + 34) = v33;
        *(_WORD *)(v40 + 42) = 2048;
        *(void *)(v40 + 44) = v41;
        qlog_internal(17, (uint64_t)v39, 509);
        int v36 = qlog_debug_enabled;
        char v37 = qlog_nwlog_enabled;
      }
      else
      {
        char v37 = 0;
        int v36 = 0;
      }
      *(void *)(*(void *)(a1 + 40) + 928) = -1;
    }
    if (v36 || (v37 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v42 = _os_log_pack_size();
      v43 = (char *)&v76 - ((MEMORY[0x270FA5388](v42, v42) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v44 = _os_log_pack_fill();
      uint64_t v45 = *(void *)a2;
      uint64_t v46 = *(void *)(*(void *)(a1 + 40) + 928);
      *(_DWORD *)uint64_t v44 = 136446722;
      *(void *)(v44 + 4) = "quic_frame_process_RESET_STREAM_block_invoke";
      *(_WORD *)(v44 + 12) = 2048;
      *(void *)(v44 + 14) = v45;
      *(_WORD *)(v44 + 22) = 2048;
      *(void *)(v44 + 24) = v46;
      qlog_internal(2, (uint64_t)v43, 519);
    }
  }
  uint64_t v47 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v47) {
    unint64_t v48 = v47 - 1;
  }
  else {
    unint64_t v48 = 0;
  }
  uint64_t updated = quic_stream_update_last_offset(*(void **)(a1 + 40), a2, v48, v47, 1);
  uint64_t v50 = updated;
  if (updated == -1)
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
      && *(void *)(*(void *)(a1 + 40) + 1112))
    {
      uint64_t v52 = _os_log_pack_size();
      v78 = &v76;
      v53 = (char *)&v76 - ((MEMORY[0x270FA5388](v52, v52) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v54 = _os_log_pack_fill();
      uint64_t v55 = *(void *)(a1 + 40);
      uint64_t v77 = v55 + 976;
      uint64_t v56 = *(void *)(v55 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        v57 = &quic_cid_describe_cid_buf2;
      }
      else {
        v57 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        v58 = v57;
      }
      else {
        v58 = &quic_cid_describe_cid_buf1;
      }
      int v59 = ++quic_cid_describe_state;
      unsigned int v60 = *(unsigned __int8 *)(v56 + 38);
      long long v61 = 0uLL;
      *(_OWORD *)((char *)v58 + 25) = 0u;
      if (v60 >= 0x14) {
        uint64_t v62 = 20;
      }
      else {
        uint64_t v62 = v60;
      }
      _OWORD *v58 = 0uLL;
      v58[1] = 0uLL;
      if (v62)
      {
        v63 = (unsigned __int8 *)(v56 + 39);
        do
        {
          int v64 = *v63++;
          snprintf((char *)v58, 0x29uLL, "%s%02x", (const char *)v58, v64);
          --v62;
        }
        while (v62);
        int v59 = quic_cid_describe_state;
        long long v61 = 0uLL;
      }
      uint64_t v65 = *(void *)(*(void *)(a1 + 40) + 1112);
      if (v59 % 3 == 2) {
        v66 = &quic_cid_describe_cid_buf2;
      }
      else {
        v66 = &quic_cid_describe_cid_buf3;
      }
      if (v59 % 3) {
        v67 = v66;
      }
      else {
        v67 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v59 + 1;
      if (*(unsigned __int8 *)(v65 + 17) >= 0x14u) {
        uint64_t v68 = 20;
      }
      else {
        uint64_t v68 = *(unsigned __int8 *)(v65 + 17);
      }
      _OWORD *v67 = v61;
      v67[1] = v61;
      *(_OWORD *)((char *)v67 + 25) = v61;
      if (v68)
      {
        v69 = (unsigned __int8 *)(v65 + 18);
        do
        {
          int v70 = *v69++;
          snprintf((char *)v67, 0x29uLL, "%s%02x", (const char *)v67, v70);
          --v68;
        }
        while (v68);
      }
      uint64_t v71 = *(void *)a2;
      uint64_t v72 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)uint64_t v54 = 136447490;
      *(void *)(v54 + 4) = "quic_frame_process_RESET_STREAM_block_invoke";
      *(_WORD *)(v54 + 12) = 2082;
      *(void *)(v54 + 14) = v77;
      *(_WORD *)(v54 + 22) = 2082;
      *(void *)(v54 + 24) = v58;
      *(_WORD *)(v54 + 32) = 2082;
      *(void *)(v54 + 34) = v67;
      *(_WORD *)(v54 + 42) = 2048;
      *(void *)(v54 + 44) = v71;
      *(_WORD *)(v54 + 52) = 2048;
      *(void *)(v54 + 54) = v72;
      qlog_internal(16, (uint64_t)v53, 535);
    }
  }
  else
  {
    if (updated) {
      quic_stream_update_fc_credit(*(void *)(a1 + 40), a2, updated, 1);
    }
    if (*(unsigned __int8 *)(a2 + 251) - 1 <= 1)
    {
      if ((*(unsigned char *)(a2 + 352) & 0x10) != 0) {
        posix_error = 0;
      }
      else {
        posix_error = (void *)nw_error_create_posix_error();
      }
      quic_fsm_recv_stream_change((unsigned char *)(a2 + 251), 4u);
      uint64_t v73 = *(void *)a2;
      if ((*(void *)a2 & 2) != 0)
      {
        if (*(unsigned char *)(*(void *)(a1 + 40) + 1380))
        {
          if ((v73 & 1) == 0) {
            goto LABEL_94;
          }
        }
        else if (v73)
        {
          goto LABEL_94;
        }
      }
      if ((*(unsigned char *)(a2 + 353) & 0x20) == 0)
      {
        int v74 = *(unsigned __int8 *)(a2 + 250);
        if (v74 != 5 && v74 != 3)
        {
LABEL_95:
          if (posix_error) {
            nw_release(posix_error);
          }
          return v50 != -1;
        }
      }
LABEL_94:
      quic_stream_close(*(void *)(a1 + 40), a2);
      goto LABEL_95;
    }
  }
  return v50 != -1;
}

@end