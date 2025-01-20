@interface PSSearchResults
- (BOOL)removeEntry:(id)a3;
- (BOOL)treatSectionEntriesAsRegularEntries;
- (PSSearchResults)init;
- (id)_initForCopyWithSectionEntries:(id)a3 entriesBySection:(id)a4 explicitlyAddedSectionEntries:(id)a5;
- (id)allSectionEntries;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)entriesInSectionAtIndex:(unint64_t)a3;
- (id)entryAtIndexPath:(id)a3;
- (id)entryComparator;
- (id)resultsByMergingWithResults:(id)a3;
- (id)sectionComparator;
- (id)sectionEntryAtIndex:(unint64_t)a3;
- (unint64_t)numberOfEntriesInSectionAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSectionEntries;
- (unint64_t)removeEntries:(id)a3;
- (unint64_t)totalNumberOfEntries;
- (void)addEntries:(id)a3;
- (void)addEntry:(id)a3;
- (void)mergeWithResults:(id)a3;
- (void)setEntryComparator:(id)a3;
- (void)setSectionComparator:(id)a3;
- (void)setTreatSectionEntriesAsRegularEntries:(BOOL)a3;
- (void)sortResults;
@end

@implementation PSSearchResults

- (PSSearchResults)init
{
  v10.receiver = self;
  v10.super_class = (Class)PSSearchResults;
  v2 = [(PSSearchResults *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sectionEntries = v2->_sectionEntries;
    v2->_sectionEntries = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    entriesBySection = v2->_entriesBySection;
    v2->_entriesBySection = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    explicitlyAddedSectionEntries = v2->_explicitlyAddedSectionEntries;
    v2->_explicitlyAddedSectionEntries = (NSMutableSet *)v7;
  }
  return v2;
}

- (id)_initForCopyWithSectionEntries:(id)a3 entriesBySection:(id)a4 explicitlyAddedSectionEntries:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PSSearchResults;
  v12 = [(PSSearchResults *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sectionEntries, a3);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MEMORY[0x1E4F1CA48] arrayWithArray:self->_sectionEntries];
  uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithSet:self->_explicitlyAddedSectionEntries];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_entriesBySection, "count"));
  entriesBySection = self->_entriesBySection;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __32__PSSearchResults_copyWithZone___block_invoke;
  v15[3] = &unk_1E5C5F3B0;
  id v16 = v6;
  id v8 = v6;
  [(NSMutableDictionary *)entriesBySection enumerateKeysAndObjectsUsingBlock:v15];
  id v9 = [[PSSearchResults alloc] _initForCopyWithSectionEntries:v4 entriesBySection:v8 explicitlyAddedSectionEntries:v5];
  uint64_t v10 = [self->_sectionComparator copy];
  id v11 = (void *)v9[5];
  v9[5] = v10;

  uint64_t v12 = [self->_entryComparator copy];
  v13 = (void *)v9[6];
  v9[6] = v12;

  *((unsigned char *)v9 + 32) = self->_needsSorting;
  return v9;
}

