@interface WebBookmarkList
- (WebBookmarkList)initWithQuery:(id)a3 skipOffset:(unsigned int)a4 collection:(id)a5;
- (WebBookmarkList)initWithQuery:(id)a3 skipOffset:(unsigned int)a4 collection:(id)a5 queue:(id)a6;
- (WebBookmarkList)shadowBookmarkList;
- (id)_arrayForDifferenceCalculation;
- (id)_bookmarkAtIndex:(unsigned int)a3 paginate:(BOOL)a4 skipDecodingSyncData:(BOOL)a5;
- (id)bookmarkArray;
- (id)bookmarkArrayRequestingCount:(unsigned int)a3;
- (id)bookmarkArraySkippingDecodeSyncData;
- (id)bookmarkAtIndex:(unsigned int)a3;
- (id)bookmarkAtIndex:(unsigned int)a3 skipDecodingSyncData:(BOOL)a4;
- (id)differenceFromList:(id)a3 withOptions:(unint64_t)a4;
- (int)folderID;
- (unsigned)_primaryBookmarkCount;
- (unsigned)_reverseOrderIndex:(unsigned int)a3;
- (unsigned)bookmarkCount;
- (void)_loadBookmarksForDifferenceFromList:(id)a3;
- (void)_moveBookmarkAtIndex:(unsigned int)a3 toIndex:(unsigned int)a4;
- (void)setShadowBookmarkList:(id)a3;
@end

@implementation WebBookmarkList

- (int)folderID
{
  return [(WebBookmarkListQuery *)self->_query folderID];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowBookmarkList, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
}

- (id)bookmarkArray
{
  unsigned int bookmarkCount = self->_bookmarkCount;
  if (!bookmarkCount)
  {
    uint64_t v9 = [(WebBookmarkList *)self->_shadowBookmarkList bookmarkArray];
    v7 = (void *)v9;
    v10 = (void *)MEMORY[0x263EFFA68];
    if (v9) {
      v10 = (void *)v9;
    }
    id v8 = v10;
    goto LABEL_7;
  }
  id v4 = [(WebBookmarkList *)self bookmarkAtIndex:bookmarkCount - 1];
  shadowBookmarkList = self->_shadowBookmarkList;
  bookmarks = self->_bookmarks;
  if (shadowBookmarkList)
  {
    v7 = [(WebBookmarkList *)shadowBookmarkList bookmarkArray];
    id v8 = [(NSMutableArray *)bookmarks arrayByAddingObjectsFromArray:v7];
LABEL_7:
    v11 = v8;

    goto LABEL_9;
  }
  v11 = (void *)[(NSMutableArray *)bookmarks copy];
LABEL_9:
  return v11;
}

- (id)bookmarkAtIndex:(unsigned int)a3
{
  return [(WebBookmarkList *)self _bookmarkAtIndex:*(void *)&a3 paginate:1 skipDecodingSyncData:0];
}

- (unsigned)bookmarkCount
{
  unsigned int v3 = [(WebBookmarkList *)self _primaryBookmarkCount];
  return [(WebBookmarkList *)self->_shadowBookmarkList bookmarkCount] + v3;
}

- (id)_bookmarkAtIndex:(unsigned int)a3 paginate:(BOOL)a4 skipDecodingSyncData:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  unsigned int v9 = [(WebBookmarkList *)self _primaryBookmarkCount];
  uint64_t v10 = a3 - v9;
  if (a3 >= v9)
  {
    v15 = [(WebBookmarkList *)self->_shadowBookmarkList _bookmarkAtIndex:v10 paginate:v6 skipDecodingSyncData:v5];
    goto LABEL_22;
  }
  uint64_t v11 = self->_skipOffset + a3;
  uint64_t v12 = [(NSMutableArray *)self->_bookmarks count];
  if (v11 >= v12)
  {
    uint64_t v13 = v11;
    if (v6)
    {
      if ([(WebBookmarkListQuery *)self->_query isCustomQuery]) {
        unsigned int v14 = self->_bookmarkCount - 1;
      }
      else {
        unsigned int v14 = v12 + 64;
      }
      if (v11 <= v14) {
        uint64_t v13 = v14;
      }
      else {
        uint64_t v13 = v11;
      }
    }
    queue = self->_queue;
    if (queue)
    {
      *(void *)buf = 0;
      v26 = buf;
      uint64_t v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__3;
      v29 = __Block_byref_object_dispose__3;
      id v30 = 0;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __66__WebBookmarkList__bookmarkAtIndex_paginate_skipDecodingSyncData___block_invoke;
      v21[3] = &unk_2643DAE60;
      v21[4] = self;
      v21[5] = buf;
      int v22 = v12;
      int v23 = v13;
      BOOL v24 = v5;
      dispatch_sync(queue, v21);
      id v17 = *((id *)v26 + 5);
      _Block_object_dispose(buf, 8);

      if (!v17) {
        goto LABEL_21;
      }
    }
    else
    {
      id v17 = [(WebBookmarkListQuery *)self->_query bookmarksInCollection:self->_collection fromIndex:v12 toIndex:v13 skipDecodingSyncData:v5];
      if (!v17) {
        goto LABEL_21;
      }
    }
    ct_green_tea_logger_create_static();
    v18 = getCTGreenTeaOsLogHandle();
    v19 = v18;
    if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C043000, v19, OS_LOG_TYPE_INFO, "Read Safari bookmarks", buf, 2u);
    }

    [(NSMutableArray *)self->_bookmarks addObjectsFromArray:v17];
  }
  if ([(NSMutableArray *)self->_bookmarks count] > (unint64_t)v11)
  {
    v15 = [(NSMutableArray *)self->_bookmarks objectAtIndex:v11];
    goto LABEL_22;
  }
