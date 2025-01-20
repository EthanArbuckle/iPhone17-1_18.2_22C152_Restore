@interface FCFDBFeed
- (BOOL)hasFetchedRangesInRange:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FCFDBFeed)initWithFeedID:(id)a3 feedLookupID:(int64_t)a4;
- (FCFDBFeed)initWithFeedID:(id)a3 feedLookupID:(int64_t)a4 refreshedFromOrder:(unint64_t)a5 refreshedToOrder:(unint64_t)a6 fetchedRanges:(id)a7;
- (FCFeedRange)refreshRegion;
- (FCFeedRange)trailingEmptyRegion;
- (NSArray)fetchedRanges;
- (NSData)fetchedRangesData;
- (NSString)feedID;
- (id)contiguousFetchedRangeInRange:(id)a3;
- (id)copyWithRefreshedFromOrder:(unint64_t)a3 refreshedToOrder:(unint64_t)a4 newlyFetchedRange:(id)a5;
- (id)copyWithoutFetchedRange:(id)a3;
- (id)fetchedRangeFollowingOrder:(unint64_t)a3;
- (id)fetchedRangePrecedingOrder:(unint64_t)a3;
- (id)initFromSQLWithFeedID:(const char *)a3 feedLookupID:(int64_t)a4 refreshedFromOrder:(int64_t)a5 refreshedToOrder:(int64_t)a6 fetchedRangesBytes:(const void *)a7 fetchedRangesLength:(int)a8;
- (int64_t)feedLookupID;
- (unint64_t)refreshedFromOrder;
- (unint64_t)refreshedToOrder;
- (void)_visitContiguousRangesInRange:(id)a3 withBlock:(id)a4;
- (void)enumerateGapsWithBlock:(id)a3;
@end

@implementation FCFDBFeed

- (FCFDBFeed)initWithFeedID:(id)a3 feedLookupID:(int64_t)a4 refreshedFromOrder:(unint64_t)a5 refreshedToOrder:(unint64_t)a6 fetchedRanges:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FCFDBFeed;
  v15 = [(FCFDBFeed *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_feedID, a3);
    v16->_feedLookupID = a4;
    v16->_refreshedFromOrder = a5;
    v16->_refreshedToOrder = a6;
    if (v14) {
      v17 = v14;
    }
    else {
      v17 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v16->_fetchedRanges, v17);
    [(FCFDBFeed *)v16 d_sanityCheck];
  }

  return v16;
}

- (FCFDBFeed)initWithFeedID:(id)a3 feedLookupID:(int64_t)a4
{
  return [(FCFDBFeed *)self initWithFeedID:a3 feedLookupID:a4 refreshedFromOrder:0 refreshedToOrder:0 fetchedRanges:MEMORY[0x1E4F1CBF0]];
}

- (id)initFromSQLWithFeedID:(const char *)a3 feedLookupID:(int64_t)a4 refreshedFromOrder:(int64_t)a5 refreshedToOrder:(int64_t)a6 fetchedRangesBytes:(const void *)a7 fetchedRangesLength:(int)a8
{
  id v14 = (void *)[[NSString alloc] initWithCString:a3 encoding:4];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __123__FCFDBFeed_initFromSQLWithFeedID_feedLookupID_refreshedFromOrder_refreshedToOrder_fetchedRangesBytes_fetchedRangesLength___block_invoke;
  v18[3] = &__block_descriptor_44_e24_v16__0__NSMutableArray_8l;
  v18[4] = a7;
  int v19 = a8;
  v15 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v18);
  v16 = [(FCFDBFeed *)self initWithFeedID:v14 feedLookupID:a4 refreshedFromOrder:a5 refreshedToOrder:a6 fetchedRanges:v15];

  return v16;
}

