@interface INObjectCollection(WFMapping)
- (id)wf_mapObjectsUsingBlock:()WFMapping;
- (void)wf_mapAsynchronously:()WFMapping completionHandler:;
@end

@implementation INObjectCollection(WFMapping)

- (void)wf_mapAsynchronously:()WFMapping completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 sections];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke;
  v13[3] = &unk_1E6558068;
  id v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__INObjectCollection_WFMapping__wf_mapAsynchronously_completionHandler___block_invoke_4;
  v11[3] = &unk_1E6558040;
  v11[4] = a1;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v13, v11);
}

- (id)wf_mapObjectsUsingBlock:()WFMapping
{
  id v4 = a3;
  v5 = [a1 sections];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__INObjectCollection_WFMapping__wf_mapObjectsUsingBlock___block_invoke;
  v10[3] = &unk_1E6557FF0;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "if_map:", v10);

  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSections:v7];
  objc_msgSend(v8, "setUsesIndexedCollation:", objc_msgSend(a1, "usesIndexedCollation"));

  return v8;
}

@end