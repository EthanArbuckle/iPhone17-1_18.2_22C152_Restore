@interface CACSpokenCommandPresentation
- (BOOL)groupIsCollapsed:(id)a3;
- (BOOL)hasConflicts;
- (BOOL)isSearching;
- (BOOL)usedByPreferences;
- (CACSpokenCommandPresentation)init;
- (NSArray)externalCommandGroups;
- (NSArray)flattenedCommandGroupsAndItems;
- (NSArray)nestedCommandGroupsAndItems;
- (NSArray)relevantCommandIdentifiers;
- (NSDictionary)additionalCommandInfo;
- (NSString)locale;
- (NSString)searchString;
- (id)_filteredCommandGroupsAndItemsWithSearchString:(id)a3;
- (id)itemsConflictingWithItem:(id)a3;
- (unint64_t)indexOfItemWithIdentifier:(id)a3;
- (unint64_t)indexOfItemWithIdentifier:(id)a3 ignoreGroups:(BOOL)a4;
- (void)_deepFlush;
- (void)_flushCommands;
- (void)addCustomCommandItem:(id)a3;
- (void)deleteCustomCommandAtIndex:(unint64_t)a3;
- (void)refreshItemWithIdentifier:(id)a3;
- (void)resetConflicts;
- (void)saveChanges;
- (void)setAdditionalCommandInfo:(id)a3;
- (void)setExternalCommandGroups:(id)a3;
- (void)setLocale:(id)a3;
- (void)setRelevantCommandIdentifiers:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setUsedByPreferences:(BOOL)a3;
- (void)sortCustomCommands;
@end

@implementation CACSpokenCommandPresentation

- (CACSpokenCommandPresentation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CACSpokenCommandPresentation;
  v2 = [(CACSpokenCommandPresentation *)&v6 init];
  if (v2)
  {
    v3 = +[CACPreferences sharedPreferences];
    v4 = [v3 bestLocaleIdentifier];
    [(CACSpokenCommandPresentation *)v2 setLocale:v4];
  }
  return v2;
}

- (void)_flushCommands
{
  allCommandGroups = self->_allCommandGroups;
  self->_allCommandGroups = 0;

  commandItems = self->_commandItems;
  self->_commandItems = 0;

  [(CACSpokenCommandPresentation *)self resetConflicts];
}

- (void)_deepFlush
{
  [(CACSpokenCommandPresentation *)self _flushCommands];
  commandGroups = self->_commandGroups;
  self->_commandGroups = 0;

  newCommandItems = self->_newCommandItems;
  self->_newCommandItems = 0;

  deletedCommandIdentifiers = self->_deletedCommandIdentifiers;
  self->_deletedCommandIdentifiers = 0;
}

- (void)setLocale:(id)a3
{
  id v13 = a3;
  if (!-[NSString isEqualToString:](self->_locale, "isEqualToString:"))
  {
    [(CACSpokenCommandPresentation *)self resetConflicts];
    objc_storeStrong((id *)&self->_locale, a3);
    v5 = +[CACPreferences sharedPreferences];
    objc_super v6 = [v5 builtInCommandsStringsTableForLocaleIdentifier:v13];
    v7 = [v6 objectForKey:@"CommandManager.searchWordsToExclude"];

    v8 = [v7 lowercaseString];
    v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v10 = [v8 componentsSeparatedByCharactersInSet:v9];

    v11 = [MEMORY[0x263EFFA08] setWithArray:v10];
    excludedSearchWordSet = self->_excludedSearchWordSet;
    self->_excludedSearchWordSet = v11;

    [(CACSpokenCommandPresentation *)self _deepFlush];
  }
}

