@interface INObjectCollection
@end

@implementation INObjectCollection

void __79__INObjectCollection_LocalizedIndexedCollation__wf_contentIsEqualToCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  v7 = [*(id *)(a1 + 32) sections];
  id v8 = [v7 objectAtIndexedSubscript:a3];

  if (v8 != v17)
  {
    v9 = [v17 title];
    v10 = [v8 title];
    if ([v9 isEqualToString:v10])
    {
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v11 = a1 + 40;
      *(unsigned char *)(*(void *)(v12 + 8) + 24) = 0;
    }
    else
    {
      v13 = [v17 items];
      v14 = [v8 items];
      char v15 = [v13 isEqualToArray:v14];
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v11 = a1 + 40;
      *(unsigned char *)(*(void *)(v16 + 8) + 24) = v15;
    }
    *a4 = *(unsigned char *)(*(void *)(*(void *)v11 + 8) + 24) ^ 1;
  }
}

id __61__INObjectCollection_LocalizedIndexedCollation__wf_mapItems___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F0FCC0];
  id v4 = a2;
  id v5 = [v3 alloc];
  v6 = [v4 title];
  v7 = [v4 items];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__INObjectCollection_LocalizedIndexedCollation__wf_mapItems___block_invoke_2;
  v11[3] = &unk_264BFCE50;
  id v12 = *(id *)(a1 + 32);
  id v8 = objc_msgSend(v7, "if_map:", v11);
  v9 = (void *)[v5 initWithTitle:v6 items:v8];

  return v9;
}

uint64_t __61__INObjectCollection_LocalizedIndexedCollation__wf_mapItems___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __125__INObjectCollection_LocalizedIndexedCollation__wf_localizedIndexedCollationCollectionWithCollation_collationStringSelector___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v3, "sectionForObject:collationStringSelector:", v5, v4));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 addObject:v5];
}

id __125__INObjectCollection_LocalizedIndexedCollation__wf_localizedIndexedCollationCollectionWithCollation_collationStringSelector___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)MEMORY[0x263F0FCC0];
  id v6 = a2;
  id v7 = [v5 alloc];
  id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  v9 = (void *)[v7 initWithTitle:v6 items:v8];

  return v9;
}

id __70__INObjectCollection_WorkflowEditor__wf_filteredCollectionUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 items];
  id v5 = objc_msgSend(v4, "if_objectsPassingTest:", *(void *)(a1 + 32));

  if ([v5 count])
  {
    id v6 = objc_alloc(MEMORY[0x263F0FCC0]);
    id v7 = [v3 title];
    id v8 = (void *)[v6 initWithTitle:v7 items:v5];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __52__INObjectCollection_WorkflowEditor__wf_objectCount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 items];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 count];
}

@end