@interface NSFileManager
@end

@implementation NSFileManager

uint64_t __110__NSFileManager_SFUtilityAdditions___changeFileProtectionAtURL_fromProtection_toProtection_recursively_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 objectForKey:*MEMORY[0x263F080A8]];
  if ([v3 isEqualToString:*(void *)(a1 + 32)]) {
    return 0;
  }
  if (!*(void *)(a1 + 40)) {
    return 1;
  }
  return objc_msgSend(v3, "isEqualToString:");
}

uint64_t __80__NSFileManager_SFUtilityAdditions__hasAtLeastFileProtection_atURL_recursively___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fileProtection:*(void *)(a1 + 40) isGreaterThan:a2] ^ 1;
}

uint64_t __79__NSFileManager_SFUtilityAdditions__hasAtMostFileProtection_atURL_recursively___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _fileProtection:a2 isGreaterThan:*(void *)(a1 + 40)] ^ 1;
}

@end