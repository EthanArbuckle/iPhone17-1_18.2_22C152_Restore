@interface WebBookmarkListQuery
- (BOOL)isCustomQuery;
- (WebBookmarkInMemoryChangeFilter)inMemoryFilter;
- (WebBookmarkListQuery)init;
- (WebBookmarkListQuery)initWithBookmarksWhere:(id)a3 folderID:(int)a4 orderBy:(id)a5 usingFilter:(id)a6;
- (WebBookmarkListQuery)initWithBookmarksWhere:(id)a3 orderBy:(id)a4 usingFilter:(id)a5;
- (WebBookmarkListQuery)initWithFolderID:(int)a3 inCollection:(id)a4 usingFilter:(id)a5 options:(unint64_t)a6;
- (id)_filterBookmarks:(id)a3;
- (id)_normalizeUserTypedString:(id)a3;
- (id)_sqliteInConditionForInMemoryModifiedBookmarksInFolder:(int)a3 collection:(id)a4;
- (id)_sqliteNotInConditionForInMemoryModifiedAndDeleted:(BOOL)a3 bookmarksInFolder:(int)a4 collection:(id)a5;
- (id)bookmarksInCollection:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5;
- (id)bookmarksInCollection:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5 skipDecodingSyncData:(BOOL)a6;
- (id)debugDescription;
- (int)_childCountInDatabaseForFolderFetchInCollection:(id)a3 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:(BOOL)a4;
- (int)_childCountInDatabaseForFolderFetchInCollection:(id)a3 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:(BOOL)a4 countShouldUseNumChildrenIfPossible:(BOOL)a5;
- (int)_inMemoryAddedChildrenCountForBookmarkFolder:(int)a3 collection:(id)a4 skipCountingBookmarksThatAreDeletedInMemory:(BOOL)a5;
- (int)countInCollection:(id)a3;
- (int)folderID;
- (int64_t)_listQueryType;
- (void)_preparePrefixesFromNormalizedString:(id)a3;
- (void)setInMemoryFilter:(id)a3;
@end

@implementation WebBookmarkListQuery

