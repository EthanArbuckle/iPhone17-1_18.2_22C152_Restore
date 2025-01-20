@interface SXTangierDragItemProvider
- (BOOL)session:(id)a3 containsURL:(id)a4;
- (id)dragItemForSmartField:(id)a3 interaction:(id)a4 session:(id)a5;
@end

@implementation SXTangierDragItemProvider

- (id)dragItemForSmartField:(id)a3 interaction:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    v12 = [v11 action];
    int v13 = [v12 conformsToProtocol:&unk_26D6054F8];

    if (v13)
    {
      v14 = [v11 action];
      v15 = [v14 URL];
      BOOL v16 = [(SXTangierDragItemProvider *)self session:v10 containsURL:v15];

      if (v16)
      {
        v17 = 0;
      }
      else
      {
        v18 = [v14 URL];
        v19 = [v11 displayText];
        v39 = v18;
        [v18 _setTitle:v19];

        v20 = [SXIdentifiableItemProvider alloc];
        v21 = [v14 URL];
        v22 = [v21 absoluteString];
        v23 = [(SXIdentifiableItemProvider *)v20 initWithObject:v18 identifier:v22];

        v24 = [v11 displayText];
        v38 = v23;
        [(SXIdentifiableItemProvider *)v23 setSuggestedName:v24];

        v17 = (void *)[objc_alloc(MEMORY[0x263F1C5E0]) initWithItemProvider:v23];
        v25 = [v9 view];
        [v10 locationInView:v25];
        double v27 = v26;
        double v29 = v28;

        id v30 = objc_alloc(MEMORY[0x263F1C5F0]);
        v31 = [v9 view];
        v32 = objc_msgSend(v30, "initWithContainer:center:", v31, v27, v29);

        v33 = (void *)MEMORY[0x263F1CA78];
        v34 = [v14 URL];
        v35 = [v11 displayText];
        v36 = [v33 previewForURL:v34 title:v35 target:v32];
        [v17 setLocalObject:v36];
      }
      goto LABEL_9;
    }
  }
  else
  {
    id v11 = 0;
  }
  v17 = 0;
LABEL_9:

  return v17;
}

- (BOOL)session:(id)a3 containsURL:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = objc_msgSend(a3, "items", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) itemProvider];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v10 identifier];
          v12 = [v5 absoluteString];
          int v13 = [v11 isEqualToString:v12];

          if (v13)
          {

            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

@end