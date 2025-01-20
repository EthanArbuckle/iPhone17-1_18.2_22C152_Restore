@interface NSPointerArray(PhotosUICore)
- (void)px_enumeratePointersWithOptions:()PhotosUICore usingBlock:;
@end

@implementation NSPointerArray(PhotosUICore)

- (void)px_enumeratePointersWithOptions:()PhotosUICore usingBlock:
{
  id v7 = a4;
  if (v7)
  {
    if ((a3 & 1) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"NSPointerArray+PhotosUICore.m", 15, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    if ((a3 & 1) == 0) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"NSPointerArray+PhotosUICore.m", 16, @"Invalid parameter not satisfying: %@", @"((options & NSEnumerationConcurrent) == 0)" object file lineNumber description];

LABEL_3:
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__NSPointerArray_PhotosUICore__px_enumeratePointersWithOptions_usingBlock___block_invoke;
  aBlock[3] = &unk_1E5DC3CE0;
  aBlock[4] = a1;
  id v8 = v7;
  id v20 = v8;
  v21 = &v22;
  v9 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v10 = [a1 count];
  unint64_t v11 = v10;
  if ((a3 & 2) != 0)
  {
    for (uint64_t i = v10 - 1; !*((unsigned char *)v23 + 24) && (i & 0x8000000000000000) == 0; uint64_t i = v16)
    {
      uint64_t v16 = i - 1;
      v9[2](v9);
    }
  }
  else
  {
    if (*((unsigned char *)v23 + 24)) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (!v12)
    {
      unint64_t v13 = 1;
      do
      {
        ((void (*)(void (**)(void), unint64_t))v9[2])(v9, v13 - 1);
        if (*((unsigned char *)v23 + 24)) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v13 >= v11;
        }
        ++v13;
      }
      while (!v14);
    }
  }

  _Block_object_dispose(&v22, 8);
}

@end