void __32__PSSearchResults_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (id)[a3 mutableCopy];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (void)addEntry:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v12 = (void *)v4;
    if ([(id)v4 isSectionEntry])
    {
      uint64_t v4 = [(NSMutableArray *)self->_sectionEntries containsObject:v12];
      uint64_t v5 = (uint64_t)v12;
      if ((v4 & 1) == 0)
      {
        [(NSMutableArray *)self->_sectionEntries addObject:v12];
        uint64_t v4 = [(NSMutableSet *)self->_explicitlyAddedSectionEntries addObject:v12];
        uint64_t v5 = (uint64_t)v12;
        self->_needsSorting = 1;
      }
    }
    else
    {
      id v6 = [v12 sectionEntry];
      if (v6)
      {
        entriesBySection = self->_entriesBySection;
        id v8 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v6];
        id v9 = [(NSMutableDictionary *)entriesBySection objectForKeyedSubscript:v8];

        if (v9)
        {
          [v9 addObject:v12];
          self->_needsSorting = 1;
        }
        else
        {
          id v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v12];
          uint64_t v10 = self->_entriesBySection;
          id v11 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v6];
          [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v11];
        }
        if (([(NSMutableArray *)self->_sectionEntries containsObject:v6] & 1) == 0)
        {
          [(NSMutableArray *)self->_sectionEntries addObject:v6];
          self->_needsSorting = 1;
        }
      }
      uint64_t v5 = (uint64_t)v12;
    }
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)addEntries:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        [(PSSearchResults *)self addEntry:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)removeEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  if (![v4 isSectionEntry])
  {
    uint64_t v8 = [v5 sectionEntry];
    if (v8)
    {
      entriesBySection = self->_entriesBySection;
      long long v10 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v8];
      long long v11 = [(NSMutableDictionary *)entriesBySection objectForKeyedSubscript:v10];

      if ([v11 count] && (uint64_t v12 = objc_msgSend(v11, "indexOfObject:", v5), v12 != 0x7FFFFFFFFFFFFFFFLL))
      {
        [v11 removeObjectAtIndex:v12];
        if (![v11 count]
          && ([(NSMutableSet *)self->_explicitlyAddedSectionEntries containsObject:v8] & 1) == 0)
        {
          uint64_t v14 = self->_entriesBySection;
          objc_super v15 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v8];
          [(NSMutableDictionary *)v14 removeObjectForKey:v15];

          [(NSMutableArray *)self->_sectionEntries removeObject:v8];
        }
        BOOL v7 = 1;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
    goto LABEL_18;
  }
  uint64_t v6 = [(NSMutableArray *)self->_sectionEntries indexOfObject:v5];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = v6;
    uint64_t v8 = [(PSSearchResults *)self entriesInSectionAtIndex:v6];
    if (![v8 count]) {
      [(NSMutableArray *)self->_sectionEntries removeObjectAtIndex:v13];
    }
    [(NSMutableSet *)self->_explicitlyAddedSectionEntries removeObject:v5];
    BOOL v7 = 1;
LABEL_18:

    goto LABEL_19;
  }
LABEL_4:
  BOOL v7 = 0;
LABEL_19:

  return v7;
}

- (unint64_t)removeEntries:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [(PSSearchResults *)self removeEntry:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)numberOfSectionEntries
{
  return [(NSMutableArray *)self->_sectionEntries count];
}

- (unint64_t)numberOfEntriesInSectionAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_sectionEntries count] <= a3) {
    return 0;
  }
  uint64_t v5 = [(PSSearchResults *)self entriesInSectionAtIndex:a3];
  unint64_t v6 = [v5 count];

  return v6;
}

- (unint64_t)totalNumberOfEntries
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PSSearchResults *)self numberOfSectionEntries];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSMutableDictionary *)self->_entriesBySection allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 += [*(id *)(*((void *)&v10 + 1) + 8 * v8++) count];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)sectionEntryAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_sectionEntries count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_sectionEntries objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (id)entriesInSectionAtIndex:(unint64_t)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(NSMutableArray *)self->_sectionEntries count];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5 > a3)
  {
    uint64_t v7 = [(NSMutableArray *)self->_sectionEntries objectAtIndexedSubscript:a3];
    entriesBySection = self->_entriesBySection;
    long long v9 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v7];
    uint64_t v10 = [(NSMutableDictionary *)entriesBySection objectForKeyedSubscript:v9];
    long long v11 = (void *)v10;
    if (v10) {
      long long v12 = (void *)v10;
    }
    else {
      long long v12 = v6;
    }
    id v13 = v12;

    if (self->_treatSectionEntriesAsRegularEntries)
    {
      v18[0] = v7;
      long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      uint64_t v6 = [v14 arrayByAddingObjectsFromArray:v13];
    }
    else
    {
      if ([v13 count])
      {
        id v15 = v13;
      }
      else
      {
        v17 = v7;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      }
      uint64_t v6 = v15;
    }
  }
  return v6;
}

- (id)entryAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[PSSearchResults entriesInSectionAtIndex:](self, "entriesInSectionAtIndex:", [v4 section]);
  unint64_t v6 = [v4 item];

  if (v6 >= [v5 count])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:v6];
  }

  return v7;
}

- (id)allSectionEntries
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithArray:self->_sectionEntries];
}

