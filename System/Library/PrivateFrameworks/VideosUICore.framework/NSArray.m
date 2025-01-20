@interface NSArray
@end

@implementation NSArray

uint64_t __91__NSArray_VideosUICore__vui_arrayByApplyingChangeSet_destinationObjects_updateObjectBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectsAtIndexes:a2];
}

uint64_t __61__NSArray_VideosUICore__vui_arrayByMappingObjectsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v2 = [*(id *)(a1 + 32) addObject:v2];
    uint64_t v3 = v5;
  }
  return MEMORY[0x1F41817F8](v2, v3);
}

@end