LABEL_21:
  v15 = 0;
LABEL_22:
  return v15;
}

- (unsigned)_primaryBookmarkCount
{
  return self->_bookmarkCount - self->_skipOffset;
}

- (WebBookmarkList)initWithQuery:(id)a3 skipOffset:(unsigned int)a4 collection:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WebBookmarkList;
  unsigned int v14 = [(WebBookmarkList *)&v20 init];
  if (!v14) {
    goto LABEL_4;
  }
  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  bookmarks = v14->_bookmarks;
  v14->_bookmarks = v15;

  objc_storeStrong((id *)&v14->_query, a3);
  v14->_skipOffset = a4;
  objc_storeStrong((id *)&v14->_collection, a5);
  objc_storeStrong((id *)&v14->_queue, a6);
  unsigned int v17 = [(WebBookmarkListQuery *)v14->_query countInCollection:v14->_collection];
  if (v17 == -1)
  {
LABEL_4:
    v18 = 0;
  }
  else
  {
    v14->_unsigned int bookmarkCount = v17;
    v18 = v14;
  }

  return v18;
}

- (WebBookmarkList)initWithQuery:(id)a3 skipOffset:(unsigned int)a4 collection:(id)a5
{
  return [(WebBookmarkList *)self initWithQuery:a3 skipOffset:*(void *)&a4 collection:a5 queue:0];
}

- (id)bookmarkArraySkippingDecodeSyncData
{
  unsigned int bookmarkCount = self->_bookmarkCount;
  if (!bookmarkCount)
  {
    uint64_t v9 = [(WebBookmarkList *)self->_shadowBookmarkList bookmarkArraySkippingDecodeSyncData];
    v7 = (void *)v9;
    uint64_t v10 = (void *)MEMORY[0x263EFFA68];
    if (v9) {
      uint64_t v10 = (void *)v9;
    }
    id v8 = v10;
    goto LABEL_7;
  }
  id v4 = [(WebBookmarkList *)self bookmarkAtIndex:bookmarkCount - 1 skipDecodingSyncData:1];
  shadowBookmarkList = self->_shadowBookmarkList;
  bookmarks = self->_bookmarks;
  if (shadowBookmarkList)
  {
    v7 = [(WebBookmarkList *)shadowBookmarkList bookmarkArraySkippingDecodeSyncData];
    id v8 = [(NSMutableArray *)bookmarks arrayByAddingObjectsFromArray:v7];
LABEL_7:
    id v11 = v8;

    goto LABEL_9;
  }
  id v11 = (void *)[(NSMutableArray *)bookmarks copy];
LABEL_9:
  return v11;
}

- (id)bookmarkAtIndex:(unsigned int)a3 skipDecodingSyncData:(BOOL)a4
{
  return [(WebBookmarkList *)self _bookmarkAtIndex:*(void *)&a3 paginate:1 skipDecodingSyncData:a4];
}

