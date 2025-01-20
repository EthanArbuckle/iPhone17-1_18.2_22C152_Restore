@interface NoteAccountObject
+ (BOOL)shouldDataAccessCreateAccountForACAccount:(id)a3;
- (BOOL)isAllNotesContainer;
- (BOOL)isDeletable;
- (BOOL)isICloudIMAPAccount;
- (BOOL)isMovable;
- (BOOL)preventMovingNotesToOtherAccounts;
- (BOOL)searchResultCanBeDeletedFromNoteContext;
- (BOOL)shouldMarkNotesAsDeleted;
- (BOOL)validateDefaultStore:(id *)a3 error:(id *)a4;
- (CSSearchableItemAttributeSet)searchableItemAttributeSet;
- (CSSearchableItemAttributeSet)userActivityContentAttributeSet;
- (NSArray)authorsExcludingCurrentUser;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSDictionary)constraints;
- (NSString)dataSourceIdentifier;
- (NSString)searchDomainIdentifier;
- (NSString)searchIndexingIdentifier;
- (id)collectionInfo;
- (id)dataForTypeIdentifier:(id)a3;
- (id)predicateForNotes;
- (id)storeForExternalId:(id)a3;
- (id)titleForTableViewCell;
- (int64_t)accountType;
- (int64_t)visibilityTestingType;
- (unint64_t)searchResultType;
- (unint64_t)searchResultsSection;
- (void)didTurnIntoFault;
- (void)setAccountType:(int64_t)a3;
- (void)setConstraints:(id)a3;
- (void)setPathToConstraintsPlist:(id)a3;
- (void)willSave;
@end

@implementation NoteAccountObject

- (void)didTurnIntoFault
{
  [(NoteAccountObject *)self setConstraints:0];
  v3.receiver = self;
  v3.super_class = (Class)NoteAccountObject;
  [(NoteAccountObject *)&v3 didTurnIntoFault];
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preventMovingNotesToOtherAccounts, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

+ (BOOL)shouldDataAccessCreateAccountForACAccount:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 parentAccount];
  v5 = (void *)v4;
  if (v4) {
    v6 = (void *)v4;
  }
  else {
    v6 = v3;
  }
  id v7 = v6;

  char v8 = [v7 isEnabledForDataclass:*MEMORY[0x1E4F175F0]];
  if (objc_msgSend(v7, "aa_isNotesMigrated"))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F83600]];
    int v9 = [v10 BOOLValue] ^ 1;
  }
  return v8 & v9;
}

- (id)predicateForNotes
{
  v2 = (void *)MEMORY[0x1E4F28F60];
  id v3 = [(NoteAccountObject *)self stores];
  uint64_t v4 = [v2 predicateWithFormat:@"(store IN %@)", v3];

  return v4;
}

- (id)collectionInfo
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  [v3 setValue:@"Account" forKey:@"NoteCollectionType"];
  uint64_t v4 = [(NoteAccountObject *)self accountIdentifier];
  [v3 setValue:v4 forKey:@"NoteCollectionPrimaryIdentifier"];

  return v3;
}

- (void)willSave
{
  v9.receiver = self;
  v9.super_class = (Class)NoteAccountObject;
  [(NoteAccountObject *)&v9 willSave];
  if ([(NoteAccountObject *)self isInserted])
  {
    id v3 = [MEMORY[0x1E4F179C8] defaultStore];
    uint64_t v4 = [(NoteAccountObject *)self accountIdentifier];
    v5 = [v3 accountWithIdentifier:v4];

    if (v5)
    {
      v6 = [v5 displayAccount];
      id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F835F8]];
      uint64_t v8 = [v7 BOOLValue];

      if (v8 != [(NoteAccountObject *)self didChooseToMigrate]) {
        [(NoteAccountObject *)self setDidChooseToMigrate:v8];
      }
    }
  }
}

- (id)storeForExternalId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v6 = (void *)MEMORY[0x1E4F1C0A8];
  id v7 = [(NoteAccountObject *)self managedObjectContext];
  uint64_t v8 = [v6 entityForName:@"Store" inManagedObjectContext:v7];
  [v5 setEntity:v8];

  objc_super v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(account == %@) AND (externalIdentifier == %@)", self, v4];
  [v5 setPredicate:v9];

  v10 = [(NoteAccountObject *)self managedObjectContext];
  id v16 = 0;
  v11 = [v10 executeFetchRequest:v5 error:&v16];
  id v12 = v16;

  if (v12)
  {
    v13 = [v12 userInfo];
    NSLog(&cfstr_ErrorGettingSt.isa, v4, v12, v13);
  }
  v14 = [v11 lastObject];

  return v14;
}

- (void)setAccountType:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(NoteAccountObject *)self setType:v4];
}

