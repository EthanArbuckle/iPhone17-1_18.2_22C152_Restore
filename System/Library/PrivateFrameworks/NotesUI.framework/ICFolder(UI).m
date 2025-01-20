@interface ICFolder(UI)
+ (__CFString)defaultFilledSystemImageName;
+ (__CFString)defaultSystemImageName;
+ (id)foldersWithHashtagAsOnlyFilter:()UI;
+ (id)smartFoldersThatWillBeDeletedAfterDeletingHashtags:()UI;
+ (uint64_t)defaultNavigationBarIcon;
+ (void)removeUsageOfHashtag:()UI;
- (__CFString)filledSystemImageName;
- (__CFString)systemImageName;
- (id)navigationBarIconOverlaySystemImage;
- (id)navigationBarIconWithSize:()UI;
@end

@implementation ICFolder(UI)

+ (void)removeUsageOfHashtag:()UI
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F83380];
  v5 = [v3 standardizedContent];
  v6 = [v3 account];
  v7 = [v4 visibleSmartFoldersForHashtagStandardizedContent:v5 account:v6];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "smartFolderQuery", (void)v18);
        v15 = [v3 standardizedContent];
        v16 = [v14 removingTagIdentifier:v15];
        [v13 setSmartFolderQuery:v16];

        [v13 updateChangeCountWithReason:@"Removed tag"];
        v17 = [v13 smartFolderQuery];

        if (!v17) {
          [v13 markForDeletion];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

+ (id)foldersWithHashtagAsOnlyFilter:()UI
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F83380];
  v5 = [v3 standardizedContent];
  v6 = [v3 account];
  v7 = [v4 visibleSmartFoldersForHashtagStandardizedContent:v5 account:v6];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__ICFolder_UI__foldersWithHashtagAsOnlyFilter___block_invoke;
  v11[3] = &unk_1E5FDE1C8;
  id v12 = v3;
  id v8 = v3;
  uint64_t v9 = objc_msgSend(v7, "ic_objectsPassingTest:", v11);

  return v9;
}

+ (id)smartFoldersThatWillBeDeletedAfterDeletingHashtags:()UI
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v36 = v3;
    obuint64_t j = v3;
    uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v46 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v11 = (void *)MEMORY[0x1E4F83380];
          id v12 = objc_msgSend(v10, "standardizedContent", v36);
          v13 = [v10 account];
          v14 = [v11 visibleSmartFoldersForHashtagStandardizedContent:v12 account:v13];

          objc_msgSend(v4, "ic_addObjectsFromNonNilArray:", v14);
          v15 = [v10 standardizedContent];
          objc_msgSend(v5, "ic_addNonNilObject:", v15);
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v7);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v38 = v4;
    uint64_t v16 = [v38 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id obja = *(id *)v42;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(id *)v42 != obja) {
            objc_enumerationMutation(v38);
          }
          long long v19 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          long long v20 = objc_msgSend(v19, "smartFolderQuery", v36);
          long long v21 = [v19 managedObjectContext];
          v22 = [v19 account];
          uint64_t v23 = [v22 objectID];
          v24 = [v20 filterSelectionWithManagedObjectContext:v21 account:v23];

          objc_opt_class();
          v25 = [v24 filterTypeSelectionForFilterType:0];
          v26 = ICDynamicCast();

          v27 = (void *)MEMORY[0x1E4F1CAD0];
          v28 = [v26 tagIdentifiers];
          v29 = [v27 setWithArray:v28];
          v30 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
          int v31 = [v29 isSubsetOfSet:v30];

          if (v31)
          {
            v32 = [v24 filterTypeSelections];
            uint64_t v33 = [v32 count];

            if (v33 == 1) {
              objc_msgSend(v37, "ic_addNonNilObject:", v19);
            }
          }
        }
        uint64_t v17 = [v38 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v17);
    }

    v34 = (void *)[v37 copy];
    id v3 = v36;
  }
  else
  {
    v34 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v34;
}

+ (__CFString)defaultSystemImageName
{
  return @"folder";
}

+ (__CFString)defaultFilledSystemImageName
{
  return @"folder.fill";
}

- (__CFString)systemImageName
{
  if ([a1 isTrashFolder])
  {
    v2 = @"trash";
  }
  else if ([a1 isSmartFolder])
  {
    v2 = @"gearshape";
  }
  else if ([a1 isSharedViaICloud])
  {
    v2 = @"folder.badge.person.crop";
  }
  else
  {
    v2 = [(id)objc_opt_class() defaultSystemImageName];
  }
  return v2;
}

- (__CFString)filledSystemImageName
{
  if ([a1 isTrashFolder])
  {
    v2 = @"trash.fill";
  }
  else if ([a1 isSmartFolder])
  {
    v2 = @"gearshape.fill";
  }
  else if ([a1 isSharedViaICloud])
  {
    v2 = @"folder.fill.badge.person.crop";
  }
  else
  {
    v2 = [(id)objc_opt_class() defaultFilledSystemImageName];
  }
  return v2;
}

+ (uint64_t)defaultNavigationBarIcon
{
  return [MEMORY[0x1E4FB1818] imageNamed:@"NavigationBarIcons/Folder"];
}

- (id)navigationBarIconOverlaySystemImage
{
  if ([a1 isTrashFolder])
  {
    v2 = @"trash.fill";
LABEL_7:
    id v3 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_systemImageNamed:", v2);
    goto LABEL_8;
  }
  if ([a1 isSmartFolder])
  {
    v2 = @"gearshape.fill";
    goto LABEL_7;
  }
  if ([a1 isSharedViaICloud])
  {
    v2 = @"person.crop.circle.fill";
    goto LABEL_7;
  }
  id v3 = 0;
LABEL_8:
  return v3;
}

- (id)navigationBarIconWithSize:()UI
{
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", a2, a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__ICFolder_UI__navigationBarIconWithSize___block_invoke;
  v9[3] = &unk_1E5FD8ED0;
  v9[4] = a1;
  *(double *)&v9[5] = a2;
  *(double *)&v9[6] = a3;
  uint64_t v7 = [v6 imageWithActions:v9];

  return v7;
}

@end