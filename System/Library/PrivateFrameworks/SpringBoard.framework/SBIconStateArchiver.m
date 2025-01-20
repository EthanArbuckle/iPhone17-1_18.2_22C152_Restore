@interface SBIconStateArchiver
+ (id)_iTunesDictionaryForLeafIcon:(id)a3 withIdentifier:(id)a4;
+ (id)_iTunesDictionaryForLeafIdentifier:(id)a3;
+ (id)_iTunesIconCellForCell:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6;
+ (id)_iTunesIconListForList:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6;
+ (id)_iTunesIconListsForLists:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6;
+ (id)_migrateLeafIdentifierIfNecessary:(id)a3;
+ (id)_modernIconCellForCell:(id)a3 allowFolders:(BOOL)a4;
+ (id)_modernIconListForList:(id)a3 allowFolders:(BOOL)a4;
+ (id)_modernIconListsForLists:(id)a3 allowFolders:(BOOL)a4;
+ (id)iTunesRepresentationFromRootArchive:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6;
+ (id)modernizeRootArchive:(id)a3;
+ (id)rootArchiveFromITunesRepresentation:(id)a3;
@end

@implementation SBIconStateArchiver

+ (id)iTunesRepresentationFromRootArchive:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v10 = (void *)MEMORY[0x1E4F1CA48];
  id v11 = a6;
  id v12 = a3;
  v13 = [v10 array];
  v14 = [v12 objectForKey:*MEMORY[0x1E4FA6878]];
  v15 = [a1 _iTunesIconListForList:v14 preApex:v7 pending:v6 iconSource:v11];
  [v13 addObject:v15];

  v16 = [v12 objectForKey:*MEMORY[0x1E4FA68C0]];

  v17 = [a1 _iTunesIconListsForLists:v16 preApex:v7 pending:v6 iconSource:v11];

  [v13 addObjectsFromArray:v17];
  return v13;
}

+ (id)rootArchiveFromITunesRepresentation:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    v10[0] = *MEMORY[0x1E4FA6878];
    BOOL v6 = [v3 objectAtIndex:0];
    v11[0] = v6;
    v10[1] = *MEMORY[0x1E4FA68C0];
    BOOL v7 = objc_msgSend(v3, "subarrayWithRange:", 1, v5 - 1);
    v11[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

+ (id)modernizeRootArchive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v6 = *MEMORY[0x1E4FA68C0];
  BOOL v7 = [v4 objectForKey:*MEMORY[0x1E4FA68C0]];
  v8 = [a1 _modernIconListsForLists:v7 allowFolders:1];
  uint64_t v9 = *MEMORY[0x1E4FA6878];
  v10 = [v4 objectForKey:*MEMORY[0x1E4FA6878]];
  id v11 = [a1 _modernIconListForList:v10 allowFolders:1];
  id v12 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v8, v6, v11, v9, 0);

  uint64_t v13 = *MEMORY[0x1E4FA68B0];
  v14 = [v4 objectForKey:*MEMORY[0x1E4FA68B0]];
  if (v14) {
    [v12 setObject:v14 forKeyedSubscript:v13];
  }
  uint64_t v15 = *MEMORY[0x1E4FA68B8];
  v16 = [v4 objectForKey:*MEMORY[0x1E4FA68B8]];
  if (v16) {
    [v12 setObject:v16 forKeyedSubscript:v15];
  }
  uint64_t v17 = *MEMORY[0x1E4FA6908];
  v18 = [v4 objectForKey:*MEMORY[0x1E4FA6908]];
  if (v18) {
    [v12 setObject:v18 forKeyedSubscript:v17];
  }
  uint64_t v19 = *MEMORY[0x1E4FA6880];
  v20 = [v4 objectForKey:*MEMORY[0x1E4FA6880]];
  if (v20) {
    [v12 setObject:v20 forKeyedSubscript:v19];
  }
  uint64_t v21 = *MEMORY[0x1E4FA68F0];
  v22 = [v4 objectForKey:*MEMORY[0x1E4FA68F0]];
  if (v22) {
    [v12 setObject:v22 forKeyedSubscript:v21];
  }
  uint64_t v23 = *MEMORY[0x1E4FA6900];
  v24 = [v4 objectForKey:*MEMORY[0x1E4FA6900]];
  if (v24) {
    [v12 setObject:v24 forKey:v23];
  }
  uint64_t v25 = *MEMORY[0x1E4FA6918];
  v26 = [v4 objectForKey:*MEMORY[0x1E4FA6918]];
  if (v26) {
    [v12 setObject:v26 forKey:v25];
  }
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v12];

  return v27;
}

