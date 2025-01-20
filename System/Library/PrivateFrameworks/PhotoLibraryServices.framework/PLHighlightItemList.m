@interface PLHighlightItemList
+ (id)timeSortDescriptors;
- (BOOL)hasChanges;
- (BOOL)isCandidateForReuse;
- (BOOL)isNewList;
- (NSArray)sortedChildHighlightItems;
- (NSDate)endDate;
- (NSDate)groupingEndDate;
- (NSDate)groupingStartDate;
- (NSDate)startDate;
- (NSManagedObjectID)objectID;
- (NSMutableOrderedSet)internalHighlightItems;
- (NSMutableSet)internalAddedHighlightItems;
- (NSMutableSet)internalRemovedHighlightItems;
- (NSSet)addedHighlightItems;
- (NSSet)removedHighlightItems;
- (NSString)description;
- (NSString)uuid;
- (PLHighlightItem)parentHighlightItem;
- (PLHighlightItemList)initWithParentHighlightItem:(id)a3 childHighlightItems:(id)a4;
- (id)initAsNewList;
- (void)_updateHighlightItemsOrdering;
- (void)_updateStartEndDates;
- (void)addHighlightItem:(id)a3;
- (void)mergeWithHighlightItemList:(id)a3;
- (void)removeHighlightItem:(id)a3;
- (void)reset;
@end

@implementation PLHighlightItemList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentHighlightItem, 0);
  objc_storeStrong((id *)&self->_internalRemovedHighlightItems, 0);
  objc_storeStrong((id *)&self->_internalAddedHighlightItems, 0);
  objc_storeStrong((id *)&self->_internalHighlightItems, 0);
  objc_storeStrong((id *)&self->_groupingEndDate, 0);
  objc_storeStrong((id *)&self->_groupingStartDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (PLHighlightItem)parentHighlightItem
{
  return self->_parentHighlightItem;
}

- (NSMutableSet)internalRemovedHighlightItems
{
  return self->_internalRemovedHighlightItems;
}

- (NSMutableSet)internalAddedHighlightItems
{
  return self->_internalAddedHighlightItems;
}

- (NSMutableOrderedSet)internalHighlightItems
{
  return self->_internalHighlightItems;
}

- (void)reset
{
  v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  internalHighlightItems = self->_internalHighlightItems;
  self->_internalHighlightItems = v3;

  v5 = [MEMORY[0x1E4F1CA80] set];
  internalAddedHighlightItems = self->_internalAddedHighlightItems;
  self->_internalAddedHighlightItems = v5;

  v7 = [MEMORY[0x1E4F1CA80] set];
  internalRemovedHighlightItems = self->_internalRemovedHighlightItems;
  self->_internalRemovedHighlightItems = v7;

  startDate = self->_startDate;
  self->_startDate = 0;

  endDate = self->_endDate;
  self->_endDate = 0;

  groupingStartDate = self->_groupingStartDate;
  self->_groupingStartDate = 0;

  groupingEndDate = self->_groupingEndDate;
  self->_groupingEndDate = 0;
}

- (void)mergeWithHighlightItemList:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = objc_msgSend(a3, "internalHighlightItems", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PLHighlightItemList *)self addHighlightItem:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(PLHighlightItemList *)self _updateHighlightItemsOrdering];
}

- (NSString)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PLHighlightItemList;
  v4 = [(PLHighlightItemList *)&v12 description];
  startDate = self->_startDate;
  endDate = self->_endDate;
  uint64_t v7 = [(NSMutableOrderedSet *)self->_internalHighlightItems count];
  BOOL v8 = [(PLHighlightItemList *)self isNewList];
  long long v9 = @"NO";
  if (v8) {
    long long v9 = @"YES";
  }
  long long v10 = [v3 stringWithFormat:@"%@ [(%@) - (%@)] (%ld) time periods, isNew: %@", v4, startDate, endDate, v7, v9];

  return (NSString *)v10;
}

