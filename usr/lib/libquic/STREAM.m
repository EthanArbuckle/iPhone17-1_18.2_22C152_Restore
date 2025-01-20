@interface STREAM
@end

@implementation STREAM

uint64_t __quic_frame_write_STREAM_block_invoke(uint64_t a1, uint64_t a2)
{
  return quic_frame_write_data_frame(*(char ***)(a1 + 40), *(_WORD **)(a1 + 48), a2, (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(void *)(a1 + 56));
}

uint64_t __quic_frame_free_STREAM_block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 16) & 4) == 0) {
    nw_frame_finalize();
  }
  return 1;
}

uint64_t __quic_frame_acknowledged_STREAM_block_invoke(uint64_t a1, uint64_t *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = (char *)a2 + 250;
  if (*((unsigned __int8 *)a2 + 250) <= 3u)
  {
    char v3 = qlog_nwlog_enabled;
    if (qlog_datapath_enabled) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = qlog_nwlog_enabled == 0;
    }
    if (!v4)
    {
      if (qlog_debug_enabled) {
        char v3 = 1;
      }
      if ((v3 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = _os_log_pack_size();
        v8 = (char *)v11 - ((MEMORY[0x270FA5388](v7, v7) + 15) & 0xFFFFFFFFFFFFFFF0);
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        uint64_t v9 = _os_log_pack_fill();
        uint64_t v10 = *a2;
        *(_DWORD *)uint64_t v9 = 136446466;
        *(void *)(v9 + 4) = "quic_frame_acknowledged_STREAM_block_invoke";
        *(_WORD *)(v9 + 12) = 2048;
        *(void *)(v9 + 14) = v10;
        qlog_internal(2, (uint64_t)v8, 2759);
      }
    }
    quic_fsm_send_stream_change(v2, 5u);
  }
  return 1;
}

uint64_t __quic_frame_process_STREAM_DATA_BLOCKED_block_invoke(uint64_t a1, uint64_t *a2)
{
  return 1;
}

@end