- (id)bookmarksInCollection:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5 skipDecodingSyncData:(BOOL)a6
{
  BOOL v82 = a6;
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v87 = a3;
  v9 = [v87 _inMemoryChangeSet];
  uint64_t v10 = [v9 numberOfReorderedBookmarksInBookmarkFolder:self->_folderID];
  unsigned int v81 = a4;
  int v11 = [v9 folderHasReplaceChange:self->_folderID];
  if (v10) {
    int v12 = 1;
  }
  else {
    int v12 = v11;
  }
  int v80 = v12;
  unint64_t v13 = [(WebBookmarkListQuery *)self _listQueryType];
  if (v13 > 1)
  {
    v15 = &stru_26CC2ED50;
    v14 = &stru_26CC2ED50;
  }
  else
  {
    v14 = [(WebBookmarkListQuery *)self _sqliteNotInConditionForInMemoryModifiedAndDeleted:v80 ^ 1u bookmarksInFolder:self->_folderID collection:v87];
    v15 = [(WebBookmarkListQuery *)self _sqliteInConditionForInMemoryModifiedBookmarksInFolder:self->_folderID collection:v87];
  }
  v75 = v14;
  v76 = v15;
  v16 = whereClauseWithAppendingINConditions(self->_query, &v15->isa, &v14->isa);
  orderBy = self->_orderBy;
  if (orderBy)
  {
    uint64_t v18 = [NSString stringWithFormat:@"%@ ORDER BY %@", v16, orderBy];

    v16 = (void *)v18;
  }
  uint64_t v19 = [NSString stringWithFormat:@"%@ LIMIT ? OFFSET ?", v16];
  unsigned int v84 = a5;

  v77 = (void *)v19;
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v105, (sqlite3_stmt *)[v87 _selectBookmarksWhere:v19]);
  titleWordPrefixes = self->_titleWordPrefixes;
  if (titleWordPrefixes)
  {
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    v21 = titleWordPrefixes;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v101 objects:v109 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v102;
      int v24 = 1;
      do
      {
        uint64_t v25 = 0;
        int v26 = v24;
        do
        {
          if (*(void *)v102 != v23) {
            objc_enumerationMutation(v21);
          }
          sqlite3_bind_text(v106, v26 + v25, (const char *)[*(id *)(*((void *)&v101 + 1) + 8 * v25) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          ++v25;
        }
        while (v22 != v25);
        uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v101 objects:v109 count:16];
        int v24 = v26 + v25;
      }
      while (v22);
      int v27 = v26 + v25;
    }
    else
    {
      int v27 = 1;
    }

    sqlite3_bind_text(v106, v27, [(NSString *)self->_urlFilter UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    int v28 = v27 + 1;
  }
  else
  {
    int v28 = 1;
  }
  v88 = [MEMORY[0x263EFF980] array];
  v29 = [MEMORY[0x263EFF980] array];
  int v30 = v81;
  uint64_t v79 = v84 - v81 + 1;
  if (v13 > 1)
  {
    char v78 = 0;
    int v38 = v84 - v81 + 1;
  }
  else
  {
    char v78 = [v9 bookmarkIsAddedInMemory:self->_folderID];
    [v9 addedBookmarksInBookmarkFolder:self->_folderID];
    v74 = int v85 = v28;
    [v9 applyModificationsToBookmarks:v74];
    long long v99 = 0u;
    long long v100 = 0u;
    long long v98 = 0u;
    long long v97 = 0u;
    id v31 = v74;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v97 objects:v108 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v98;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v98 != v33) {
            objc_enumerationMutation(v31);
          }
          v35 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          if (([v9 replayChangesOnBookmark:v35] & 0xFFFFFFFFFFFFFFFDLL) != 1
            && (v13 != 1 || bookmarkMatchesFilter(v35, self->_titleWordPrefixesForInMemoryFiltering))
            && (!self->_inMemoryFilter
             || (objc_opt_respondsToSelector() & 1) == 0
             || [(WebBookmarkInMemoryChangeFilter *)self->_inMemoryFilter shouldIncludeBookmarkAddedInMemory:v35]))
          {
            if ([v35 isFolder]) {
              v36 = v88;
            }
            else {
              v36 = v29;
            }
            [v36 addObject:v35];
          }
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v97 objects:v108 count:16];
      }
      while (v32);
    }

    int v28 = v85;
    unint64_t v37 = [v88 count];
    if (v80)
    {
      int v30 = 0;
      int v38 = [(WebBookmarkListQuery *)self _childCountInDatabaseForFolderFetchInCollection:v87 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:0];
    }
    else if (v37 <= v81)
    {
      int v30 = v81 - v37;
      int v38 = v79;
    }
    else
    {
      int v30 = 0;
      int v38 = v79 + v81 - v37;
    }
  }
  v86 = [MEMORY[0x263EFF980] array];
  if (v78) {
    goto LABEL_51;
  }
  sqlite3_bind_int(v106, v28, v38);
  sqlite3_bind_int(v106, v28 + 1, v30);
  while (1)
  {
    int v39 = sqlite3_step(v106);
    if (v39 != 100) {
      break;
    }
    v40 = [WebBookmark alloc];
    v41 = v106;
    v42 = [v87 currentDeviceIdentifier];
    v43 = [v87 configuration];
    v44 = -[WebBookmark initWithSQLiteStatement:deviceIdentifier:collectionType:skipDecodingSyncData:](v40, "initWithSQLiteStatement:deviceIdentifier:collectionType:skipDecodingSyncData:", v41, v42, [v43 collectionType], v82);

    [v86 addObject:v44];
  }
  if (v39 == 101)
  {
LABEL_51:
    v45 = [MEMORY[0x263EFF980] array];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id v46 = v86;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v93 objects:v107 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v94;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v94 != v48) {
            objc_enumerationMutation(v46);
          }
          uint64_t v50 = *(void *)(*((void *)&v93 + 1) + 8 * j);
          if (([v9 replayChangesOnBookmark:v50] & 0xFFFFFFFFFFFFFFFDLL) != 1) {
            [v45 addObject:v50];
          }
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v93 objects:v107 count:16];
      }
      while (v47);
    }

    uint64_t v51 = v79;
    [v9 applyModificationsToBookmarks:v45];
    if (v13 >= 2)
    {
      v55 = v45;
    }
    else
    {
      if (v80)
      {
        v52 = [v9 bookmarksAfterReplayingChangesToBookmarks:v46 inFolderWithID:self->_folderID];
        v89[0] = MEMORY[0x263EF8330];
        v89[1] = 3221225472;
        v89[2] = __85__WebBookmarkListQuery_bookmarksInCollection_fromIndex_toIndex_skipDecodingSyncData___block_invoke;
        v89[3] = &unk_2643DAF28;
        id v90 = v9;
        v91 = self;
        unint64_t v92 = v13;
        v53 = objc_msgSend(v52, "safari_filterObjectsUsingBlock:", v89);
        if (v79 + (unint64_t)v81 >= [v53 count])
        {
          id v54 = v53;
        }
        else
        {
          objc_msgSend(v53, "subarrayWithRange:");
          id v54 = (id)objc_claimAutoreleasedReturnValue();
        }
        v55 = v54;
      }
      else
      {
        v55 = [MEMORY[0x263EFF980] array];
        unint64_t v83 = [v88 count];
        if (v83 > v81 && v79)
        {
          uint64_t v56 = v81;
          do
          {
            v57 = [v88 objectAtIndexedSubscript:v56];
            [v55 addObject:v57];

            uint64_t v58 = v51 - 1;
            if (++v56 >= v83) {
              break;
            }
            --v51;
          }
          while (v51);
        }
        else
        {
          uint64_t v58 = v79;
        }
        unint64_t v59 = [v45 count];
        if (v59 && v58)
        {
          uint64_t v60 = 0;
          do
          {
            v61 = [v45 objectAtIndexedSubscript:v60];
            [v55 addObject:v61];

            uint64_t v62 = v60 + 1;
            if (v60 + 1 >= v59) {
              break;
            }
          }
          while (v58 - 1 != v60++);
          v58 -= v62;
        }
        unint64_t v64 = 0;
        if (![v45 count] && v83 <= v81)
        {
          if (v78) {
            int v65 = 0;
          }
          else {
            int v65 = [(WebBookmarkListQuery *)self _childCountInDatabaseForFolderFetchInCollection:v87 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:1];
          }
          unint64_t v67 = v83 + (v65 & ~(v65 >> 31));
          BOOL v68 = v81 >= v67;
          unint64_t v69 = v81 - v67;
          if (v68) {
            unint64_t v64 = v69;
          }
          else {
            unint64_t v64 = 0;
          }
        }
        unint64_t v70 = [v29 count];
        if (v64 < v70 && v58)
        {
          uint64_t v71 = v58 - 1;
          do
          {
            v72 = [v29 objectAtIndexedSubscript:v64];
            [v55 addObject:v72];

            ++v64;
            BOOL v68 = v71-- != 0;
            char v73 = v68;
          }
          while (v64 < v70 && (v73 & 1) != 0);
        }
      }
    }
  }
  else
  {
    v55 = (void *)MEMORY[0x263EFFA68];
  }

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v105);
  return v55;
}

