@interface WFOnScreenContentService(WFContentCollection)
- (void)getOnScreenContentForInputContentClasses:()WFContentCollection completionHandler:;
- (void)populateOutputFromNodeRecursively:()WFContentCollection outputCollection:;
@end

@implementation WFOnScreenContentService(WFContentCollection)

- (void)populateOutputFromNodeRecursively:()WFContentCollection outputCollection:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 contentItem];

  if (v8)
  {
    v9 = [v6 contentItem];
    [v7 addItem:v9];
  }
  v10 = [v6 file];

  if (v10)
  {
    v11 = [v6 file];
    v12 = objc_msgSend(v11, "wf_fileRepresentation");
    [v7 addFile:v12];
  }
  v13 = [v6 children];

  if (v13)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v14 = objc_msgSend(v6, "children", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [a1 populateOutputFromNodeRecursively:*(void *)(*((void *)&v19 + 1) + 8 * v18++) outputCollection:v7];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
}

- (void)getOnScreenContentForInputContentClasses:()WFContentCollection completionHandler:
{
  id v6 = a4;
  if (a3)
  {
    id v7 = objc_msgSend(a3, "if_compactMap:", &__block_literal_global_66103);
    id v8 = objc_alloc(MEMORY[0x1E4FB4810]);
    v9 = [MEMORY[0x1E4F28F80] processInfo];
    v10 = v9;
    if (v9) {
      objc_msgSend(v9, "if_auditToken");
    }
    else {
      memset(v19, 0, sizeof(v19));
    }
    id v11 = (id)[v8 initWithSupportedItemClasses:v7 originatingProcessAuditToken:v19];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4FB4810]);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4FB4808]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F5A830]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __108__WFOnScreenContentService_WFContentCollection__getOnScreenContentForInputContentClasses_completionHandler___block_invoke_2;
  v16[3] = &unk_1E65577E8;
  id v17 = v13;
  id v18 = v6;
  v16[4] = a1;
  id v14 = v13;
  id v15 = v6;
  [v12 getOnScreenContentWithOptions:v11 completionHandler:v16];
}

@end