@interface OOB
@end

@implementation OOB

BOOL __get_agent_uuid_if_OOB_data_required_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL result = 1;
  if (a3)
  {
    if (MEMORY[0x21055EC50](a3) == MEMORY[0x263EF8D00])
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_value(a3, "OutOfBandDataUUID");
      if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        return 0;
      }
    }
  }
  return result;
}

@end