@interface UIImageCollectImagePathsForPath
@end

@implementation UIImageCollectImagePathsForPath

void ___UIImageCollectImagePathsForPath_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___UIImageCollectImagePathsForPath_block_invoke_2;
  aBlock[3] = &unk_1E52FAEA8;
  id v7 = v5;
  id v35 = v7;
  id v8 = v6;
  id v36 = v8;
  id v37 = *(id *)(a1 + 32);
  id v38 = *(id *)(a1 + 40);
  id v39 = *(id *)(a1 + 48);
  v9 = _Block_copy(aBlock);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = ___UIImageCollectImagePathsForPath_block_invoke_3;
  v28[3] = &unk_1E52FAEA8;
  id v10 = v7;
  id v29 = v10;
  id v11 = v8;
  id v30 = v11;
  id v31 = *(id *)(a1 + 32);
  id v32 = *(id *)(a1 + 40);
  id v33 = *(id *)(a1 + 48);
  v12 = _Block_copy(v28);
  if (dyld_program_sdk_at_least())
  {
    if (*(unsigned char *)(a1 + 64))
    {
      if (+[UIImage _scaleDefinedByPath:*(void *)(a1 + 56)] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (+[UIDevice _isWatch]
          || +[UIDevice _isWatchCompanion])
        {
          +[_UIAssetManager _watchScreenScale];
          uint64_t v14 = v13;
        }
        else
        {
          v16 = +[UIScreen mainScreen];
          [v16 scale];
          uint64_t v14 = v17;
        }
        v18 = *(void **)(a1 + 40);
        v19 = [NSString stringWithFormat:@"%@@%.0fx.%@", *(void *)(a1 + 56), v14, v11];
        v20 = [v18 stringByAppendingPathComponent:v19];

        if (([v20 getCString:v40 maxLength:1024 encoding:4] & 1) != 0
          && !faccessat(-2, v40, 0, 48))
        {
          [*(id *)(a1 + 48) addObject:v20];
        }
      }
      if (![*(id *)(a1 + 48) count])
      {
        v21 = *(void **)(a1 + 40);
        v22 = [*(id *)(a1 + 56) stringByAppendingPathExtension:v11];
        v23 = [v21 stringByAppendingPathComponent:v22];

        if (([v23 getCString:v40 maxLength:1024 encoding:4] & 1) != 0
          && !faccessat(-2, v40, 0, 48))
        {
          [*(id *)(a1 + 48) addObject:v23];
        }
      }
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = ___UIImageCollectImagePathsForPath_block_invoke_4;
      v24[3] = &unk_1E5311BA0;
      char v27 = *(unsigned char *)(a1 + 65);
      id v25 = v9;
      id v26 = v12;
      v15 = (void (**)(void *, void))_Block_copy(v24);
      v15[2](v15, 0);
      if (![*(id *)(a1 + 48) count]) {
        v15[2](v15, 1);
      }
    }
  }
  else
  {
    if (*(unsigned char *)(a1 + 65)) {
      (*((void (**)(void *, void))v9 + 2))(v9, 0);
    }
    if (![*(id *)(a1 + 48) count]) {
      (*((void (**)(void *, void))v12 + 2))(v12, 0);
    }
    if (!*(unsigned char *)(a1 + 65) && ![*(id *)(a1 + 48) count]) {
      (*((void (**)(void *, void))v9 + 2))(v9, 0);
    }
    if (![*(id *)(a1 + 48) count])
    {
      if (*(void *)(a1 + 32))
      {
        (*((void (**)(void *, uint64_t))v12 + 2))(v12, 1);
        if (![*(id *)(a1 + 48) count]) {
          (*((void (**)(void *, uint64_t))v9 + 2))(v9, 1);
        }
      }
    }
  }
}

uint64_t ___UIImageCollectImagePathsForPath_block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!*(unsigned char *)(a1 + 48))
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  return result;
}

