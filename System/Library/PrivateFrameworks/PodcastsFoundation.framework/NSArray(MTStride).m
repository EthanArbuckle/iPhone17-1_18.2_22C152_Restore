@interface NSArray(MTStride)
- (uint64_t)strideCountForSize:()MTStride;
- (uint64_t)subarrayForStrideIndex:()MTStride withStrideSize:;
- (void)concurrentMapWithStrideSize:()MTStride on:withBlock:;
@end

@implementation NSArray(MTStride)

- (uint64_t)subarrayForStrideIndex:()MTStride withStrideSize:
{
  unint64_t v7 = [a1 count];
  unint64_t v8 = v7;
  if (v7 && a4)
  {
    uint64_t v9 = a4 * a3;
    if (a4 * a3 >= v7)
    {
      unint64_t v8 = 0;
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      unint64_t v10 = v9 + a4;
      if (v9 + a4 >= v7) {
        unint64_t v10 = v7;
      }
      unint64_t v8 = v10 - v9;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  return objc_msgSend(a1, "subarrayWithRange:", v9, v8);
}

- (uint64_t)strideCountForSize:()MTStride
{
  unint64_t v4 = [a1 count];
  if (!a3) {
    return 1;
  }
  if (v4 % a3) {
    return v4 / a3 + 1;
  }
  return v4 / a3;
}

- (void)concurrentMapWithStrideSize:()MTStride on:withBlock:
{
  id v8 = a5;
  uint64_t v9 = a4;
  size_t v10 = [a1 strideCountForSize:a3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__NSArray_MTStride__concurrentMapWithStrideSize_on_withBlock___block_invoke;
  block[3] = &unk_1E5E62F90;
  id v13 = v8;
  uint64_t v14 = a3;
  block[4] = a1;
  id v11 = v8;
  dispatch_apply(v10, v9, block);
}

@end