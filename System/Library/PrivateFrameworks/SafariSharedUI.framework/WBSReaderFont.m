@interface WBSReaderFont
@end

@implementation WBSReaderFont

void __66__WBSReaderFont_SafariSharedUI__isInstalledWithCompletionHandler___block_invoke(uint64_t a1)
{
}

uint64_t __66__WBSReaderFont_SafariSharedUI__isInstalledWithCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 1)
  {
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    return 0;
  }
  else if (a2 == 7)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t result = 1;
    *(unsigned char *)(v2 + 24) = 1;
  }
  else
  {
    return 1;
  }
  return result;
}

@end