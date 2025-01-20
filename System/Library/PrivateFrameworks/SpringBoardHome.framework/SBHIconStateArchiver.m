@interface SBHIconStateArchiver
+ (BOOL)_iconContainsMultipleRepresentations:(id)a3;
+ (BOOL)_isCustomIconElementBuiltIn:(id)a3;
+ (BOOL)_widgetDataSourceIsSuggestion:(id)a3;
+ (id)_builtInCustomIconElementTypeForCustomIconElement:(id)a3;
+ (id)_folderTypeForFolder:(id)a3;
+ (id)_nodeAtPath:(id)a3 inNode:(id)a4;
+ (id)_pathForNode:(id)a3 toIdentifier:(id)a4;
+ (id)archiveRootFolderInModel:(id)a3 metadata:(id)a4;
+ (id)folderPathForLeafIdentifier:(id)a3 inArchive:(id)a4 iconSource:(id)a5;
+ (id)iconStateRepresentationForFolder:(id)a3 inModel:(id)a4;
+ (id)indexPathForLeafIdentifier:(id)a3 inArchive:(id)a4;
+ (id)leafIdentifiersFromArchive:(id)a3;
+ (id)leafIdentifiersInListAtIndexPath:(id)a3 inArchive:(id)a4;
+ (id)modernizeRootArchive:(id)a3;
+ (id)unarchiveRootFolderFromArchive:(id)a3 withIconSource:(id)a4;
+ (void)_addLeafNodesForNode:(id)a3 toSet:(id)a4;
- (NSDictionary)metadata;
- (SBHIconModel)iconModel;
- (SBHIconStateArchiver)initWithRootNode:(id)a3;
- (SBHIconStateArchiverDelegate)delegate;
- (id)_metadataForList:(id)a3;
- (id)_representationForApplicationIcon:(id)a3;
- (id)_representationForCustomIcon:(id)a3;
- (id)_representationForCustomIconElement:(id)a3;
- (id)_representationForFolder:(id)a3;
- (id)_representationForIcon:(id)a3;
- (id)_representationForList:(id)a3;
- (id)_representationForNode:(id)a3;
- (id)_representationsForIcon:(id)a3;
- (id)archiveStringForGridSizeClass:(id)a3;
- (id)archiveWithError:(id *)a3;
- (id)customGridSizeClassDomain;
- (id)effectiveDelegate;
- (id)effectiveGridSizeClassDomain;
- (id)rootNode;
- (void)_addValuesForCustomIconElement:(id)a3 toRepresentation:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIconModel:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRootNode:(id)a3;
@end

@implementation SBHIconStateArchiver

+ (id)archiveRootFolderInModel:(id)a3 metadata:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 rootFolder];
  v9 = (void *)[objc_alloc((Class)a1) initWithRootNode:v8];
  [v9 setIconModel:v7];

  [v9 setMetadata:v6];
  v10 = [v9 archiveWithError:0];

  return v10;
}

+ (id)unarchiveRootFolderFromArchive:(id)a3 withIconSource:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[SBHIconStateUnarchiver alloc] initWithArchive:v6 iconModel:v5];

  v8 = [(SBHIconStateUnarchiver *)v7 unarchive];

  return v8;
}

+ (id)leafIdentifiersFromArchive:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v6 = (void *)MEMORY[0x1D9484600]();
  [a1 _addLeafNodesForNode:v4 toSet:v5];

  return v5;
}

+ (id)indexPathForLeafIdentifier:(id)a3 inArchive:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9484600]();
  v9 = [a1 _pathForNode:v7 toIdentifier:v6];

  return v9;
}

