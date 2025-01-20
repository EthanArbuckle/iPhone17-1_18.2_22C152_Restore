@interface NSArray(_LTAsyncMap)
- (void)_ltAsyncMap:()_LTAsyncMap completion:;
- (void)_ltAsyncMap:()_LTAsyncMap queue:completion:;
- (void)_ltSequentialMap:()_LTAsyncMap completion:;
@end

@implementation NSArray(_LTAsyncMap)

- (void)_ltAsyncMap:()_LTAsyncMap completion:
{
  dispatch_get_global_queue(9, 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _ltAsyncMap:a3 queue:v7 completion:a4];
}

- (void)_ltAsyncMap:()_LTAsyncMap queue:completion:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263EFF980] array];
  if ([a1 count])
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [MEMORY[0x263EFF9D0] null];
      [v11 addObject:v13];

      ++v12;
    }
    while (v12 < [a1 count]);
  }
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  id v35 = 0;
  dispatch_queue_t v14 = dispatch_queue_create("com.apple.translation.async-map", 0);
  dispatch_group_t v15 = dispatch_group_create();
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke;
  v27[3] = &unk_265545D38;
  v16 = v15;
  v28 = v16;
  v17 = v9;
  v29 = v17;
  id v18 = v8;
  id v32 = v18;
  v33 = v34;
  v19 = v14;
  v30 = v19;
  id v20 = v11;
  id v31 = v20;
  [a1 enumerateObjectsUsingBlock:v27];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_5;
  block[3] = &unk_265545D60;
  id v25 = v10;
  v26 = v34;
  id v24 = v20;
  id v21 = v20;
  id v22 = v10;
  dispatch_group_notify(v16, v17, block);

  _Block_object_dispose(v34, 8);
}

- (void)_ltSequentialMap:()_LTAsyncMap completion:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  id v9 = [a1 objectEnumerator];
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__6;
  id v28 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__NSArray__LTAsyncMap___ltSequentialMap_completion___block_invoke;
  v17[3] = &unk_265545DB0;
  id v10 = v9;
  id v18 = v10;
  id v11 = v7;
  id v20 = v11;
  id v12 = v8;
  id v19 = v12;
  id v22 = &v23;
  id v13 = v6;
  id v21 = v13;
  dispatch_queue_t v14 = (void (**)(void))MEMORY[0x26120C050](v17);
  uint64_t v15 = MEMORY[0x26120C050]();
  v16 = (void *)v24[5];
  v24[5] = v15;

  v14[2](v14);
  _Block_object_dispose(&v23, 8);
}

@end