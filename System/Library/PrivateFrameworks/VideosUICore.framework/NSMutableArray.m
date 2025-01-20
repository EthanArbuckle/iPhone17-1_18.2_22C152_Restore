@interface NSMutableArray
@end

@implementation NSMutableArray

uint64_t __88__NSMutableArray_VideosUICore__vui_applyChangeSet_destinationObjects_updateObjectBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectsAtIndexes:a2];
}

BOOL __93__NSMutableArray_VideosUICore__vui_applyChangeSet_destinationObjectsBlock_updateObjectBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  return [*(id *)(a1 + 32) count] > a2;
}

@end