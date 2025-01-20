@interface NSArray(NFTransportService)
- (id)encodeToCBOR;
@end

@implementation NSArray(NFTransportService)

- (id)encodeToCBOR
{
  v4 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__NSArray_NFTransportService__encodeToCBOR__block_invoke;
  v8[3] = &unk_1E595D190;
  v8[4] = a1;
  uint64_t v10 = a2;
  id v5 = v4;
  id v9 = v5;
  [v5 enumerateObjectsUsingBlock:v8];
  if ([v5 count])
  {
    v6 = [getCBORClass() cborWithArray:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end