- (BOOL)hasConflicts
{
  conflictDictionary = self->_conflictDictionary;
  if (!conflictDictionary)
  {
    v4 = [MEMORY[0x263EFF9A0] dictionary];
    id v5 = [(CACSpokenCommandPresentation *)self flattenedCommandGroupsAndItems];
    NSUInteger v6 = [(NSArray *)self->_commandsOnly count];
    if (v6)
    {
      NSUInteger v7 = v6;
      uint64_t v8 = 0;
      do
      {
        v9 = [(NSArray *)self->_commandsOnly objectAtIndex:v8];
        char v10 = [v9 isGroup];
        if (++v8 < v7 && (v10 & 1) == 0)
        {
          uint64_t v11 = v8;
          do
          {
            v12 = [(NSArray *)self->_commandsOnly objectAtIndex:v11];
            if (([v12 isGroup] & 1) == 0 && objc_msgSend(v9, "conflictsWithItem:", v12))
            {
              id v13 = [v9 identifier];
              v14 = [v4 objectForKey:v13];

              if (!v14)
              {
                v14 = [MEMORY[0x263EFF980] array];
                v15 = [v9 identifier];
                [v4 setObject:v14 forKey:v15];
              }
              [v14 addObject:v12];
              v16 = [v12 identifier];
              v17 = [v4 objectForKey:v16];

              if (!v17)
              {
                v17 = [MEMORY[0x263EFF980] array];
                v18 = [v12 identifier];
                [v4 setObject:v17 forKey:v18];
              }
              [v17 addObject:v9];
            }
            ++v11;
          }
          while (v7 != v11);
        }
      }
      while (v8 != v7);
    }
    v19 = (NSDictionary *)[v4 copy];
    v20 = self->_conflictDictionary;
    self->_conflictDictionary = v19;

    conflictDictionary = self->_conflictDictionary;
  }
  return [(NSDictionary *)conflictDictionary count] != 0;
}

- (id)itemsConflictingWithItem:(id)a3
{
  id v4 = a3;
  [(CACSpokenCommandPresentation *)self hasConflicts];
  conflictDictionary = self->_conflictDictionary;
  NSUInteger v6 = [v4 identifier];

  NSUInteger v7 = [(NSDictionary *)conflictDictionary objectForKey:v6];

  return v7;
}

- (void)resetConflicts
{
  self->_conflictDictionary = 0;
  MEMORY[0x270F9A758]();
}

- (void)saveChanges
{
  v3 = +[CACPreferences sharedPreferences];
  [v3 beginPropertyTransaction];
  [(NSMutableArray *)self->_newCommandItems makeObjectsPerformSelector:sel_saveToPreferences];
  [(NSArray *)self->_commandGroups makeObjectsPerformSelector:sel_saveToPreferences];
  deletedCommandIdentifiers = self->_deletedCommandIdentifiers;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__CACSpokenCommandPresentation_saveChanges__block_invoke;
  v6[3] = &unk_264D12B58;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableArray *)deletedCommandIdentifiers enumerateObjectsUsingBlock:v6];
  [v5 endPropertyTransaction];
}

uint64_t __43__CACSpokenCommandPresentation_saveChanges__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removePropertiesForCommandIdentifier:a2];
}

- (void)refreshItemWithIdentifier:(id)a3
{
  id v11 = a3;
  unint64_t v4 = -[CACSpokenCommandPresentation indexOfItemWithIdentifier:](self, "indexOfItemWithIdentifier:");
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (![v11 hasPrefix:@"Custom"]) {
      goto LABEL_8;
    }
    id v5 = +[CACPreferences sharedPreferences];
    NSUInteger v6 = [v5 propertiesForCommandIdentifier:v11];

    if (v6)
    {
      id v7 = [[CACSpokenCommandItem alloc] initWithIdentifier:v11 properties:v6 locale:self->_locale];
      uint64_t v8 = [(NSDictionary *)self->_additionalCommandInfo objectForKey:v11];
      [(CACSpokenCommandItem *)v7 setCommandInfo:v8];

      [(CACSpokenCommandPresentation *)self addCustomCommandItem:v7];
    }
  }
  else
  {
    unint64_t v9 = v4;
    char v10 = [(CACSpokenCommandPresentation *)self flattenedCommandGroupsAndItems];
    NSUInteger v6 = [v10 objectAtIndex:v9];

    [v6 refreshDataFromPreferences];
    if ([v6 isCustom]) {
      [(CACSpokenCommandPresentation *)self sortCustomCommands];
    }
  }

