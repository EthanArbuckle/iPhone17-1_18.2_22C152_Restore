@interface PXSharedLibraryIncludedPeopleDataSource
- (NSArray)allInfos;
- (NSArray)allPersonUUIDs;
- (NSArray)infosWithBothPeopleAndParticipants;
- (NSArray)infosWithoutPeople;
- (PXSharedLibraryIncludedPeopleDataSource)initWithInfos:(id)a3 infosWithBothPeopleAndParticipants:(id)a4 infosWithoutPeople:(id)a5;
- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3;
- (id)infoAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)infoForParticipant:(id)a3;
- (id)infoForPersonUUID:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation PXSharedLibraryIncludedPeopleDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infosWithoutPeople, 0);
  objc_storeStrong((id *)&self->_infosWithBothPeopleAndParticipants, 0);
  objc_storeStrong((id *)&self->_allInfos, 0);
}

- (NSArray)infosWithoutPeople
{
  return self->_infosWithoutPeople;
}

- (NSArray)infosWithBothPeopleAndParticipants
{
  return self->_infosWithBothPeopleAndParticipants;
}

- (NSArray)allInfos
{
  return self->_allInfos;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a3, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 198, @"Invalid parameter not satisfying: %@", @"objectReference" object file lineNumber description];

    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = *(void *)off_1E5DAAED8;
LABEL_18:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a3, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 199, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(objectReference.indexPath)" object file lineNumber description];

    goto LABEL_10;
  }
  [v7 indexPath];
  uint64_t v9 = *(void *)off_1E5DAAED8;
  if ((void)v27 == *(void *)off_1E5DAAED8
    || (void)v28 == 0x7FFFFFFFFFFFFFFFLL
    || *((void *)&v28 + 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_18;
  }
LABEL_10:
  long long v25 = 0u;
  long long v26 = 0u;
  v24.receiver = self;
  v24.super_class = (Class)PXSharedLibraryIncludedPeopleDataSource;
  [(PXSimpleIndexPath *)&v24 indexPathForObjectReference:v8];
  if ((void)v25 != v9) {
    goto LABEL_16;
  }
  v12 = [v8 itemObject];
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a3, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 203, @"%@ should be an instance inheriting from %@, but it is nil", @"objectReference.itemObject", v21 object file lineNumber description];
LABEL_21:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v22);
    v23 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a3, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 203, @"%@ should be an instance inheriting from %@, but it is %@", @"objectReference.itemObject", v21, v23 object file lineNumber description];

    goto LABEL_21;
  }
LABEL_13:
  v13 = [(PXSharedLibraryIncludedPeopleDataSource *)self allInfos];
  uint64_t v14 = [v13 indexOfObject:v12];

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v25 = (unint64_t)[(PXSharedLibraryIncludedPeopleDataSource *)self identifier];
    *(void *)&long long v26 = v14;
    *((void *)&v26 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_16:
  long long v15 = v26;
  *(_OWORD *)&retstr->dataSourceIdentifier = v25;
  *(_OWORD *)&retstr->item = v15;

  return result;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXSharedLibraryIncludedPeopleDataSource *)self identifier])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 191, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 192, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];
  }
  uint64_t v9 = [(PXSharedLibraryIncludedPeopleDataSource *)self allInfos];
  v10 = [v9 objectAtIndexedSubscript:a3->item];

  return v10;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if (a3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 186, @"Invalid parameter not satisfying: %@", @"section == 0" object file lineNumber description];
  }
  v4 = [(PXSharedLibraryIncludedPeopleDataSource *)self allInfos];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)infoForPersonUUID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 length])
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 168, @"Invalid parameter not satisfying: %@", @"personUUID.length > 0" object file lineNumber description];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(PXSharedLibraryIncludedPeopleDataSource *)self allInfos];
  id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [v10 person];
        v12 = [v11 uuid];
        int v13 = [v12 isEqualToString:v5];

        if (v13)
        {
          id v7 = v10;
          goto LABEL_13;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)infoForParticipant:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 156, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(PXSharedLibraryIncludedPeopleDataSource *)self allInfos];
  id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = [v10 participant];
        int v12 = [v11 isEqual:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_13;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)infoAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  long long v5 = *(_OWORD *)&a3->item;
  v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v13[1] = v5;
  v6 = [(PXSharedLibraryIncludedPeopleDataSource *)self objectAtIndexPath:v13];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    int v12 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 152, @"%@ should be an instance inheriting from %@, but it is %@", @"[self objectAtIndexPath:indexPath]", v10, v12 object file lineNumber description];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 152, @"%@ should be an instance inheriting from %@, but it is nil", @"[self objectAtIndexPath:indexPath]", v10 object file lineNumber description];
  }

LABEL_3:
  return v6;
}

- (NSArray)allPersonUUIDs
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(PXSharedLibraryIncludedPeopleDataSource *)self allInfos];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) person];
        v10 = [v9 uuid];

        if ([v10 length]) {
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = (void *)[v3 copy];
  return (NSArray *)v11;
}

- (PXSharedLibraryIncludedPeopleDataSource)initWithInfos:(id)a3 infosWithBothPeopleAndParticipants:(id)a4 infosWithoutPeople:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXSharedLibraryIncludedPeopleDataSource;
  v11 = [(PXSharedLibraryIncludedPeopleDataSource *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    allInfos = v11->_allInfos;
    v11->_allInfos = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    infosWithBothPeopleAndParticipants = v11->_infosWithBothPeopleAndParticipants;
    v11->_infosWithBothPeopleAndParticipants = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    infosWithoutPeople = v11->_infosWithoutPeople;
    v11->_infosWithoutPeople = (NSArray *)v16;
  }
  return v11;
}

@end