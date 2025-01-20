@interface ValidateAllSymlinksUnderPath
@end

@implementation ValidateAllSymlinksUnderPath

uint64_t ___ValidateAllSymlinksUnderPath_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    return 1;
  }
  if ((*(_WORD *)(*(void *)(a2 + 96) + 4) & 0xF000) != 0xA000) {
    return 1;
  }
  v5 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:*(void *)(a2 + 48) isDirectory:0 relativeToURL:0];
  v6 = [v5 path];
  v7 = [*(id *)(a1 + 32) path];
  LODWORD(a3) = _CheckRealpathHasBasePrefix(v6, v7, a3);

  uint64_t result = 0;
  if (a3) {
    return 1;
  }
  return result;
}

@end