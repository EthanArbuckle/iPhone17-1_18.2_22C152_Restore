@interface NSArray(MyersDiff)
- (uint64_t)sf_differencesFromArray:()MyersDiff removedIndexes:insertedIndexes:;
- (void)sf_differencesFromArray:()MyersDiff usingComparator:removedIndexes:insertedIndexes:;
@end

@implementation NSArray(MyersDiff)

- (uint64_t)sf_differencesFromArray:()MyersDiff removedIndexes:insertedIndexes:
{
  return objc_msgSend(a1, "sf_differencesFromArray:usingComparator:removedIndexes:insertedIndexes:", a3, &__block_literal_global_17, a4, a5);
}

- (void)sf_differencesFromArray:()MyersDiff usingComparator:removedIndexes:insertedIndexes:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = [MEMORY[0x1E4F28E60] indexSet];
  v13 = [MEMORY[0x1E4F28E60] indexSet];
  unint64_t v14 = [a1 count];
  unint64_t v15 = [v10 count];
  unint64_t v16 = v15;
  if (v14 >> 15 || v15 >= 0x8000)
  {
    objc_msgSend(v12, "addIndexesInRange:", 0, v14);
    objc_msgSend(v13, "addIndexesInRange:", 0, v16);
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v23[1] = v23;
  MEMORY[0x1F4188790](v15);
  v24 = v11;
  v18 = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v18, v17);
  MEMORY[0x1F4188790](v19);
  v21 = (char *)v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v21, v20);
  objc_msgSend(a1, "getObjects:range:", v18, 0, v14);
  objc_msgSend(v10, "getObjects:range:", v21, 0, v16);
  uint64_t v22 = (uint64_t)v18;
  id v11 = v24;
  _SF_MyersDiff(v22, (uint64_t)v21, 0, 0, (__int16)v14, (__int16)v16, v24, v12, v13);
  if (a5) {
LABEL_6:
  }
    *a5 = v12;
LABEL_7:
  if (a6) {
    *a6 = v13;
  }
}

@end