@interface ConsumerSecret
@end

@implementation ConsumerSecret

void ___ConsumerSecret_block_invoke()
{
  v0 = [MEMORY[0x1E4F28E78] string];
  for (uint64_t i = 0; i != 40; ++i)
    objc_msgSend(v0, "appendFormat:", @"%c", dword_1AFFD0540[i]);
  v2 = (void *)_ConsumerSecret_ConsumerSecretString;
  _ConsumerSecret_ConsumerSecretString = (uint64_t)v0;
}

@end