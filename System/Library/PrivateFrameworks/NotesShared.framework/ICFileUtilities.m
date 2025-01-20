@interface ICFileUtilities
+ (id)coordinateDeleteItemAt:(id)a3;
+ (id)coordinateDeleteItemAt:(id)a3 coordinator:(id)a4;
+ (id)coordinateMoveItemAt:(id)a3 to:(id)a4;
+ (id)coordinateMoveItemAt:(id)a3 to:(id)a4 coordinator:(id)a5;
@end

@implementation ICFileUtilities

+ (id)coordinateDeleteItemAt:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F28CA0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [a1 coordinateDeleteItemAt:v5 coordinator:v6];

  return v7;
}

+ (id)coordinateDeleteItemAt:(id)a3 coordinator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = 0;
  v18 = (id *)&v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v11[5] = &v17;
  id v12 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__ICFileUtilities_coordinateDeleteItemAt_coordinator___block_invoke;
  v11[3] = &unk_1E64A4FE0;
  v11[4] = &v13;
  [v6 coordinateWritingItemAtURL:v5 options:1 error:&v12 byAccessor:v11];
  id v7 = v12;
  id v8 = v12;
  if (!*((unsigned char *)v14 + 24)) {
    objc_storeStrong(v18 + 5, v7);
  }
  id v9 = v18[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __54__ICFileUtilities_coordinateDeleteItemAt_coordinator___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a2;
  id v5 = [v3 defaultManager];
  id v8 = 0;
  [v5 removeItemAtURL:v4 error:&v8];

  id v6 = v8;
  id v7 = v8;

  if (v7 && [v7 code] != 4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
  }
}

+ (id)coordinateMoveItemAt:(id)a3 to:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F28CA0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [a1 coordinateMoveItemAt:v8 to:v7 coordinator:v9];

  return v10;
}

+ (id)coordinateMoveItemAt:(id)a3 to:(id)a4 coordinator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v26 = 0;
  v27 = (id *)&v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
  id v31 = 0;
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  v11 = [v7 path];
  char v12 = [v10 fileExistsAtPath:v11];

  if (v12)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    id v21 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__ICFileUtilities_coordinateMoveItemAt_to_coordinator___block_invoke;
    v17[3] = &unk_1E64A5008;
    uint64_t v19 = &v22;
    id v18 = v10;
    v20 = &v26;
    [v9 coordinateWritingItemAtURL:v7 options:2 writingItemAtURL:v8 options:8 error:&v21 byAccessor:v17];
    id v13 = v21;
    id v14 = v21;
    if (!*((unsigned char *)v23 + 24)) {
      objc_storeStrong(v27 + 5, v13);
    }
    id v15 = v27[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:4 userInfo:0];
    id v14 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v15;
}

void __55__ICFileUtilities_coordinateMoveItemAt_to_coordinator___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  id v7 = (void *)a1[4];
  id v8 = [v6 path];
  LOBYTE(v7) = [v7 fileExistsAtPath:v8];

  if ((v7 & 1) == 0)
  {
    id v9 = (void *)a1[4];
    id v13 = 0;
    [v9 moveItemAtURL:v5 toURL:v6 error:&v13];
    id v10 = v13;
    id v11 = v13;
    char v12 = v11;
    if (v11 && [v11 code] != 4) {
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v10);
    }
  }
}

@end