LABEL_8:
  MEMORY[0x270F9A758]();
}

- (void)sortCustomCommands
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_allCommandGroups;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "isCustom", (void)v11))
        {
          unint64_t v9 = [v8 commandsArray];
          [v9 sortUsingComparator:&__block_literal_global_40];

          commandItems = self->_commandItems;
          self->_commandItems = 0;

          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

uint64_t __50__CACSpokenCommandPresentation_sortCustomCommands__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 sortString];
  uint64_t v6 = [v4 sortString];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (void)setExternalCommandGroups:(id)a3
{
  id v4 = (NSArray *)a3;
  [(CACSpokenCommandPresentation *)self _flushCommands];
  externalCommandGroups = self->_externalCommandGroups;
  self->_externalCommandGroups = v4;
}

- (void)setRelevantCommandIdentifiers:(id)a3
{
  id v4 = (NSArray *)a3;
  [(CACSpokenCommandPresentation *)self _flushCommands];
  relevantCommandIdentifiers = self->_relevantCommandIdentifiers;
  self->_relevantCommandIdentifiers = v4;
}

- (void)setAdditionalCommandInfo:(id)a3
{
  id v4 = (NSDictionary *)a3;
  [(CACSpokenCommandPresentation *)self _flushCommands];
  additionalCommandInfo = self->_additionalCommandInfo;
  self->_additionalCommandInfo = v4;
}

