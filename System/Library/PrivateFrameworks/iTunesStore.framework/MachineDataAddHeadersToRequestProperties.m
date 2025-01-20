@interface MachineDataAddHeadersToRequestProperties
@end

@implementation MachineDataAddHeadersToRequestProperties

void __MachineDataAddHeadersToRequestProperties_V1_5_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6) {
    [*(id *)(a1 + 32) setValue:v6 forHTTPHeaderField:*MEMORY[0x263F7B7A0]];
  }
  if (v5) {
    [*(id *)(a1 + 32) setValue:v5 forHTTPHeaderField:*MEMORY[0x263F7B798]];
  }
}

@end