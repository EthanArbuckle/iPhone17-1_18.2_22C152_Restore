@interface PSSearchIndexOperation
+ (id)_bundleForSearchEntry:(id)a3 thirdPartyApp:(BOOL *)a4;
+ (id)_loadSearchEntriesFromPlistForEntry:(id)a3 bundle:(id)a4;
+ (id)_loadThirdPartySearchEntriesForEntry:(id)a3 bundle:(id)a4;
+ (id)possibleBundleRoots;
+ (id)topLevelManifestBundlePath;
+ (void)setPossibleBundleRoots:(id)a3;
+ (void)setTopLevelManifestBundlePath:(id)a3;
- (PSSearchEntry)searchEntry;
- (PSSearchIndexOperation)initWithSearchEntry:(id)a3 delegate:(id)a4;
- (PSSearchIndexOperationDelegate)delegate;
- (void)_cancel;
- (void)_finishedIndexingWithEntries:(id)a3 cancelled:(BOOL)a4;
- (void)dealloc;
- (void)main;
- (void)setDelegate:(id)a3;
@end

@implementation PSSearchIndexOperation

+ (void)setTopLevelManifestBundlePath:(id)a3
{
  _topLevelManifestBundlePath = [a3 copy];
  MEMORY[0x1F41817F8]();
}

+ (void)setPossibleBundleRoots:(id)a3
{
}

- (PSSearchIndexOperation)initWithSearchEntry:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSSearchIndexOperation;
  v9 = [(PSSearchIndexOperation *)&v12 init];
  if (v9)
  {
    if (([v7 hasListController] & 1) == 0)
    {
      [v7 finishIndexing];
      v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v9->_searchEntry, a3);
    [(PSSearchIndexOperation *)v9 setDelegate:v8];
  }
  v10 = v9;
LABEL_6:

  return v10;
}

- (void)dealloc
{
  [(PSSearchIndexOperation *)self setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PSSearchIndexOperation;
  [(PSSearchIndexOperation *)&v3 dealloc];
}

- (void)_finishedIndexingWithEntries:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  [(PSSearchEntry *)self->_searchEntry finishIndexing];
  v6 = [(PSSearchIndexOperation *)self delegate];
  id v7 = v6;
  if (v4)
  {
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      goto LABEL_6;
    }
    id v7 = [(PSSearchIndexOperation *)self delegate];
    [v7 searchIndexOperationDidCancel:self];
  }
  else
  {
    [v6 searchIndexOperationDidFinish:self searchEntries:v9];
  }

LABEL_6:
  [(PSSearchIndexOperation *)self setDelegate:0];
}

- (void)_cancel
{
}

