@interface NSItemProvider
@end

@implementation NSItemProvider

uint64_t __63__NSItemProvider_RCAdditions__rc_supportedFileTypesRepresented__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasItemConformingToTypeIdentifier:a2];
}

@end