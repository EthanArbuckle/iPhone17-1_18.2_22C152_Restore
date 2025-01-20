@interface PSSearchableItemManifest
- (BOOL)writeToPlistAndStringsFilesAtURL:(id)a3 error:(id *)a4;
- (NSMutableArray)searchableItems;
- (PSSearchableItemManifest)init;
- (id)_escapedStringForString:(id)a3;
- (id)_stringKeyForString:(id)a3;
- (id)items;
- (void)addSearchableItem:(id)a3;
- (void)addSearchableItems:(id)a3;
- (void)removeSearchableItem:(id)a3;
- (void)setSearchableItems:(id)a3;
@end

@implementation PSSearchableItemManifest

- (PSSearchableItemManifest)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSSearchableItemManifest;
  v2 = [(PSSearchableItemManifest *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(PSSearchableItemManifest *)v2 setSearchableItems:v3];
  }
  return v2;
}

- (void)addSearchableItems:(id)a3
{
  id v4 = a3;
  id v5 = [(PSSearchableItemManifest *)self searchableItems];
  [v5 addObjectsFromArray:v4];
}

- (void)addSearchableItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PSSearchableItemManifest *)self searchableItems];
  [v5 addObject:v4];
}

- (void)removeSearchableItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PSSearchableItemManifest *)self searchableItems];
  [v5 removeObject:v4];
}

- (id)items
{
  v2 = [(PSSearchableItemManifest *)self searchableItems];
  v3 = (void *)[v2 copy];

  return v3;
}

