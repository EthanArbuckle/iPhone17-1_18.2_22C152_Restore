@interface UIPrintInfoPrinterLookup
@end

@implementation UIPrintInfoPrinterLookup

void ___UIPrintInfoPrinterLookup_block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x1E4F932F8] printerLookupWithName:*(void *)(a1 + 32) andTimeout:60.0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = ___UIPrintInfoPrinterLookup_block_invoke_2;
  v3[3] = &unk_1E6DA1BC0;
  id v4 = *(id *)(a1 + 40);
  char v5 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t ___UIPrintInfoPrinterLookup_block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

@end