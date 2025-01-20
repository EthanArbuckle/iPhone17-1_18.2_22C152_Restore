@interface CRYPTO
@end

@implementation CRYPTO

void __quic_frame_process_CRYPTO_block_invoke(uint64_t a1, int64x2_t **a2)
{
  v62[1] = *MEMORY[0x263EF8340];
  int v4 = *(unsigned __int8 *)(a1 + 72);
  switch(v4)
  {
    case 3:
      v5 = (unint64_t **)(a2 + 35);
      break;
    case 2:
      v5 = (unint64_t **)(a2 + 34);
      break;
    case 1:
      v5 = (unint64_t **)(a2 + 33);
      break;
    default:
      uint64_t v54 = *(void *)(a1 + 40);
      v55 = (const char *)(v54 + 976);
      v56 = quic_cid_describe((unsigned __int8 *)(*(void *)(v54 + 1112) + 38));
      v57 = quic_cid_describe((unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 1112) + 17));
      uint64_t v58 = qlog_abort_internal("%s %s [%s-%s] space %d not implemented", "quic_frame_process_CRYPTO_block_invoke", v55, v56, v57, *(unsigned __int8 *)(a1 + 72));
      quic_crypto_process_reassq(v58, v59, v60, v61);
      return;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if ((*(unsigned char *)(v6 + 1381) & 0x10) != 0)
  {
    if ((qlog_debug_enabled
       || (qlog_nwlog_enabled & 1) != 0
       || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_INFO))
      && *(void *)(v6 + 1112))
    {
      uint64_t v30 = _os_log_pack_size();
      v62[0] = v62;
      v31 = (char *)v62 - ((MEMORY[0x270FA5388](v30, v30) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v32 = _os_log_pack_fill();
      uint64_t v33 = *(void *)(a1 + 40);
      uint64_t v34 = *(void *)(v33 + 1112);
      if (quic_cid_describe_state % 3 == 2) {
        v35 = &quic_cid_describe_cid_buf2;
      }
      else {
        v35 = &quic_cid_describe_cid_buf3;
      }
      if (quic_cid_describe_state % 3) {
        v36 = v35;
      }
      else {
        v36 = &quic_cid_describe_cid_buf1;
      }
      int v37 = ++quic_cid_describe_state;
      unsigned int v38 = *(unsigned __int8 *)(v34 + 38);
      long long v39 = 0uLL;
      *(_OWORD *)((char *)v36 + 25) = 0u;
      if (v38 >= 0x14) {
        uint64_t v40 = 20;
      }
      else {
        uint64_t v40 = v38;
      }
      _OWORD *v36 = 0uLL;
      v36[1] = 0uLL;
      if (v40)
      {
        v41 = (unsigned __int8 *)(v34 + 39);
        do
        {
          int v42 = *v41++;
          snprintf((char *)v36, 0x29uLL, "%s%02x", (const char *)v36, v42);
          --v40;
        }
        while (v40);
        int v37 = quic_cid_describe_state;
        long long v39 = 0uLL;
      }
      uint64_t v43 = v33 + 976;
      uint64_t v44 = *(void *)(*(void *)(a1 + 40) + 1112);
      if (v37 % 3 == 2) {
        v45 = &quic_cid_describe_cid_buf2;
      }
      else {
        v45 = &quic_cid_describe_cid_buf3;
      }
      if (v37 % 3) {
        v46 = v45;
      }
      else {
        v46 = &quic_cid_describe_cid_buf1;
      }
      quic_cid_describe_state = v37 + 1;
      if (*(unsigned __int8 *)(v44 + 17) >= 0x14u) {
        uint64_t v47 = 20;
      }
      else {
        uint64_t v47 = *(unsigned __int8 *)(v44 + 17);
      }
      _OWORD *v46 = v39;
      v46[1] = v39;
      *(_OWORD *)((char *)v46 + 25) = v39;
      if (v47)
      {
        v48 = (unsigned __int8 *)(v44 + 18);
        do
        {
          int v49 = *v48++;
          snprintf((char *)v46, 0x29uLL, "%s%02x", (const char *)v46, v49);
          --v47;
        }
        while (v47);
      }
      if (*(unsigned __int8 *)(*(void *)(a1 + 48) + 16) - 1 > 2) {
        v50 = "???";
      }
      else {
        v50 = off_26421ED98[(*(unsigned char *)(*(void *)(a1 + 48) + 16) - 1)];
      }
      *(_DWORD *)uint64_t v32 = 136447234;
      *(void *)(v32 + 4) = "quic_frame_process_CRYPTO_block_invoke";
      *(_WORD *)(v32 + 12) = 2082;
      *(void *)(v32 + 14) = v43;
      *(_WORD *)(v32 + 22) = 2082;
      *(void *)(v32 + 24) = v36;
      *(_WORD *)(v32 + 32) = 2082;
      *(void *)(v32 + 34) = v46;
      *(_WORD *)(v32 + 42) = 2082;
      *(void *)(v32 + 44) = v50;
      qlog_internal(1, (uint64_t)v31, 2946);
    }
  }
  else
  {
    v7 = *v5;
    if (v4 == 2) {
      unint64_t v8 = 0x2000;
    }
    else {
      unint64_t v8 = 4096;
    }
    if (quic_reassq_size((uint64_t)v7) <= v8)
    {
      if (quic_reassq_append(v7, *(void *)(a1 + 56), *(void *)(*(void *)(a1 + 48) + 24), *(void *)(*(void *)(a1 + 48) + 32), *(int **)(*(void *)(a1 + 48) + 40), 0))
      {
        uint64_t v51 = *(void *)(a1 + 40);
        uint64_t v52 = *(void *)(v51 + 40);
        if (!v52)
        {
          *(void *)(v51 + 40) = *(void *)(a1 + 64);
          uint64_t v51 = *(void *)(a1 + 40);
          uint64_t v52 = *(void *)(v51 + 40);
        }
        quic_crypto_process_reassq(v52, v51 + 48, (uint64_t)a2, a2[33]);
        quic_crypto_process_reassq(*(void *)(*(void *)(a1 + 40) + 40), *(void *)(a1 + 40) + 112, (uint64_t)a2, a2[34]);
        quic_crypto_process_reassq(*(void *)(*(void *)(a1 + 40) + 40), *(void *)(a1 + 40) + 240, (uint64_t)a2, a2[35]);
      }
    }
    else
    {
      if ((qlog_debug_enabled
         || (qlog_nwlog_enabled & 1) != 0
         || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_ERROR))
        && *(void *)(*(void *)(a1 + 40) + 1112))
      {
        uint64_t v9 = _os_log_pack_size();
        v62[0] = v62;
        v10 = (char *)v62 - ((MEMORY[0x270FA5388](v9, v9) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v11 = _os_log_pack_fill();
        uint64_t v12 = *(void *)(a1 + 40);
        uint64_t v13 = *(void *)(v12 + 1112);
        if (quic_cid_describe_state % 3 == 2) {
          v14 = &quic_cid_describe_cid_buf2;
        }
        else {
          v14 = &quic_cid_describe_cid_buf3;
        }
        if (quic_cid_describe_state % 3) {
          v15 = v14;
        }
        else {
          v15 = &quic_cid_describe_cid_buf1;
        }
        int v16 = ++quic_cid_describe_state;
        unsigned int v17 = *(unsigned __int8 *)(v13 + 38);
        long long v18 = 0uLL;
        *(_OWORD *)((char *)v15 + 25) = 0u;
        if (v17 >= 0x14) {
          uint64_t v19 = 20;
        }
        else {
          uint64_t v19 = v17;
        }
        _OWORD *v15 = 0uLL;
        v15[1] = 0uLL;
        if (v19)
        {
          v20 = (unsigned __int8 *)(v13 + 39);
          do
          {
            int v21 = *v20++;
            snprintf((char *)v15, 0x29uLL, "%s%02x", (const char *)v15, v21);
            --v19;
          }
          while (v19);
          int v16 = quic_cid_describe_state;
          long long v18 = 0uLL;
        }
        uint64_t v22 = v12 + 976;
        uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 1112);
        if (v16 % 3 == 2) {
          v24 = &quic_cid_describe_cid_buf2;
        }
        else {
          v24 = &quic_cid_describe_cid_buf3;
        }
        if (v16 % 3) {
          v25 = v24;
        }
        else {
          v25 = &quic_cid_describe_cid_buf1;
        }
        quic_cid_describe_state = v16 + 1;
        if (*(unsigned __int8 *)(v23 + 17) >= 0x14u) {
          uint64_t v26 = 20;
        }
        else {
          uint64_t v26 = *(unsigned __int8 *)(v23 + 17);
        }
        _OWORD *v25 = v18;
        v25[1] = v18;
        *(_OWORD *)((char *)v25 + 25) = v18;
        if (v26)
        {
          v27 = (unsigned __int8 *)(v23 + 18);
          do
          {
            int v28 = *v27++;
            snprintf((char *)v25, 0x29uLL, "%s%02x", (const char *)v25, v28);
            --v26;
          }
          while (v26);
        }
        if (*(unsigned __int8 *)(a1 + 72) - 1 > 2) {
          v29 = "???";
        }
        else {
          v29 = off_26421ED98[(*(unsigned char *)(a1 + 72) - 1)];
        }
        *(_DWORD *)uint64_t v11 = 136447490;
        *(void *)(v11 + 4) = "quic_frame_process_CRYPTO_block_invoke";
        *(_WORD *)(v11 + 12) = 2082;
        *(void *)(v11 + 14) = v22;
        *(_WORD *)(v11 + 22) = 2082;
        *(void *)(v11 + 24) = v15;
        *(_WORD *)(v11 + 32) = 2082;
        *(void *)(v11 + 34) = v25;
        *(_WORD *)(v11 + 42) = 2048;
        *(void *)(v11 + 44) = v8;
        *(_WORD *)(v11 + 52) = 2082;
        *(void *)(v11 + 54) = v29;
        qlog_internal(16, (uint64_t)v10, 2960);
      }
      v53 = *(void **)(a1 + 40);
      if (*(unsigned char *)(a1 + 72) == 2)
      {
        v53[134] = 13;
        v53[135] = "exceeded crypto buffer";
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      }
      else
      {
        *(void *)((char *)v53 + 1380) |= 0x1000uLL;
      }
    }
  }
}

@end