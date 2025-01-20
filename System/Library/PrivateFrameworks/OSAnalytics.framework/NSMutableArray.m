@interface NSMutableArray
@end

@implementation NSMutableArray

uint64_t __79__NSMutableArray_OSABinaryImageListExtension__sortByAddressAndSetInferredSizes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = [v4 symbolInfo];
  unint64_t v7 = [v6 start];
  v8 = [v5 symbolInfo];
  if (v7 >= [v8 start])
  {
    v10 = [v4 symbolInfo];
    uint64_t v11 = [v10 start];
    v12 = [v5 symbolInfo];
    uint64_t v9 = v11 != [v12 start];
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

@end