- (void)main
{
  v2 = self;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if ([(PSSearchIndexOperation *)self isCancelled]) {
    [(PSSearchIndexOperation *)v2 _cancel];
  }
  char v61 = 0;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = [(id)objc_opt_class() _bundleForSearchEntry:v2->_searchEntry thirdPartyApp:&v61];
  v5 = [(PSSearchEntry *)v2->_searchEntry specifier];
  v6 = [v5 propertyForKey:@"dataSourceClass"];

  if (v6)
  {
    id v7 = [NSClassFromString(v6) sharedInstance];
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v4 == 0;
    }
    if (!v8)
    {
      [v4 load];
      id v7 = [NSClassFromString(v6) sharedInstance];
    }
    if (v7)
    {
      id v9 = [(PSSearchIndexOperation *)v2 delegate];
      [v9 searchIndexOperation:v2 didFindSpecifierDataSource:v7];

      v10 = [(PSSearchEntry *)v2->_searchEntry specifier];
      v11 = [(PSSearchIndexOperation *)v2 delegate];
      objc_super v12 = [v7 specifiersForSpecifier:v10 observer:v11];

      if (v12)
      {
        v13 = SearchEntriesFromSpecifiers(v12, v2->_searchEntry, 0);
        [v3 addObjectsFromArray:v13];
      }
      Class v14 = 0;
LABEL_28:

      goto LABEL_29;
    }
  }
  if (v4)
  {
    if (v61)
    {
      Class v14 = 0;
LABEL_23:
      if ([(PSSearchIndexOperation *)v2 isCancelled]) {
        [(PSSearchIndexOperation *)v2 _cancel];
      }
      if (v61)
      {
        uint64_t v19 = [(id)objc_opt_class() _loadThirdPartySearchEntriesForEntry:v2->_searchEntry bundle:v4];
      }
      else
      {
        if ([v3 count]) {
          goto LABEL_29;
        }
        uint64_t v19 = [(id)objc_opt_class() _loadSearchEntriesFromPlistForEntry:v2->_searchEntry bundle:v4];
      }
      objc_super v12 = (void *)v19;
      [v3 addObjectsFromArray:v19];
      goto LABEL_28;
    }
    v15 = [v4 objectForInfoDictionaryKey:@"PSSupportsSearch"];
    int v16 = [v15 BOOLValue];

    if (v16)
    {
      v17 = [v4 objectForInfoDictionaryKey:@"PSSearchControllerClass"];
      if (v17)
      {
        [v4 load];
        Class v18 = NSClassFromString(v17);
        if (v18) {
          goto LABEL_22;
        }
      }
      Class v14 = (Class)[v4 principalClass];

      if (v14) {
        goto LABEL_23;
      }
    }
    v17 = [(PSSearchEntry *)v2->_searchEntry specifier];
    Class v18 = (Class)[(NSString *)v17 detailControllerClass];
LABEL_22:
    Class v14 = v18;

    goto LABEL_23;
  }
  Class v14 = 0;
LABEL_29:
  BOOL v20 = [(PSSearchEntry *)v2->_searchEntry isRootEntry];
  if (!v61 && v20)
  {
    v46 = v6;
    v52 = v3;
    uint64_t v21 = +[PSSearchIndexOperation topLevelManifestBundlePath];
    v22 = (void *)v21;
    v23 = @"/System/Library/PrivateFrameworks/PreferencesUI.framework";
    if (v21) {
      v23 = (__CFString *)v21;
    }
    v24 = v23;

    v45 = v24;
    v25 = [MEMORY[0x1E4F28B50] bundleWithPath:v24];
    v26 = v2;
    v48 = v14;
    v49 = v4;
    v47 = v25;
    if (v25)
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      SearchEntriesFromManifest(v2->_searchEntry, v25);
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v58 != v29) {
              objc_enumerationMutation(obj);
            }
            v31 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            v32 = [v31 sectionIdentifier];
            v33 = [(PSSearchEntry *)v2->_searchEntry sectionEntry];
            v34 = [v33 identifier];
            int v35 = [v32 isEqualToString:v34];

            if (v35) {
              [v52 addObject:v31];
            }
            v2 = v26;
          }
          uint64_t v28 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
        }
        while (v28);
      }

      Class v14 = v48;
      BOOL v4 = v49;
      v25 = v47;
    }
    if (v4 && v25 != v4)
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      SearchEntriesFromManifest(v2->_searchEntry, v4);
      id obja = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v36 = [obja countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v54 != v38) {
              objc_enumerationMutation(obja);
            }
            v40 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            v41 = [v40 sectionIdentifier];
            v42 = [(PSSearchEntry *)v2->_searchEntry sectionEntry];
            v43 = [v42 identifier];
            int v44 = [v41 isEqualToString:v43];

            if (v44) {
              [v52 addObject:v40];
            }
            v2 = v26;
          }
          uint64_t v37 = [obja countByEnumeratingWithState:&v53 objects:v62 count:16];
        }
        while (v37);
      }

      Class v14 = v48;
      BOOL v4 = v49;
      v25 = v47;
    }

    id v3 = v52;
    v6 = v46;
  }
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
    [(objc_class *)v14 formatSearchEntries:v3 parent:v2->_searchEntry];
  }
  [v3 count];
  [(PSSearchIndexOperation *)v2 _finishedIndexingWithEntries:v3 cancelled:[(PSSearchIndexOperation *)v2 isCancelled]];
}