+ (id)_migrateLeafIdentifierIfNecessary:(id)a3
{
  return +[SBIconModel migratedIdentifierForLeafIdentifier:a3];
}

+ (id)_modernIconCellForCell:(id)a3 allowFolders:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = *MEMORY[0x1E4FA68C0];
      uint64_t v9 = [v6 objectForKey:*MEMORY[0x1E4FA68C0]];
      v10 = [v6 objectForKey:*MEMORY[0x1E4FA68E0]];
      id v11 = v10;
      if (v9) {
        BOOL v12 = !v4;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        if (([v10 isEqual:*MEMORY[0x1E4FA68D8]] & 1) != 0
          || [v11 isEqual:*MEMORY[0x1E4FA68D0]])
        {
          id v7 = v6;
        }
        else
        {
          id v7 = [v6 objectForKey:*MEMORY[0x1E4FA68F8]];
          if (!v7)
          {
            v16 = [v6 objectForKey:*MEMORY[0x1E4FA68E8]];
            if (v16
              && ([MEMORY[0x1E4F1CB10] URLWithString:v16],
                  (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v18 = (void *)v17;
              v28 = v16;
              v29 = v11;
              v30 = v9;
              id v31 = a1;
              uint64_t v19 = [MEMORY[0x1E4F43048] webClips];
              long long v32 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                id v7 = 0;
                uint64_t v22 = *(void *)v33;
                do
                {
                  for (uint64_t i = 0; i != v21; ++i)
                  {
                    if (*(void *)v33 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
                    uint64_t v25 = [v24 pageURL];
                    int v26 = [v25 isEqual:v18];

                    if (v26)
                    {
                      uint64_t v27 = [v24 identifier];

                      id v7 = (id)v27;
                    }
                  }
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
                }
                while (v21);
              }
              else
              {
                id v7 = 0;
              }

              uint64_t v9 = v30;
              a1 = v31;
              v16 = v28;
              id v11 = v29;
            }
            else
            {
              id v7 = 0;
            }
          }
        }
      }
      else
      {
        id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
        uint64_t v13 = [a1 _modernIconListsForLists:v9 allowFolders:1];
        [v7 setObject:v13 forKey:v8];
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [a1 _migrateLeafIdentifierIfNecessary:v7];

    id v7 = (id)v14;
  }

  return v7;
}

+ (id)_modernIconListForList:(id)a3 allowFolders:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 objectForKey:*MEMORY[0x1E4FA68C8]];

    id v6 = (id)v8;
  }
  unint64_t v9 = 0x1E4F1C000uLL;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = v6;
    id obj = v6;
    uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v13 = 0;
        uint64_t v25 = v11;
        do
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v15 = v14;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              unint64_t v18 = v9;
              uint64_t v19 = *(void *)v28;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v28 != v19) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v21 = objc_msgSend(a1, "_modernIconCellForCell:allowFolders:", *(void *)(*((void *)&v27 + 1) + 8 * i), v4, v23);
                  if (v21) {
                    [v7 addObject:v21];
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
              }
              while (v17);
              unint64_t v9 = v18;
              uint64_t v12 = v24;
              uint64_t v11 = v25;
            }
          }
          else
          {
            id v15 = [a1 _modernIconCellForCell:v14 allowFolders:v4];
            if (v15) {
              [v7 addObject:v15];
            }
          }

          ++v13;
        }
        while (v13 != v11);
        uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v11);
    }

    id v6 = v23;
  }

  return v7;
}

+ (id)_modernIconListsForLists:(id)a3 allowFolders:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [a1 _modernIconListForList:*(void *)(*((void *)&v15 + 1) + 8 * i) allowFolders:v4];
          if ([v13 count] || !objc_msgSend(v7, "count")) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  return v7;
}

+ (id)_iTunesIconListsForLists:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = objc_msgSend(a1, "_iTunesIconListForList:preApex:pending:iconSource:", *(void *)(*((void *)&v20 + 1) + 8 * i), v8, v7, v11, (void)v20);
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v12;
}