void ___UIImageCollectImagePathsForPath_block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least()) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  do
  {
    if (dyld_program_sdk_at_least())
    {
      id v5 = ProductSuffix();
      int v6 = [v5 isEqualToString:@"~iphone"];
      id v7 = @"~ipad";
      if (!v6) {
        id v7 = @"~iphone";
      }
      id v8 = NSString;
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = v7;
      v12 = [v8 stringWithFormat:@"%@@%lux%@.%@", v9, v4, v5, v10];
      v36[0] = v12;
      uint64_t v13 = [NSString stringWithFormat:@"%@@%lux%@.%@", *(void *)(a1 + 32), v4, v11, *(void *)(a1 + 40)];
      v36[1] = v13;
      uint64_t v14 = [NSString stringWithFormat:@"%@@%lux.%@", *(void *)(a1 + 32), v4, *(void *)(a1 + 40)];
      v36[2] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
    }
    else
    {
      v16 = NSString;
      uint64_t v17 = *(void *)(a1 + 32);
      id v5 = ProductSuffix();
      v12 = [v16 stringWithFormat:@"%@@%lux%@.%@", v17, v4, v5, *(void *)(a1 + 40)];
      v35[0] = v12;
      uint64_t v13 = [NSString stringWithFormat:@"%@@%lux.%@", *(void *)(a1 + 32), v4, *(void *)(a1 + 40)];
      v35[1] = v13;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    }

    if (a2)
    {
      v18 = [NSString stringWithFormat:@"%@@%lux.%@", *(void *)(a1 + 32), v4, *(void *)(a1 + 40)];
      v34 = v18;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];

      v15 = (void *)v19;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v20 = v15;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          if (a2)
          {
            id v25 = *(void **)(a1 + 48);
            id v26 = [*(id *)(*((void *)&v29 + 1) + 8 * i) stringByDeletingPathExtension];
            char v27 = [v25 pathForResource:v26 ofType:*(void *)(a1 + 40)];
          }
          else
          {
            char v27 = [*(id *)(a1 + 56) stringByAppendingPathComponent:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          }
          if (([v27 getCString:v37 maxLength:1024 encoding:4] & 1) != 0
            && !faccessat(-2, v37, 0, 48))
          {
            [*(id *)(a1 + 64) addObject:v27];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v22);
    }

    unint64_t v28 = v4 - 3;
    uint64_t v4 = 2;
  }
  while (v28 < 0xFFFFFFFFFFFFFFFELL);
}

void ___UIImageCollectImagePathsForPath_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) stringByAppendingString:@"@1x"];
  id v5 = *(void **)(a1 + 32);
  int v6 = ProductSuffix();
  id v7 = [v5 stringByAppendingString:v6];

  id v8 = ProductSuffix();
  uint64_t v9 = [v4 stringByAppendingString:v8];

  uint64_t v10 = [v7 stringByAppendingPathExtension:*(void *)(a1 + 40)];
  v33[0] = v10;
  id v11 = [*(id *)(a1 + 32) stringByAppendingPathExtension:*(void *)(a1 + 40)];
  v33[1] = v11;
  id v26 = v9;
  v12 = [v9 stringByAppendingPathExtension:*(void *)(a1 + 40)];
  v33[2] = v12;
  uint64_t v13 = [v4 stringByAppendingPathExtension:*(void *)(a1 + 40)];
  v33[3] = v13;
  v33[4] = v7;
  v33[5] = *(void *)(a1 + 32);
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:6];

  if (a2)
  {
    v15 = [*(id *)(a1 + 32) stringByAppendingPathExtension:*(void *)(a1 + 40)];
    v32[0] = v15;
    v16 = [v4 stringByAppendingPathExtension:*(void *)(a1 + 40)];
    v32[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];

    uint64_t v14 = (void *)v17;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        if (a2)
        {
          uint64_t v23 = *(void **)(a1 + 48);
          v24 = [*(id *)(*((void *)&v27 + 1) + 8 * i) stringByDeletingPathExtension];
          id v25 = [v23 pathForResource:v24 ofType:*(void *)(a1 + 40)];
        }
        else
        {
          id v25 = [*(id *)(a1 + 56) stringByAppendingPathComponent:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        }
        if (([v25 getCString:v34 maxLength:1024 encoding:4] & 1) != 0
          && !faccessat(-2, v34, 0, 48))
        {
          [*(id *)(a1 + 64) addObject:v25];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v20);
  }
}

@end