uint64_t __66__WebBookmarkList__bookmarkAtIndex_paginate_skipDecodingSyncData___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) bookmarksInCollection:*(void *)(*(void *)(a1 + 32) + 32) fromIndex:*(unsigned int *)(a1 + 48) toIndex:*(unsigned int *)(a1 + 52) skipDecodingSyncData:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)bookmarkArrayRequestingCount:(unsigned int)a3
{
  if (a3 && (unsigned int bookmarkCount = self->_bookmarkCount) != 0)
  {
    unsigned int v6 = bookmarkCount - 1;
    if (v6 >= a3 - 1) {
      uint64_t v7 = a3 - 1;
    }
    else {
      uint64_t v7 = v6;
    }
    id v8 = [(WebBookmarkList *)self bookmarkAtIndex:v7];
    uint64_t v9 = a3 - v7;
    if (a3 == v7)
    {
      uint64_t v10 = (void *)[(NSMutableArray *)self->_bookmarks copy];
      goto LABEL_13;
    }
    id v12 = [(WebBookmarkList *)self->_shadowBookmarkList bookmarkArrayRequestingCount:v9];
    id v14 = [(NSMutableArray *)self->_bookmarks arrayByAddingObjectsFromArray:v12];
  }
  else
  {
    uint64_t v11 = [(WebBookmarkList *)self->_shadowBookmarkList bookmarkArrayRequestingCount:*(void *)&a3];
    id v12 = (void *)v11;
    id v13 = (void *)MEMORY[0x263EFFA68];
    if (v11) {
      id v13 = (void *)v11;
    }
    id v14 = v13;
  }
  uint64_t v10 = v14;

LABEL_13:
  return v10;
}

- (id)_arrayForDifferenceCalculation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(WebBookmarkList *)self _primaryBookmarkCount];
  uint64_t v4 = [MEMORY[0x263EFF980] arrayWithCapacity:v3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v5 = self->_bookmarks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "UUID", (void)v16);
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if ([v4 count] < v3)
  {
    uint64_t v11 = 0;
    do
    {
      uint64_t v12 = v11 + 1;
      id v13 = [NSNumber numberWithInteger:(void)v16];
      [v4 addObject:v13];

      unint64_t v14 = [v4 count];
      uint64_t v11 = v12;
    }
    while (v14 < v3);
  }
  return v4;
}

- (void)_loadBookmarksForDifferenceFromList:(id)a3
{
  uint64_t v9 = (id *)a3;
  if (v9)
  {
    unint64_t v4 = [(WebBookmarkList *)self _primaryBookmarkCount];
    unint64_t v5 = v4 - [v9 _primaryBookmarkCount];
    uint64_t v6 = [v9[1] count];
    unint64_t v7 = (v5 + v6) & ~((uint64_t)(v5 + v6) >> 63);
    if (v7 >= v4) {
      unint64_t v7 = v4;
    }
    if (v7) {
      id v8 = [(WebBookmarkList *)self _bookmarkAtIndex:(v7 - 1) paginate:0 skipDecodingSyncData:0];
    }
  }
}

- (id)differenceFromList:(id)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if (v4) {
    [(WebBookmarkList *)self _loadBookmarksForDifferenceFromList:v6];
  }
  unint64_t v7 = [(WebBookmarkList *)self _arrayForDifferenceCalculation];
  if (v6)
  {
    id v8 = [v6 _arrayForDifferenceCalculation];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }
  uint64_t v9 = [v7 differenceFromArray:v8 withOptions:(2 * v4) & 4];

  return v9;
}

- (WebBookmarkList)shadowBookmarkList
{
  return self->_shadowBookmarkList;
}

- (void)setShadowBookmarkList:(id)a3
{
}

- (void)_moveBookmarkAtIndex:(unsigned int)a3 toIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  -[WebBookmarkList bookmarkAtIndex:](self, "bookmarkAtIndex:");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = [(WebBookmarkList *)self bookmarkAtIndex:v4];
  uint64_t v8 = [v7 orderIndex];

  if (v4 >= a3) {
    uint64_t v9 = a3;
  }
  else {
    uint64_t v9 = v4;
  }
  if (v4 <= a3) {
    unsigned int v10 = a3;
  }
  else {
    unsigned int v10 = v4;
  }
  if (v4 < a3) {
    int v11 = 1;
  }
  else {
    int v11 = -1;
  }
  do
  {
    uint64_t v12 = [(WebBookmarkList *)self bookmarkAtIndex:v9];
    objc_msgSend(v12, "_setOrderIndex:", objc_msgSend(v12, "orderIndex") + v11);

    uint64_t v9 = (v9 + 1);
  }
  while (v9 <= v10);
  [v14 _setOrderIndex:v8];
  [v14 markAttributesAsModified:4];
  bookmarks = self->_bookmarks;
  if (v4 >= a3)
  {
    [(NSMutableArray *)bookmarks insertObject:v14 atIndex:(v4 + 1)];
  }
  else
  {
    [(NSMutableArray *)bookmarks insertObject:v14 atIndex:v4];
    ++a3;
  }
  [(NSMutableArray *)self->_bookmarks removeObjectAtIndex:a3];
}

- (unsigned)_reverseOrderIndex:(unsigned int)a3
{
  return self->_bookmarkCount + ~a3;
}

@end