- (int)countInCollection:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(WebBookmarkListQuery *)self _listQueryType];
  v6 = [v4 _inMemoryChangeSet];
  int v7 = [v6 bookmarkIsAddedInMemory:self->_folderID];
  if (v5 < 2) {
    int v8 = 1;
  }
  else {
    int v8 = v7;
  }
  if (v8 == 1)
  {
    if (v7)
    {
      int v9 = 0;
    }
    else
    {
      int v9 = [(WebBookmarkListQuery *)self _childCountInDatabaseForFolderFetchInCollection:v4 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:v5 == 1];
      if (v9 < 0)
      {
        int v20 = -1;
        goto LABEL_33;
      }
    }
    int v20 = [(WebBookmarkListQuery *)self _inMemoryAddedChildrenCountForBookmarkFolder:self->_folderID collection:v4 skipCountingBookmarksThatAreDeletedInMemory:v5 == 1]+ v9;
    if (v5 != 1)
    {
      v21 = [v6 deletedBookmarkIDsInBookmarkFolder:self->_folderID];
      v20 -= [v21 count];
    }
  }
  else
  {
    WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v30, (sqlite3_stmt *)[v4 _selectBookmarksWhere:self->_query returnType:1]);
    titleWordPrefixes = self->_titleWordPrefixes;
    if (titleWordPrefixes)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      int v11 = titleWordPrefixes;
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v27;
        int v14 = 1;
        do
        {
          uint64_t v15 = 0;
          int v16 = v14;
          do
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v11);
            }
            v17 = v31;
            id v18 = *(id *)(*((void *)&v26 + 1) + 8 * v15);
            sqlite3_bind_text(v17, v16 + v15++, (const char *)objc_msgSend(v18, "UTF8String", (void)v26), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          }
          while (v12 != v15);
          uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v32 count:16];
          int v14 = v16 + v15;
        }
        while (v12);
        int v19 = v16 + v15;
      }
      else
      {
        int v19 = 1;
      }

      sqlite3_bind_text(v31, v19, [(NSString *)self->_urlFilter UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    if (self->_customQuery) {
      int v22 = 0;
    }
    else {
      int v22 = [v6 numberOfAddedBookmarksInBookmarkFolder:self->_folderID];
    }
    while (1)
    {
      int v23 = sqlite3_step(v31);
      if (v23 != 100) {
        break;
      }
      v22 += objc_msgSend(v6, "isBookmarkDeleted:", sqlite3_column_int(v31, 0)) ^ 1;
    }
    if (v23) {
      BOOL v24 = v23 == 101;
    }
    else {
      BOOL v24 = 1;
    }
    if (v24) {
      int v20 = v22;
    }
    else {
      int v20 = -1;
    }
    WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v30);
  }