+ (id)_iTunesIconListForList:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  v36 = v10;
  if (v8)
  {
    uint64_t v13 = [v11 maxRowCountForListInRootFolderWithInterfaceOrientation:1];
    uint64_t v14 = [v11 maxColumnCountForListInRootFolderWithInterfaceOrientation:1];
    uint64_t v15 = [v10 count];
    uint64_t v32 = v13;
    if (v13)
    {
      unint64_t v16 = v15;
      unint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v31 = v14;
      do
      {
        if (v18 * v14 >= v16) {
          break;
        }
        uint64_t v34 = v18;
        context = (void *)MEMORY[0x1D948C4D0]();
        uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
        [v12 addObject:v19];
        uint64_t v20 = v14;
        unint64_t v35 = v17;
        if (v14)
        {
          do
          {
            if (v17 >= v16)
            {
              long long v21 = 0;
            }
            else
            {
              long long v21 = [v36 objectAtIndex:v17];
              if (v21)
              {
                uint64_t v22 = [a1 _iTunesIconCellForCell:v21 preApex:1 pending:v7 iconSource:v11];
                if (v22) {
                  goto LABEL_12;
                }
              }
            }
            uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", 0, v31);
LABEL_12:
            long long v23 = (void *)v22;
            objc_msgSend(v19, "addObject:", v22, v31);

            ++v17;
          }
          while (--v20);
        }

        uint64_t v18 = v34 + 1;
        uint64_t v14 = v31;
        unint64_t v17 = v35 + v31;
      }
      while (v34 + 1 != v32);
    }
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v24 = v10;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(v24);
          }
          long long v29 = [a1 _iTunesIconCellForCell:*(void *)(*((void *)&v37 + 1) + 8 * i) preApex:0 pending:v7 iconSource:v11];
          if (v29) {
            [v12 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v26);
    }
  }
  return v12;
}

+ (id)_iTunesIconCellForCell:(id)a3 preApex:(BOOL)a4 pending:(BOOL)a5 iconSource:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v10;
    uint64_t v13 = [v11 leafIconForIdentifier:v12];
    if (v13)
    {
      uint64_t v14 = [a1 _iTunesDictionaryForLeafIcon:v13 withIdentifier:v12];
    }
    else
    {
      if (!v7)
      {
        uint64_t v15 = 0;
        goto LABEL_11;
      }
      uint64_t v14 = [a1 _iTunesDictionaryForLeafIdentifier:v12];
    }
    uint64_t v15 = (void *)v14;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  uint64_t v15 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0 && !a4)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
    uint64_t v16 = *MEMORY[0x1E4FA68C0];
    id v12 = [v15 objectForKey:*MEMORY[0x1E4FA68C0]];
    unint64_t v17 = [a1 _iTunesIconListsForLists:v12 preApex:0 pending:v7 iconSource:v11];
    [v15 setObject:v17 forKey:v16];

    [v15 removeObjectForKey:*MEMORY[0x1E4FA6898]];
    [v15 removeObjectForKey:*MEMORY[0x1E4FA68B8]];
    [v15 removeObjectForKey:*MEMORY[0x1E4FA6910]];
LABEL_12:
  }
  return v15;
}

+ (id)_iTunesDictionaryForLeafIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = v4;
  if (v3)
  {
    [v4 setObject:v3 forKey:*MEMORY[0x1E4FA68F8]];
    [v5 setObject:v3 forKey:*MEMORY[0x1E4FA6888]];
  }

  return v5;
}

+ (id)_iTunesDictionaryForLeafIcon:(id)a3 withIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v8 = [v5 displayNameForLocation:*MEMORY[0x1E4FA66C8]];
  if (v8) {
    [v7 setObject:v8 forKey:*MEMORY[0x1E4FA68A0]];
  }
  if (v6) {
    [v7 setObject:v6 forKey:*MEMORY[0x1E4FA68F8]];
  }
  if (![v5 isBookmarkIcon])
  {
    if (![v5 isApplicationIcon] || !objc_msgSend(v5, "hasApplication")) {
      goto LABEL_21;
    }
    uint64_t v9 = [v5 application];
    uint64_t v14 = [v9 info];
    id v10 = [v14 bundleVersion];

    if (v10) {
      [v7 setObject:v10 forKey:*MEMORY[0x1E4FA6890]];
    }
    id v11 = [v9 bundleIdentifier];
    if (v11) {
      [v7 setObject:v11 forKey:*MEMORY[0x1E4FA6888]];
    }
    id v12 = [v9 info];
    [v12 lastModifiedDate];
    goto LABEL_17;
  }
  uint64_t v9 = [v5 webClip];
  id v10 = [v9 pageURL];
  id v11 = [v10 relativePath];
  if (v11) {
    [v7 setObject:v11 forKey:*MEMORY[0x1E4FA68E8]];
  }
  id v12 = [v9 iconImagePath];
  if (v12)
  {
    SBModificationDateForPath();
LABEL_17:
    double v15 = v13;
    goto LABEL_19;
  }
  double v15 = 0.0;
LABEL_19:

  if (v15 != 0.0)
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v15];
    [v7 setObject:v16 forKey:*MEMORY[0x1E4FA68A8]];
  }
LABEL_21:

  return v7;
}

@end