- (NSArray)nestedCommandGroupsAndItems
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  p_allCommandGroups = (id *)&self->_allCommandGroups;
  if (self->_allCommandGroups)
  {
    id v70 = 0;
  }
  else
  {
    externalCommandGroups = self->_externalCommandGroups;
    if (externalCommandGroups) {
      id v5 = (id)[(NSArray *)externalCommandGroups mutableCopy];
    }
    else {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v70 = v5;
  }
  if (!self->_commandGroups)
  {
    location = p_allCommandGroups;
    uint64_t v6 = +[CACPreferences sharedPreferences];
    v60 = [MEMORY[0x263EFF980] array];
    [v6 beginPropertyTransaction];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    obuint64_t j = [v6 availableCommandSetIdentifiers];
    uint64_t v7 = [obj countByEnumeratingWithState:&v87 objects:v95 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v88;
      uint64_t v58 = *(void *)v88;
      v59 = v6;
      do
      {
        uint64_t v10 = 0;
        id v62 = (id)v8;
        do
        {
          if (*(void *)v88 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v87 + 1) + 8 * v10);
          if (!self->_usedByPreferences
            || ([v6 hidePreferencesForCommandSetIdentifier:*(void *)(*((void *)&v87 + 1) + 8 * v10)] & 1) == 0)
          {
            long long v12 = [v6 commandIdentifiersForCommandSetIdentifier:v11 localeIdentifier:self->_locale];
            if ([v12 count])
            {
              long long v13 = [[CACSpokenCommandGroup alloc] initWithIdentifier:v11];
              long long v14 = [(CACSpokenCommandGroup *)v13 commandsArray];
              v66 = v13;
              if ([(CACSpokenCommandGroup *)v13 isCustom]) {
                [v60 insertObject:v13 atIndex:0];
              }
              else {
                [v60 addObject:v13];
              }
              long long v85 = 0u;
              long long v86 = 0u;
              long long v83 = 0u;
              long long v84 = 0u;
              v68 = v12;
              id v15 = v12;
              uint64_t v16 = [v15 countByEnumeratingWithState:&v83 objects:v94 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v84;
                do
                {
                  for (uint64_t i = 0; i != v17; ++i)
                  {
                    if (*(void *)v84 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    uint64_t v20 = *(void *)(*((void *)&v83 + 1) + 8 * i);
                    v21 = [[CACSpokenCommandItem alloc] initWithIdentifier:v20 properties:0 locale:self->_locale];
                    if ([(CACSpokenCommandItem *)v21 isVisible])
                    {
                      v22 = [(NSDictionary *)self->_additionalCommandInfo objectForKey:v20];
                      [(CACSpokenCommandItem *)v21 setCommandInfo:v22];

                      [v14 addObject:v21];
                    }
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v83 objects:v94 count:16];
                }
                while (v17);
              }

              if ([(CACSpokenCommandGroup *)v66 isCustom])
              {
                v23 = [(CACSpokenCommandGroup *)v66 commandsArray];
                [v23 sortUsingComparator:&__block_literal_global_15_0];
              }
              uint64_t v9 = v58;
              uint64_t v6 = v59;
              uint64_t v8 = (uint64_t)v62;
              long long v12 = v68;
            }
          }
          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [obj countByEnumeratingWithState:&v87 objects:v95 count:16];
      }
      while (v8);
    }

    [v6 endPropertyTransaction];
    v24 = (NSArray *)[v60 copy];
    commandGroups = self->_commandGroups;
    self->_commandGroups = v24;

    p_allCommandGroups = location;
  }
  id v26 = *p_allCommandGroups;
  if (!*p_allCommandGroups)
  {
    locationa = p_allCommandGroups;
    if (![(NSMutableArray *)self->_newCommandItems count])
    {
      v27 = [MEMORY[0x263EFF980] arrayWithArray:self->_commandGroups];
      goto LABEL_52;
    }
    v27 = [MEMORY[0x263EFF980] array];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v28 = self->_commandGroups;
    uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v79 objects:v93 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      v31 = 0;
      uint64_t v32 = *(void *)v80;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v80 != v32) {
            objc_enumerationMutation(v28);
          }
          v34 = (CACSpokenCommandGroup *)*(id *)(*((void *)&v79 + 1) + 8 * j);
          if ([(CACSpokenCommandGroup *)v34 isCustom])
          {
            v35 = [(CACSpokenCommandGroup *)v34 cloneWithoutCommands];

            v36 = [v35 commandsArray];
            v37 = [(CACSpokenCommandGroup *)v34 commandsArray];
            [v36 addObjectsFromArray:v37];

            v38 = [v35 commandsArray];
            [v38 addObjectsFromArray:self->_newCommandItems];

            v31 = v35;
            v39 = [(CACSpokenCommandGroup *)v31 commandsArray];
            [v39 sortUsingComparator:&__block_literal_global_17];

            v34 = v31;
          }
          [v27 addObject:v34];
        }
        uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v79 objects:v93 count:16];
      }
      while (v30);

      if (v31) {
        goto LABEL_51;
      }
    }
    else
    {
    }
    v31 = [[CACSpokenCommandGroup alloc] initWithIdentifier:@"Custom"];
    [v27 insertObject:v31 atIndex:0];
    v40 = [(CACSpokenCommandGroup *)v31 commandsArray];
    [v40 addObjectsFromArray:self->_newCommandItems];

LABEL_51:
    p_allCommandGroups = locationa;
