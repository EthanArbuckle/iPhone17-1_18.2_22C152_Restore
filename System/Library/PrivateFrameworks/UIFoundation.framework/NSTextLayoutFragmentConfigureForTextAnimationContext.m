@interface NSTextLayoutFragmentConfigureForTextAnimationContext
@end

@implementation NSTextLayoutFragmentConfigureForTextAnimationContext

uint64_t ____NSTextLayoutFragmentConfigureForTextAnimationContext_block_invoke(uint64_t result, void *a2, unint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 72) <= a3)
  {
    *a4 = 1;
    return result;
  }
  uint64_t v4 = result;
  v5 = (void *)[a2 textRangeByIntersectingWithTextRange:*(void *)(result + 32)];
  result = [v5 isNotEmpty];
  if (!result) {
    return result;
  }
  v6 = *(void **)(v4 + 48);
  uint64_t v7 = [*(id *)(v4 + 32) location];
  v8 = *(void **)(v4 + 56);
  uint64_t v9 = [v5 location];
  if (v8)
  {
    result = [v8 rangeForLocation:v9 allowsTrailingEdge:0];
    if (result == 0x7FFFFFFFFFFFFFFFLL) {
      return result;
    }
    uint64_t v10 = result;
    result = objc_msgSend(v8, "rangeForLocation:allowsTrailingEdge:", objc_msgSend(v5, "endLocation"), 1);
  }
  else
  {
    result = [v6 offsetFromLocation:v7 toLocation:v9];
    if (result == 0x7FFFFFFFFFFFFFFFLL) {
      return result;
    }
    uint64_t v10 = result;
    result = objc_msgSend(v6, "offsetFromLocation:toLocation:", v7, objc_msgSend(v5, "endLocation"));
  }
  if (result != 0x7FFFFFFFFFFFFFFFLL && result != v10)
  {
    uint64_t v11 = *(void *)(*(void *)(v4 + 64) + 8);
    v12 = *(uint64_t **)(v11 + 24);
    *(void *)(v11 + 24) = v12 + 2;
    uint64_t *v12 = v10;
    v12[1] = result - v10;
  }
  return result;
}

@end