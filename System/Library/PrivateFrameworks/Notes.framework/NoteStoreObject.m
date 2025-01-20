@interface NoteStoreObject
- (BOOL)isDeletable;
- (BOOL)isHiddenFromIndexing;
- (BOOL)isMovable;
- (BOOL)searchResultCanBeDeletedFromNoteContext;
- (CSSearchableItemAttributeSet)searchableItemAttributeSet;
- (CSSearchableItemAttributeSet)userActivityContentAttributeSet;
- (NSArray)ancestorStores;
- (NSArray)authorsExcludingCurrentUser;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)dataSourceIdentifier;
- (NSString)searchDomainIdentifier;
- (NSString)searchIndexingIdentifier;
- (NoteStoreObject)parentStore;
- (id)basicAccountIdentifier;
- (id)collectionInfo;
- (id)dataForTypeIdentifier:(id)a3;
- (id)notesForGUIDs:(id)a3;
- (id)notesForIntegerIds:(id)a3;
- (id)notesForServerIds:(id)a3;
- (id)notesForServerIntIds:(id)a3;
- (id)notesForServerIntIds:(id)a3 ascending:(BOOL)a4 limit:(unint64_t)a5;
- (id)notesForServerIntIdsInRange:(_NSRange)a3;
- (id)notesForServerIntIdsInRange:(_NSRange)a3 ascending:(BOOL)a4 limit:(unint64_t)a5;
- (id)predicateForNotes;
- (id)titleForTableViewCell;
- (int64_t)visibilityTestingType;
- (unint64_t)minimumSequenceNumberForServerIntIds:(id)a3;
- (unint64_t)searchResultType;
- (unint64_t)searchResultsSection;
- (unsigned)maximumServerIntId;
@end

@implementation NoteStoreObject

- (NoteStoreObject)parentStore
{
  v3 = [(NoteStoreObject *)self externalIdentifier];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1CB10];
    v5 = [(NoteStoreObject *)self externalIdentifier];
    v6 = [v4 URLWithString:v5];

    v7 = [v6 URLByDeletingLastPathComponent];
    v8 = [v7 absoluteString];
    if ([v8 hasSuffix:@"/"])
    {
      uint64_t v9 = objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);

      v8 = (void *)v9;
    }
    v10 = [(NoteStoreObject *)self account];
    v11 = [v10 storeForExternalId:v8];

    v12 = [v11 account];
    v13 = [v12 defaultStore];

    if (v11 == v13) {
      id v14 = 0;
    }
    else {
      id v14 = v11;
    }
  }
  else
  {
    id v14 = 0;
  }
  return (NoteStoreObject *)v14;
}

- (NSArray)ancestorStores
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(NoteStoreObject *)self parentStore];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      [v3 addObject:v5];
      uint64_t v6 = [v5 parentStore];

      v5 = (void *)v6;
    }
    while (v6);
  }
  v7 = (void *)[v3 copy];

  return (NSArray *)v7;
}

- (id)notesForServerIds:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E4F1C0A8];
  v8 = [(NoteStoreObject *)self managedObjectContext];
  uint64_t v9 = [v7 entityForName:@"Note" inManagedObjectContext:v8];

  [v6 setEntity:v9];
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(store == %@) AND (serverId IN %@)", self, v5];

  [v6 setPredicate:v10];
  v11 = [(NoteStoreObject *)self managedObjectContext];
  v12 = [v11 executeFetchRequest:v6 error:0];

  return v12;
}

- (id)notesForIntegerIds:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E4F1C0A8];
  v8 = [(NoteStoreObject *)self managedObjectContext];
  uint64_t v9 = [v7 entityForName:@"Note" inManagedObjectContext:v8];

  [v6 setEntity:v9];
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(store == %@) AND (integerId IN %@)", self, v5];

  [v6 setPredicate:v10];
  v11 = [(NoteStoreObject *)self managedObjectContext];
  v12 = [v11 executeFetchRequest:v6 error:0];

  return v12;
}