- (void)_updateStartEndDates
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v26 = self;
  obj = self->_internalHighlightItems;
  uint64_t v2 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      long long v10 = v5;
      long long v11 = (void *)v6;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        objc_super v12 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        if (objc_msgSend(v12, "kind", v26) != 3)
        {
          v13 = [v12 startDate];
          uint64_t v14 = [v13 earlierDate:v7];

          v15 = [v12 endDate];
          uint64_t v16 = [v15 laterDate:v4];

          v4 = (NSDate *)v16;
          uint64_t v7 = (NSDate *)v14;
        }
        v17 = [v12 startDate];
        uint64_t v5 = [v17 earlierDate:v10];

        v18 = [v12 endDate];
        uint64_t v6 = [v18 laterDate:v11];

        ++v9;
        long long v10 = v5;
        long long v11 = (void *)v6;
      }
      while (v3 != v9);
      uint64_t v3 = [(NSMutableOrderedSet *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v3);
  }
  else
  {
    v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }

  startDate = v26->_startDate;
  v26->_startDate = v7;
  v20 = v7;

  endDate = v26->_endDate;
  v26->_endDate = v4;
  v22 = v4;

  groupingStartDate = v26->_groupingStartDate;
  v26->_groupingStartDate = v5;
  v24 = v5;

  groupingEndDate = v26->_groupingEndDate;
  v26->_groupingEndDate = (NSDate *)v6;
}

- (void)_updateHighlightItemsOrdering
{
  internalHighlightItems = self->_internalHighlightItems;
  v4 = [(id)objc_opt_class() timeSortDescriptors];
  [(NSMutableOrderedSet *)internalHighlightItems sortUsingDescriptors:v4];

  [(PLHighlightItemList *)self _updateStartEndDates];
}

- (void)removeHighlightItem:(id)a3
{
  id v4 = a3;
  if (-[NSMutableOrderedSet containsObject:](self->_internalHighlightItems, "containsObject:"))
  {
    [(NSMutableOrderedSet *)self->_internalHighlightItems removeObject:v4];
    if ([(NSMutableSet *)self->_internalAddedHighlightItems containsObject:v4]) {
      [(NSMutableSet *)self->_internalAddedHighlightItems removeObject:v4];
    }
    else {
      [(NSMutableSet *)self->_internalRemovedHighlightItems addObject:v4];
    }
    [(PLHighlightItemList *)self _updateStartEndDates];
  }
}

- (void)addHighlightItem:(id)a3
{
  id v4 = a3;
  if (([(NSMutableOrderedSet *)self->_internalHighlightItems containsObject:v4] & 1) == 0)
  {
    [(NSMutableOrderedSet *)self->_internalHighlightItems addObject:v4];
    if ([(NSMutableSet *)self->_internalRemovedHighlightItems containsObject:v4]) {
      [(NSMutableSet *)self->_internalRemovedHighlightItems removeObject:v4];
    }
    else {
      [(NSMutableSet *)self->_internalAddedHighlightItems addObject:v4];
    }
    uint64_t v5 = [(id)objc_opt_class() timeSortDescriptors];
    internalHighlightItems = self->_internalHighlightItems;
    uint64_t v7 = [(NSMutableOrderedSet *)internalHighlightItems count];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__PLHighlightItemList_addHighlightItem___block_invoke;
    v9[3] = &unk_1E586C990;
    id v10 = v5;
    id v8 = v5;
    -[NSMutableOrderedSet indexOfObject:inSortedRange:options:usingComparator:](internalHighlightItems, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, v7, 1024, v9);
    [(PLHighlightItemList *)self _updateStartEndDates];
  }
}

