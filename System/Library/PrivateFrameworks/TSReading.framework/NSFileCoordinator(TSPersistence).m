@interface NSFileCoordinator(TSPersistence)
+ (uint64_t)tsp_coordinateReadingItemAtURL:()TSPersistence options:filePresenter:error:byAccessor:;
+ (uint64_t)tsp_coordinateReadingItemAtURL:()TSPersistence options:writingItemAtURL:options:filePresenter:error:byAccessor:;
+ (uint64_t)tsp_coordinateWritingItemAtURL:()TSPersistence options:filePresenter:error:byAccessor:;
+ (uint64_t)tsp_coordinateWritingItemAtURL:()TSPersistence options:writingItemAtURL:options:filePresenter:error:byAccessor:;
@end

@implementation NSFileCoordinator(TSPersistence)

+ (uint64_t)tsp_coordinateReadingItemAtURL:()TSPersistence options:filePresenter:error:byAccessor:
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v15 = (void *)[[a1 alloc] initWithFilePresenter:v13];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __106__NSFileCoordinator_TSPersistence__tsp_coordinateReadingItemAtURL_options_filePresenter_error_byAccessor___block_invoke;
  v19[3] = &unk_2646B0308;
  id v16 = v14;
  id v20 = v16;
  v21 = &v22;
  [v15 coordinateReadingItemAtURL:v12 options:a4 error:a6 byAccessor:v19];
  uint64_t v17 = *((unsigned __int8 *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v17;
}

+ (uint64_t)tsp_coordinateReadingItemAtURL:()TSPersistence options:writingItemAtURL:options:filePresenter:error:byAccessor:
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v19 = (void *)[[a1 alloc] initWithFilePresenter:v17];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __131__NSFileCoordinator_TSPersistence__tsp_coordinateReadingItemAtURL_options_writingItemAtURL_options_filePresenter_error_byAccessor___block_invoke;
  v23[3] = &unk_2646B0330;
  id v20 = v18;
  id v24 = v20;
  char v25 = &v26;
  [v19 coordinateReadingItemAtURL:v15 options:a4 writingItemAtURL:v16 options:a6 error:a8 byAccessor:v23];
  uint64_t v21 = *((unsigned __int8 *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v21;
}

+ (uint64_t)tsp_coordinateWritingItemAtURL:()TSPersistence options:filePresenter:error:byAccessor:
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v15 = (void *)[[a1 alloc] initWithFilePresenter:v13];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __106__NSFileCoordinator_TSPersistence__tsp_coordinateWritingItemAtURL_options_filePresenter_error_byAccessor___block_invoke;
  v19[3] = &unk_2646B0308;
  id v16 = v14;
  id v20 = v16;
  uint64_t v21 = &v22;
  [v15 coordinateWritingItemAtURL:v12 options:a4 error:a6 byAccessor:v19];
  uint64_t v17 = *((unsigned __int8 *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return v17;
}

+ (uint64_t)tsp_coordinateWritingItemAtURL:()TSPersistence options:writingItemAtURL:options:filePresenter:error:byAccessor:
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v19 = (void *)[[a1 alloc] initWithFilePresenter:v17];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __131__NSFileCoordinator_TSPersistence__tsp_coordinateWritingItemAtURL_options_writingItemAtURL_options_filePresenter_error_byAccessor___block_invoke;
  v24[3] = &unk_2646B0358;
  id v20 = v18;
  id v26 = v20;
  id v21 = v19;
  id v25 = v21;
  v27 = &v28;
  [v21 coordinateWritingItemAtURL:v15 options:a4 writingItemAtURL:v16 options:a6 error:a8 byAccessor:v24];
  uint64_t v22 = *((unsigned __int8 *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return v22;
}

@end