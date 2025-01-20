@interface THGlossaryIndex
+ (id)alphabeticalIndexForEntries:(id)a3;
+ (id)alphabeticalIndexForGlossary:(id)a3 withPrefix:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLastInSection:(id)a3;
- (NSArray)sectionIndexTitles;
- (id)entryAtIndex:(unint64_t)a3;
- (id)entryForRowAtIndexPath:(id)a3;
- (id)indexPathForEntry:(id)a3;
- (id)p_sectionAtIndex:(unint64_t)a3;
- (id)p_sectionForSectionTitle:(id)a3;
- (id)titleForHeaderInSection:(int64_t)a3;
- (int64_t)indexForEntry:(id)a3;
- (int64_t)numberOfEntries;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)sectionForSectionIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (unint64_t)hash;
- (void)dealloc;
- (void)p_buildAlphabeticalIndexForGlossaryEntries:(id)a3;
- (void)p_releaseData;
@end

@implementation THGlossaryIndex

- (void)p_releaseData
{
  self->mSortedEntries = 0;
  self->mEntryToIndexMap = 0;

  self->mSections = 0;
  self->mSectionTitleToSectionMap = 0;

  self->mSectionIndexTitles = 0;
}

- (id)p_sectionForSectionTitle:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mSections = self->mSections;
  id v5 = [(NSMutableArray *)mSections countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(mSections);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (!objc_msgSend(objc_msgSend(v9, "sectionTitle"), "localizedCaseInsensitiveCompare:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)mSections countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)p_buildAlphabeticalIndexForGlossaryEntries:(id)a3
{
  id v5 = [a3 count];
  self->mSections = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->mSectionTitleToSectionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(a3);
        }
        v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        long long v11 = sub_C07A4(v10);
        id v12 = [(NSMutableDictionary *)self->mSectionTitleToSectionMap objectForKey:v11];
        if (v12)
        {
          [v12 addEntry:v10];
        }
        else
        {
          long long v13 = [[THGlossaryIndexSection alloc] initWithSectionTitle:v11 andEntry:v10];
          [(NSMutableDictionary *)self->mSectionTitleToSectionMap setObject:v13 forKey:v11];
          [(NSMutableArray *)self->mSections addObject:v13];
        }
      }
      id v7 = [a3 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v7);
  }
  [(NSMutableArray *)self->mSections sortUsingSelector:"compare:"];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  mSections = self->mSections;
  id v15 = [(NSMutableArray *)mSections countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v46;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(mSections);
        }
        [*(id *)(*((void *)&v45 + 1) + 8 * (void)j) setSectionIndex:(char *)j + v17];
      }
      id v16 = [(NSMutableArray *)mSections countByEnumeratingWithState:&v45 objects:v55 count:16];
      v17 += (uint64_t)j;
    }
    while (v16);
  }
  self->mEntryToIndexMap = (TSUPointerKeyDictionary *)[objc_alloc((Class)TSUPointerKeyDictionary) initWithCapacity:v5];
  self->mSortedEntries = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v5];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obj = self->mSections;
  id v20 = [(NSMutableArray *)obj countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = 0;
    uint64_t v36 = *(void *)v42;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v41 + 1) + 8 * (void)k);
        if ((uint64_t)[v24 entryCount] >= 1)
        {
          uint64_t v25 = 0;
          do
          {
            id v26 = [v24 entryAtIndex:v25];
            [(NSMutableArray *)self->mSortedEntries addObject:v26];
            [(TSUPointerKeyDictionary *)self->mEntryToIndexMap setObject:+[NSNumber numberWithInteger:v22 + v25++] forUncopiedKey:v26];
          }
          while ((uint64_t)[v24 entryCount] > v25);
          v22 += v25;
        }
      }
      id v21 = [(NSMutableArray *)obj countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v21);
  }
  self->mSectionIndexTitles = (NSArray *)[(NSArray *)[+[UILocalizedIndexedCollation currentCollation] sectionTitles] copy];
  if ([(NSMutableArray *)self->mSections count])
  {
    id v27 = [(NSMutableArray *)self->mSections objectAtIndex:0];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    mSectionIndexTitles = self->mSectionIndexTitles;
    id v29 = [(NSArray *)mSectionIndexTitles countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v38;
      do
      {
        v32 = 0;
        id v33 = v27;
        do
        {
          if (*(void *)v38 != v31) {
            objc_enumerationMutation(mSectionIndexTitles);
          }
          uint64_t v34 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v32);
          id v27 = [(NSMutableDictionary *)self->mSectionTitleToSectionMap objectForKey:v34];
          if (!v27)
          {
            [(NSMutableDictionary *)self->mSectionTitleToSectionMap setObject:v33 forKey:v34];
            id v27 = v33;
          }
          v32 = (char *)v32 + 1;
          id v33 = v27;
        }
        while (v30 != v32);
        id v30 = [(NSArray *)mSectionIndexTitles countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v30);
    }
  }
}