+ (id)_bundleForSearchEntry:(id)a3 thirdPartyApp:(BOOL *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 bundleName];
  BOOL v8 = [v6 specifier];
  id v9 = (void *)[v8 detailControllerClass];

  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = [v9 searchBundle];
    goto LABEL_28;
  }
  v11 = [v6 specifier];
  v10 = [v11 propertyForKey:@"AppSettingsBundle"];

  if (v10)
  {
    if (a4) {
      *a4 = 1;
    }
    goto LABEL_28;
  }
  if (!v7)
  {
    v15 = (void *)MEMORY[0x1E4F28B50];
    int v16 = [v6 specifier];
    v10 = objc_msgSend(v15, "bundleForClass:", objc_msgSend(v16, "detailControllerClass"));

    goto LABEL_28;
  }
  objc_super v12 = [a1 possibleBundleRoots];
  v13 = [MEMORY[0x1E4F1CA48] array];
  Class v14 = v13;
  if (v12)
  {
    [v13 addObjectsFromArray:v12];
  }
  else
  {
    v17 = SFRuntimeAbsoluteFilePathForPath();
    [v14 addObject:v17];

    Class v18 = SFDeveloperSettingsBundlesDirectoryPath();
    uint64_t v19 = SFRuntimeAbsoluteFilePathForPath();
    [v14 addObject:v19];

    BOOL v20 = [MEMORY[0x1E4F42948] currentDevice];
    if (objc_msgSend(v20, "sf_isInternalInstall"))
    {
      Boolean keyExistsAndHasValidFormat = 0;
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"PSShouldIndexInternalSettings", @"com.apple.Preferences", &keyExistsAndHasValidFormat);
      int v22 = keyExistsAndHasValidFormat;

      if (!v22 || !AppBooleanValue) {
        goto LABEL_16;
      }
      BOOL v20 = SFRuntimeAbsoluteFilePathForPath();
      [v14 addObject:v20];
    }
  }
LABEL_16:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v23 = v14;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    v31 = v12;
    uint64_t v26 = *(void *)v33;
LABEL_18:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v33 != v26) {
        objc_enumerationMutation(v23);
      }
      uint64_t v28 = [*(id *)(*((void *)&v32 + 1) + 8 * v27) stringByAppendingPathComponent:v7];
      uint64_t v29 = [v28 stringByAppendingPathExtension:@"bundle"];

      v10 = [MEMORY[0x1E4F28B50] bundleWithPath:v29];

      if (v10) {
        break;
      }
      if (v25 == ++v27)
      {
        uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v25) {
          goto LABEL_18;
        }
        v10 = 0;
        break;
      }
    }
    objc_super v12 = v31;
  }
  else
  {
    v10 = 0;
  }

LABEL_28:
  return v10;
}

+ (id)_loadThirdPartySearchEntriesForEntry:(id)a3 bundle:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 specifier];
  BOOL v8 = [v7 propertyForKey:@"File"];

  id v9 = [v6 pathForResource:v8 ofType:@"plist"];
  if (v9)
  {
    uint64_t v26 = v8;
    id v27 = v6;
    uint64_t v25 = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v9];
    v11 = [v10 objectForKeyedSubscript:@"StringsTable"];
    objc_super v12 = [v11 stringByDeletingPathExtension];

    v13 = [v10 objectForKeyedSubscript:@"PreferenceSpecifiers"];
    uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v20 = v5;
          uint64_t v21 = [v5 specifier];
          int v22 = +[PSAppListController specifiersFromDictionary:v19 stringsTable:v12 parentSpecifier:v21 target:0];

          if (v22) {
            [v28 addObjectsFromArray:v22];
          }

          id v5 = v20;
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v16);
    }

    BOOL v8 = v26;
    id v23 = SearchEntriesFromSpecifiers(v28, v5, v26);

    id v6 = v27;
    id v9 = v25;
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