LABEL_33:

  return v20;
}

- (int)_inMemoryAddedChildrenCountForBookmarkFolder:(int)a3 collection:(id)a4 skipCountingBookmarksThatAreDeletedInMemory:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a4;
  int64_t v9 = [(WebBookmarkListQuery *)self _listQueryType];
  uint64_t v10 = [v8 _inMemoryChangeSet];
  int v11 = v10;
  if (v9 || v5)
  {
    id v13 = [v10 addedBookmarksInBookmarkFolder:v6];
    if ([v13 count])
    {
      [v11 applyModificationsToBookmarks:v13];
      if (v9 == 1)
      {
        uint64_t v14 = [(WebBookmarkListQuery *)self _filterBookmarks:v13];

        id v13 = (id)v14;
      }
      int v12 = [v13 count];
      if (v5)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v13 = v13;
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v20 != v16) {
                objc_enumerationMutation(v13);
              }
              v12 -= objc_msgSend(v11, "isBookmarkDeleted:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "identifier", (void)v19));
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v15);
        }
      }
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = [v10 numberOfAddedBookmarksInBookmarkFolder:v6];
  }

  return v12;
}

- (int)_childCountInDatabaseForFolderFetchInCollection:(id)a3 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:(BOOL)a4 countShouldUseNumChildrenIfPossible:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v33 = a4;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v35 = a3;
  v34 = [MEMORY[0x263F089D8] string];
  int v7 = &stru_26CC2ED50;
  int64_t v8 = [(WebBookmarkListQuery *)self _listQueryType];
  BOOL v9 = v8 == 1 && v33;
  if (self->_inMemoryFilter || v9)
  {
    uint64_t v11 = [(WebBookmarkListQuery *)self _sqliteNotInConditionForInMemoryModifiedAndDeleted:v9 bookmarksInFolder:self->_folderID collection:v35];
    int v7 = [(WebBookmarkListQuery *)self _sqliteInConditionForInMemoryModifiedBookmarksInFolder:self->_folderID collection:v35];
    uint64_t v10 = (__CFString *)v11;
  }
  else
  {
    uint64_t v10 = &stru_26CC2ED50;
  }
  p_folderID = (unsigned int *)&self->_folderID;
  if (!self->_folderID
    || self->_includeHidden
    || self->_titleWordPrefixes
    || [(__CFString *)v10 length]
    || !v5
    || self->_includeDescendantsAsChildren)
  {
    int v12 = whereClauseWithAppendingINConditions(self->_query, &v7->isa, &v10->isa);
    [v34 appendFormat:@"SELECT COUNT(*) FROM bookmarks WHERE %@", v12];

    int v31 = 0;
  }
  else
  {
    objc_msgSend(v34, "appendFormat:", @"SELECT num_children FROM bookmarks WHERE id = %d", *p_folderID);
    int v31 = 1;
  }
  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((uint64_t)v44, (sqlite3_stmt *)[v35 _sqliteStatementWithQuery:v34]);
  titleWordPrefixes = self->_titleWordPrefixes;
  if (titleWordPrefixes)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v14 = titleWordPrefixes;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v41;
      int v17 = 1;
      do
      {
        uint64_t v18 = 0;
        int v19 = v17;
        do
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v14);
          }
          sqlite3_bind_text(v45, v19 + v18, (const char *)[*(id *)(*((void *)&v40 + 1) + 8 * v18) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          ++v18;
        }
        while (v15 != v18);
        uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v40 objects:v47 count:16];
        int v17 = v19 + v18;
      }
      while (v15);
      int v20 = v19 + v18;
    }
    else
    {
      int v20 = 1;
    }

    sqlite3_bind_text(v45, v20, [(NSString *)self->_urlFilter UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  int v21 = sqlite3_step(v45);
  int v22 = 0;
  if (v21 && v21 != 101)
  {
    if (v21 != 100)
    {
      int v22 = -1;
      goto LABEL_45;
    }
    int v22 = sqlite3_column_int(v45, 0);
  }
  if (v33 && !v8)
  {
    int v23 = [v35 _inMemoryChangeSet];
    [v23 deletedBookmarkIDsInBookmarkFolder:*p_folderID];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v24);
          }
          v22 -= objc_msgSend(v23, "bookmarkIsAddedInMemory:", objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "intValue")) ^ 1;
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v36 objects:v46 count:16];
      }
      while (v25);
    }
  }
  if (v22 < 0)
  {
    long long v28 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[WebBookmarkListQuery _childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:countShouldUseNumChildrenIfPossible:]((int *)p_folderID, v22, v28);
    }
    if (v31)
    {
      long long v29 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[WebBookmarkListQuery _childCountInDatabaseForFolderFetchInCollection:skipCountingInDatabaseBookmarksThatAreDeletedInMemory:countShouldUseNumChildrenIfPossible:]((int *)p_folderID, v29);
      }
      int v22 = [(WebBookmarkListQuery *)self _childCountInDatabaseForFolderFetchInCollection:v35 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:v33 countShouldUseNumChildrenIfPossible:0];
    }
  }