void __123__FCFDBFeed_initFromSQLWithFeedID_feedLookupID_refreshedFromOrder_refreshedToOrder_fetchedRangesBytes_fetchedRangesLength___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = *(char **)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(int *)(a1 + 40);
    v5 = &v3[v4];
    while (v3 < v5)
    {
      uint64_t v6 = *(void *)v3;
      uint64_t v7 = *((void *)v3 + 1);
      v3 += 16;
      v8 = +[FCFeedRange feedRangeWithMaxOrder:v6 minOrder:v7];
      [v9 addObject:v8];
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [(FCFDBFeed *)self feedID];
    v8 = [v6 feedID];
    if ([v7 isEqualToString:v8]
      && (int64_t v9 = -[FCFDBFeed feedLookupID](self, "feedLookupID"), v9 == [v6 feedLookupID])
      && (unint64_t v10 = [(FCFDBFeed *)self refreshedFromOrder],
          v10 == [v6 refreshedFromOrder])
      && (unint64_t v11 = -[FCFDBFeed refreshedToOrder](self, "refreshedToOrder"), v11 == [v6 refreshedToOrder]))
    {
      v12 = [(FCFDBFeed *)self fetchedRanges];
      id v13 = [v6 fetchedRanges];
      char v14 = [v12 isEqualToArray:v13];
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSData)fetchedRangesData
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(FCFDBFeed *)self fetchedRanges];
  id v4 = malloc_type_calloc(2 * [v3 count], 8uLL, 0x100004000313F17uLL);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [(FCFDBFeed *)self fetchedRanges];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    int64_t v9 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = [v11 top];
        *int64_t v9 = [v12 order];

        id v13 = [v11 bottom];
        char v14 = v9 + 2;
        v9[1] = [v13 order];

        v9 += 2;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      int64_t v9 = v14;
    }
    while (v7);
  }

  v15 = (void *)MEMORY[0x1E4F1C9B8];
  v16 = [(FCFDBFeed *)self fetchedRanges];
  v17 = objc_msgSend(v15, "dataWithBytesNoCopy:length:freeWhenDone:", v4, 16 * objc_msgSend(v16, "count"), 1);

  return (NSData *)v17;
}

- (FCFeedRange)refreshRegion
{
  v3 = [(FCFDBFeed *)self refreshedFromOrder];
  if (v3)
  {
    v3 = +[FCFeedRange feedRangeWithMaxOrder:[(FCFDBFeed *)self refreshedFromOrder] minOrder:[(FCFDBFeed *)self refreshedToOrder]];
  }
  return (FCFeedRange *)v3;
}

- (FCFeedRange)trailingEmptyRegion
{
  v3 = [(FCFDBFeed *)self fetchedRanges];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(FCFDBFeed *)self fetchedRanges];
    uint64_t v6 = [v5 lastObject];
    uint64_t v7 = [v6 bottom];
    uint64_t v8 = +[FCFeedCursor cursorForBottomOfFeed];
    int64_t v9 = +[FCFeedRange feedRangeWithTop:v7 bottom:v8];
  }
  else
  {
    v5 = +[FCFeedCursor cursorForTopOfFeed];
    uint64_t v6 = +[FCFeedCursor cursorForBottomOfFeed];
    int64_t v9 = +[FCFeedRange feedRangeWithTop:v5 bottom:v6];
  }

  return (FCFeedRange *)v9;
}

- (id)copyWithRefreshedFromOrder:(unint64_t)a3 refreshedToOrder:(unint64_t)a4 newlyFetchedRange:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v10 = (void *)v9;
  if (v8)
  {
    unint64_t v42 = a4;
    v44 = (void *)v9;
    id v11 = v8;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v12 = [(FCFDBFeed *)self fetchedRanges];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id obj = v12;
      v39 = self;
      unint64_t v40 = a3;
      id v41 = v8;
      uint64_t v15 = *(void *)v46;
      v16 = v11;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          long long v19 = objc_msgSend(v18, "bottom", v39, v40, v41);
          unint64_t v20 = [v19 order];
          long long v21 = [v11 top];
          unint64_t v22 = [v21 order];

          if (v20 <= v22)
          {
            v23 = [v18 top];
            unint64_t v24 = [v23 order];
            v25 = [v11 bottom];
            unint64_t v26 = [v25 order];

            if (v24 >= v26)
            {
              uint64_t v27 = [v16 feedRangeByUnioningWithRange:v18];

              v16 = (void *)v27;
            }
            else
            {
              if (v16)
              {
                [v44 addObject:v16];
              }
              [v44 addObject:v18];
              v16 = 0;
            }
          }
          else
          {
            [v44 addObject:v18];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      }
      while (v14);

      a3 = v40;
      id v8 = v41;
      self = v39;
      if (!v16)
      {
        v28 = v44;
LABEL_21:
        a4 = v42;
        goto LABEL_22;
      }
    }
    else
    {

      v16 = v11;
    }
    v28 = v44;
    [v44 addObject:v16];

    goto LABEL_21;
  }
  v29 = [(FCFDBFeed *)self fetchedRanges];
  v28 = (void *)[v29 mutableCopy];

LABEL_22:
  if ([v28 count])
  {
    v30 = [v28 firstObject];
    v31 = [v30 top];
    unint64_t v32 = [v31 order];

    if (v32 > a4)
    {
      v33 = [v28 firstObject];
      v34 = [v33 top];
      a4 = [v34 order];
    }
  }
  v35 = [FCFDBFeed alloc];
  v36 = [(FCFDBFeed *)self feedID];
  v37 = [(FCFDBFeed *)v35 initWithFeedID:v36 feedLookupID:[(FCFDBFeed *)self feedLookupID] refreshedFromOrder:a3 refreshedToOrder:a4 fetchedRanges:v28];

  return v37;
}

