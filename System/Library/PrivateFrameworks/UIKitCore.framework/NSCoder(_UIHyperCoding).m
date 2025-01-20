@interface NSCoder(_UIHyperCoding)
- (id)_ui_decodeNSUIntegerVectorForKey:()_UIHyperCoding returnedCount:;
- (id)_ui_decodeVectorForKey:()_UIHyperCoding returnedCount:;
- (uint64_t)_ui_encodeNSUIntegerVector:()_UIHyperCoding count:forKey:;
- (uint64_t)_ui_encodeVector:()_UIHyperCoding count:forKey:;
@end

@implementation NSCoder(_UIHyperCoding)

- (uint64_t)_ui_encodeVector:()_UIHyperCoding count:forKey:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double v5 = MEMORY[0x1F4188790](a1);
  if (v3)
  {
    v6 = (void *)((char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      unint64_t v7 = *v2++;
      *v6++ = bswap64(v7);
      --v3;
    }
    while (v3);
  }
  return [v1 encodeBytes:(char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) length:v4 forKey:v5];
}

- (id)_ui_decodeVectorForKey:()_UIHyperCoding returnedCount:
{
  uint64_t v15 = 0;
  id v7 = a1;
  uint64_t v8 = [v7 decodeBytesForKey:a3 returnedLength:&v15];
  unint64_t v9 = v15;
  if ((v15 & 7) != 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, @"_UIHyperBase.m", 353, @"length (%lu) must be a multiple of the size of CFSwappedFloat64 (%lu)", v15, 8);

    unint64_t v9 = v15;
  }
  unint64_t v10 = v9 >> 3;
  *a4 = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__NSCoder__UIHyperCoding___ui_decodeVectorForKey_returnedCount___block_invoke;
  aBlock[3] = &__block_descriptor_48_e9_v16__0_d8l;
  aBlock[4] = v10;
  aBlock[5] = v8;
  v11 = _Block_copy(aBlock);
  return v11;
}

- (uint64_t)_ui_encodeNSUIntegerVector:()_UIHyperCoding count:forKey:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  size_t v7 = 8 * a4;
  MEMORY[0x1F4188790](a1);
  unint64_t v9 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v10) {
    memcpy((char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v8, v7);
  }
  else {
    size_t v7 = 0;
  }
  return [a1 encodeBytes:v9 length:v7 forKey:a5];
}

- (id)_ui_decodeNSUIntegerVectorForKey:()_UIHyperCoding returnedCount:
{
  uint64_t v15 = 0;
  id v7 = a1;
  uint64_t v8 = [v7 decodeBytesForKey:a3 returnedLength:&v15];
  unint64_t v9 = v15;
  if ((v15 & 7) != 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, @"_UIHyperBase.m", 376, @"length (%lu) must be a multiple of the size of uint64_t (%lu)", v15, 8);

    unint64_t v9 = v15;
  }
  unint64_t v10 = v9 >> 3;
  *a4 = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__NSCoder__UIHyperCoding___ui_decodeNSUIntegerVectorForKey_returnedCount___block_invoke;
  aBlock[3] = &__block_descriptor_48_e9_v16__0_Q8l;
  aBlock[4] = v10;
  aBlock[5] = v8;
  v11 = _Block_copy(aBlock);
  return v11;
}

@end