+ (id)_loadSearchEntriesFromPlistForEntry:(id)a3 bundle:(id)a4
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v46 = a4;
  id v6 = [v5 specifier];
  id v7 = [v6 propertyForKey:@"searchPlist"];

  uint64_t v8 = [v5 bundleName];
  id v9 = (__CFString *)v8;
  if (v7)
  {
    v62[0] = v7;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
  }
  else
  {
    if (v8)
    {
      v11 = [v5 parentEntry];
      objc_super v12 = [v11 bundleName];
      if ([(__CFString *)v9 isEqualToString:v12]) {
        v13 = &stru_1EFB51FD0;
      }
      else {
        v13 = v9;
      }
      id v14 = v5;
      uint64_t v15 = v13;
    }
    else
    {
      id v14 = v5;
      uint64_t v15 = &stru_1EFB51FD0;
    }
    uint64_t v16 = [v14 identifier];
    uint64_t v17 = (void *)v16;
    if (v16) {
      Class v18 = (__CFString *)v16;
    }
    else {
      Class v18 = &stru_1EFB51FD0;
    }
    v61[0] = v18;
    uint64_t v19 = [v14 name];
    id v20 = (void *)v19;
    if (v19) {
      uint64_t v21 = (__CFString *)v19;
    }
    else {
      uint64_t v21 = &stru_1EFB51FD0;
    }
    v61[1] = v21;
    v61[2] = v15;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];

    id v5 = v14;
    id v7 = 0;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v22 = v10;
  uint64_t v50 = [v22 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v50)
  {
    v45 = v7;
    v48 = v22;
    uint64_t v49 = *(void *)v56;
    v47 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v56 != v49) {
          objc_enumerationMutation(v22);
        }
        uint64_t v24 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v24, "length", v45))
        {
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          uint64_t v25 = [v5 ancestorEntries];
          uint64_t v26 = [v25 arrayByAddingObject:v5];

          uint64_t v27 = [v26 countByEnumeratingWithState:&v51 objects:v59 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v52;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v52 != v29) {
                  objc_enumerationMutation(v26);
                }
                long long v31 = *(void **)(*((void *)&v51 + 1) + 8 * j);
                long long v32 = [v31 plistName];
                if ([v24 isEqualToString:v32])
                {
                  long long v33 = [v31 bundleName];
                  char v34 = [(__CFString *)v9 isEqualToString:v33];

                  if (v34)
                  {

                    id v5 = v47;
                    id v22 = v48;
                    goto LABEL_35;
                  }
                }
                else
                {
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v51 objects:v59 count:16];
            }
            while (v28);
          }

          uint64_t v35 = [v46 pathForResource:v24 ofType:@"plist"];
          id v5 = v47;
          id v22 = v48;
          if (v35)
          {
            uint64_t v37 = (void *)v35;
            id v38 = v24;

            v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v37];
            v40 = [v39 objectForKeyedSubscript:@"searchable"];
            v41 = v40;
            if (v40 && ![v40 BOOLValue])
            {
              uint64_t v36 = 0;
              id v7 = v45;
            }
            else
            {
              v42 = [v47 specifier];
              v43 = SearchSpecifiersFromPlist(v39, v42, v38, v46);

              id v7 = v45;
              if (v43)
              {
                uint64_t v36 = SearchEntriesFromSpecifiers(v43, v47, v38);
              }
              else
              {
                uint64_t v36 = 0;
              }
            }
            id v22 = v48;
            goto LABEL_47;
          }
        }
LABEL_35:
        ;
      }
      uint64_t v50 = [v22 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (v50) {
        continue;
      }
      break;
    }
    uint64_t v37 = 0;
    id v38 = 0;
    uint64_t v36 = 0;
    v39 = v22;
    id v7 = v45;
  }
  else
  {
    uint64_t v37 = 0;
    id v38 = 0;
    uint64_t v36 = 0;
    v39 = v22;
  }
LABEL_47:

  return v36;
}

+ (id)possibleBundleRoots
{
  return (id)_possibleBundleRoots;
}

+ (id)topLevelManifestBundlePath
{
  return (id)_topLevelManifestBundlePath;
}

- (PSSearchEntry)searchEntry
{
  return self->_searchEntry;
}

- (PSSearchIndexOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSSearchIndexOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchEntry, 0);
}

@end