+ (id)alphabeticalIndexForEntries:(id)a3
{
  v4 = objc_alloc_init(THGlossaryIndex);
  [(THGlossaryIndex *)v4 p_buildAlphabeticalIndexForGlossaryEntries:a3];
  return v4;
}

+ (id)alphabeticalIndexForGlossary:(id)a3 withPrefix:(id)a4
{
  id v6 = objc_alloc_init(THGlossaryIndex);
  id v7 = (char *)[a3 entryCount];
  id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v7];
  if ([a4 length])
  {
    id v9 = [a4 normalizedStringForSearch];
    if ((uint64_t)v7 >= 1)
    {
      id v10 = v9;
      for (i = 0; i != v7; ++i)
      {
        id v12 = [a3 entryAtIndex:i];
        if ([v12 containsPrefix:v10]) {
          [v8 addObject:v12];
        }
      }
    }
  }
  else if ((uint64_t)v7 >= 1)
  {
    for (j = 0; j != v7; ++j)
    {
      id v14 = [a3 entryAtIndex:j];
      if (objc_msgSend(objc_msgSend(v14, "term"), "length"))
      {
        [v8 addObject:v14];
      }
      else if (!objc_msgSend(objc_msgSend(v14, "term"), "length"))
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THGlossaryIndex alphabeticalIndexForGlossary:withPrefix:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryIndex.m") lineNumber:264 description:@"Zero length glossary term"];
      }
    }
  }
  [(THGlossaryIndex *)v6 p_buildAlphabeticalIndexForGlossaryEntries:v8];
  return v6;
}

- (void)dealloc
{
  [(THGlossaryIndex *)self p_releaseData];
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryIndex;
  [(THGlossaryIndex *)&v3 dealloc];
}

- (int64_t)numberOfEntries
{
  return (int64_t)[(NSMutableArray *)self->mSortedEntries count];
}

- (int64_t)numberOfSections
{
  return (int64_t)[(NSMutableArray *)self->mSections count];
}

- (id)p_sectionAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->mSections count] <= a3) {
    return 0;
  }
  mSections = self->mSections;

  return [(NSMutableArray *)mSections objectAtIndex:a3];
}

- (id)entryForRowAtIndexPath:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = -[THGlossaryIndex p_sectionAtIndex:](self, "p_sectionAtIndex:", [a3 section]);
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  id v6 = [a3 row];
  if ((uint64_t)v6 >= (uint64_t)[v5 entryCount]
    || ((unint64_t)[a3 row] & 0x8000000000000000) != 0)
  {
    return 0;
  }
  id v7 = [a3 row];

  return [v5 entryAtIndex:v7];
}

- (id)indexPathForEntry:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->mSectionTitleToSectionMap objectForKey:sub_C07A4(a3)];
  if (v4 && (id v5 = v4, v6 = [v4 indexForEntry:a3], v6 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    id v9 = v6;
    id v8 = [v5 sectionIndex];
    id v7 = v9;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryIndex indexPathForEntry:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryIndex.m"), 329, @"Entry %@ out of bounds.", objc_msgSend(a3, "term"));
    id v7 = 0;
    id v8 = 0;
  }

  return +[NSIndexPath indexPathForRow:v7 inSection:v8];
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  id v3 = [(THGlossaryIndex *)self p_sectionAtIndex:a3];

  return (int64_t)[v3 entryCount];
}

- (int64_t)sectionForSectionIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  id v4 = -[NSMutableDictionary objectForKey:](self->mSectionTitleToSectionMap, "objectForKey:", a3, a4);

  return (int64_t)[v4 sectionIndex];
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  id v3 = [(THGlossaryIndex *)self p_sectionAtIndex:a3];

  return [v3 sectionTitle];
}

- (id)entryAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->mSortedEntries count] <= a3) {
    return 0;
  }
  mSortedEntries = self->mSortedEntries;

  return [(NSMutableArray *)mSortedEntries objectAtIndex:a3];
}

- (int64_t)indexForEntry:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v3 = -[TSUPointerKeyDictionary objectForKey:](self->mEntryToIndexMap, "objectForKey:");
  if (v3) {
    return (int)[v3 intValue];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (BOOL)isLastInSection:(id)a3
{
  id v5 = (char *)[a3 row];
  return v5 == (char *)[self p_sectionAtIndex:[a3 section]]- 1;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    uint64_t v5 = *(void *)(v4 + 8);
    mSortedEntries = self->mSortedEntries;
    LOBYTE(v4) = [(NSMutableArray *)mSortedEntries isEqual:v5];
  }
  return v4;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableArray *)self->mSortedEntries hash];
}

- (NSArray)sectionIndexTitles
{
  return self->mSectionIndexTitles;
}

@end