- (id)notesForGUIDs:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E4F1C0A8];
  v8 = [(NoteStoreObject *)self managedObjectContext];
  uint64_t v9 = [v7 entityForName:@"Note" inManagedObjectContext:v8];

  [v6 setEntity:v9];
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(store == %@) AND (guid IN %@)", self, v5];

  [v6 setPredicate:v10];
  v11 = [(NoteStoreObject *)self managedObjectContext];
  v12 = [v11 executeFetchRequest:v6 error:0];

  return v12;
}

- (id)notesForServerIntIds:(id)a3 ascending:(BOOL)a4 limit:(unint64_t)a5
{
  BOOL v6 = a4;
  v8 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v9 = a3;
  id v10 = objc_alloc_init(v8);
  v11 = (void *)MEMORY[0x1E4F1C0A8];
  v12 = [(NoteStoreObject *)self managedObjectContext];
  v13 = [v11 entityForName:@"Note" inManagedObjectContext:v12];

  [v10 setEntity:v13];
  id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(store == %@) AND (externalServerIntId IN %@)", self, v9];

  [v10 setPredicate:v14];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"externalServerIntId" ascending:v6];
  v16 = [MEMORY[0x1E4F1C978] arrayWithObject:v15];
  [v10 setSortDescriptors:v16];

  [v10 setFetchLimit:a5];
  v17 = [(NoteStoreObject *)self managedObjectContext];
  v18 = [v17 executeFetchRequest:v10 error:0];

  return v18;
}

- (id)notesForServerIntIdsInRange:(_NSRange)a3 ascending:(BOOL)a4 limit:(unint64_t)a5
{
  BOOL v6 = a4;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v11 = (void *)MEMORY[0x1E4F1C0A8];
  v12 = [(NoteStoreObject *)self managedObjectContext];
  v13 = [v11 entityForName:@"Note" inManagedObjectContext:v12];

  [v10 setEntity:v13];
  id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(store == %@) AND (externalServerIntId >= %d) AND (externalServerIntId < %d)", self, location, location + length];
  [v10 setPredicate:v14];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"externalServerIntId" ascending:v6];
  v16 = [MEMORY[0x1E4F1C978] arrayWithObject:v15];
  [v10 setSortDescriptors:v16];

  [v10 setFetchLimit:a5];
  v17 = [(NoteStoreObject *)self managedObjectContext];
  v18 = [v17 executeFetchRequest:v10 error:0];

  return v18;
}

- (id)notesForServerIntIds:(id)a3
{
  return [(NoteStoreObject *)self notesForServerIntIds:a3 ascending:1 limit:0];
}

- (id)notesForServerIntIdsInRange:(_NSRange)a3
{
  return -[NoteStoreObject notesForServerIntIdsInRange:ascending:limit:](self, "notesForServerIntIdsInRange:ascending:limit:", a3.location, a3.length, 1, 0);
}

- (unsigned)maximumServerIntId
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  uint64_t v4 = (void *)MEMORY[0x1E4F1C0A8];
  id v5 = [(NoteStoreObject *)self managedObjectContext];
  BOOL v6 = [v4 entityForName:@"Note" inManagedObjectContext:v5];

  [v3 setEntity:v6];
  v7 = [(NoteStoreObject *)self predicateForNotes];
  [v3 setPredicate:v7];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"externalServerIntId" ascending:0];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:v8];
  [v3 setSortDescriptors:v9];

  [v3 setFetchLimit:1];
  id v10 = [(NoteStoreObject *)self managedObjectContext];
  id v18 = 0;
  v11 = [v10 executeFetchRequest:v3 error:&v18];
  id v12 = v18;

  if (v12)
  {
    v13 = [v12 userInfo];
    NSLog(&cfstr_UnresolvedErro.isa, self, v12, v13);

    unsigned int v14 = 0;
  }
  else
  {
    v15 = [v11 lastObject];
    uint64_t v16 = [v15 serverIntId];

    unsigned int v14 = v16 & ~(v16 >> 63);
  }

  return v14;
}

