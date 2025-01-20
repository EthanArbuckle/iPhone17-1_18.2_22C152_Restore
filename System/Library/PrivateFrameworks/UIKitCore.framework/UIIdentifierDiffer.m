@interface UIIdentifierDiffer
@end

@implementation UIIdentifierDiffer

void __43___UIIdentifierDiffer_collectionDifference__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:a2];
  v3 = objc_msgSend(MEMORY[0x1E4F28F18], "changeWithObject:type:index:");
  [*(id *)(a1 + 40) addObject:v3];
}

void __43___UIIdentifierDiffer_collectionDifference__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:a2];
  v3 = objc_msgSend(MEMORY[0x1E4F28F18], "changeWithObject:type:index:");
  [*(id *)(a1 + 40) addObject:v3];
}

@end