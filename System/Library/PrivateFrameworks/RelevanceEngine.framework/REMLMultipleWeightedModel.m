@interface REMLMultipleWeightedModel
@end

@implementation REMLMultipleWeightedModel

uint64_t __46___REMLMultipleWeightedModel_enumerateModels___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51___REMLMultipleWeightedModel_saveModelToURL_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v6 = [*(id *)(a1 + 32) URLByAppendingPathComponent:a3];
    v7 = [MEMORY[0x263F08850] defaultManager];
    v8 = [v6 path];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v9 + 40);
    char v10 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);

    if (v10)
    {
      uint64_t v11 = [v6 URLByAppendingPathComponent:@"model"];

      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      id v14 = *(id *)(v12 + 40);
      char v13 = [v5 saveModelToURL:v11 error:&v14];
      objc_storeStrong((id *)(v12 + 40), v14);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13;
      v6 = (void *)v11;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

@end