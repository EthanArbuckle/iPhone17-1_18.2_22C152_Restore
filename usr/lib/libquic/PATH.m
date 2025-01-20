@interface PATH
@end

@implementation PATH

BOOL __quic_frame_process_PATH_STATUS_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 328) != *(void *)(*(void *)(a1 + 32) + 24);
}

BOOL __quic_frame_process_PATH_STATUS_block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = (unsigned __int8 *)(a2 + 38);
  v3 = (unsigned __int8 *)quic_cid_entry_cid(*(void *)(a1 + 32));
  return !quic_cid_equal(v2, v3);
}

BOOL __quic_frame_acknowledged_PATH_ABANDON_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = quic_cid_array_find_by_cid(*(unsigned __int8 **)(*(void *)(a1 + 32) + 376), (unsigned char *)(a2 + 38));
  return quic_cid_entry_seq_number(v3) != *(void *)(*(void *)(a1 + 40) + 24);
}

BOOL __quic_frame_acknowledged_PATH_ABANDON_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 328) != *(void *)(*(void *)(a1 + 32) + 24);
}

@end