+ (id)folderPathForLeafIdentifier:(id)a3 inArchive:(id)a4 iconSource:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v30 = a5;
  v27 = [a1 indexPathForLeafIdentifier:a3 inArchive:v8];
  v9 = objc_msgSend(v27, "sb_indexPathByRemovingLastIconPathComponent");
  v29 = objc_alloc_init(SBIconStateFolderPath);
  v26 = v9;
  v10 = objc_msgSend(v9, "sb_iconRelativePathComponents");
  id v11 = objc_alloc_init(MEMORY[0x1E4F28D58]);
  id v12 = v8;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  v25 = v12;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    v16 = v12;
    do
    {
      uint64_t v17 = 0;
      v18 = v16;
      v19 = v11;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v34 + 1) + 8 * v17);
        objc_msgSend(v20, "bs_indexPathByAddingPrefix:", v19);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        v16 = [a1 _nodeAtPath:v20 inNode:v18];
        id v32 = 0;
        id v33 = 0;
        id v31 = 0;
        +[SBHIconStateUnarchiver _getFolderDisplayName:&v33 defaultDisplayName:&v32 uniqueIdentifier:&v31 forRepresentation:v16 iconSource:v30];
        id v21 = v33;
        id v22 = v32;
        id v23 = v31;
        [(SBIconStateFolderPath *)v29 addFolderWithName:v21 defaultName:v22 uniqueIdentifier:v23 indexPath:v11];

        ++v17;
        v18 = v16;
        v19 = v11;
      }
      while (v14 != v17);
      uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v14);
  }
  else
  {
    v16 = v12;
  }

  return v29;
}

+ (id)leafIdentifiersInListAtIndexPath:(id)a3 inArchive:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 length];
  uint64_t v8 = (uint64_t)v6;
  if (!v7)
  {
LABEL_20:
    id v23 = (void *)MEMORY[0x1E4F1CBF0];
    v20 = self;
    if (objc_opt_isKindOfClass()) {
      v24 = (void *)v8;
    }
    else {
      v24 = v23;
    }
    id v25 = v24;
    id v11 = (void *)v8;
    goto LABEL_24;
  }
  uint64_t v9 = v7;
  uint64_t v10 = 0;
  id v11 = v6;
  while (1)
  {
    uint64_t v12 = [v5 indexAtPosition:v10];
    uint64_t v13 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      break;
    }
    uint64_t v15 = [v11 objectAtIndex:v12];
LABEL_15:
    uint64_t v8 = v15;
LABEL_16:

    ++v10;
    id v11 = (void *)v8;
    if (v9 == v10) {
      goto LABEL_20;
    }
  }
  v16 = self;
  char v17 = objc_opt_isKindOfClass();

  if ((v17 & 1) == 0)
  {
    id v25 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_26;
  }
  switch(v12)
  {
    case 10000:
      v18 = v11;
      v19 = @"buttonBar";
LABEL_14:
      uint64_t v15 = [v18 objectForKey:v19];
      goto LABEL_15;
    case 20000:
      v18 = v11;
      v19 = @"today";
      goto LABEL_14;
    case 40000:
      v18 = v11;
      v19 = @"favoriteToday";
      goto LABEL_14;
    case 30000:
      v18 = v11;
      v19 = @"ignored";
      goto LABEL_14;
  }
  id v27 = v6;
  v20 = [v11 objectForKey:@"iconLists"];
  id v21 = self;
  char v22 = objc_opt_isKindOfClass();

  if (v22)
  {
    uint64_t v8 = [v20 objectAtIndex:v12];

    id v11 = v20;
    id v6 = v27;
    goto LABEL_16;
  }
  id v6 = v27;
  id v25 = (id)MEMORY[0x1E4F1CBF0];
LABEL_24:

LABEL_26:
  return v25;
}

+ (id)modernizeRootArchive:(id)a3
{
  id v3 = a3;
  return v3;
}

- (SBHIconStateArchiver)initWithRootNode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconStateArchiver;
  id v6 = [(SBHIconStateArchiver *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_rootNode, a3);
  }

  return v7;
}

- (id)archiveWithError:(id *)a3
{
  id v4 = [(SBHIconStateArchiver *)self rootNode];
  id v5 = (void *)MEMORY[0x1D9484600]();
  id v6 = [(SBHIconStateArchiver *)self _representationForNode:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
    uint64_t v8 = [(SBHIconStateArchiver *)self metadata];
    if (v8) {
      [v7 setObject:v8 forKeyedSubscript:@"metadata"];
    }
    objc_super v9 = [(SBHIconStateArchiver *)self effectiveDelegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v9 versionForIconStateArchiver:self];
      if (v10) {
        [v7 setObject:v10 forKeyedSubscript:@"widgetVersion"];
      }
    }
    else
    {
      [v7 setObject:&unk_1F300EB78 forKeyedSubscript:@"widgetVersion"];
    }
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];

    id v6 = (void *)v11;
  }

  return v6;
}

