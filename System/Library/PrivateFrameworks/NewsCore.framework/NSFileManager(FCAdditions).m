@interface NSFileManager(FCAdditions)
- (uint64_t)fc_removeContentsOfDirectoryAtURL:()FCAdditions;
- (uint64_t)fc_sizeOfItemAtPath:()FCAdditions error:;
- (uint64_t)fc_sizeOfItemAtURL:()FCAdditions error:;
- (void)fc_quicklyClearDirectory:()FCAdditions callbackQueue:completion:;
@end

@implementation NSFileManager(FCAdditions)

- (uint64_t)fc_sizeOfItemAtURL:()FCAdditions error:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = 0;
  int v7 = [v6 getResourceValue:&v27 forKey:*MEMORY[0x1E4F1C628] error:a4];
  id v8 = v27;
  v9 = v8;
  uint64_t v10 = 0;
  if (v7)
  {
    if ([v8 BOOLValue])
    {
      uint64_t v11 = *MEMORY[0x1E4F1C5F8];
      v29[0] = *MEMORY[0x1E4F1C5F8];
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      v13 = [a1 enumeratorAtURL:v6 includingPropertiesForKeys:v12 options:0 errorHandler:0];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v10 = 0;
        uint64_t v17 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v24 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            id v22 = 0;
            if ([v19 getResourceValue:&v22 forKey:v11 error:0]) {
              v10 += [v22 unsignedLongLongValue];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v16);
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      id v21 = 0;
      uint64_t v10 = 0;
      if ([v6 getResourceValue:&v21 forKey:*MEMORY[0x1E4F1C5F8] error:a4]) {
        uint64_t v10 = [v21 unsignedLongLongValue];
      }
    }
  }

  return v10;
}

- (uint64_t)fc_removeContentsOfDirectoryAtURL:()FCAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a3, MEMORY[0x1E4F1CBF0], 0, 0, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    LOBYTE(v8) = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (v8) {
          uint64_t v8 = [a1 removeItemAtURL:*(void *)(*((void *)&v11 + 1) + 8 * i) error:0];
        }
        else {
          uint64_t v8 = 0;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (void)fc_quicklyClearDirectory:()FCAdditions callbackQueue:completion:
{
  uint64_t v8 = a4;
  id v9 = a5;
  id v10 = a3;
  long long v11 = NSTemporaryDirectory();
  uint64_t v12 = [MEMORY[0x1E4F28F80] processInfo];
  long long v13 = [(id)v12 globallyUniqueString];
  long long v14 = [v11 stringByAppendingPathComponent:v13];

  uint64_t v15 = [v10 path];

  id v29 = 0;
  LOBYTE(v12) = [a1 moveItemAtPath:v15 toPath:v14 error:&v29];
  id v16 = v29;

  if (v12) {
    goto LABEL_2;
  }
  v19 = [v16 domain];
  v20 = v19;
  if (v19 == (void *)*MEMORY[0x1E4F281F8])
  {
    uint64_t v21 = [v16 code];

    if (v21 == 4)
    {
LABEL_2:
      uint64_t v17 = dispatch_get_global_queue(-2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_2;
      block[3] = &unk_1E5B575E8;
      block[4] = a1;
      id v23 = v14;
      id v25 = v9;
      long long v24 = v8;
      dispatch_async(v17, block);

      v18 = v23;
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  if (v9)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke;
    v26[3] = &unk_1E5B4C7C0;
    id v28 = v9;
    id v27 = v16;
    dispatch_async(v8, v26);

    v18 = v28;
    goto LABEL_8;
  }
LABEL_9:
}

- (uint64_t)fc_sizeOfItemAtPath:()FCAdditions error:
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
  uint64_t v7 = objc_msgSend(a1, "fc_sizeOfItemAtURL:error:", v6, a4);

  return v7;
}

@end