uint64_t __40__PLHighlightItemList_addHighlightItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "compareObject:toObject:", v5, v6, (void)v15);
        if (v12)
        {
          uint64_t v13 = v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

- (NSSet)removedHighlightItems
{
  uint64_t v2 = (void *)[(NSMutableSet *)self->_internalRemovedHighlightItems copy];
  return (NSSet *)v2;
}

- (NSSet)addedHighlightItems
{
  uint64_t v2 = (void *)[(NSMutableSet *)self->_internalAddedHighlightItems copy];
  return (NSSet *)v2;
}

- (NSArray)sortedChildHighlightItems
{
  uint64_t v2 = [(NSMutableOrderedSet *)self->_internalHighlightItems array];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (BOOL)isNewList
{
  return self->_parentHighlightItem == 0;
}

- (BOOL)hasChanges
{
  if ([(NSMutableSet *)self->_internalAddedHighlightItems count]
    || [(NSMutableSet *)self->_internalRemovedHighlightItems count])
  {
    LOBYTE(v3) = 1;
  }
  else if (self->_parentHighlightItem && [(NSMutableOrderedSet *)self->_internalHighlightItems count])
  {
    id v5 = [(PLHighlightItem *)self->_parentHighlightItem startDate];
    if ([v5 isEqualToDate:self->_startDate])
    {
      id v6 = [(PLHighlightItem *)self->_parentHighlightItem endDate];
      int v3 = [v6 isEqualToDate:self->_endDate] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isCandidateForReuse
{
  return ![(NSMutableOrderedSet *)self->_internalHighlightItems count] && self->_parentHighlightItem != 0;
}

- (NSManagedObjectID)objectID
{
  uint64_t v2 = [(PLHighlightItemList *)self parentHighlightItem];
  int v3 = [v2 objectID];

  return (NSManagedObjectID *)v3;
}

- (NSString)uuid
{
  uint64_t v2 = [(PLHighlightItemList *)self parentHighlightItem];
  int v3 = [v2 uuid];

  return (NSString *)v3;
}

- (NSDate)endDate
{
  if ([(PLHighlightItemList *)self isCandidateForReuse])
  {
    int v3 = [(PLHighlightItemList *)self parentHighlightItem];
    id v4 = [v3 endDate];
  }
  else
  {
    id v4 = self->_endDate;
  }
  return v4;
}

- (NSDate)startDate
{
  if ([(PLHighlightItemList *)self isCandidateForReuse])
  {
    int v3 = [(PLHighlightItemList *)self parentHighlightItem];
    id v4 = [v3 startDate];
  }
  else
  {
    id v4 = self->_startDate;
  }
  return v4;
}

- (NSDate)groupingEndDate
{
  if ([(PLHighlightItemList *)self isCandidateForReuse])
  {
    int v3 = [(PLHighlightItemList *)self parentHighlightItem];
    id v4 = [v3 endDate];
  }
  else
  {
    id v4 = self->_groupingEndDate;
  }
  return v4;
}

- (NSDate)groupingStartDate
{
  if ([(PLHighlightItemList *)self isCandidateForReuse])
  {
    int v3 = [(PLHighlightItemList *)self parentHighlightItem];
    id v4 = [v3 startDate];
  }
  else
  {
    id v4 = self->_groupingStartDate;
  }
  return v4;
}

- (id)initAsNewList
{
  v10.receiver = self;
  v10.super_class = (Class)PLHighlightItemList;
  uint64_t v2 = [(PLHighlightItemList *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA70] orderedSet];
    internalHighlightItems = v2->_internalHighlightItems;
    v2->_internalHighlightItems = (NSMutableOrderedSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    internalAddedHighlightItems = v2->_internalAddedHighlightItems;
    v2->_internalAddedHighlightItems = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    internalRemovedHighlightItems = v2->_internalRemovedHighlightItems;
    v2->_internalRemovedHighlightItems = (NSMutableSet *)v7;
  }
  return v2;
}

- (PLHighlightItemList)initWithParentHighlightItem:(id)a3 childHighlightItems:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PLHighlightItemList;
  uint64_t v9 = [(PLHighlightItemList *)&v18 init];
  objc_super v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parentHighlightItem, a3);
    uint64_t v11 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v8];
    internalHighlightItems = v10->_internalHighlightItems;
    v10->_internalHighlightItems = (NSMutableOrderedSet *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
    internalAddedHighlightItems = v10->_internalAddedHighlightItems;
    v10->_internalAddedHighlightItems = (NSMutableSet *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA80] set];
    internalRemovedHighlightItems = v10->_internalRemovedHighlightItems;
    v10->_internalRemovedHighlightItems = (NSMutableSet *)v15;

    [(PLHighlightItemList *)v10 _updateHighlightItemsOrdering];
  }

  return v10;
}

+ (id)timeSortDescriptors
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

@end