+ (void)_addLeafNodesForNode:(id)a3 toSet:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v10 = self;
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v12 = v6;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_msgSend(a1, "_addLeafNodesForNode:toSet:", *(void *)(*((void *)&v23 + 1) + 8 * i), v7, (void)v23);
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v14);
      }
    }
    else
    {
      char v17 = self;
      char v18 = objc_opt_isKindOfClass();

      if ((v18 & 1) == 0) {
        goto LABEL_25;
      }
      id v12 = [v6 objectForKey:@"buttonBar"];
      if (v12) {
        [a1 _addLeafNodesForNode:v12 toSet:v7];
      }
      v19 = [v6 objectForKey:@"today"];
      if (v19) {
        [a1 _addLeafNodesForNode:v19 toSet:v7];
      }
      v20 = [v6 objectForKey:@"favoriteToday"];
      if (v20) {
        [a1 _addLeafNodesForNode:v20 toSet:v7];
      }
      id v21 = [v6 objectForKey:@"iconLists"];
      if (v21) {
        [a1 _addLeafNodesForNode:v21 toSet:v7];
      }
      char v22 = [v6 objectForKey:@"ignored"];
      if (v22) {
        [a1 _addLeafNodesForNode:v22 toSet:v7];
      }
    }
    goto LABEL_25;
  }
  [v7 addObject:v6];
LABEL_25:
}

+ (id)_pathForNode:(id)a3 toIdentifier:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if ([v7 isEqualToString:v8])
    {
      id v4 = objc_msgSend(MEMORY[0x1E4F28D58], "bs_emptyPath");
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  char v11 = self;
  char v12 = objc_opt_isKindOfClass();

  if (v12)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = *(void *)v38;
      while (2)
      {
        uint64_t v18 = 0;
        uint64_t v19 = v16 + v15;
        do
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v20 = objc_msgSend(a1, "_pathForNode:toIdentifier:", *(void *)(*((void *)&v37 + 1) + 8 * v18), v8, (void)v37);
          if (v20)
          {
            long long v24 = (void *)v20;
            long long v25 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v16 + v18];
            id v4 = objc_msgSend(v24, "bs_indexPathByAddingPrefix:", v25);

            goto LABEL_19;
          }
          ++v18;
        }
        while (v15 != v18);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v41 count:16];
        uint64_t v16 = v19;
        if (v15) {
          continue;
        }
        break;
      }
    }

    goto LABEL_38;
  }
  id v21 = self;
  char v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) == 0)
  {
LABEL_38:
    id v4 = 0;
    goto LABEL_39;
  }
  id v13 = [v7 objectForKey:@"iconLists"];
  if (!v13
    || ([a1 _pathForNode:v13 toIdentifier:v8], (uint64_t v23 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v26 = [v7 objectForKey:@"buttonBar"];
    if (v26)
    {
      uint64_t v27 = [a1 _pathForNode:v26 toIdentifier:v8];
      if (v27)
      {
        uint64_t v28 = (void *)v27;
        v29 = [MEMORY[0x1E4F28D58] indexPathWithIndex:10000];
        id v4 = objc_msgSend(v28, "bs_indexPathByAddingPrefix:", v29);
        int v30 = 1;
        goto LABEL_37;
      }
    }
    v29 = [v7 objectForKey:@"today"];
    if (v29)
    {
      uint64_t v31 = [a1 _pathForNode:v29 toIdentifier:v8];
      if (v31)
      {
        uint64_t v28 = (void *)v31;
        id v32 = [MEMORY[0x1E4F28D58] indexPathWithIndex:20000];
        id v4 = objc_msgSend(v28, "bs_indexPathByAddingPrefix:", v32);
        int v30 = 1;
LABEL_36:

LABEL_37:
        if (v30) {
          goto LABEL_39;
        }
        goto LABEL_38;
      }
    }
    id v32 = [v7 objectForKey:@"favoriteToday"];
    if (v32)
    {
      uint64_t v33 = [a1 _pathForNode:v32 toIdentifier:v8];
      if (v33)
      {
        uint64_t v28 = (void *)v33;
        long long v34 = [MEMORY[0x1E4F28D58] indexPathWithIndex:40000];
        id v4 = objc_msgSend(v28, "bs_indexPathByAddingPrefix:", v34);
LABEL_32:
        int v30 = 1;
LABEL_35:

        goto LABEL_36;
      }
    }
    long long v34 = [v7 objectForKey:@"ignored"];
    if (v34)
    {
      uint64_t v28 = [a1 _pathForNode:v34 toIdentifier:v8];
      if (v28)
      {
        long long v35 = [MEMORY[0x1E4F28D58] indexPathWithIndex:30000];
        id v4 = objc_msgSend(v28, "bs_indexPathByAddingPrefix:", v35);

        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    int v30 = 0;
    goto LABEL_35;
  }
  id v4 = (void *)v23;
LABEL_19:

LABEL_39:
  return v4;
}

+ (id)_nodeAtPath:(id)a3 inNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  if (objc_opt_isKindOfClass())
  {

LABEL_6:
    id v13 = v7;
    goto LABEL_20;
  }
  uint64_t v9 = [v6 length];

  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v12 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "indexAtPosition:", 0));
  }
  else
  {
    uint64_t v14 = self;
    char v15 = objc_opt_isKindOfClass();

    if ((v15 & 1) == 0)
    {
      id v13 = 0;
      goto LABEL_20;
    }
    uint64_t v16 = [v6 indexAtPosition:0];
    switch(v16)
    {
      case 10000:
        uint64_t v17 = @"buttonBar";
        break;
      case 20000:
        uint64_t v17 = @"today";
        break;
      case 40000:
        uint64_t v17 = @"favoriteToday";
        break;
      case 30000:
        uint64_t v17 = @"ignored";
        break;
      default:
        uint64_t v18 = [v7 objectForKey:@"iconLists"];
        id v13 = [a1 _nodeAtPath:v6 inNode:v18];
        goto LABEL_19;
    }
    uint64_t v12 = [v7 objectForKey:v17];
  }
  uint64_t v18 = (void *)v12;
  uint64_t v19 = objc_msgSend(v6, "bs_indexPathByRemovingFirstIndex");
  id v13 = [a1 _nodeAtPath:v19 inNode:v18];