LABEL_52:
    if (self->_relevantCommandIdentifiers || self->_deletedCommandIdentifiers)
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      v61 = v27;
      id v63 = v27;
      uint64_t v67 = [v63 countByEnumeratingWithState:&v75 objects:v92 count:16];
      if (v67)
      {
        id obja = *(id *)v76;
        do
        {
          uint64_t v41 = 0;
          do
          {
            if (*(id *)v76 != obja) {
              objc_enumerationMutation(v63);
            }
            uint64_t v69 = v41;
            v42 = *(void **)(*((void *)&v75 + 1) + 8 * v41);
            long long v71 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            v43 = [v42 commandsArray];
            uint64_t v44 = [v43 countByEnumeratingWithState:&v71 objects:v91 count:16];
            if (v44)
            {
              uint64_t v45 = v44;
              v46 = 0;
              uint64_t v47 = *(void *)v72;
              do
              {
                for (uint64_t k = 0; k != v45; ++k)
                {
                  if (*(void *)v72 != v47) {
                    objc_enumerationMutation(v43);
                  }
                  v49 = *(void **)(*((void *)&v71 + 1) + 8 * k);
                  v50 = [v49 identifier];
                  relevantCommandIdentifiers = self->_relevantCommandIdentifiers;
                  if ((!relevantCommandIdentifiers
                     || [(NSArray *)relevantCommandIdentifiers containsObject:v50])
                    && ([(NSMutableArray *)self->_deletedCommandIdentifiers containsObject:v50] & 1) == 0)
                  {
                    if (!v46)
                    {
                      v46 = [v42 cloneWithoutCommands];
                      [v70 addObject:v46];
                    }
                    v52 = [v46 commandsArray];
                    [v52 addObject:v49];

                    v53 = [(NSDictionary *)self->_additionalCommandInfo objectForKey:v50];
                    [v49 setCommandInfo:v53];
                  }
                }
                uint64_t v45 = [v43 countByEnumeratingWithState:&v71 objects:v91 count:16];
              }
              while (v45);
            }
            else
            {
              v46 = 0;
            }

            uint64_t v41 = v69 + 1;
          }
          while (v69 + 1 != v67);
          uint64_t v67 = [v63 countByEnumeratingWithState:&v75 objects:v92 count:16];
        }
        while (v67);
      }

      p_allCommandGroups = locationa;
      v27 = v61;
    }
    else
    {
      [v70 addObjectsFromArray:v27];
    }
    objc_storeStrong(p_allCommandGroups, v70);

    id v26 = *p_allCommandGroups;
  }
  v54 = (NSArray *)v26;

  return v54;
}

uint64_t __59__CACSpokenCommandPresentation_nestedCommandGroupsAndItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 sortString];
  uint64_t v6 = [v4 sortString];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

uint64_t __59__CACSpokenCommandPresentation_nestedCommandGroupsAndItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 sortString];
  uint64_t v6 = [v4 sortString];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

- (void)setSearchString:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  uint64_t v6 = [v4 whitespaceCharacterSet];
  uint64_t v7 = [v5 stringByTrimmingCharactersInSet:v6];

  searchString = self->_searchString;
  self->_searchString = v7;
}

- (NSArray)flattenedCommandGroupsAndItems
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!self->_commandItems)
  {
    v3 = [MEMORY[0x263EFF980] array];
    id v4 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = [(CACSpokenCommandPresentation *)self nestedCommandGroupsAndItems];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v4 addObject:v10];
          if (![(CACSpokenCommandPresentation *)self groupIsCollapsed:v10])
          {
            uint64_t v11 = [v10 commandsArray];
            [v4 addObjectsFromArray:v11];
          }
          long long v12 = [v10 commandsArray];
          [v3 addObjectsFromArray:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }

    long long v13 = (NSArray *)[v3 copy];
    commandsOnly = self->_commandsOnly;
    self->_commandsOnly = v13;

    id v15 = (NSArray *)[v4 copy];
    commandItems = self->_commandItems;
    self->_commandItems = v15;
  }
  if ([(NSString *)self->_searchString length])
  {
    uint64_t v17 = [(CACSpokenCommandPresentation *)self _filteredCommandGroupsAndItemsWithSearchString:self->_searchString];
  }
  else
  {
    uint64_t v17 = self->_commandItems;
  }
  return v17;
}