LABEL_45:
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v44);

  return v22;
}

- (int64_t)_listQueryType
{
  if (self->_customQuery) {
    return 2;
  }
  else {
    return self->_titleWordPrefixes != 0;
  }
}

- (id)_sqliteNotInConditionForInMemoryModifiedAndDeleted:(BOOL)a3 bookmarksInFolder:(int)a4 collection:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  int64_t v8 = [MEMORY[0x263F089D8] string];
  BOOL v9 = [v7 _inMemoryChangeSet];
  uint64_t v10 = v9;
  if (v5)
  {
    uint64_t v11 = [v9 deletedBookmarkIDsInBookmarkFolder:self->_folderID];
    int v12 = [v11 allObjects];
    id v13 = commaSeparatedIDStringForBookmarkIDs(v12);

    if ([v13 length]) {
      [v8 appendString:v13];
    }
  }
  if (self->_inMemoryFilter && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v14 = [(WebBookmarkInMemoryChangeFilter *)self->_inMemoryFilter bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:v10 inFolder:self->_folderID];
    uint64_t v15 = commaSeparatedIDStringForBookmarkIDs(v14);
    if ([v8 length] && objc_msgSend(v15, "length")) {
      [v8 appendFormat:@",%@", v15];
    }
    else {
      [v8 appendString:v15];
    }
  }
  if ([v8 length])
  {
    uint64_t v16 = [NSString stringWithFormat:@"id NOT IN (%@)", v8];
  }
  else
  {
    uint64_t v16 = &stru_26CC2ED50;
  }

  return v16;
}

- (id)_sqliteInConditionForInMemoryModifiedBookmarksInFolder:(int)a3 collection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (self->_inMemoryFilter)
  {
    id v7 = [v5 _inMemoryChangeSet];
    if (objc_opt_respondsToSelector())
    {
      int64_t v8 = [(WebBookmarkInMemoryChangeFilter *)self->_inMemoryFilter bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet:v7 inFolder:self->_folderID];
      BOOL v9 = commaSeparatedIDStringForBookmarkIDs(v8);
      if ([v9 length])
      {
        uint64_t v10 = [NSString stringWithFormat:@"id IN (%@)", v9];
      }
      else
      {
        uint64_t v10 = &stru_26CC2ED50;
      }
    }
    else
    {
      uint64_t v10 = &stru_26CC2ED50;
    }
  }
  else
  {
    uint64_t v10 = &stru_26CC2ED50;
  }

  return v10;
}

