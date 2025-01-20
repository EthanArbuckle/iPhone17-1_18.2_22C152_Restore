@interface UIDataSourceBatchUpdateMapHelper
@end

@implementation UIDataSourceBatchUpdateMapHelper

uint64_t __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = [*(id *)(a1 + 32) numberOfItemsBeforeSection:a2];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

uint64_t __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_2(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = [*(id *)(a1 + 32) numberOfItemsInSection:a2];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

uint64_t __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_3(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = [*(id *)(a1 + 32) numberOfItemsBeforeSection:a2];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

uint64_t __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_4(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = [*(id *)(a1 + 32) numberOfItemsInSection:a2];
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

void __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_5(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  _UIDataSourceUpdateFromCollectionViewUpdateItem(v4, a3);
}

@end