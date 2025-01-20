@interface TVRUIAvatarGenerator
@end

@implementation TVRUIAvatarGenerator

void __74___TVRUIAvatarGenerator_generateAvatarForText_size_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74___TVRUIAvatarGenerator_generateAvatarForText_size_identifier_completion___block_invoke_2;
  block[3] = &unk_264800A10;
  id v8 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __74___TVRUIAvatarGenerator_generateAvatarForText_size_identifier_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end