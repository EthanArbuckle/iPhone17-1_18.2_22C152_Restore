@interface NSTextContentStorageReleaseElementsInRange
@end

@implementation NSTextContentStorageReleaseElementsInRange

void ____NSTextContentStorageReleaseElementsInRange_block_invoke(uint64_t a1, id *a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 1)
  {
    uint64_t v11 = v5;
    uint64_t v12 = v4;
    uint64_t v13 = v6;
    uint64_t v14 = v7;
    v8 = a2;
    unint64_t v9 = (unint64_t)&a2[a4];
    do
    {
      objc_msgSend(*v8, "setTextContentManager:", 0, v11, v12, v13, v14);
      id v10 = *v8++;
    }
    while ((unint64_t)v8 < v9);
  }
}

@end