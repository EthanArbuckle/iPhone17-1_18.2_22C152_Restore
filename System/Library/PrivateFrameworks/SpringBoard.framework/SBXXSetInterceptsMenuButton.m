@interface SBXXSetInterceptsMenuButton
@end

@implementation SBXXSetInterceptsMenuButton

uint64_t ___SBXXSetInterceptsMenuButton_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v1 = 0;
  }
  return [(id)SBApp setMenuButtonInterceptApp:v1 forever:*(unsigned __int8 *)(a1 + 41) != 0];
}

@end