LABEL_19:
LABEL_20:

  return v13;
}

- (id)effectiveDelegate
{
  id v3 = [(SBHIconStateArchiver *)self delegate];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SBHIconStateArchiver *)self iconModel];
  }
  id v6 = v5;

  return v6;
}

- (id)customGridSizeClassDomain
{
  id v3 = [(SBHIconStateArchiver *)self effectiveDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 iconGridSizeClassDomainForIconStateArchiver:self];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)effectiveGridSizeClassDomain
{
  id v3 = [(SBHIconStateArchiver *)self customGridSizeClassDomain];
  if (!v3)
  {
    id v4 = [(SBHIconStateArchiver *)self rootNode];
    if (objc_opt_respondsToSelector())
    {
      id v3 = [v4 gridSizeClassDomain];

      if (v3) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    id v3 = +[SBHIconGridSizeClassDomain globalDomain];
  }
LABEL_7:
  return v3;
}

- (id)_representationForIcon:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v7 = 0;
    goto LABEL_9;
  }
  if ([v4 isFolderIcon])
  {
    id v6 = [v5 folder];
    id v7 = [(SBHIconStateArchiver *)self _representationForFolder:v6];
LABEL_8:

    goto LABEL_9;
  }
  if ([v5 isPlaceholder])
  {
    id v6 = [v5 referencedIcon];
    id v8 = [v5 referencedIcon];
    uint64_t v9 = [(SBHIconStateArchiver *)self _representationForIcon:v8];
LABEL_7:
    id v7 = v9;

    goto LABEL_8;
  }
  if ([v5 isWidgetIcon])
  {
    uint64_t v11 = [(SBHIconStateArchiver *)self _representationForCustomIcon:v5];
  }
  else
  {
    if (![v5 isApplicationIcon])
    {
      id v6 = [(SBHIconStateArchiver *)self effectiveDelegate];
      if (objc_opt_respondsToSelector())
      {
        id v7 = [v6 archiver:self representationForIcon:v5];
        if (v7) {
          goto LABEL_8;
        }
      }
      uint64_t v12 = [v5 leafIdentifier];
      id v8 = (void *)v12;
      id v13 = &stru_1F2FA0300;
      if (v12) {
        id v13 = (__CFString *)v12;
      }
      uint64_t v9 = v13;
      goto LABEL_7;
    }
    uint64_t v11 = [(SBHIconStateArchiver *)self _representationForApplicationIcon:v5];
  }
  id v7 = (void *)v11;