- (id)_filteredCommandGroupsAndItemsWithSearchString:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v49 = a3;
  id v4 = [v49 lowercaseString];
  v81.length = [(__CFString *)v4 length];
  v81.location = 0;
  id v5 = CFStringTokenizerCreate(0, v4, v81, 0, 0);
  id v63 = [MEMORY[0x263EFF980] array];
  id v62 = [MEMORY[0x263EFF980] array];
  while (CFStringTokenizerAdvanceToNextToken(v5))
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v5);
    uint64_t v6 = (__CFString *)CFStringCreateWithSubstring(0, v4, CurrentTokenRange);
    if (![(NSSet *)self->_excludedSearchWordSet containsObject:v6])
    {
      uint64_t v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF BEGINSWITH[cd] %@", v6];
      [v63 addObject:v7];
      if (CFStringGetLength(v6) > 1
        || CFStringGetLength(v6) == 1
        && [(__CFString *)v6 characterAtIndex:0] >= 0x81)
      {
        uint64_t v8 = [NSString stringWithFormat:@"*%@*", v6];
        uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF LIKE[cd] %@", v8];

        uint64_t v7 = (void *)v8;
      }
      else
      {
        uint64_t v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"FALSEPREDICATE"];
      }

      [v62 addObject:v9];
    }
    CFRelease(v6);
  }
  CFRelease(v5);
  uint64_t v10 = [v63 count];
  uint64_t v58 = [MEMORY[0x263EFF980] array];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  obuint64_t j = self->_allCommandGroups;
  uint64_t v53 = [(NSArray *)obj countByEnumeratingWithState:&v72 objects:v78 count:16];
  v48 = v4;
  if (!v53)
  {
    unint64_t v50 = 0;
    goto LABEL_49;
  }
  unint64_t v50 = 0;
  uint64_t v52 = *(void *)v73;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v73 != v52) {
        objc_enumerationMutation(obj);
      }
      long long v12 = *(void **)(*((void *)&v72 + 1) + 8 * v11);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v59 = v12;
      long long v13 = [v12 commandsArray];
      uint64_t v57 = [v13 countByEnumeratingWithState:&v68 objects:v77 count:16];
      if (!v57)
      {
        v61 = 0;
        long long v14 = 0;
        goto LABEL_42;
      }
      long long v14 = 0;
      v61 = 0;
      uint64_t v54 = v11;
      uint64_t v55 = *(void *)v69;
      v56 = v13;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v69 != v55) {
            objc_enumerationMutation(v13);
          }
          uint64_t v60 = v15;
          uint64_t v16 = *(void **)(*((void *)&v68 + 1) + 8 * v15);
          [v16 setSearchScore:0];
          if (v10)
          {
            uint64_t v17 = 0;
            uint64_t v18 = 1;
            uint64_t v19 = v10;
            do
            {
              long long v20 = [v63 objectAtIndex:v17];
              if ([v16 evaluateCommandPredicate:v20])
              {
                uint64_t v21 = v10 + [v16 searchScore] + v18;
              }
              else
              {
                long long v22 = [v62 objectAtIndex:v17];
                int v23 = [v16 evaluateCommandPredicate:v22];

                if (!v23) {
                  goto LABEL_31;
                }
                uint64_t v21 = [v16 searchScore] + v19;
              }
              [v16 setSearchScore:v21];
              id v24 = v16;
              if (v16)
              {
                v25 = v24;
                if (([v14 containsObject:v24] & 1) == 0)
                {
                  if (!v61)
                  {
                    id v26 = objc_alloc_init(CACSpokenCommandGroup);
                    v27 = [v59 displayString];
                    [(CACSpokenCommandGroup *)v26 setDisplayString:v27];

                    v61 = v26;
                    [v58 addObject:v26];
                    id v28 = objc_alloc_init(MEMORY[0x263EFF980]);

                    long long v14 = v28;
                  }
                  [v14 addObject:v25];
                }
                goto LABEL_32;
              }
LABEL_31:
              v25 = 0;
LABEL_32:
              --v19;

              ++v17;
              --v18;
            }
            while (v10 != v17);
          }
          uint64_t v15 = v60 + 1;
          long long v13 = v56;
        }
        while (v60 + 1 != v57);
        uint64_t v57 = [v56 countByEnumeratingWithState:&v68 objects:v77 count:16];
      }
      while (v57);

      if (v61)
      {
        uint64_t v11 = v54;
        if (v14)
        {
          long long v13 = [v14 sortedArrayUsingComparator:&__block_literal_global_34_0];
          if ([v13 count])
          {
            uint64_t v29 = [v13 objectAtIndex:0];
            unint64_t v30 = [v29 searchScore];

            [(CACSpokenCommandGroup *)v61 setSearchScore:v30];
            v31 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"searchScore == %ld", v30);
            uint64_t v32 = [v13 filteredArrayUsingPredicate:v31];
            v33 = [(CACSpokenCommandGroup *)v61 commandsArray];
            [v33 addObjectsFromArray:v32];

            unint64_t v34 = v50;
            if (v30 > v50) {
              unint64_t v34 = v30;
            }
            unint64_t v50 = v34;
          }
LABEL_42:
        }
      }
      else
      {
        uint64_t v11 = v54;
      }

      ++v11;
    }
    while (v11 != v53);
    uint64_t v35 = [(NSArray *)obj countByEnumeratingWithState:&v72 objects:v78 count:16];
    uint64_t v53 = v35;
  }
  while (v35);
