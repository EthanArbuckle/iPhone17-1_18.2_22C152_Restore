@interface FilterByDataType
@end

@implementation FilterByDataType

BOOL ___FilterByDataType_block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

@end