LABEL_9:

  return v7;
}

+ (BOOL)_iconContainsMultipleRepresentations:(id)a3
{
  return [a3 isPlaceholder];
}

- (id)_representationsForIcon:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v4 isPlaceholder])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v15 = 0u;
      id v6 = objc_msgSend(v4, "referencedIcons", 0, 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        while (1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = [v4 referencedIcon];
          uint64_t v11 = [(SBHIconStateArchiver *)self _representationForIcon:v10];

          if (v11) {
            [v5 addObject:v11];
          }

          if (!--v8)
          {
            uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (!v8) {
              break;
            }
          }
        }
      }
    }
    else
    {
      uint64_t v12 = [(SBHIconStateArchiver *)self _representationForIcon:v4];
      if (v12) {
        [v5 addObject:v12];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_representationForList:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = objc_msgSend(v4, "icons", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if ([(id)objc_opt_class() _iconContainsMultipleRepresentations:v11])
          {
            uint64_t v12 = [(SBHIconStateArchiver *)self _representationsForIcon:v11];
            if (v12) {
              [v5 addObjectsFromArray:v12];
            }
          }
          else
          {
            uint64_t v12 = [(SBHIconStateArchiver *)self _representationForIcon:v11];
            if (v12) {
              [v5 addObject:v12];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_metadataForList:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 hiddenDate];
    id v6 = [v4 _rotatedIconsIfApplicable];
    uint64_t v7 = [v4 focusModeIdentifiers];
    uint64_t v8 = [v7 allObjects];

    uint64_t v9 = [v4 fixedIconLocations];
    uint64_t v10 = [v4 rotatedFixedIconLocations];
    uint64_t v11 = [v4 overflowSlotCount];
    uint64_t v12 = v11;
    if (v5 || v6 || v8 || v9 || v10 || v11)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v13 = v14;
      if (v5) {
        [v14 setObject:v5 forKey:@"hiddenDate"];
      }
      if (v8) {
        [v13 setObject:v8 forKey:@"focusModeIdentifiers"];
      }
      if (v12)
      {
        long long v15 = [NSNumber numberWithUnsignedInteger:v12];
        [v13 setObject:v15 forKey:@"overflowSlotCount"];
      }
      if (v6)
      {
        v29 = v8;
        uint64_t v31 = v5;
        long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        int v30 = v6;
        id v17 = v6;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v33 != v20) {
                objc_enumerationMutation(v17);
              }
              char v22 = [*(id *)(*((void *)&v32 + 1) + 8 * i) uniqueIdentifier];
              [v16 addObject:v22];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v19);
        }

        [v13 setObject:v16 forKey:@"rotatedOrder"];
        id v6 = v30;
        id v5 = v31;
        uint64_t v8 = v29;
      }
      if (v9 | v10)
      {
        uint64_t v23 = v9 ? v9 : MEMORY[0x1E4F1CC08];
        [v13 setObject:v23 forKey:@"fixedLocations"];
        unsigned int v24 = [v4 gridSize];
        unsigned __int16 v25 = v24;
        long long v26 = [NSNumber numberWithUnsignedShort:HIWORD(v24)];
        [v13 setObject:v26 forKey:@"fixedLocationsGridRows"];

        uint64_t v27 = [NSNumber numberWithUnsignedShort:v25];
        [v13 setObject:v27 forKey:@"fixedLocationsGridColumns"];

        if (v10) {
          [v13 setObject:v10 forKey:@"rotatedFixedLocations"];
        }
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)_folderTypeForFolder:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 isRootFolder]) {
      id v5 = 0;
    }
    else {
      id v5 = @"folder";
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_representationForFolder:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v6 = [(id)objc_opt_class() _folderTypeForFolder:v4];
    if (v6) {
      [v5 setObject:v6 forKey:@"listType"];
    }
    uint64_t v7 = [v4 defaultDisplayName];
    if (v7) {
      [v5 setObject:v7 forKey:@"defaultDisplayName"];
    }
    uint64_t v8 = [v4 displayName];
    if (v8) {
      [v5 setObject:v8 forKey:@"displayName"];
    }
    long long v34 = (void *)v8;
    long long v35 = (void *)v7;
    long long v36 = (void *)v6;
    uint64_t v9 = [v4 uniqueIdentifier];
    if (v9) {
      [v5 setObject:v9 forKey:@"uniqueIdentifier"];
    }
    uint64_t v32 = v9;
    uint64_t v37 = v5;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v38 = v4;
    uint64_t v12 = [v4 lists];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = 0;
      uint64_t v16 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v19 = -[SBHIconStateArchiver _representationForList:](self, "_representationForList:", v18, v32);
          [v10 addObject:v19];

          uint64_t v20 = [v18 uniqueIdentifier];
          [v11 addObject:v20];
          id v21 = [(SBHIconStateArchiver *)self _metadataForList:v18];
          if (v21)
          {
            if (!v15) {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            [v15 setObject:v21 forKey:v20];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v14);
    }
    else
    {
      id v15 = 0;
    }

    char v22 = v37;
    [v37 setObject:v10 forKey:@"iconLists"];
    [v37 setObject:v11 forKey:@"listUniqueIdentifiers"];
    if (v15) {
      [v37 setObject:v15 forKey:@"listMetadata"];
    }
    id v4 = v38;
    if (objc_msgSend(v38, "isRootFolder", v32))
    {
      uint64_t v23 = [v38 dock];
      unsigned int v24 = [(SBHIconStateArchiver *)self _representationForList:v23];

      if (v24) {
        [v37 setObject:v24 forKey:@"buttonBar"];
      }
      unsigned __int16 v25 = [v38 todayList];
      long long v26 = [(SBHIconStateArchiver *)self _representationForList:v25];

      if ([v26 count]) {
        [v37 setObject:v26 forKey:@"today"];
      }
      uint64_t v27 = [v38 favoriteTodayList];
      uint64_t v28 = [(SBHIconStateArchiver *)self _representationForList:v27];

      if ([v28 count]) {
        [v37 setObject:v28 forKey:@"favoriteToday"];
      }
      v29 = [v38 ignoredList];
      int v30 = [(SBHIconStateArchiver *)self _representationForList:v29];

      if ([v30 count]) {
        [v37 setObject:v30 forKey:@"ignored"];
      }
    }
  }
  else
  {
    char v22 = 0;
  }

  return v22;
}