- (BOOL)writeToPlistAndStringsFilesAtURL:(id)a3 error:(id *)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v64 = self;
  v8 = [(PSSearchableItemManifest *)self searchableItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v80 objects:v88 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v81 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        v14 = [v13 bundleID];
        uint64_t v15 = [v14 length];

        if (v15)
        {
          v16 = [v13 bundleID];
          v17 = [v7 objectForKeyedSubscript:v16];

          if (!v17)
          {
            v18 = objc_opt_new();
            v19 = [v13 bundleID];
            [v7 setObject:v18 forKeyedSubscript:v19];
          }
          v20 = [v13 bundleID];
          v21 = [v7 objectForKeyedSubscript:v20];
          [v21 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v80 objects:v88 count:16];
    }
    while (v10);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = [v7 allKeys];
  uint64_t v60 = [obj countByEnumeratingWithState:&v76 objects:v87 count:16];
  if (v60)
  {
    v57 = v7;
    uint64_t v58 = *(void *)v77;
    v59 = v6;
    while (2)
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v77 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v61 = v22;
        uint64_t v23 = *(void *)(*((void *)&v76 + 1) + 8 * v22);
        v67 = objc_opt_new();
        v66 = objc_opt_new();
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        uint64_t v62 = v23;
        id v63 = [v7 objectForKeyedSubscript:v23];
        uint64_t v68 = [v63 countByEnumeratingWithState:&v72 objects:v86 count:16];
        if (v68)
        {
          uint64_t v65 = *(void *)v73;
          do
          {
            for (uint64_t j = 0; j != v68; ++j)
            {
              if (*(void *)v73 != v65) {
                objc_enumerationMutation(v63);
              }
              v25 = [*(id *)(*((void *)&v72 + 1) + 8 * j) toManifestDictionary];
              v26 = (void *)[v25 mutableCopy];

              v27 = [v26 objectForKeyedSubscript:@"label"];
              v28 = [(PSSearchableItemManifest *)v64 _stringKeyForString:v27];
              [v26 setObject:v28 forKeyedSubscript:@"label"];
              v29 = NSString;
              if (v27) {
                v30 = v27;
              }
              else {
                v30 = &stru_1EFB51FD0;
              }
              v31 = [(PSSearchableItemManifest *)v64 _escapedStringForString:v30];
              v71 = [v29 stringWithFormat:@"\"%@\" = \"%@\"", v28, v31];;

              [v66 addObject:v71];
              uint64_t v32 = [v26 objectForKeyedSubscript:@"keywords"];
              v33 = [NSString stringWithFormat:@"%@_KEYWORDS", v28];
              [v26 setObject:v33 forKeyedSubscript:@"keywords"];
              v34 = NSString;
              v70 = (void *)v32;
              if (v32) {
                v35 = (__CFString *)v32;
              }
              else {
                v35 = &stru_1EFB51FD0;
              }
              v36 = [(PSSearchableItemManifest *)v64 _escapedStringForString:v35];
              v69 = [v34 stringWithFormat:@"\"%@\" = \"%@\"", v33, v36];;

              [v66 addObject:v69];
              v37 = [v26 objectForKeyedSubscript:@"contentDescription"];
              v38 = [NSString stringWithFormat:@"%@_DESCRIPTION", v28];
              [v26 setObject:v38 forKeyedSubscript:@"contentDescription"];
              v39 = NSString;
              if (v37) {
                v40 = v37;
              }
              else {
                v40 = &stru_1EFB51FD0;
              }
              v41 = [(PSSearchableItemManifest *)v64 _escapedStringForString:v40];
              v42 = [v39 stringWithFormat:@"\"%@\" = \"%@\"", v38, v41];;

              [v66 addObject:v42];
              v43 = (void *)[v26 copy];
              [v67 addObject:v43];
            }
            uint64_t v68 = [v63 countByEnumeratingWithState:&v72 objects:v86 count:16];
          }
          while (v68);
        }

        v44 = [v66 componentsJoinedByString:@"\n"];
        v45 = [v44 stringByAppendingString:@"\n"];

        v46 = [NSString stringWithFormat:@"SettingsSearchManifest-%@", v62];
        id v6 = v59;
        v47 = [v59 URLByAppendingPathComponent:v46];
        v48 = [v47 URLByAppendingPathExtension:@"strings"];
        int v49 = [v45 writeToURL:v48 atomically:1 encoding:4 error:a4];

        if (!v49)
        {

          BOOL v54 = 0;
          v7 = v57;
          goto LABEL_41;
        }
        v84 = @"items";
        v85 = v67;
        v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        v51 = [v59 URLByAppendingPathComponent:v46];
        v52 = [v51 URLByAppendingPathExtension:@"plist"];
        int v53 = [v50 writeToURL:v52 error:a4];

        v7 = v57;
        if (!v53)
        {
          BOOL v54 = 0;
          goto LABEL_41;
        }
        uint64_t v22 = v61 + 1;
      }
      while (v61 + 1 != v60);
      BOOL v54 = 1;
      uint64_t v60 = [obj countByEnumeratingWithState:&v76 objects:v87 count:16];
      if (v60) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v54 = 1;
  }
LABEL_41:

  return v54;
}

- (id)_stringKeyForString:(id)a3
{
  uint64_t v3 = _stringKeyForString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_stringKeyForString__onceToken, &__block_literal_global_27);
  }
  id v5 = [v4 uppercaseString];

  id v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  v7 = [(id)_stringKeyForString__allowedCharacters invertedSet];
  v8 = [v6 componentsSeparatedByCharactersInSet:v7];
  uint64_t v9 = [v8 componentsJoinedByString:&stru_1EFB51FD0];

  return v9;
}

uint64_t __48__PSSearchableItemManifest__stringKeyForString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E58] alphanumericCharacterSet];
  v1 = (void *)_stringKeyForString__allowedCharacters;
  _stringKeyForString__allowedCharacters = v0;

  v2 = (void *)_stringKeyForString__allowedCharacters;
  return [v2 addCharactersInString:@"_"];
}

- (id)_escapedStringForString:(id)a3
{
  uint64_t v3 = [a3 stringByReplacingOccurrencesOfString:@"\" withString:@"\\\"];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];

  id v5 = [v4 stringByReplacingOccurrencesOfString:@"%" withString:@"\\%"];

  return v5;
}

- (NSMutableArray)searchableItems
{
  return self->_searchableItems;
}

- (void)setSearchableItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end