- (id)copyWithoutFetchedRange:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  unint64_t v32 = self;
  uint64_t v6 = [(FCFDBFeed *)self fetchedRanges];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    v33 = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (([v4 containsFeedRange:v11] & 1) == 0)
        {
          if ([v4 intersectsRange:v11])
          {
            v12 = v5;
            uint64_t v13 = [v11 top];
            unint64_t v14 = [v13 order];
            uint64_t v15 = [v4 top];
            unint64_t v16 = [v15 order];

            if (v14 <= v16)
            {
              unint64_t v20 = [v4 bottom];
              long long v21 = [v11 top];
              long long v19 = +[FCFeedRange feedRangeWithTop:v20 bottom:v21];
            }
            else
            {
              v17 = [v11 top];
              v18 = [v4 top];
              long long v19 = +[FCFeedRange feedRangeWithTop:v17 bottom:v18];
            }
            v5 = v12;
            [v12 addObject:v19];

            uint64_t v6 = v33;
          }
          else
          {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v8);
  }

  unint64_t v22 = [(FCFDBFeed *)v32 refreshedFromOrder];
  v23 = [v4 top];
  unint64_t v24 = [v23 order];

  if (v22 <= v24) {
    unint64_t v22 = v24;
  }
  unint64_t v25 = [(FCFDBFeed *)v32 refreshedToOrder];
  unint64_t v26 = [v4 top];
  unint64_t v27 = [v26 order];

  if (v25 <= v27) {
    unint64_t v25 = v27;
  }
  v28 = [FCFDBFeed alloc];
  v29 = [(FCFDBFeed *)v32 feedID];
  v30 = [(FCFDBFeed *)v28 initWithFeedID:v29 feedLookupID:[(FCFDBFeed *)v32 feedLookupID] refreshedFromOrder:v22 refreshedToOrder:v25 fetchedRanges:v5];

  return v30;
}

- (void)enumerateGapsWithBlock:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  char v36 = 0;
  v5 = [(FCFDBFeed *)self fetchedRanges];
  uint64_t v6 = [v5 count];

  uint64_t v7 = +[FCFeedCursor cursorForTopOfFeed];
  if (v6)
  {
    uint64_t v8 = [(FCFDBFeed *)self fetchedRanges];
    uint64_t v9 = [v8 firstObject];
    unint64_t v10 = [v9 top];
    id v11 = +[FCFeedCursor cursorForOrder:](FCFeedCursor, "cursorForOrder:", [v10 order]);
    v12 = +[FCFeedRange feedRangeWithTop:v7 bottom:v11];
    v4[2](v4, v12, &v36);

    if (v36) {
      goto LABEL_19;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v13 = [(FCFDBFeed *)self fetchedRanges];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      v30 = self;
      v31 = v4;
      id v16 = 0;
      uint64_t v17 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          uint64_t v7 = v16;
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v13);
          }
          long long v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (v7)
          {
            unint64_t v20 = [*(id *)(*((void *)&v32 + 1) + 8 * i) top];
            uint64_t v21 = [v20 order];
            unint64_t v22 = [v7 bottom];
            uint64_t v23 = [v22 order];

            if (v21 != v23)
            {
              unint64_t v24 = [v7 bottom];
              unint64_t v25 = [v19 top];
              unint64_t v26 = +[FCFeedRange feedRangeWithTop:v24 bottom:v25];
              v31[2](v31, v26, &v36);

              if (v36)
              {
                id v4 = v31;
                goto LABEL_18;
              }
            }
          }
          id v16 = v19;
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v15) {
          continue;
        }
        break;
      }

      self = v30;
      id v4 = v31;
    }

    uint64_t v7 = [(FCFDBFeed *)self fetchedRanges];
    uint64_t v13 = [v7 lastObject];
    unint64_t v27 = [v13 bottom];
    v28 = +[FCFeedCursor cursorForBottomOfFeed];
    v29 = +[FCFeedRange feedRangeWithTop:v27 bottom:v28];
    v4[2](v4, v29, &v36);
  }
  else
  {
    uint64_t v13 = +[FCFeedCursor cursorForBottomOfFeed];
    unint64_t v27 = +[FCFeedRange feedRangeWithTop:v7 bottom:v13];
    v4[2](v4, v27, &v36);
  }

LABEL_18:
LABEL_19:
}

- (id)fetchedRangePrecedingOrder:(unint64_t)a3
{
  id v4 = [(FCFDBFeed *)self fetchedRanges];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__FCFDBFeed_fetchedRangePrecedingOrder___block_invoke;
  v7[3] = &__block_descriptor_40_e21_B16__0__FCFeedRange_8l;
  v7[4] = a3;
  v5 = objc_msgSend(v4, "fc_lastObjectPassingTest:", v7);

  return v5;
}

