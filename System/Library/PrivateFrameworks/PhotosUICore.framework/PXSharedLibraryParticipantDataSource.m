@interface PXSharedLibraryParticipantDataSource
- (BOOL)canAddParticipants;
- (NSArray)names;
- (NSArray)participantImageCombinerItems;
- (NSArray)participants;
- (NSSet)emailAddresses;
- (NSSet)participantAddresses;
- (NSSet)phoneNumbers;
- (id)_initWithParticipants:(id)a3;
- (id)itemAtIndex:(int64_t)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfParticipants;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
- (void)setParticipants:(id)a3;
@end

@implementation PXSharedLibraryParticipantDataSource

- (void).cxx_destruct
{
}

- (void)setParticipants:(id)a3
{
}

- (NSArray)participants
{
  return self->_participants;
}

- (NSSet)participantAddresses
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [(PXSharedLibraryParticipantDataSource *)self participants];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PXSharedLibraryParticipantDataSource_participantAddresses__block_invoke;
  v7[3] = &unk_1E5DC5E10;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSSet *)v5;
}

void __60__PXSharedLibraryParticipantDataSource_participantAddresses__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 appleIDAddress];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    v6 = [v7 appleIDAddress];
    [v5 addObject:v6];
  }
}

- (NSSet)phoneNumbers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(PXSharedLibraryParticipantDataSource *)self participants];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PXSharedLibraryParticipantDataSource_phoneNumbers__block_invoke;
  v7[3] = &unk_1E5DC5E10;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSSet *)v5;
}

void __52__PXSharedLibraryParticipantDataSource_phoneNumbers__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = [v6 addressKind] == 2;
  uint64_t v4 = v6;
  if (v3)
  {
    id v5 = [v6 appleIDAddress];
    if ([v5 length]) {
      [*(id *)(a1 + 32) addObject:v5];
    }

    uint64_t v4 = v6;
  }
}

- (NSSet)emailAddresses
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(PXSharedLibraryParticipantDataSource *)self participants];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PXSharedLibraryParticipantDataSource_emailAddresses__block_invoke;
  v7[3] = &unk_1E5DC5E10;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSSet *)v5;
}

void __54__PXSharedLibraryParticipantDataSource_emailAddresses__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = [v6 addressKind] == 1;
  uint64_t v4 = v6;
  if (v3)
  {
    id v5 = [v6 appleIDAddress];
    if ([v5 length]) {
      [*(id *)(a1 + 32) addObject:v5];
    }

    uint64_t v4 = v6;
  }
}

- (NSArray)names
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PXSharedLibraryParticipantDataSource *)self participants];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PXSharedLibraryParticipantDataSource_names__block_invoke;
  v7[3] = &unk_1E5DC5E10;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

void __45__PXSharedLibraryParticipantDataSource_names__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 name];
  if ([v4 length])
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    id v5 = [v3 appleIDAddress];
    if ([v5 length])
    {
      [*(id *)(a1 + 32) addObject:v5];
    }
    else
    {
      id v6 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Didn't find display name for participant %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (NSArray)participantImageCombinerItems
{
  v2 = [(PXSharedLibraryParticipantDataSource *)self participants];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (BOOL)canAddParticipants
{
  return (unint64_t)[(PXSharedLibraryParticipantDataSource *)self numberOfParticipants] < 5;
}

- (int64_t)numberOfParticipants
{
  v2 = [(PXSharedLibraryParticipantDataSource *)self participants];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)itemAtIndex:(int64_t)a3
{
  uint64_t v4 = [(PXSharedLibraryParticipantDataSource *)self participants];
  id v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXSharedLibraryParticipantDataSource *)self identifier])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantDataSource.m", 64, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantDataSource.m", 65, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsSection(indexPath)" object file lineNumber description];
  }
  return [(PXSharedLibraryParticipantDataSource *)self participants];
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXSharedLibraryParticipantDataSource *)self identifier])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantDataSource.m", 57, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->section)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantDataSource.m", 58, @"Invalid parameter not satisfying: %@", @"indexPath.section == 0" object file lineNumber description];
  }
  if (a3->subitem)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantDataSource.m", 59, @"Invalid parameter not satisfying: %@", @"indexPath.subitem == 0" object file lineNumber description];
  }
  int v7 = [(PXSharedLibraryParticipantDataSource *)self participants];
  id v8 = [v7 objectAtIndex:a3->item];

  return v8;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  if (a4)
  {
    int v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v7 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantDataSource.m", 51, @"Invalid parameter not satisfying: %@", @"section == 0" object file lineNumber description];
  }
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if (a3)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantDataSource.m", 46, @"Invalid parameter not satisfying: %@", @"section == 0" object file lineNumber description];
  }
  uint64_t v4 = [(PXSharedLibraryParticipantDataSource *)self participants];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)_initWithParticipants:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSharedLibraryParticipantDataSource;
  int64_t v5 = [(PXSharedLibraryParticipantDataSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    participants = v5->_participants;
    v5->_participants = (NSArray *)v6;
  }
  return v5;
}

@end