- (int)_childCountInDatabaseForFolderFetchInCollection:(id)a3 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:(BOOL)a4
{
  return [(WebBookmarkListQuery *)self _childCountInDatabaseForFolderFetchInCollection:a3 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:a4 countShouldUseNumChildrenIfPossible:self->_countShouldUseNumChildrenIfPossible];
}

- (int)folderID
{
  return self->_folderID;
}

- (WebBookmarkListQuery)initWithFolderID:(int)a3 inCollection:(id)a4 usingFilter:(id)a5 options:(unint64_t)a6
{
  unsigned int v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v28 = a4;
  id v30 = a5;
  if ((v6 & 0x21) != 0)
  {
    uint64_t v10 = &stru_26CC2ED50;
  }
  else
  {
    if (v8)
    {
      uint64_t v10 = @"AND hidden = 0";
    }
    else
    {
      uint64_t v10 = [v28 _rootFolderHiddenChildrenClause];
    }
    if ((v6 & 0x18) == 0x10)
    {
      uint64_t v11 = [(__CFString *)v10 stringByAppendingString:@" AND hidden_ancestor_count = 0"];

      uint64_t v10 = (__CFString *)v11;
    }
  }
  long long v29 = objc_msgSend(NSString, "stringWithFormat:", @"parent = %d", v8);
  unint64_t v12 = v6 & 0x10;
  if ((v6 & 0x10) != 0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"OR parent IN (SELECT folder_id FROM folder_ancestors WHERE ancestor_id = %d)", v8);
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = &stru_26CC2ED50;
  }
  BOOL v14 = (v6 & 0x21) != 0;
  if ((v6 & 6) != 0)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"AND type = %d", (v6 & 2) == 0);
    uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = &stru_26CC2ED50;
  }
  if ((v6 & 0x140) != 0)
  {
    uint64_t v16 = ~(v6 >> 6) & 4;
LABEL_16:
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"AND subtype = %ld", v16);
LABEL_22:
    int v19 = (__CFString *)v17;
    goto LABEL_23;
  }
  if ((v6 & 0xA0) != 0)
  {
    if ((v6 & 0x20) != 0) {
      uint64_t v18 = @"AND (subtype = %ld OR subtype = %ld)";
    }
    else {
      uint64_t v18 = @"AND (subtype != %ld AND subtype != %ld)";
    }
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", v18, 4, 3);
    goto LABEL_22;
  }
  if ((v6 & 8) != 0)
  {
    uint64_t v16 = 1;
    goto LABEL_16;
  }
  int v19 = &stru_26CC2ED50;
LABEL_23:
  int v20 = [NSString stringWithFormat:@"(%@ %@) %@ %@ %@", v29, v13, v10, v15, v19];
  int v21 = [(WebBookmarkListQuery *)self initWithBookmarksWhere:v20 folderID:v8 orderBy:@"order_index ASC" usingFilter:v30];
  int v22 = v21;
  if (v21)
  {
    v21->_customQuery = 0;
    v21->_includeHidden = v14;
    v21->_folderID = v8;
    int v23 = [v28 configuration];
    v22->_countShouldUseNumChildrenIfPossible = [v23 collectionType] == 0;

    v22->_includeDescendantsAsChildren = v12 >> 4;
    if (!v22->_includeHidden)
    {
      id v24 = objc_alloc_init(WBInMemoryChangeFilterVisible);
      inMemoryFilter = v22->_inMemoryFilter;
      v22->_inMemoryFilter = (WebBookmarkInMemoryChangeFilter *)v24;
    }
    uint64_t v26 = v22;
  }

  return v22;
}

