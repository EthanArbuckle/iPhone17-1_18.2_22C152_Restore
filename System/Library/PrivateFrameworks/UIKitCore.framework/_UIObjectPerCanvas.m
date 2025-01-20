@interface _UIObjectPerCanvas
+ (id)objectOfClass:(Class)a3 forCanvas:(id)a4 withOptions:(id)a5 createIfNecessary:(BOOL)a6;
+ (void)canvasDisconnected:(id)a3;
+ (void)removeObject:(id)a3;
+ (void)removeObjectsOfClass:(Class)a3;
@end

@implementation _UIObjectPerCanvas

+ (id)objectOfClass:(Class)a3 forCanvas:(id)a4 withOptions:(id)a5 createIfNecessary:(BOOL)a6
{
  BOOL v26 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    +[UIWindowScene _keyWindowScene]();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = a1;
  objc_sync_enter(v11);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76___UIObjectPerCanvas_objectOfClass_forCanvas_withOptions_createIfNecessary___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v11;
  if (qword_1EB264C20 != -1) {
    dispatch_once(&qword_1EB264C20, block);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = (id)qword_1EB264C18;
  id v13 = (id)[v12 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v16 isMemberOfClass:a3])
        {
          id v17 = [v16 _intendedCanvas];
          if (v17 == v9)
          {
            int v18 = [v16 _matchingOptions:v10];

            if (v18)
            {
              id v13 = v16;
              goto LABEL_18;
            }
          }
          else
          {
          }
        }
      }
      id v13 = (id)[v12 countByEnumeratingWithState:&v27 objects:v34 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  if (!v13 && v26)
  {
    v19 = +[UIScene _scenesIncludingInternal:1];
    int v20 = [v19 containsObject:v9];

    if (v20)
    {
      v21 = NSNumber;
      v32[0] = @"Canvas";
      v32[1] = @"Options";
      id v22 = (id)MEMORY[0x1E4F1CC08];
      if (v10) {
        id v22 = v10;
      }
      v33[0] = v9;
      v33[1] = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
      v24 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v23, "hash"));

      if ([(id)qword_1EB264C28 containsObject:v24])
      {
        id v13 = 0;
      }
      else
      {
        [(id)qword_1EB264C28 addObject:v24];
        id v13 = (id)[[a3 alloc] _initWithCanvas:v9 options:v10];
        [(id)qword_1EB264C18 addObject:v13];
        [(id)qword_1EB264C28 removeObject:v24];
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  objc_sync_exit(v11);

  return v13;
}

+ (void)canvasDisconnected:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 object];
  v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  id v7 = a1;
  objc_sync_enter(v7);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)qword_1EB264C18;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "_intendedCanvas", (void)v15);
        BOOL v14 = v13 == v5;

        if (v14) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [(id)qword_1EB264C18 removeObjectsInArray:v6];
  objc_sync_exit(v7);
}

+ (void)removeObjectsOfClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  id v5 = a1;
  objc_sync_enter(v5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)qword_1EB264C18;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v4, "addObject:", v10, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(id)qword_1EB264C18 removeObjectsInArray:v4];
  objc_sync_exit(v5);
}

+ (void)removeObject:(id)a3
{
  id v5 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  [(id)qword_1EB264C18 removeObject:v5];
  objc_sync_exit(v4);
}

@end