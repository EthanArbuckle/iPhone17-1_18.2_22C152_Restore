@interface PFXPCCreate
@end

@implementation PFXPCCreate

uint64_t ____PFXPCCreate_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = MEMORY[0x223CAD7B0](a2);
  if (__pfconnection) {
    BOOL v4 = result == MEMORY[0x263EF8720];
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
    return PFManagerErrorLog();
  }
  else if (__pfconnection)
  {
    return PFManagerErrorLog();
  }
  return result;
}

@end