- (int64_t)accountType
{
  v2 = [(NoteAccountObject *)self type];
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (BOOL)preventMovingNotesToOtherAccounts
{
  preventMovingNotesToOtherAccounts = self->_preventMovingNotesToOtherAccounts;
  if (!preventMovingNotesToOtherAccounts)
  {
    id v4 = [MEMORY[0x1E4F179C8] defaultStore];
    id v5 = [(NoteAccountObject *)self accountIdentifier];
    v6 = [v4 accountWithIdentifier:v5];

    id v7 = [v6 displayAccount];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"MFRestrictMessageTransfersToOtherAccounts"];
    char v9 = [v8 BOOLValue];

    if (v9)
    {
      uint64_t v10 = 1;
    }
    else
    {
      v11 = [v6 displayAccount];
      id v12 = [v11 objectForKeyedSubscript:@"MCAccountIsManaged"];
      int v13 = [v12 BOOLValue];

      if (v13)
      {
        uint64_t v21 = 0;
        v22 = &v21;
        uint64_t v23 = 0x2050000000;
        v14 = (void *)getMCProfileConnectionClass_softClass;
        uint64_t v24 = getMCProfileConnectionClass_softClass;
        if (!getMCProfileConnectionClass_softClass)
        {
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __getMCProfileConnectionClass_block_invoke;
          v20[3] = &unk_1E686E060;
          v20[4] = &v21;
          __getMCProfileConnectionClass_block_invoke((uint64_t)v20);
          v14 = (void *)v22[3];
        }
        id v15 = v14;
        _Block_object_dispose(&v21, 8);
        id v16 = [v15 sharedConnection];
        uint64_t v10 = [v16 isOpenInRestrictionInEffect];
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    v17 = [NSNumber numberWithBool:v10];
    v18 = self->_preventMovingNotesToOtherAccounts;
    self->_preventMovingNotesToOtherAccounts = v17;

    preventMovingNotesToOtherAccounts = self->_preventMovingNotesToOtherAccounts;
  }
  return [(NSNumber *)preventMovingNotesToOtherAccounts BOOLValue];
}

- (void)setPathToConstraintsPlist:(id)a3
{
  id v4 = a3;
  [(NoteAccountObject *)self setConstraints:0];
  [(NoteAccountObject *)self setConstraintsPath:v4];
}

- (NSDictionary)constraints
{
  if (!self->_constraints)
  {
    int64_t v3 = [(NoteAccountObject *)self constraintsPath];

    if (v3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      id v5 = [(NoteAccountObject *)self constraintsPath];
      v6 = (NSDictionary *)[v4 initWithContentsOfFile:v5];
      constraints = self->_constraints;
      self->_constraints = v6;
    }
    else
    {
      uint64_t v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      id v5 = self->_constraints;
      self->_constraints = v8;
    }
  }
  char v9 = self->_constraints;
  return v9;
}

- (BOOL)shouldMarkNotesAsDeleted
{
  v2 = [(NoteAccountObject *)self constraints];
  int64_t v3 = [v2 objectForKey:0x1F2676300];
  id v4 = [v3 objectForKey:0x1F2676320];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)validateDefaultStore:(id *)a3 error:(id *)a4
{
  if (!*a3) {
    return 1;
  }
  v6 = [(NoteAccountObject *)self stores];
  char v7 = [v6 containsObject:*a3];

  if (a4 && (v7 & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F281F8];
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Tried to use default store not from within account's stores." forKey:@"reason"];
    *a4 = [v8 errorWithDomain:v9 code:1550 userInfo:v10];

    return 0;
  }
  return v7;
}

- (BOOL)isAllNotesContainer
{
  return 1;
}

- (BOOL)isICloudIMAPAccount
{
  int64_t v3 = [MEMORY[0x1E4F179C8] defaultStore];
  id v4 = [(NoteAccountObject *)self accountIdentifier];
  char v5 = [v3 accountWithIdentifier:v4];

  v6 = [v5 parentAccount];
  char v7 = [v6 accountType];
  uint64_t v8 = [v7 identifier];

  LOBYTE(v6) = [v8 isEqualToString:*MEMORY[0x1E4F17750]];
  return (char)v6;
}

- (NSString)searchDomainIdentifier
{
  int64_t v3 = +[AccountUtilities sharedAccountUtilities];
  id v4 = [v3 accountStore];

  char v5 = [(NoteAccountObject *)self accountIdentifier];
  v6 = [v4 accountWithIdentifier:v5];

  char v7 = [v6 parentAccount];
  uint64_t v8 = v7;
  if (!v7) {
    char v7 = v6;
  }
  uint64_t v9 = [v7 identifier];

  return (NSString *)v9;
}

- (id)titleForTableViewCell
{
  int64_t v3 = NSString;
  id v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"All %@" value:@"All %@" table:0 allowSiri:1];
  char v5 = [(NoteAccountObject *)self name];
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

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
  return 3;
}

- (unint64_t)searchResultType
{
  return 3;
}

- (BOOL)searchResultCanBeDeletedFromNoteContext
{
  return 0;
}

- (NSArray)authorsExcludingCurrentUser
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSString)searchIndexingIdentifier
{
  v2 = [(NoteAccountObject *)self objectID];
  int64_t v3 = [v2 URIRepresentation];
  id v4 = [v3 absoluteString];

  return (NSString *)v4;
}

- (CSSearchableItemAttributeSet)userActivityContentAttributeSet
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:@"com.apple.notes.spotlightrecord"];
  return (CSSearchableItemAttributeSet *)v2;
}

- (CSSearchableItemAttributeSet)searchableItemAttributeSet
{
  int64_t v3 = [(NoteAccountObject *)self userActivityContentAttributeSet];
  id v4 = [(NoteAccountObject *)self name];
  [v3 setDisplayName:v4];

  char v5 = [(NoteAccountObject *)self name];
  [v3 setTextContent:v5];

  objc_msgSend(v3, "setIc_searchResultType:", 3);
  if ([(NoteAccountObject *)self preventMovingNotesToOtherAccounts]) {
    v6 = &unk_1F2679928;
  }
  else {
    v6 = &unk_1F2679940;
  }
  [v3 setDataOwnerType:v6];
  objc_msgSend(v3, "ic_populateValuesForSpecializedFields");
  if (objc_opt_respondsToSelector()) {
    [(NoteAccountObject *)self associateAppEntityWithSearchableItemAttributeSet:v3];
  }
  return (CSSearchableItemAttributeSet *)v3;
}

- (id)dataForTypeIdentifier:(id)a3
{
  return 0;
}

@end