- (WebBookmarkListQuery)initWithBookmarksWhere:(id)a3 folderID:(int)a4 orderBy:(id)a5 usingFilter:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v35.receiver = self;
  v35.super_class = (Class)WebBookmarkListQuery;
  BOOL v14 = [(WebBookmarkListQuery *)&v35 init];
  uint64_t v15 = v14;
  if (v14)
  {
    v14->_customQuery = 1;
    p_query = &v14->_query;
    objc_storeStrong((id *)&v14->_query, a3);
    uint64_t v17 = [v12 copy];
    orderBy = v15->_orderBy;
    v15->_orderBy = (NSString *)v17;

    int v19 = [(WebBookmarkListQuery *)v15 _normalizeUserTypedString:v13];
    if (v19)
    {
      [(WebBookmarkListQuery *)v15 _preparePrefixesFromNormalizedString:v19];
      uint64_t v20 = [[NSString alloc] initWithFormat:@"%%%@%%", v19];
      urlFilter = v15->_urlFilter;
      v15->_urlFilter = (NSString *)v20;
    }
    if (v15->_titleWordPrefixes)
    {
      id v22 = [NSString alloc];
      id v34 = v11;
      int v23 = v15->_titleWordPrefixes;
      id v24 = (void *)[@"id IN (SELECT bookmark_id FROM bookmark_title_words WHERE word GLOB ?)" mutableCopy];
      for (unint64_t i = 1; i < [(NSArray *)v23 count]; ++i)
        [v24 appendString:@" AND id IN (SELECT bookmark_id FROM bookmark_title_words WHERE word GLOB ?)"];

      id v26 = v24;
      long long v27 = (void *)[[NSString alloc] initWithFormat:@"((%@) OR url LIKE ?)", v26];

      uint64_t v28 = [v22 initWithFormat:@"%@ AND %@", v27, *p_query];
      long long v29 = (void *)*p_query;
      void *p_query = v28;

      id v11 = v34;
    }
    if (v12)
    {
      uint64_t v30 = [[NSString alloc] initWithFormat:@"%@ ORDER BY %@", *p_query, v12];
      queryWithOrderBy = v15->_queryWithOrderBy;
      v15->_queryWithOrderBy = (NSString *)v30;
    }
    if (a4 != 0x7FFFFFFF)
    {
      v15->_folderID = a4;
      v15->_customQuery = 0;
    }
    v15->_countShouldUseNumChildrenIfPossible = 0;
    uint64_t v32 = v15;
  }

  return v15;
}

- (id)_normalizeUserTypedString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = (__CFString *)[v3 mutableCopy];
    CFStringTrimWhitespace(v5);
    if ([(__CFString *)v5 length])
    {
      CFLocaleRef v6 = CFLocaleCopyCurrent();
      CFStringNormalize(v5, kCFStringNormalizationFormD);
      CFStringFold(v5, 0x181uLL, v6);
      CFRelease(v6);
      id v7 = v5;
      id v5 = 0;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inMemoryFilter, 0);
  objc_storeStrong((id *)&self->_urlFilter, 0);
  objc_storeStrong((id *)&self->_titleWordPrefixesForInMemoryFiltering, 0);
  objc_storeStrong((id *)&self->_titleWordPrefixes, 0);
  objc_storeStrong((id *)&self->_orderBy, 0);
  objc_storeStrong((id *)&self->_queryWithOrderBy, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

- (BOOL)isCustomQuery
{
  return self->_customQuery;
}

- (void)setInMemoryFilter:(id)a3
{
}

- (WebBookmarkListQuery)init
{
  return 0;
}

- (WebBookmarkListQuery)initWithBookmarksWhere:(id)a3 orderBy:(id)a4 usingFilter:(id)a5
{
  return [(WebBookmarkListQuery *)self initWithBookmarksWhere:a3 folderID:0x7FFFFFFFLL orderBy:a4 usingFilter:a5];
}

- (id)debugDescription
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  CFLocaleRef v6 = (void *)v5;
  id v7 = @"YES";
  if (!self->_customQuery) {
    id v7 = @"NO";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; customQuery = %@; query = \"%@\"; orderBy = \"%@\"; titleWordPrefixes = %@>",
    v5,
    self,
    v7,
    self->_query,
    self->_orderBy,
  uint64_t v8 = self->_titleWordPrefixes);

  return v8;
}

