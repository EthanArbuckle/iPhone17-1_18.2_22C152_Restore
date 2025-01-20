@interface NSTextContentStorageFillAttributedStringWithElementsInIndexRange
@end

@implementation NSTextContentStorageFillAttributedStringWithElementsInIndexRange

uint64_t ____NSTextContentStorageFillAttributedStringWithElementsInIndexRange_block_invoke(uint64_t result, id *a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 1)
  {
    v4 = a2;
    uint64_t v5 = result;
    unint64_t v6 = (unint64_t)&a2[a4];
    do
    {
      objc_opt_class();
      result = objc_opt_isKindOfClass();
      if (result)
      {
        id v7 = *v4;
        v8 = (void *)[*v4 attributedString];
        v9 = (void *)[v7 paragraphSeparatorRange];
        objc_msgSend(*(id *)(v5 + 32), "replaceCharactersInRange:withAttributedString:", *(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 32), *(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 40), v8);
        *(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 32) += [v8 length];
        *(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 40) = 0;
        result = [v9 range];
        if (!v10 && *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 24) < *(void *)(v5 + 56)) {
          result = objc_msgSend(*(id *)(v5 + 32), "replaceCharactersInRange:withString:", (*(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 32))++, *(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 40), @"\n");
        }
      }
      ++*(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 24);
      ++v4;
    }
    while ((unint64_t)v4 < v6);
  }
  return result;
}

@end