- (void)sortResults
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_needsSorting)
  {
    if (self->_sectionComparator) {
      id sectionComparator = self->_sectionComparator;
    }
    else {
      id sectionComparator = &__block_literal_global_21;
    }
    id v4 = (void *)MEMORY[0x1AD0BE2A0](sectionComparator, a2);
    if (self->_entryComparator) {
      id entryComparator = self->_entryComparator;
    }
    else {
      id entryComparator = &__block_literal_global_21;
    }
    unint64_t v6 = (void *)MEMORY[0x1AD0BE2A0](entryComparator);
    [(NSMutableArray *)self->_sectionEntries sortUsingComparator:v4];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [(NSMutableDictionary *)self->_entriesBySection allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) sortUsingComparator:v6];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

uint64_t __30__PSSearchResults_sortResults__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 name];
  unint64_t v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)setSectionComparator:(id)a3
{
  if (self->_sectionComparator != a3)
  {
    id v4 = (void *)[a3 copy];
    id sectionComparator = self->_sectionComparator;
    self->_id sectionComparator = v4;

    self->_needsSorting = 1;
  }
}

- (void)setEntryComparator:(id)a3
{
  if (self->_entryComparator != a3)
  {
    id v4 = (void *)[a3 copy];
    id entryComparator = self->_entryComparator;
    self->_id entryComparator = v4;

    self->_needsSorting = 1;
  }
}

- (void)mergeWithResults:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v5 = *((void *)a3 + 1);
    unint64_t v6 = a3;
    uint64_t v7 = [v4 setWithArray:v5];
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_sectionEntries];
    uint64_t v9 = [v8 setByAddingObjectsFromSet:v7];

    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v11 = [v9 allObjects];
    long long v12 = (NSMutableArray *)[v10 initWithArray:v11];
    sectionEntries = self->_sectionEntries;
    self->_sectionEntries = v12;

    long long v14 = (void *)v6[3];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __36__PSSearchResults_mergeWithResults___block_invoke;
    v17[3] = &unk_1E5C5F3B0;
    v17[4] = self;
    [v14 enumerateKeysAndObjectsUsingBlock:v17];
    explicitlyAddedSectionEntries = self->_explicitlyAddedSectionEntries;
    uint64_t v16 = v6[2];

    [(NSMutableSet *)explicitlyAddedSectionEntries unionSet:v16];
    self->_needsSorting = 1;
  }
}

void __36__PSSearchResults_mergeWithResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:v9];
  uint64_t v8 = v7;
  if (v7) {
    [v7 addObjectsFromArray:v6];
  }
  else {
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v6 forKeyedSubscript:v9];
  }
}

- (id)resultsByMergingWithResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(PSSearchResults *)self copy];
  [v5 mergeWithResults:v4];

  return v5;
}

- (id)description
{
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_entriesBySection, "count"));
  entriesBySection = self->_entriesBySection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__PSSearchResults_description__block_invoke;
  v11[3] = &unk_1E5C5F3F8;
  id v12 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)entriesBySection enumerateKeysAndObjectsUsingBlock:v11];
  id v6 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)PSSearchResults;
  uint64_t v7 = [(PSSearchResults *)&v10 description];
  uint64_t v8 = [v6 stringWithFormat:@"%@ %@", v7, v5];

  return v8;
}

void __30__PSSearchResults_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v7 = [a2 nonretainedObjectValue];
  id v6 = [v7 description];
  [v4 setObject:v5 forKeyedSubscript:v6];
}

- (id)sectionComparator
{
  return self->_sectionComparator;
}

- (id)entryComparator
{
  return self->_entryComparator;
}

- (BOOL)treatSectionEntriesAsRegularEntries
{
  return self->_treatSectionEntriesAsRegularEntries;
}

- (void)setTreatSectionEntriesAsRegularEntries:(BOOL)a3
{
  self->_treatSectionEntriesAsRegularEntries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_entryComparator, 0);
  objc_storeStrong(&self->_sectionComparator, 0);
  objc_storeStrong((id *)&self->_entriesBySection, 0);
  objc_storeStrong((id *)&self->_explicitlyAddedSectionEntries, 0);
  objc_storeStrong((id *)&self->_sectionEntries, 0);
}

@end