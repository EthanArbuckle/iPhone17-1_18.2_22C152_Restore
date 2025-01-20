@interface StringValuesForKeyPath
@end

@implementation StringValuesForKeyPath

void ___StringValuesForKeyPath_block_invoke(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F8A7F0] distinctValuesForKeyPath:a1[4] inManagedObjectContext:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t ___StringValuesForKeyPath_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCaseInsensitiveCompare:");
}

@end