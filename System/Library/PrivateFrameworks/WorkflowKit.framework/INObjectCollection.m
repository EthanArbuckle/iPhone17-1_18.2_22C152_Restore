@interface INObjectCollection
@end

@implementation INObjectCollection

void __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v8 = [v6 items];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_2;
  v14[3] = &unk_1E6558018;
  id v15 = *(id *)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_3;
  v11[3] = &unk_1E6558040;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v14, v11);
}

void __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v5 = (objc_class *)MEMORY[0x1E4F30570];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithSections:v7];

  objc_msgSend(v8, "setUsesIndexedCollation:", objc_msgSend(*(id *)(a1 + 32), "usesIndexedCollation"));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v5 = (objc_class *)MEMORY[0x1E4F30580];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  id v9 = [*(id *)(a1 + 32) title];
  id v10 = (id)[v8 initWithTitle:v9 items:v7];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __57__INObjectCollection_WFMapping__wf_mapObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 items];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__INObjectCollection_WFMapping__wf_mapObjectsUsingBlock___block_invoke_2;
  v10[3] = &unk_1E6557FC8;
  id v11 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "if_map:", v10);

  id v6 = objc_alloc(MEMORY[0x1E4F30580]);
  id v7 = [v3 title];

  id v8 = (void *)[v6 initWithTitle:v7 items:v5];
  return v8;
}

uint64_t __57__INObjectCollection_WFMapping__wf_mapObjectsUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end