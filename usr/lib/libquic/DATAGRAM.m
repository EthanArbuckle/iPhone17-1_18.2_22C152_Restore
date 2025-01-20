@interface DATAGRAM
@end

@implementation DATAGRAM

uint64_t __quic_frame_free_DATAGRAM_block_invoke()
{
  return 1;
}

uint64_t __quic_frame_write_DATAGRAM_block_invoke(uint64_t a1, uint64_t a2)
{
  return quic_frame_write_data_frame(*(char ***)(a1 + 40), *(_WORD **)(a1 + 48), a2, (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(void *)(a1 + 56));
}

uint64_t __quic_frame_process_DATAGRAM_block_invoke(void *a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1[4] + 24);
  *(_DWORD *)(a2 + 352) |= 0x1000u;
  *(void *)(a2 + 24) = a1[5];
  quic_fsm_recv_stream_change((unsigned char *)(a2 + 251), 1u);
  quic_fsm_send_stream_change((unsigned char *)(a2 + 250), 1u);
  uint64_t min_mss_path = quic_conn_get_min_mss_path(a1[6]);
  quic_stream_compute_datagram_usable_frame_size(a1[6], min_mss_path, a2);
  quic_stream_setup_metadata_handlers(a1[6], a2, *(void *)(a2 + 16));
  if (*(unsigned char *)(a1[6] + 477) == 9)
  {
    nw_protocol_instance_update_outbound_data_limit();
    nw_protocol_instance_report_ready();
  }
  return 1;
}

uint64_t __quic_frame_process_DATAGRAM_block_invoke_2(uint64_t a1)
{
  nw_retain(**(void ***)(a1 + 40));
  inbound_data = (void *)nw_protocol_create_inbound_data();
  nw_protocol_data_access_buffer();
  nw_protocol_instance_add_inbound();
  if (inbound_data) {
    nw_release(inbound_data);
  }
  return 1;
}

void __quic_frame_process_DATAGRAM_block_invoke_3(uint64_t a1)
{
}

void *__quic_frame_process_DATAGRAM_block_invoke_184(uint64_t a1, void *__dst, size_t a3)
{
  if (*(void *)(a1 + 40) < a3) {
    a3 = *(void *)(a1 + 40);
  }
  return memcpy(__dst, *(const void **)(*(void *)(a1 + 32) + 48), a3);
}

uint64_t __quic_frame_process_DATAGRAM_block_invoke_4(void *a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x263EF8340];
  char v4 = qlog_nwlog_enabled;
  if (qlog_datapath_enabled) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = qlog_nwlog_enabled == 0;
  }
  if (!v5)
  {
    if (qlog_debug_enabled) {
      char v4 = 1;
    }
    if ((v4 & 1) != 0 || os_log_type_enabled((os_log_t)qlog_log, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = _os_log_pack_size();
      v9 = (char *)v13 - ((MEMORY[0x270FA5388](v8, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v10 = _os_log_pack_fill();
      uint64_t v11 = a1[4];
      uint64_t v12 = a1[5];
      *(_DWORD *)uint64_t v10 = 136446722;
      *(void *)(v10 + 4) = "quic_frame_process_DATAGRAM_block_invoke_4";
      *(_WORD *)(v10 + 12) = 2048;
      *(void *)(v10 + 14) = v11;
      *(_WORD *)(v10 + 22) = 2048;
      *(void *)(v10 + 24) = v12;
      qlog_internal(2, (uint64_t)v9, 3355);
    }
  }
  uint64_t v6 = a1[6];
  *(void *)(a2 + 104) += a1[5];
  *(void *)(v6 + 912) += a1[5];
  return 1;
}

@end