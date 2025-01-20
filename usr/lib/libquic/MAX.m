@interface MAX
@end

@implementation MAX

uint64_t __quic_frame_acknowledged_MAX_STREAM_DATA_block_invoke(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  *(void *)(a2 + 56) = *(void *)(*(void *)(a1 + 32) + 24);
  char v2 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = qlog_nwlog_enabled == 0;
  }
  if (!v3)
  {
    if (qlog_debug_enabled) {
      char v2 = 1;
    }
    if ((v2 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = _os_log_pack_size();
      v7 = (char *)v10 - ((MEMORY[0x270FA5388](v6, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v8 = _os_log_pack_fill();
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)uint64_t v8 = 136446722;
      *(void *)(v8 + 4) = "quic_frame_acknowledged_MAX_STREAM_DATA_block_invoke";
      *(_WORD *)(v8 + 12) = 2048;
      *(void *)(v8 + 14) = v9;
      *(_WORD *)(v8 + 22) = 2048;
      *(void *)(v8 + 24) = v9;
      qlog_internal(2, (uint64_t)v7, 1080);
    }
  }
  return 1;
}

uint64_t __quic_frame_process_MAX_STREAM_DATA_block_invoke(uint64_t a1, uint64_t *a2)
{
  return 1;
}

@end