BOOL __40__FCFDBFeed_fetchedRangePrecedingOrder___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 top];
  BOOL v4 = (unint64_t)[v3 order] > *(void *)(a1 + 32);

  return v4;
}

- (id)fetchedRangeFollowingOrder:(unint64_t)a3
{
  BOOL v4 = [(FCFDBFeed *)self fetchedRanges];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__FCFDBFeed_fetchedRangeFollowingOrder___block_invoke;
  v7[3] = &__block_descriptor_40_e21_B16__0__FCFeedRange_8l;
  v7[4] = a3;
  v5 = objc_msgSend(v4, "fc_firstObjectPassingTest:", v7);

  return v5;
}

BOOL __40__FCFDBFeed_fetchedRangeFollowingOrder___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bottom];
  BOOL v4 = (unint64_t)[v3 order] < *(void *)(a1 + 32);

  return v4;
}

- (id)contiguousFetchedRangeInRange:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__83;
  uint64_t v15 = __Block_byref_object_dispose__83;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__FCFDBFeed_contiguousFetchedRangeInRange___block_invoke;
  v10[3] = &unk_1E5B5BE88;
  v10[4] = &v11;
  [(FCFDBFeed *)self _visitContiguousRangesInRange:v4 withBlock:v10];
  if ([(FCFDBFeed *)self refreshedFromOrder])
  {
    v5 = +[FCFeedRange feedRangeWithMaxOrder:[(FCFDBFeed *)self refreshedFromOrder] minOrder:[(FCFDBFeed *)self refreshedToOrder]];
    if ([v5 intersectsOrAdjoinsRange:v4])
    {
      uint64_t v6 = +[FCFeedRange feedRangeByMergingRange:v12[5] withRange:v5];
      uint64_t v7 = (void *)v12[5];
      v12[5] = v6;
    }
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __43__FCFDBFeed_contiguousFetchedRangeInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[FCFeedRange feedRangeByMergingRange:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) withRange:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

- (BOOL)hasFetchedRangesInRange:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(FCFDBFeed *)self fetchedRanges];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__FCFDBFeed_hasFetchedRangesInRange___block_invoke;
  v8[3] = &unk_1E5B5BEB0;
  unint64_t v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateObjectsWithOptions:2 usingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __37__FCFDBFeed_hasFetchedRangesInRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v9 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 intersectsRange:*(void *)(a1 + 32)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
  }
  else
  {
    id v6 = [v9 top];
    unint64_t v7 = [v6 order];
    id v8 = [*(id *)(a1 + 32) bottom];
    *a4 = v7 > [v8 order];
  }
}

- (void)_visitContiguousRangesInRange:(id)a3 withBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__83;
  v23[4] = __Block_byref_object_dispose__83;
  id v24 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__FCFDBFeed__visitContiguousRangesInRange_withBlock___block_invoke;
  aBlock[3] = &unk_1E5B5BED8;
  unint64_t v22 = v23;
  id v8 = v6;
  id v20 = v8;
  id v9 = v7;
  id v21 = v9;
  unint64_t v10 = (uint64_t (**)(void *, void))_Block_copy(aBlock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v11 = [(FCFDBFeed *)self fetchedRanges];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v16 != v13) {
        objc_enumerationMutation(v11);
      }
      if ((v10[2](v10, *(void *)(*((void *)&v15 + 1) + 8 * v14)) & 1) == 0) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v25 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(v23, 8);
}

uint64_t __53__FCFDBFeed__visitContiguousRangesInRange_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (objc_msgSend(v3, "intersectsOrAdjoinsRange:"))
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t v5 = +[FCFeedRange feedRangeByMergingRange:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withRange:v4];
      uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
LABEL_7:

      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v8 = [v3 bottom];
  unint64_t v9 = [v8 order];
  unint64_t v10 = [*(id *)(a1 + 32) top];
  unint64_t v11 = [v10 order];

  if (v9 < v11)
  {
    if ([v4 intersectsRange:*(void *)(a1 + 32)])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      id v13 = v4;
      id v7 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v13;
      goto LABEL_7;
    }
LABEL_9:
    uint64_t v14 = 0;
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v14 = 1;
LABEL_10:

  return v14;
}

- (NSString)feedID
{
  return self->_feedID;
}

- (unint64_t)refreshedFromOrder
{
  return self->_refreshedFromOrder;
}

- (unint64_t)refreshedToOrder
{
  return self->_refreshedToOrder;
}

- (NSArray)fetchedRanges
{
  return self->_fetchedRanges;
}

- (int64_t)feedLookupID
{
  return self->_feedLookupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedRanges, 0);
  objc_storeStrong((id *)&self->_feedID, 0);
}

@end