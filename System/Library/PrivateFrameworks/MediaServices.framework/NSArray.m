@interface NSArray
@end

@implementation NSArray

uint64_t __54__NSArray_MSVAdditions__msv_lastIndexOfObjectEqualTo___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 1;
  }
  else {
    return objc_msgSend(a2, "isEqual:");
  }
}

uint64_t __55__NSArray_MSVAdditions__msv_firstIndexOfObjectEqualTo___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 1;
  }
  else {
    return objc_msgSend(a2, "isEqual:");
  }
}

uint64_t __53__NSArray_MSVAdditions__msv_indexesOfObjectsEqualTo___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 1;
  }
  else {
    return objc_msgSend(a2, "isEqual:");
  }
}

@end