- (id)_filterBookmarks:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_titleWordPrefixes)
  {
    CFLocaleRef v6 = [MEMORY[0x263EFF980] array];
    if (self->_inMemoryFilter) {
      char v7 = objc_opt_respondsToSelector();
    }
    else {
      char v7 = 0;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (bookmarkMatchesFilter(v12, self->_titleWordPrefixesForInMemoryFiltering)
            && ((v7 & 1) == 0
             || -[WebBookmarkInMemoryChangeFilter shouldIncludeBookmarkAddedInMemory:](self->_inMemoryFilter, "shouldIncludeBookmarkAddedInMemory:", v12, (void)v14)))
          {
            objc_msgSend(v6, "addObject:", v12, (void)v14);
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    CFLocaleRef v6 = v4;
  }
  return v6;
}

- (id)bookmarksInCollection:(id)a3 fromIndex:(unsigned int)a4 toIndex:(unsigned int)a5
{
  uint64_t v5 = [(WebBookmarkListQuery *)self bookmarksInCollection:a3 fromIndex:*(void *)&a4 toIndex:*(void *)&a5 skipDecodingSyncData:0];
  return v5;
}

uint64_t __85__WebBookmarkListQuery_bookmarksInCollection_fromIndex_toIndex_skipDecodingSyncData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_msgSend(*(id *)(a1 + 32), "bookmarkIsAddedInMemory:", objc_msgSend(v3, "identifier"));
  if (*(void *)(*(void *)(a1 + 40) + 64)
    && (v4 & objc_opt_respondsToSelector()) == 1
    && ([*(id *)(*(void *)(a1 + 40) + 64) shouldIncludeBookmarkAddedInMemory:v3] & 1) == 0)
  {
    uint64_t v5 = 0;
  }
  else if (*(void *)(a1 + 48) == 1)
  {
    uint64_t v5 = bookmarkMatchesFilter(v3, *(void **)(*(void *)(a1 + 40) + 40));
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (void)_preparePrefixesFromNormalizedString:(id)a3
{
  id v4 = a3;
  if (-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::once != -1) {
    dispatch_once(&-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::once, &__block_literal_global_13);
  }
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  CFLocaleRef v6 = [MEMORY[0x263EFF980] array];
  char v7 = -[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizerAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__WebBookmarkListQuery__preparePrefixesFromNormalizedString___block_invoke_2;
  block[3] = &unk_2643D9C00;
  id v16 = v4;
  id v8 = v6;
  long long v17 = v8;
  uint64_t v9 = v5;
  uint64_t v18 = v9;
  id v10 = v4;
  dispatch_sync(v7, block);
  titleWordPrefixes = self->_titleWordPrefixes;
  self->_titleWordPrefixes = v9;
  id v12 = v9;

  titleWordPrefixesForInMemoryFiltering = self->_titleWordPrefixesForInMemoryFiltering;
  self->_titleWordPrefixesForInMemoryFiltering = v8;
  long long v14 = v8;
}

uint64_t __61__WebBookmarkListQuery__preparePrefixesFromNormalizedString___block_invoke()
{
  v0 = objc_alloc_init(WebBookmarkTitleWordTokenizer);
  v1 = (void *)-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizer;
  -[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizer = (uint64_t)v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.WebBookmarks.titleWordTokenizerAccess", 0);
  uint64_t v3 = -[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizerAccessQueue;
  -[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizerAccessQueue = (uint64_t)v2;
  return MEMORY[0x270F9A758](v2, v3);
}

uint64_t __61__WebBookmarkListQuery__preparePrefixesFromNormalizedString___block_invoke_2(uint64_t a1)
{
  [(id)-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizer setString:*(void *)(a1 + 32)];
  uint64_t result = [(id)-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizer advanceToNextToken];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = result;
    do
    {
      uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v4, v3);
      [*(id *)(a1 + 40) addObject:v5];
      CFLocaleRef v6 = *(void **)(a1 + 48);
      char v7 = [v5 stringByAppendingString:@"*"];
      [v6 addObject:v7];

      uint64_t result = [(id)-[WebBookmarkListQuery _preparePrefixesFromNormalizedString:]::tokenizer advanceToNextToken];
      uint64_t v4 = result;
    }
    while (result != 0x7FFFFFFFFFFFFFFFLL);
  }
  return result;
}

- (WebBookmarkInMemoryChangeFilter)inMemoryFilter
{
  return self->_inMemoryFilter;
}

- (void)_childCountInDatabaseForFolderFetchInCollection:(int *)a1 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:(NSObject *)a2 countShouldUseNumChildrenIfPossible:.cold.1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_21C043000, a2, OS_LOG_TYPE_ERROR, "Retrying to fetch count without using num_children %i", (uint8_t *)v3, 8u);
}

- (void)_childCountInDatabaseForFolderFetchInCollection:(int *)a1 skipCountingInDatabaseBookmarksThatAreDeletedInMemory:(int)a2 countShouldUseNumChildrenIfPossible:(os_log_t)log .cold.2(int *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_21C043000, log, OS_LOG_TYPE_ERROR, "num_children for bookmark %i has an invalid value %i", (uint8_t *)v4, 0xEu);
}

@end