+ (id)iconStateRepresentationForFolder:(id)a3 inModel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithRootNode:v7];

  [v8 setIconModel:v6];
  uint64_t v9 = [v8 archiveWithError:0];

  return v9;
}

- (id)_representationForApplicationIcon:(id)a3
{
  id v3 = a3;
  id v4 = [v3 leafIdentifier];
  id v5 = [v3 applicationBundleID];

  if (v4 && v5 && ([v4 isEqualToString:v5] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [v6 setObject:@"app" forKey:@"iconType"];
    [v6 setObject:v4 forKey:@"displayIdentifier"];
    [v6 setObject:v5 forKey:@"bundleIdentifier"];
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (id)_representationForCustomIcon:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:@"custom" forKey:@"iconType"];
  id v6 = [v4 leafIdentifier];
  if (v6) {
    [v5 setObject:v6 forKey:@"displayIdentifier"];
  }
  id v7 = [v4 iconDataSources];
  uint64_t v8 = [v7 firstObject];
  uint64_t v9 = [v7 count];
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = v9;
  if (v9 == 1 && [(id)objc_opt_class() _isCustomIconElementBuiltIn:v8])
  {
    if ([(id)objc_opt_class() _widgetDataSourceIsSuggestion:v8])
    {
LABEL_7:
      id v11 = 0;
      goto LABEL_27;
    }
    [(SBHIconStateArchiver *)self _addValuesForCustomIconElement:v8 toRepresentation:v5];
  }
  else
  {
    uint64_t v27 = v8;
    uint64_t v28 = v6;
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          if (([(id)objc_opt_class() _widgetDataSourceIsSuggestion:v18] & 1) == 0)
          {
            uint64_t v19 = [(SBHIconStateArchiver *)self _representationForCustomIconElement:v18];
            if (v19) {
              [v12 addObject:v19];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v15);
    }

    [v5 setObject:v12 forKey:@"elements"];
    uint64_t v8 = v27;
    id v6 = v28;
  }
  uint64_t v20 = objc_msgSend(v4, "lastUserSelectedDataSource", v27, v28, (void)v29);
  if (objc_opt_respondsToSelector())
  {
    id v21 = [v20 uniqueIdentifier];
    if (v21) {
      [v5 setObject:v21 forKey:@"userSelectedElementIdentifier"];
    }
  }
  char v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "allowsSuggestions"));
  [v5 setObject:v22 forKey:@"allowsSuggestions"];

  uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "allowsExternalSuggestions"));
  [v5 setObject:v23 forKey:@"allowsExternalSuggestions"];

  unsigned int v24 = [v4 gridSizeClass];
  unsigned __int16 v25 = [(SBHIconStateArchiver *)self archiveStringForGridSizeClass:v24];
  if (v25) {
    [v5 setObject:v25 forKey:@"gridSize"];
  }
  id v11 = v5;

