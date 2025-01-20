@interface INObjectCollection(LocalizedIndexedCollation)
- (BOOL)wf_contentIsEqualToCollection:()LocalizedIndexedCollation;
- (id)wf_localizedIndexedCollationCollectionWithCollation:()LocalizedIndexedCollation collationStringSelector:;
- (id)wf_mapItems:()LocalizedIndexedCollation;
@end

@implementation INObjectCollection(LocalizedIndexedCollation)

- (BOOL)wf_contentIsEqualToCollection:()LocalizedIndexedCollation
{
  id v4 = a3;
  if (a1 == v4)
  {
    BOOL v11 = 1;
    goto LABEL_8;
  }
  v5 = [a1 sections];
  uint64_t v6 = [v5 count];
  v7 = [v4 sections];
  if (v6 != [v7 count])
  {

    goto LABEL_7;
  }
  int v8 = [a1 usesIndexedCollation];
  int v9 = [v4 usesIndexedCollation];

  if (v8 != v9)
  {
LABEL_7:
    BOOL v11 = 0;
    goto LABEL_8;
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  v10 = [a1 sections];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__INObjectCollection_LocalizedIndexedCollation__wf_contentIsEqualToCollection___block_invoke;
  v13[3] = &unk_264BFCE78;
  id v14 = v4;
  v15 = &v16;
  [v10 enumerateObjectsUsingBlock:v13];

  BOOL v11 = *((unsigned char *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);
LABEL_8:

  return v11;
}

- (id)wf_mapItems:()LocalizedIndexedCollation
{
  id v4 = a3;
  v5 = [a1 sections];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__INObjectCollection_LocalizedIndexedCollation__wf_mapItems___block_invoke;
  v10[3] = &unk_264BFD1F8;
  id v11 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "if_map:", v10);

  int v8 = (void *)[objc_alloc(MEMORY[0x263F0FCB8]) initWithSections:v7];
  objc_msgSend(v8, "setUsesIndexedCollation:", objc_msgSend(a1, "usesIndexedCollation"));

  return v8;
}

- (id)wf_localizedIndexedCollationCollectionWithCollation:()LocalizedIndexedCollation collationStringSelector:
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF980];
  int v8 = [v6 sectionTitles];
  int v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

  v10 = [v6 sectionTitles];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [MEMORY[0x263EFF980] array];
      [v9 addObject:v13];

      ++v12;
      id v14 = [v6 sectionTitles];
      unint64_t v15 = [v14 count];
    }
    while (v12 < v15);
  }
  uint64_t v16 = [a1 allItems];
  v17 = [v6 sortedArrayFromArray:v16 collationStringSelector:a4];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __125__INObjectCollection_LocalizedIndexedCollation__wf_localizedIndexedCollationCollectionWithCollation_collationStringSelector___block_invoke;
  v31[3] = &unk_264BFCE28;
  id v32 = v6;
  uint64_t v34 = a4;
  id v18 = v9;
  id v33 = v18;
  id v19 = v6;
  [v17 enumerateObjectsUsingBlock:v31];
  v20 = [v19 sectionTitles];
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __125__INObjectCollection_LocalizedIndexedCollation__wf_localizedIndexedCollationCollectionWithCollation_collationStringSelector___block_invoke_2;
  v29 = &unk_264BFD0F0;
  id v30 = v18;
  id v21 = v18;
  v22 = objc_msgSend(v20, "if_map:", &v26);

  id v23 = objc_alloc(MEMORY[0x263F0FCB8]);
  v24 = objc_msgSend(v23, "initWithSections:", v22, v26, v27, v28, v29);
  objc_msgSend(v24, "setUsesIndexedCollation:", objc_msgSend(a1, "usesIndexedCollation"));

  return v24;
}

@end