LABEL_49:

  id v36 = [v58 sortedArrayUsingComparator:&__block_literal_global_39];
  v37 = v36;
  if ([v36 count])
  {
    v37 = v36;
    if (v50)
    {
      v38 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"searchScore >= %ld", v50 - 1);
      v37 = [v36 filteredArrayUsingPredicate:v38];
    }
  }
  v39 = [MEMORY[0x263EFF980] array];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v40 = v37;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v64 objects:v76 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v65 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        [v39 addObject:v45];
        v46 = [v45 commandsArray];
        [v39 addObjectsFromArray:v46];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v64 objects:v76 count:16];
    }
    while (v42);
  }

  return v39;
}

uint64_t __79__CACSpokenCommandPresentation__filteredCommandGroupsAndItemsWithSearchString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 searchScore];
  if (v6 >= [v5 searchScore])
  {
    unint64_t v8 = [v4 searchScore];
    if (v8 <= [v5 searchScore]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __79__CACSpokenCommandPresentation__filteredCommandGroupsAndItemsWithSearchString___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 searchScore];
  if (v6 >= [v5 searchScore])
  {
    unint64_t v8 = [v4 searchScore];
    if (v8 <= [v5 searchScore]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (unint64_t)indexOfItemWithIdentifier:(id)a3
{
  return [(CACSpokenCommandPresentation *)self indexOfItemWithIdentifier:a3 ignoreGroups:1];
}

- (unint64_t)indexOfItemWithIdentifier:(id)a3 ignoreGroups:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [(CACSpokenCommandPresentation *)self flattenedCommandGroupsAndItems];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v10 + v9;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v7);
          }
          long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
          if (!v4 || ([*(id *)(*((void *)&v19 + 1) + 8 * v12) isGroup] & 1) == 0)
          {
            uint64_t v15 = [v14 identifier];
            char v16 = [v15 isEqualToString:v6];

            if (v16)
            {
              unint64_t v17 = v10 + v12;
              goto LABEL_14;
            }
          }
          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v10 = v13;
        if (v9) {
          continue;
        }
        break;
      }
    }
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
  }
  else
  {
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v17;
}

