@interface NSArray(VideosExtras)
- (id)ikAssetAttributes;
- (uint64_t)ikAssetArraysEqual:()VideosExtras;
@end

@implementation NSArray(VideosExtras)

- (uint64_t)ikAssetArraysEqual:()VideosExtras
{
  id v4 = a3;
  if (v4 && (uint64_t v5 = [a1 count], v5 == objc_msgSend(v4, "count")))
  {
    v6 = [a1 ikAssetAttributes];
    if (v5 == [v6 count])
    {
      v7 = [v4 ikAssetAttributes];
      if (v5 == [v7 count]) {
        uint64_t v8 = [v6 isEqualToArray:v7];
      }
      else {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)ikAssetAttributes
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__NSArray_VideosExtras__ikAssetAttributes__block_invoke;
  v6[3] = &unk_1E6DFD1C8;
  id v7 = v2;
  id v3 = v2;
  [a1 enumerateObjectsUsingBlock:v6];
  id v4 = (void *)[v3 copy];

  return v4;
}

@end