LABEL_27:
  return v11;
}

- (id)archiveStringForGridSizeClass:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHIconStateArchiver *)self effectiveGridSizeClassDomain];
  id v6 = [v5 archiveValueForGridSizeClass:v4];

  return v6;
}

+ (BOOL)_widgetDataSourceIsSuggestion:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && [v3 suggestionSource] == 1;

  return v4;
}

- (id)_representationForCustomIconElement:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() _isCustomIconElementBuiltIn:v4])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(SBHIconStateArchiver *)self _addValuesForCustomIconElement:v4 toRepresentation:v5];
  }
  else
  {
    id v6 = [(SBHIconStateArchiver *)self effectiveDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v6 archiver:self representationForIconDataSource:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (void)_addValuesForCustomIconElement:(id)a3 toRepresentation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v5 uniqueIdentifier];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      [v6 setObject:v7 forKey:@"uniqueIdentifier"];
    }
  }
  uint64_t v9 = [(id)objc_opt_class() _builtInCustomIconElementTypeForCustomIconElement:v5];
  if (v9) {
    [v6 setObject:v9 forKey:@"elementType"];
  }
  uint64_t v10 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v12 = v5;
    id v13 = [v12 kind];
    if (v13) {
      [v6 setObject:v13 forKey:@"widgetIdentifier"];
    }
    uint64_t v14 = [v12 extensionBundleIdentifier];
    if (v14) {
      [v6 setObject:v14 forKey:@"bundleIdentifier"];
    }
    uint64_t v15 = [v12 containerBundleIdentifier];
    if (v15) {
      [v6 setObject:v15 forKey:@"containerBundleIdentifier"];
    }
  }
  else
  {
    uint64_t v12 = SBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SBHIconStateArchiver _addValuesForCustomIconElement:toRepresentation:]();
    }
  }
}

+ (id)_builtInCustomIconElementTypeForCustomIconElement:(id)a3
{
  id v3 = a3;
  id v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = @"widget";
  }
  else
  {
    uint64_t v7 = self;
    char v8 = objc_opt_isKindOfClass();

    if (v8)
    {
      id v6 = @"siriSuggestions";
    }
    else
    {
      uint64_t v9 = self;
      char v10 = objc_opt_isKindOfClass();

      if (v10)
      {
        id v6 = @"appPredictions";
      }
      else
      {
        id v11 = self;
        char v12 = objc_opt_isKindOfClass();

        if (v12)
        {
          id v6 = @"shortcuts";
        }
        else
        {
          id v13 = self;
          char v14 = objc_opt_isKindOfClass();

          if (v14)
          {
            id v6 = @"shortcutsSingle";
          }
          else
          {
            uint64_t v15 = self;
            char v16 = objc_opt_isKindOfClass();

            if (v16) {
              id v6 = @"files";
            }
            else {
              id v6 = 0;
            }
          }
        }
      }
    }
  }

  return v6;
}

+ (BOOL)_isCustomIconElementBuiltIn:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _builtInCustomIconElementTypeForCustomIconElement:v3];

  return v4 != 0;
}

- (id)_representationForNode:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SBHIconStateArchiver *)self _representationForFolder:v4];
LABEL_7:
    id v6 = (void *)v5;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SBHIconStateArchiver *)self _representationForList:v4];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(SBHIconStateArchiver *)self _representationForIcon:v4];
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (id)rootNode
{
  return self->_rootNode;
}

- (void)setRootNode:(id)a3
{
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
}

- (SBHIconStateArchiverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHIconStateArchiverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong(&self->_rootNode, 0);
}

- (void)_addValuesForCustomIconElement:toRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D7F0A000, v0, v1, "Unknown custom icon element: %@", v2, v3, v4, v5, v6);
}

@end