- (void)addCustomCommandItem:(id)a3
{
  id v4 = a3;
  deletedCommandIdentifiers = self->_deletedCommandIdentifiers;
  id v11 = v4;
  if (deletedCommandIdentifiers
    && ([v4 identifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [(NSMutableArray *)deletedCommandIdentifiers indexOfObject:v6],
        v6,
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    [(NSMutableArray *)self->_deletedCommandIdentifiers removeObjectAtIndex:v7];
  }
  else
  {
    newCommandItems = self->_newCommandItems;
    if (!newCommandItems)
    {
      uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v10 = self->_newCommandItems;
      self->_newCommandItems = v9;

      newCommandItems = self->_newCommandItems;
    }
    [(NSMutableArray *)newCommandItems addObject:v11];
  }
  [v11 setIsEdited:1];
  [v11 saveToPreferences];
  [(CACSpokenCommandPresentation *)self _flushCommands];
}

- (void)deleteCustomCommandAtIndex:(unint64_t)a3
{
  id v6 = [(CACSpokenCommandPresentation *)self flattenedCommandGroupsAndItems];
  uint64_t v7 = [v6 objectAtIndex:a3];

  uint64_t v8 = [v7 identifier];
  [v7 removeFromPreferences];
  newCommandItems = self->_newCommandItems;
  if (newCommandItems)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__CACSpokenCommandPresentation_deleteCustomCommandAtIndex___block_invoke;
    v14[3] = &unk_264D12BC0;
    v3 = &v15;
    id v15 = v8;
    uint64_t v10 = [(NSMutableArray *)newCommandItems indexOfObjectPassingTest:v14];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(NSMutableArray *)self->_newCommandItems removeObjectAtIndex:v10];
      [(CACSpokenCommandPresentation *)self _flushCommands];
LABEL_9:

      goto LABEL_10;
    }
  }
  if (([(NSMutableArray *)self->_deletedCommandIdentifiers containsObject:v8] & 1) == 0)
  {
    deletedCommandIdentifiers = self->_deletedCommandIdentifiers;
    if (!deletedCommandIdentifiers)
    {
      uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      uint64_t v13 = self->_deletedCommandIdentifiers;
      self->_deletedCommandIdentifiers = v12;

      deletedCommandIdentifiers = self->_deletedCommandIdentifiers;
    }
    [(NSMutableArray *)deletedCommandIdentifiers addObject:v8];
  }
  [(CACSpokenCommandPresentation *)self _flushCommands];
  if (newCommandItems) {
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __59__CACSpokenCommandPresentation_deleteCustomCommandAtIndex___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)groupIsCollapsed:(id)a3
{
  return 0;
}

- (BOOL)isSearching
{
  return [(NSString *)self->_searchString length] != 0;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSArray)externalCommandGroups
{
  return self->_externalCommandGroups;
}

- (NSArray)relevantCommandIdentifiers
{
  return self->_relevantCommandIdentifiers;
}

- (NSDictionary)additionalCommandInfo
{
  return self->_additionalCommandInfo;
}

- (NSString)locale
{
  return self->_locale;
}

- (BOOL)usedByPreferences
{
  return self->_usedByPreferences;
}

- (void)setUsedByPreferences:(BOOL)a3
{
  self->_usedByPreferences = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictDictionary, 0);
  objc_storeStrong((id *)&self->_excludedSearchWordSet, 0);
  objc_storeStrong((id *)&self->_additionalCommandInfo, 0);
  objc_storeStrong((id *)&self->_relevantCommandIdentifiers, 0);
  objc_storeStrong((id *)&self->_externalCommandGroups, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_allCommandGroups, 0);
  objc_storeStrong((id *)&self->_commandGroups, 0);
  objc_storeStrong((id *)&self->_deletedCommandIdentifiers, 0);
  objc_storeStrong((id *)&self->_newCommandItems, 0);
  objc_storeStrong((id *)&self->_commandsOnly, 0);
  objc_storeStrong((id *)&self->_commandItems, 0);
}

@end