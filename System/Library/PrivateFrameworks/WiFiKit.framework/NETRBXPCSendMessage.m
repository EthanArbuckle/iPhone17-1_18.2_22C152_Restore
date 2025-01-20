@interface NETRBXPCSendMessage
@end

@implementation NETRBXPCSendMessage

uint64_t ____NETRBXPCSendMessage_block_invoke(uint64_t a1, void *a2)
{
  if (!a2)
  {
    NETRBXPCCleanup();
    NETRBErrorLog();
    v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_11;
  }
  uint64_t v4 = MEMORY[0x22A646560](a2);
  if (v4 != MEMORY[0x263EF8708])
  {
    if (v4 == MEMORY[0x263EF8720]) {
      xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
    }
    goto LABEL_9;
  }
  if (xpc_dictionary_get_uint64(a2, netrbXPCResponse) == 2002)
  {
LABEL_9:
    NETRBErrorLog();
    NETRBXPCCleanup();
  }
  v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_11:
  return v5();
}

@end