- (unint64_t)minimumSequenceNumberForServerIntIds:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)MEMORY[0x1E4F1C0A8];
  v8 = [(NoteStoreObject *)self managedObjectContext];
  id v9 = [v7 entityForName:@"Note" inManagedObjectContext:v8];

  [v6 setEntity:v9];
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(store == %@) AND (externalServerIntId IN %@)", self, v5];

  [v6 setPredicate:v10];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"externalSequenceNumber" ascending:1];
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObject:v11];
  [v6 setSortDescriptors:v12];

  [v6 setFetchLimit:1];
  v13 = [(NoteStoreObject *)self managedObjectContext];
  id v19 = 0;
  unsigned int v14 = [v13 executeFetchRequest:v6 error:&v19];
  id v15 = v19;

  if (v15)
  {
    uint64_t v16 = [v15 userInfo];
    NSLog(&cfstr_UnresolvedErro_0.isa, self, v15, v16);
    unint64_t v17 = 0;
  }
  else
  {
    uint64_t v16 = [v14 lastObject];
    unint64_t v17 = [v16 sequenceNumber];
  }

  return v17;
}

- (id)predicateForNotes
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"store == %@", self];
}

- (id)collectionInfo
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  [v3 setValue:@"Store" forKey:@"NoteCollectionType"];
  uint64_t v4 = [(NoteStoreObject *)self account];
  id v5 = [v4 accountIdentifier];
  [v3 setValue:v5 forKey:@"NoteCollectionPrimaryIdentifier"];

  id v6 = [(NoteStoreObject *)self externalIdentifier];
  [v3 setValue:v6 forKey:@"NoteCollectionSecondaryIdentifier"];

  return v3;
}

- (id)basicAccountIdentifier
{
  v2 = [(NoteStoreObject *)self account];
  id v3 = [v2 accountIdentifier];

  return v3;
}

- (NSString)searchDomainIdentifier
{
  v2 = [(NoteStoreObject *)self account];
  id v3 = [v2 searchDomainIdentifier];

  return (NSString *)v3;
}

- (id)titleForTableViewCell
{
  id v3 = [(NoteStoreObject *)self account];
  uint64_t v4 = [v3 defaultStore];
  int v5 = [(NoteStoreObject *)self isEqual:v4];

  if (v5) {
    [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Notes" value:@"Notes" table:0 allowSiri:1];
  }
  else {
  id v6 = [(NoteStoreObject *)self name];
  }
  return v6;
}

- (NSDate)creationDate
{
  return 0;
}

- (NSDate)modificationDate
{
  return 0;
}

- (BOOL)isDeletable
{
  return 0;
}

- (BOOL)isMovable
{
  return 0;
}

- (int64_t)visibilityTestingType
{
  return 2;
}

- (NSString)dataSourceIdentifier
{
  return (NSString *)@"Legacy";
}

- (unint64_t)searchResultsSection
{
  return 4;
}

- (unint64_t)searchResultType
{
  return 4;
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 0;
}

- (BOOL)isHiddenFromIndexing
{
  v2 = [(NoteStoreObject *)self account];
  char v3 = [v2 didChooseToMigrate];

  return v3;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSString)searchIndexingIdentifier
{
  v2 = [(NoteStoreObject *)self objectID];
  char v3 = [v2 URIRepresentation];
  uint64_t v4 = [v3 absoluteString];

  return (NSString *)v4;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:@"com.apple.notes.spotlightrecord"];
  return (CSSearchableItemAttributeSet *)v2;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  char v3 = [(NoteStoreObject *)self userActivityContentAttributeSet];
  uint64_t v4 = [(NoteStoreObject *)self name];
  [v3 setDisplayName:v4];

  int v5 = [(NoteStoreObject *)self name];
  [v3 setTextContent:v5];

  objc_msgSend(v3, "setIc_searchResultType:", 3);
  id v6 = [(NoteStoreObject *)self account];
  if ([v6 preventMovingNotesToOtherAccounts]) {
    v7 = &unk_1F2679958;
  }
  else {
    v7 = &unk_1F2679970;
  }
  [v3 setDataOwnerType:v7];

  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  if (objc_opt_respondsToSelector()) {
    [(NoteStoreObject *)self associateAppEntityWithSearchableItemAttributeSet:v3];
  }
  return (CSSearchableItemAttributeSet *)v3;
}

- (id)dataForTypeIdentifier:(id)a3
{
  return 0;
}

@end