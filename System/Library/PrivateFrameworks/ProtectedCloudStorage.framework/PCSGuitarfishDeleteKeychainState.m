@interface PCSGuitarfishDeleteKeychainState
@end

@implementation PCSGuitarfishDeleteKeychainState

void ___PCSGuitarfishDeleteKeychainState_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    v4 = pcsLogObjForScope("Guitarfish");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1ACF98000, v4, OS_LOG_TYPE_DEFAULT, "Error while deleting Guitarfish state: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

@end