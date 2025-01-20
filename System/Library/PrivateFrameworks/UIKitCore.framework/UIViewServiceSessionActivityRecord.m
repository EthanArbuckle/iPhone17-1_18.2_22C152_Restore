@interface UIViewServiceSessionActivityRecord
@end

@implementation UIViewServiceSessionActivityRecord

void __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 24));
  if (v3)
  {
    id v4 = NSString;
    uint64_t v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    id v7 = [v4 stringWithFormat:@"<%@: %p>", v6, v3];
  }
  else
  {
    id v7 = @"(nil)";
  }

  id v8 = (id)[v2 appendObject:v7 withName:@"tracker"];
  v9 = *(void **)(a1 + 32);
  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
  if (v10)
  {
    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    v14 = [v11 stringWithFormat:@"<%@: %p>", v13, v10];
  }
  else
  {
    v14 = @"(nil)";
  }

  id v15 = (id)[v9 appendObject:v14 withName:@"primaryHostedWindow"];
  v16 = *(void **)(a1 + 32);
  v17 = _NSStringFromUIUserInterfaceIdiom(*(void *)(*(void *)(a1 + 40) + 64));
  id v18 = (id)[v16 appendObject:v17 withName:@"idiom"];

  id v19 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) withName:@"hasInvalidated"];
  v20 = *(void **)(a1 + 32);
  id v21 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
  if (v21)
  {
    v22 = NSString;
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v25 = [v22 stringWithFormat:@"<%@: %p>", v24, v21];
  }
  else
  {
    v25 = @"(nil)";
  }

  id v26 = (id)[v20 appendObject:v25 withName:@"lastActivityProvider"];
  unint64_t v27 = *(void *)(*(void *)(a1 + 40) + 40);
  if (v27 > 4) {
    v28 = &stru_1ED0E84C0;
  }
  else {
    v28 = off_1E52DCC98[v27];
  }
  id v29 = (id)[*(id *)(a1 + 32) appendObject:v28 withName:@"lastActivity"];
  v30 = *(void **)(a1 + 32);
  v31 = _NSStringFromUIViewControllerAppearState(*(_DWORD *)(*(void *)(a1 + 40) + 20));
  id v32 = (id)[v30 appendObject:v31 withName:@"lastAppearState"];

  id v33 = (id)[*(id *)(a1 + 32) appendUInt64:*(void *)(*(void *)(a1 + 40) + 48) withName:@"lastActivityTimestamp"];
  uint64_t v34 = *(void *)(a1 + 40);
  if (v34)
  {
    if ([*(id *)(v34 + 8) count])
    {
      v35 = *(void **)(a1 + 32);
      v36 = [v35 activeMultilinePrefix];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke_3;
      v39[3] = &unk_1E52D9F98;
      int8x16_t v38 = *(int8x16_t *)(a1 + 32);
      id v37 = (id)v38.i64[0];
      int8x16_t v40 = vextq_s8(v38, v38, 8uLL);
      [v35 appendBodySectionWithName:@"allHostedWindows" multilinePrefix:v36 block:v39];
    }
  }
}

void __77___UIViewServiceSessionActivityRecord_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        id v8 = *(void **)(a1 + 40);
        if (v7)
        {
          v9 = NSString;
          id v10 = v7;
          v11 = (objc_class *)objc_opt_class();
          v12 = NSStringFromClass(v11);
          v13 = [v9 stringWithFormat:@"<%@: %p>", v12, v10, (void)v15];
        }
        else
        {
          v13 = @"(nil)";
        }
        id v14 = (id)[v8 appendObject:v13 withName:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

@end