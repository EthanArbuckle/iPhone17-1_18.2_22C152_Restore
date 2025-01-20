@interface NSArray(MSVAdditions)
- (id)msv_indexesOfObjectsEqualTo:()MSVAdditions;
- (id)msv_subarrayFromIndex:()MSVAdditions;
- (id)msv_subarrayToIndex:()MSVAdditions;
- (uint64_t)msv_compactDescription;
- (uint64_t)msv_firstIndexOfObjectEqualTo:()MSVAdditions;
- (uint64_t)msv_firstIndexOfObjectsPassingTest:()MSVAdditions;
- (uint64_t)msv_lastIndexOfObjectEqualTo:()MSVAdditions;
- (uint64_t)msv_lastIndexOfObjectsPassingTest:()MSVAdditions;
@end

@implementation NSArray(MSVAdditions)

- (uint64_t)msv_compactDescription
{
  return [a1 componentsJoinedByString:@", "];
}

- (id)msv_subarrayFromIndex:()MSVAdditions
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = a1;
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", a3 + 1, objc_msgSend(a1, "count") + ~a3);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)msv_subarrayToIndex:()MSVAdditions
{
  if ([a1 count] <= a3)
  {
    id v5 = a1;
  }
  else if ((a3 & 0x8000000000000000) != 0)
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (uint64_t)msv_lastIndexOfObjectEqualTo:()MSVAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__NSArray_MSVAdditions__msv_lastIndexOfObjectEqualTo___block_invoke;
  v8[3] = &unk_1E5AD9900;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(a1, "msv_lastIndexOfObjectsPassingTest:", v8);

  return v6;
}

- (uint64_t)msv_lastIndexOfObjectsPassingTest:()MSVAdditions
{
  id v4 = a3;
  if ([a1 count])
  {
    uint64_t v5 = [a1 count] - 1;
    do
    {
      if (v5 < 0) {
        break;
      }
      char v9 = 0;
      uint64_t v6 = [a1 objectAtIndexedSubscript:v5];
      int v7 = v4[2](v4, v6, v5, &v9);

      if (v7) {
        goto LABEL_7;
      }
      --v5;
    }
    while (!v9);
  }
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_7:

  return v5;
}

- (uint64_t)msv_firstIndexOfObjectEqualTo:()MSVAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__NSArray_MSVAdditions__msv_firstIndexOfObjectEqualTo___block_invoke;
  v8[3] = &unk_1E5AD9900;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(a1, "msv_firstIndexOfObjectsPassingTest:", v8);

  return v6;
}

- (uint64_t)msv_firstIndexOfObjectsPassingTest:()MSVAdditions
{
  id v4 = a3;
  if ([a1 count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      char v9 = 0;
      uint64_t v6 = [a1 objectAtIndexedSubscript:v5];
      int v7 = v4[2](v4, v6, v5, &v9);

      if (v7) {
        break;
      }
      if (!v9 && ++v5 < (unint64_t)[a1 count]) {
        continue;
      }
      goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)msv_indexesOfObjectsEqualTo:()MSVAdditions
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__NSArray_MSVAdditions__msv_indexesOfObjectsEqualTo___block_invoke;
  v8[3] = &unk_1E5AD9900;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 indexesOfObjectsPassingTest:v8];

  return v6;
}

@end