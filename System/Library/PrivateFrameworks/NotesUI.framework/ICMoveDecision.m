@interface ICMoveDecision
+ (BOOL)isValidHTMLDestinationObject:(id)a3;
+ (BOOL)isValidHTMLSourceObject:(id)a3;
+ (BOOL)isValidModernDestinationObject:(id)a3;
+ (BOOL)isValidModernSourceObject:(id)a3;
+ (BOOL)isValidVirtualDestinationObject:(id)a3;
+ (BOOL)shouldCopyThenDeleteWhenMovingObject:(id)a3 toNoteContainer:(id)a4;
+ (id)objectsForMakingDecisionForNonSharedFolder:(id)a3;
- (BOOL)allowsManagedToUnmanagedMove;
- (BOOL)allowsUnmanagedToManagedMove;
- (BOOL)hasLockedNotesNotFromDestinationAccountInSource;
- (BOOL)hasLockedObjects;
- (BOOL)hasSanitizedAndScreenedModernSourceObjects;
- (BOOL)hasSharedObjectsNotFromDestinationAccountInSource;
- (BOOL)shouldContinueDecisionMaking;
- (BOOL)shouldMove;
- (BOOL)shouldProceed;
- (ICAccount)modernDestinationAccount;
- (ICCloudSyncingObject)modernDestination;
- (ICFolder)modernDestinationFolder;
- (ICMoveDecision)initWithSourceObjects:(id)a3 destination:(id)a4;
- (ICMoveDecision)initWithSourceObjects:(id)a3 destination:(id)a4 allowsManagedToUnmanagedMove:(BOOL)a5 allowsUnmanagedToManagedMove:(BOOL)a6;
- (ICVirtualSmartFolderItemIdentifier)virtualDestinationFolder;
- (NSArray)guiltyObjects;
- (NSArray)htmlSourceObjects;
- (NSArray)modernFoldersInSource;
- (NSArray)modernNotes;
- (NSArray)modernSourceObjects;
- (NSMutableArray)callNotesInSource;
- (NSMutableArray)joinedSharedRootObjectsInSource;
- (NSMutableArray)lockedObjectsInSource;
- (NSMutableArray)mathNotesNotesInSource;
- (NSMutableArray)nonCallNotesInSource;
- (NSMutableArray)nonMathNotesNotesInSource;
- (NSMutableArray)nonSystemPaperNotesInSource;
- (NSMutableArray)ownedSharedRootObjectsInSource;
- (NSMutableArray)privateModernNoteWithAttachmentsInSource;
- (NSMutableArray)readOnlySharedSubObjectsInSource;
- (NSMutableArray)readWriteSharedSubObjectsInSource;
- (NSMutableArray)sanitizedFilteredModernSourceObjects;
- (NSMutableArray)sharedObjectsInSource;
- (NSMutableArray)sharedObjectsNotFromDestinationFolderInSource;
- (NSMutableArray)systemPaperNotesInSource;
- (NSMutableArray)unsupportedObjectsInSource;
- (NSMutableSet)accountsOfHTMLSourceObjects;
- (NSMutableSet)accountsOfModernSourceObjects;
- (NSMutableSet)filteredModernSourceObjects;
- (NoteStoreObject)htmlDestinationFolder;
- (id)accountForObject:(id)a3;
- (id)description;
- (id)htmlAccountForObject:(id)a3;
- (id)typeString;
- (unint64_t)additionalStep;
- (unint64_t)type;
- (void)_makeDecisionForMovingBetweenManagedAndUnmanagedAccounts;
- (void)_makeDecisionForMovingHTMLObjectsToHTMLDestination;
- (void)_makeDecisionForMovingHTMLObjectsToModernDestination;
- (void)_makeDecisionForMovingHTMLObjectsToVirtualDestination;
- (void)_makeDecisionForMovingModernObjectsToHTMLDestination;
- (void)_makeDecisionForMovingModernObjectsToModernDestination;
- (void)_makeDecisionForMovingModernObjectsToVirtualDestination;
- (void)_sanitizeAndScreenFilteredModernSourceObjectsIfNecessary;
- (void)_setDecisionWithType:(unint64_t)a3 additionalStep:(unint64_t)a4 guiltyObjects:(id)a5;
- (void)_setDecisionWithType:(unint64_t)a3 guiltyObjects:(id)a4;
- (void)setAccountsOfHTMLSourceObjects:(id)a3;
- (void)setAccountsOfModernSourceObjects:(id)a3;
- (void)setAllowsManagedToUnmanagedMove:(BOOL)a3;
- (void)setAllowsUnmanagedToManagedMove:(BOOL)a3;
- (void)setCallNotesInSource:(id)a3;
- (void)setFilteredModernSourceObjects:(id)a3;
- (void)setHasLockedNotesNotFromDestinationAccountInSource:(BOOL)a3;
- (void)setHasSanitizedAndScreenedModernSourceObjects:(BOOL)a3;
- (void)setHasSharedObjectsNotFromDestinationAccountInSource:(BOOL)a3;
- (void)setJoinedSharedRootObjectsInSource:(id)a3;
- (void)setLockedObjectsInSource:(id)a3;
- (void)setMathNotesNotesInSource:(id)a3;
- (void)setModernFoldersInSource:(id)a3;
- (void)setModernNotes:(id)a3;
- (void)setNonCallNotesInSource:(id)a3;
- (void)setNonMathNotesNotesInSource:(id)a3;
- (void)setNonSystemPaperNotesInSource:(id)a3;
- (void)setOwnedSharedRootObjectsInSource:(id)a3;
- (void)setPrivateModernNoteWithAttachmentsInSource:(id)a3;
- (void)setReadOnlySharedSubObjectsInSource:(id)a3;
- (void)setReadWriteSharedSubObjectsInSource:(id)a3;
- (void)setSanitizedFilteredModernSourceObjects:(id)a3;
- (void)setSharedObjectsInSource:(id)a3;
- (void)setSharedObjectsNotFromDestinationFolderInSource:(id)a3;
- (void)setSystemPaperNotesInSource:(id)a3;
- (void)setUnsupportedObjectsInSource:(id)a3;
@end

@implementation ICMoveDecision

- (ICMoveDecision)initWithSourceObjects:(id)a3 destination:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F74230];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 sharedConnection];
  uint64_t v10 = [v9 mayOpenFromManagedToUnmanaged];

  v11 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v12 = [v11 mayOpenFromUnmanagedToManaged];

  v13 = [(ICMoveDecision *)self initWithSourceObjects:v8 destination:v7 allowsManagedToUnmanagedMove:v10 allowsUnmanagedToManagedMove:v12];
  return v13;
}

- (ICMoveDecision)initWithSourceObjects:(id)a3 destination:(id)a4 allowsManagedToUnmanagedMove:(BOOL)a5 allowsUnmanagedToManagedMove:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v49.receiver = self;
  v49.super_class = (Class)ICMoveDecision;
  uint64_t v12 = [(ICMoveDecision *)&v49 init];
  v13 = v12;
  if (v12)
  {
    v12->_allowsManagedToUnmanagedMove = a5;
    v12->_allowsUnmanagedToManagedMove = a6;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __110__ICMoveDecision_initWithSourceObjects_destination_allowsManagedToUnmanagedMove_allowsUnmanagedToManagedMove___block_invoke;
    v45[3] = &unk_1E5FDE258;
    v16 = v13;
    v46 = v16;
    id v17 = v14;
    id v47 = v17;
    id v18 = v15;
    id v48 = v18;
    [v10 enumerateObjectsUsingBlock:v45];
    if ([v17 count])
    {
      uint64_t v19 = [v17 copy];
      modernSourceObjects = v16->_modernSourceObjects;
      v16->_modernSourceObjects = (NSArray *)v19;
    }
    if ([v18 count])
    {
      uint64_t v21 = [v18 copy];
      htmlSourceObjects = v16->_htmlSourceObjects;
      v16->_htmlSourceObjects = (NSArray *)v21;

      uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSArray count](v16->_htmlSourceObjects, "count"));
      accountsOfHTMLSourceObjects = v16->_accountsOfHTMLSourceObjects;
      v16->_accountsOfHTMLSourceObjects = (NSMutableSet *)v23;

      v25 = v16->_htmlSourceObjects;
      uint64_t v40 = MEMORY[0x1E4F143A8];
      uint64_t v41 = 3221225472;
      v42 = __110__ICMoveDecision_initWithSourceObjects_destination_allowsManagedToUnmanagedMove_allowsUnmanagedToManagedMove___block_invoke_2;
      v43 = &unk_1E5FDE280;
      v44 = v16;
      [(NSArray *)v25 enumerateObjectsUsingBlock:&v40];
    }
    if ([(id)objc_opt_class() isValidModernDestinationObject:v11])
    {
      uint64_t v26 = 32;
    }
    else if ([(id)objc_opt_class() isValidHTMLDestinationObject:v11])
    {
      uint64_t v26 = 40;
    }
    else
    {
      if (![(id)objc_opt_class() isValidVirtualDestinationObject:v11]) {
        goto LABEL_13;
      }
      uint64_t v26 = 48;
    }
    objc_storeStrong((id *)((char *)&v16->super.isa + v26), a4);
LABEL_13:
    [(ICMoveDecision *)v16 _makeDecisionForMovingBetweenManagedAndUnmanagedAccounts];
    if ([(ICMoveDecision *)v16 type] > 1)
    {
LABEL_31:
      v37 = [(ICMoveDecision *)v16 modernSourceObjects];
      v38 = objc_msgSend(v37, "ic_objectsOfClass:", objc_opt_class());
      [(ICMoveDecision *)v16 setModernNotes:v38];

      goto LABEL_32;
    }
    v27 = [(ICMoveDecision *)v16 modernDestination];

    if (v27)
    {
      v28 = [(ICMoveDecision *)v16 modernSourceObjects];

      BOOL v29 = v28 != 0;
      if (v28) {
        [(ICMoveDecision *)v16 _makeDecisionForMovingModernObjectsToModernDestination];
      }
      v30 = [(ICMoveDecision *)v16 htmlSourceObjects];

      if (v30)
      {
        [(ICMoveDecision *)v16 _makeDecisionForMovingHTMLObjectsToModernDestination];
        goto LABEL_31;
      }
    }
    else
    {
      v31 = [(ICMoveDecision *)v16 htmlDestinationFolder];

      if (v31)
      {
        v32 = [(ICMoveDecision *)v16 modernSourceObjects];

        BOOL v29 = v32 != 0;
        if (v32) {
          [(ICMoveDecision *)v16 _makeDecisionForMovingModernObjectsToHTMLDestination];
        }
        v33 = [(ICMoveDecision *)v16 htmlSourceObjects];

        if (v33)
        {
          [(ICMoveDecision *)v16 _makeDecisionForMovingHTMLObjectsToHTMLDestination];
          goto LABEL_31;
        }
      }
      else
      {
        v34 = [(ICMoveDecision *)v16 virtualDestinationFolder];

        if (!v34) {
          goto LABEL_30;
        }
        v35 = [(ICMoveDecision *)v16 modernSourceObjects];

        BOOL v29 = v35 != 0;
        if (v35) {
          [(ICMoveDecision *)v16 _makeDecisionForMovingModernObjectsToVirtualDestination];
        }
        v36 = [(ICMoveDecision *)v16 htmlSourceObjects];

        if (v36)
        {
          [(ICMoveDecision *)v16 _makeDecisionForMovingHTMLObjectsToVirtualDestination];
          goto LABEL_31;
        }
      }
    }
    if (v29) {
      goto LABEL_31;
    }
LABEL_30:
    [(ICMoveDecision *)v16 _setDecisionWithType:2 guiltyObjects:0];
    goto LABEL_31;
  }
LABEL_32:

  return v13;
}

void __110__ICMoveDecision_initWithSourceObjects_destination_allowsManagedToUnmanagedMove_allowsUnmanagedToManagedMove___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([(id)objc_opt_class() isValidModernSourceObject:v5])
  {
    id v3 = v5;
    v4 = (id *)(a1 + 40);
  }
  else
  {
    if (![(id)objc_opt_class() isValidHTMLSourceObject:v5]) {
      goto LABEL_6;
    }
    id v3 = v5;
    v4 = (id *)(a1 + 48);
  }
  [*v4 addObject:v3];
LABEL_6:
}

void __110__ICMoveDecision_initWithSourceObjects_destination_allowsManagedToUnmanagedMove_allowsUnmanagedToManagedMove___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) htmlAccountForObject:a2];
  id v3 = [*(id *)(a1 + 32) accountsOfHTMLSourceObjects];
  objc_msgSend(v3, "ic_addNonNilObject:", v4);
}

- (void)_setDecisionWithType:(unint64_t)a3 additionalStep:(unint64_t)a4 guiltyObjects:(id)a5
{
  id v9 = a5;
  if (self->_type < a3)
  {
    self->_type = a3;
    self->_additionalStep = a4;
    id v10 = v9;
    objc_storeStrong((id *)&self->_guiltyObjects, a5);
    id v9 = v10;
  }
}

- (void)_setDecisionWithType:(unint64_t)a3 guiltyObjects:(id)a4
{
}

- (BOOL)shouldMove
{
  return ([(ICMoveDecision *)self type] & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (BOOL)shouldProceed
{
  return [(ICMoveDecision *)self type] != 2;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ICMoveDecision;
  id v4 = [(ICMoveDecision *)&v9 description];
  id v5 = [(ICMoveDecision *)self typeString];
  v6 = [(ICMoveDecision *)self guiltyObjects];
  id v7 = [v3 stringWithFormat:@"%@: type = %@, guiltyObjects = %@", v4, v5, v6];

  return v7;
}

- (id)typeString
{
  unint64_t v2 = [(ICMoveDecision *)self type];
  if (v2 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E5FDE3C0[v2];
  }
}

- (void)_makeDecisionForMovingBetweenManagedAndUnmanagedAccounts
{
  v30[1] = *MEMORY[0x1E4F143B8];
  [(ICMoveDecision *)self _sanitizeAndScreenFilteredModernSourceObjectsIfNecessary];
  id v3 = [(ICMoveDecision *)self accountsOfModernSourceObjects];
  id v4 = [v3 allObjects];

  id v5 = objc_msgSend(v4, "ic_objectsPassingTest:", &__block_literal_global_89);
  uint64_t v26 = v4;
  v6 = objc_msgSend(v4, "ic_objectsPassingTest:", &__block_literal_global_34);
  id v7 = [(ICMoveDecision *)self accountsOfHTMLSourceObjects];
  id v8 = [v7 allObjects];

  objc_super v9 = objc_msgSend(v8, "ic_objectsPassingTest:", &__block_literal_global_37_0);
  id v10 = objc_msgSend(v8, "ic_objectsPassingTest:", &__block_literal_global_39_1);
  uint64_t v11 = objc_msgSend(v8, "ic_objectsPassingTest:", &__block_literal_global_41_4);
  BOOL v29 = [v5 arrayByAddingObjectsFromArray:v9];
  v25 = v5;
  if ([v5 count]) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = [v9 count] == 0;
  }
  v13 = v9;
  v28 = [v6 arrayByAddingObjectsFromArray:v10];
  v27 = (void *)v11;
  if ([v6 count]) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = [v10 count] == 0;
  }
  id v15 = [(ICMoveDecision *)self htmlDestinationFolder];
  v16 = [v15 account];

  id v17 = [(ICMoveDecision *)self modernDestinationAccount];
  if ([v17 isManaged]) {
    int v18 = 1;
  }
  else {
    int v18 = [v16 isManaged];
  }

  if (![(ICMoveDecision *)self allowsManagedToUnmanagedMove] && !v12 && (v18 & 1) == 0)
  {
    [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:v29];
    uint64_t v19 = v26;
LABEL_16:
    v20 = v25;
    uint64_t v21 = v27;
    goto LABEL_17;
  }
  uint64_t v19 = v26;
  if (![(ICMoveDecision *)self allowsUnmanagedToManagedMove]
    && !v14
    && ((v18 ^ 1) & 1) == 0)
  {
    [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:v28];
    goto LABEL_16;
  }
  uint64_t v21 = v27;
  v20 = v25;
  if ([v27 count])
  {
    v22 = [(ICMoveDecision *)self modernDestinationAccount];
    if (v22)
    {
    }
    else
    {
      v30[0] = v16;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
      char v24 = [v27 isEqual:v23];

      uint64_t v21 = v27;
      if (v24) {
        goto LABEL_17;
      }
    }
    [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:v21];
  }
LABEL_17:
}

uint64_t __74__ICMoveDecision__makeDecisionForMovingBetweenManagedAndUnmanagedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isManaged];
}

uint64_t __74__ICMoveDecision__makeDecisionForMovingBetweenManagedAndUnmanagedAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isManaged] ^ 1;
}

uint64_t __74__ICMoveDecision__makeDecisionForMovingBetweenManagedAndUnmanagedAccounts__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isManaged];
}

uint64_t __74__ICMoveDecision__makeDecisionForMovingBetweenManagedAndUnmanagedAccounts__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 isManaged] ^ 1;
}

uint64_t __74__ICMoveDecision__makeDecisionForMovingBetweenManagedAndUnmanagedAccounts__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 preventMovingNotesToOtherAccounts];
}

- (void)_makeDecisionForMovingModernObjectsToModernDestination
{
  v80[1] = *MEMORY[0x1E4F143B8];
  if (![(ICMoveDecision *)self shouldContinueDecisionMaking]) {
    return;
  }
  id v3 = [(ICMoveDecision *)self modernDestinationFolder];
  int v4 = [v3 isUnsupported];

  if (v4) {
    goto LABEL_5;
  }
  id v5 = [(ICMoveDecision *)self modernDestinationFolder];
  int v6 = [v5 isSharedReadOnly];

  if (v6
    || ([(ICMoveDecision *)self modernDestinationFolder],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isSmartFolder],
        v7,
        v8))
  {
LABEL_5:
    [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:0];
  }
  else
  {
    uint64_t v23 = [(ICMoveDecision *)self modernSourceObjects];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke;
    v79[3] = &unk_1E5FDE2E8;
    v79[4] = self;
    [v23 enumerateObjectsUsingBlock:v79];
  }
  if (![(ICMoveDecision *)self type])
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v10 = [(ICMoveDecision *)self modernSourceObjects];
    uint64_t v11 = (void *)[v9 initWithArray:v10];

    BOOL v12 = [(ICMoveDecision *)self modernSourceObjects];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke_2;
    v77[3] = &unk_1E5FDE310;
    v77[4] = self;
    id v13 = v11;
    id v78 = v13;
    [v12 enumerateObjectsUsingBlock:v77];

    BOOL v14 = [(ICMoveDecision *)self filteredModernSourceObjects];
    char v15 = [v14 isEqual:v13];

    if ((v15 & 1) == 0)
    {
      [(ICMoveDecision *)self setFilteredModernSourceObjects:v13];
      [(ICMoveDecision *)self setHasSanitizedAndScreenedModernSourceObjects:0];
    }
    v16 = [(ICMoveDecision *)self filteredModernSourceObjects];
    uint64_t v17 = [v16 count];

    if (!v17) {
      [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:0];
    }
  }
  if ([(ICMoveDecision *)self type]) {
    return;
  }
  [(ICMoveDecision *)self _sanitizeAndScreenFilteredModernSourceObjectsIfNecessary];
  int v18 = [(ICMoveDecision *)self unsupportedObjectsInSource];
  if (![v18 count]) {
    goto LABEL_16;
  }
  uint64_t v19 = [(ICMoveDecision *)self modernDestinationFolder];
  if ([v19 isDefaultFolderForAccount])
  {

LABEL_16:
    goto LABEL_17;
  }
  v30 = [(ICMoveDecision *)self modernDestinationFolder];
  char v31 = [v30 isTrashFolder];

  if ((v31 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_17:
  v20 = [(ICMoveDecision *)self unsupportedObjectsInSource];
  if ([v20 count])
  {
    uint64_t v21 = [(ICMoveDecision *)self sharedObjectsInSource];
    uint64_t v22 = [v21 count];

    if (v22) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  char v24 = [(ICMoveDecision *)self unsupportedObjectsInSource];
  if (![v24 count])
  {

    goto LABEL_31;
  }
  v25 = [(ICMoveDecision *)self accountsOfModernSourceObjects];
  uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
  v27 = [(ICMoveDecision *)self modernDestinationAccount];
  v28 = [v26 setWithObject:v27];
  char v29 = [v25 isEqual:v28];

  if ((v29 & 1) == 0)
  {
LABEL_26:
    uint64_t v32 = [(ICMoveDecision *)self unsupportedObjectsInSource];
LABEL_27:
    v33 = (void *)v32;
    [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:v32];
LABEL_28:

    return;
  }
LABEL_31:
  v34 = [(ICMoveDecision *)self modernFoldersInSource];
  if ([v34 count]
    && ([(ICMoveDecision *)self modernDestinationFolder],
        (uint64_t v35 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v36 = (void *)v35;
    v37 = [(ICMoveDecision *)self modernDestinationFolder];
    uint64_t v38 = [v37 depth];
    v39 = (void *)MEMORY[0x1E4F83380];
    uint64_t v40 = [(ICMoveDecision *)self modernFoldersInSource];
    unint64_t v41 = [v39 maximumDistanceToLeafFolderOfFolders:v40] + v38;
    unint64_t v42 = [MEMORY[0x1E4F83380] folderDepthLimit];

    if (v41 >= v42)
    {
      v33 = [(ICMoveDecision *)self modernDestinationFolder];
      v80[0] = v33;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
      [(ICMoveDecision *)self _setDecisionWithType:3 additionalStep:1 guiltyObjects:v43];
LABEL_35:

      goto LABEL_28;
    }
  }
  else
  {
  }
  v44 = [(ICMoveDecision *)self modernFoldersInSource];
  if ([v44 count])
  {
    v45 = [(ICMoveDecision *)self modernDestinationFolder];
    int v46 = [v45 isSystemFolder];

    if (v46)
    {
      uint64_t v32 = [(ICMoveDecision *)self modernFoldersInSource];
      goto LABEL_27;
    }
  }
  else
  {
  }
  id v47 = [(ICMoveDecision *)self readOnlySharedSubObjectsInSource];
  uint64_t v48 = [v47 count];

  if (v48)
  {
    uint64_t v32 = [(ICMoveDecision *)self readOnlySharedSubObjectsInSource];
    goto LABEL_27;
  }
  if ([(ICMoveDecision *)self hasSharedObjectsNotFromDestinationAccountInSource])
  {
    v33 = [(ICMoveDecision *)self sharedObjectsInSource];
    objc_super v49 = self;
    uint64_t v50 = 3;
    uint64_t v51 = 4;
LABEL_67:
    [(ICMoveDecision *)v49 _setDecisionWithType:v50 additionalStep:v51 guiltyObjects:v33];
    goto LABEL_28;
  }
  v52 = [(ICMoveDecision *)self modernDestinationFolder];
  if ([v52 isSharedViaICloud])
  {
  }
  else
  {
    v53 = [(ICMoveDecision *)self readWriteSharedSubObjectsInSource];
    uint64_t v54 = [v53 count];

    if (v54)
    {
      uint64_t v55 = [(ICMoveDecision *)self readWriteSharedSubObjectsInSource];
LABEL_49:
      v33 = (void *)v55;
      objc_super v49 = self;
      uint64_t v50 = 1;
      uint64_t v51 = 6;
      goto LABEL_67;
    }
  }
  v56 = [(ICMoveDecision *)self modernDestinationFolder];
  int v57 = [v56 isSharedViaICloud];

  v58 = [(ICMoveDecision *)self lockedObjectsInSource];
  uint64_t v59 = [v58 count];
  if (v57)
  {
    if (v59)
    {

LABEL_57:
      v63 = [(ICMoveDecision *)self lockedObjectsInSource];
      v64 = [(ICMoveDecision *)self joinedSharedRootObjectsInSource];
      v33 = [v63 arrayByAddingObjectsFromArray:v64];

      objc_super v49 = self;
      uint64_t v50 = 3;
      uint64_t v51 = 3;
      goto LABEL_67;
    }
    v61 = [(ICMoveDecision *)self joinedSharedRootObjectsInSource];
    uint64_t v62 = [v61 count];

    if (v62) {
      goto LABEL_57;
    }
    v69 = [(ICMoveDecision *)self sharedObjectsNotFromDestinationFolderInSource];
    uint64_t v70 = [v69 count];

    if (v70)
    {
      uint64_t v55 = [(ICMoveDecision *)self sharedObjectsNotFromDestinationFolderInSource];
      goto LABEL_49;
    }
  }
  else
  {
    if (v59)
    {
      BOOL v60 = [(ICMoveDecision *)self hasLockedNotesNotFromDestinationAccountInSource];

      if (v60)
      {
        v33 = [(ICMoveDecision *)self lockedObjectsInSource];
        objc_super v49 = self;
        uint64_t v50 = 3;
        uint64_t v51 = 2;
        goto LABEL_67;
      }
    }
    else
    {
    }
    v65 = [(ICMoveDecision *)self systemPaperNotesInSource];
    uint64_t v66 = [v65 count];

    if (v66)
    {
      v33 = [(ICMoveDecision *)self systemPaperNotesInSource];
      objc_super v49 = self;
      uint64_t v50 = 1;
      uint64_t v51 = 8;
      goto LABEL_67;
    }
    v67 = [(ICMoveDecision *)self mathNotesNotesInSource];
    uint64_t v68 = [v67 count];

    if (v68)
    {
      v33 = [(ICMoveDecision *)self mathNotesNotesInSource];
      objc_super v49 = self;
      uint64_t v50 = 1;
      uint64_t v51 = 10;
      goto LABEL_67;
    }
    v71 = [(ICMoveDecision *)self callNotesInSource];
    uint64_t v72 = [v71 count];

    if (v72)
    {
      v33 = [(ICMoveDecision *)self callNotesInSource];
      objc_super v49 = self;
      uint64_t v50 = 1;
      uint64_t v51 = 12;
      goto LABEL_67;
    }
    v73 = [(ICMoveDecision *)self modernDestinationAccount];
    int v74 = [v73 isLocalAccount];

    if (v74)
    {
      v75 = [(ICMoveDecision *)self filteredModernSourceObjects];
      v33 = objc_msgSend(v75, "ic_objectsPassingTest:", &__block_literal_global_48);

      v43 = objc_msgSend(v33, "ic_objectsPassingTest:", &__block_literal_global_51);
      if ([v43 count])
      {
        v76 = [v43 allObjects];
        [(ICMoveDecision *)self _setDecisionWithType:3 additionalStep:13 guiltyObjects:v76];
      }
      goto LABEL_35;
    }
  }
}

void __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  objc_opt_class();
  id v7 = ICDynamicCast();
  if (v7)
  {
    int v8 = [*(id *)(a1 + 32) modernDestinationFolder];
    if ([v8 isDescendantOfFolder:v7])
    {
    }
    else
    {
      uint64_t v11 = [*(id *)(a1 + 32) modernDestination];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_9;
      }
      int v12 = [v7 isSmartFolder];

      if (!v12) {
        goto LABEL_9;
      }
    }
    id v9 = *(void **)(a1 + 32);
    v13[0] = v6;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v9 _setDecisionWithType:2 guiltyObjects:v10];

    *a4 = 1;
  }
LABEL_9:
}

void __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke_2(uint64_t a1, void *a2)
{
  id v18 = a2;
  id v3 = [v18 identifier];
  int v4 = [*(id *)(a1 + 32) modernDestination];
  id v5 = [v4 identifier];
  int v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    [*(id *)(a1 + 40) removeObject:v18];
  }
  else
  {
    id v7 = [v18 cloudAccount];
    int v8 = [v7 identifier];
    id v9 = [*(id *)(a1 + 32) modernDestinationAccount];
    id v10 = [v9 identifier];
    int v11 = [v8 isEqualToString:v10];

    if (v11)
    {
      objc_opt_class();
      int v12 = ICDynamicCast();
      id v13 = [v12 folder];
      BOOL v14 = [v13 identifier];
      char v15 = [*(id *)(a1 + 32) modernDestination];
      v16 = [v15 identifier];
      if ([v14 isEqualToString:v16] && (objc_msgSend(v12, "isSystemPaper") & 1) == 0)
      {
        char v17 = [v12 isMathNote];

        if ((v17 & 1) == 0) {
          [*(id *)(a1 + 40) removeObject:v18];
        }
      }
      else
      {
      }
    }
  }
}

uint64_t __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = ICDynamicCast();

  if ([v3 isSmartFolder])
  {
    int v4 = [v3 account];
    uint64_t v5 = [v4 isLocalAccount] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 smartFolderQuery];
  int v4 = [v2 managedObjectContext];
  uint64_t v5 = [v2 account];

  int v6 = [v5 objectID];
  id v7 = [v3 filterSelectionWithManagedObjectContext:v4 account:v6];

  int v8 = [v7 filterTypeSelections];
  uint64_t v9 = objc_msgSend(v8, "ic_containsObjectPassingTest:", &__block_literal_global_54);

  return v9;
}

uint64_t __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F83378];
  id v3 = a2;
  int v4 = [v2 cloudSpecificFilterTypes];
  uint64_t v5 = NSNumber;
  uint64_t v6 = [v3 filterType];

  id v7 = [v5 numberWithInteger:v6];
  uint64_t v8 = [v4 containsObject:v7];

  return v8;
}

- (void)_makeDecisionForMovingModernObjectsToHTMLDestination
{
  if (![(ICMoveDecision *)self shouldContinueDecisionMaking]) {
    return;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(ICMoveDecision *)self modernSourceObjects];
  id v23 = (id)[v3 initWithArray:v4];

  uint64_t v5 = [(ICMoveDecision *)self filteredModernSourceObjects];
  LOBYTE(v4) = [v5 isEqual:v23];

  if ((v4 & 1) == 0)
  {
    [(ICMoveDecision *)self setFilteredModernSourceObjects:v23];
    [(ICMoveDecision *)self setHasSanitizedAndScreenedModernSourceObjects:0];
  }
  [(ICMoveDecision *)self _sanitizeAndScreenFilteredModernSourceObjectsIfNecessary];
  uint64_t v6 = [(ICMoveDecision *)self modernSourceObjects];
  uint64_t v7 = [v6 count];

  if (v7) {
    [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:0];
  }
  uint64_t v8 = [(ICMoveDecision *)self modernFoldersInSource];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(ICMoveDecision *)self modernFoldersInSource];
LABEL_11:
    id v13 = (void *)v10;
    [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:v10];
    goto LABEL_12;
  }
  int v11 = [(ICMoveDecision *)self unsupportedObjectsInSource];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v10 = [(ICMoveDecision *)self unsupportedObjectsInSource];
    goto LABEL_11;
  }
  BOOL v14 = [(ICMoveDecision *)self lockedObjectsInSource];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    id v13 = [(ICMoveDecision *)self lockedObjectsInSource];
    v16 = self;
    uint64_t v17 = 3;
    uint64_t v18 = 2;
  }
  else
  {
    uint64_t v19 = [(ICMoveDecision *)self sharedObjectsInSource];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      id v13 = [(ICMoveDecision *)self sharedObjectsInSource];
      v16 = self;
      uint64_t v17 = 3;
      uint64_t v18 = 4;
    }
    else
    {
      uint64_t v21 = [(ICMoveDecision *)self privateModernNoteWithAttachmentsInSource];
      uint64_t v22 = [v21 count];

      if (!v22) {
        goto LABEL_13;
      }
      id v13 = [(ICMoveDecision *)self privateModernNoteWithAttachmentsInSource];
      v16 = self;
      uint64_t v17 = 1;
      uint64_t v18 = 5;
    }
  }
  [(ICMoveDecision *)v16 _setDecisionWithType:v17 additionalStep:v18 guiltyObjects:v13];
LABEL_12:

LABEL_13:
}

- (void)_makeDecisionForMovingModernObjectsToVirtualDestination
{
  id v3 = [(ICMoveDecision *)self modernSourceObjects];
  uint64_t v4 = [v3 firstObject];
  id v48 = [v4 managedObjectContext];

  if (!v48) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((context) != nil)", "-[ICMoveDecision _makeDecisionForMovingModernObjectsToVirtualDestination]", 1, 0, @"Expected non-nil value for '%s'", "context");
  }
  if ([(ICMoveDecision *)self shouldContinueDecisionMaking])
  {
    uint64_t v5 = [(ICMoveDecision *)self virtualDestinationFolder];

    if (v48)
    {
      if (v5)
      {
        uint64_t v6 = [(ICMoveDecision *)self filteredModernSourceObjects];
        uint64_t v7 = (void *)[v6 mutableCopy];

        uint64_t v8 = (void *)MEMORY[0x1E4F83418];
        uint64_t v9 = [(ICMoveDecision *)self virtualDestinationFolder];
        uint64_t v10 = [v9 predicateForContext:v48];
        int v11 = objc_msgSend(v8, "ic_objectsMatchingPredicate:context:", v10, v48);

        uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
        [v7 minusSet:v12];

        id v13 = [(ICMoveDecision *)self filteredModernSourceObjects];
        LOBYTE(v10) = [v13 isEqual:v7];

        if ((v10 & 1) == 0)
        {
          [(ICMoveDecision *)self setFilteredModernSourceObjects:v7];
          [(ICMoveDecision *)self setHasSanitizedAndScreenedModernSourceObjects:0];
        }
        [(ICMoveDecision *)self _sanitizeAndScreenFilteredModernSourceObjectsIfNecessary];
        BOOL v14 = [(ICMoveDecision *)self filteredModernSourceObjects];
        uint64_t v15 = [v14 count];

        if (!v15)
        {
          uint64_t v18 = [(ICMoveDecision *)self modernSourceObjects];
          goto LABEL_16;
        }
        v16 = [(ICMoveDecision *)self unsupportedObjectsInSource];
        uint64_t v17 = [v16 count];

        if (v17)
        {
          uint64_t v18 = [(ICMoveDecision *)self unsupportedObjectsInSource];
LABEL_16:
          id v23 = (void *)v18;
          [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:v18];
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        uint64_t v19 = [(ICMoveDecision *)self modernFoldersInSource];
        uint64_t v20 = [v19 count];

        if (v20)
        {
          uint64_t v18 = [(ICMoveDecision *)self modernFoldersInSource];
          goto LABEL_16;
        }
        uint64_t v21 = [(ICMoveDecision *)self readOnlySharedSubObjectsInSource];
        uint64_t v22 = [v21 count];

        if (v22)
        {
          uint64_t v18 = [(ICMoveDecision *)self readOnlySharedSubObjectsInSource];
          goto LABEL_16;
        }
        if ([(ICMoveDecision *)self hasSharedObjectsNotFromDestinationAccountInSource])
        {
          id v23 = [(ICMoveDecision *)self sharedObjectsInSource];
          char v24 = self;
          uint64_t v25 = 3;
          uint64_t v26 = 4;
        }
        else if ([(ICMoveDecision *)self hasLockedNotesNotFromDestinationAccountInSource])
        {
          id v23 = [(ICMoveDecision *)self lockedObjectsInSource];
          char v24 = self;
          uint64_t v25 = 3;
          uint64_t v26 = 2;
        }
        else
        {
          v27 = [(ICMoveDecision *)self virtualDestinationFolder];
          v28 = [v27 type];
          int v29 = [v28 isEqual:@"ICVirtualSmartFolderItemIdentifierTypeSharedWithYou"];

          if (v29)
          {
            uint64_t v30 = [(ICMoveDecision *)self modernSourceObjects];
          }
          else
          {
            char v31 = [(ICMoveDecision *)self virtualDestinationFolder];
            uint64_t v32 = [v31 type];
            int v33 = [v32 isEqual:@"ICVirtualSmartFolderItemIdentifierTypeSystemPaper"];

            if (!v33)
            {
              v36 = [(ICMoveDecision *)self virtualDestinationFolder];
              v37 = [v36 type];
              int v38 = [v37 isEqual:@"ICVirtualSmartFolderItemIdentifierTypeMathNotes"];

              if (v38)
              {
                v39 = [(ICMoveDecision *)self nonMathNotesNotesInSource];
                uint64_t v40 = [v39 count];

                if (!v40) {
                  goto LABEL_18;
                }
                id v23 = [(ICMoveDecision *)self nonMathNotesNotesInSource];
                char v24 = self;
                uint64_t v25 = 1;
                uint64_t v26 = 9;
              }
              else
              {
                unint64_t v41 = [(ICMoveDecision *)self virtualDestinationFolder];
                unint64_t v42 = [v41 type];
                int v43 = [v42 isEqual:@"ICVirtualSmartFolderItemIdentifierTypeCallNotes"];

                if (!v43) {
                  goto LABEL_18;
                }
                v44 = [(ICMoveDecision *)self nonCallNotesInSource];
                uint64_t v45 = [v44 count];

                if (!v45) {
                  goto LABEL_18;
                }
                id v23 = [(ICMoveDecision *)self nonCallNotesInSource];
                char v24 = self;
                uint64_t v25 = 1;
                uint64_t v26 = 11;
              }
              goto LABEL_32;
            }
            v34 = [(ICMoveDecision *)self lockedObjectsInSource];
            uint64_t v35 = [v34 count];

            if (!v35)
            {
              int v46 = [(ICMoveDecision *)self nonSystemPaperNotesInSource];
              uint64_t v47 = [v46 count];

              if (!v47) {
                goto LABEL_18;
              }
              id v23 = [(ICMoveDecision *)self nonSystemPaperNotesInSource];
              char v24 = self;
              uint64_t v25 = 1;
              uint64_t v26 = 7;
              goto LABEL_32;
            }
            uint64_t v30 = [(ICMoveDecision *)self lockedObjectsInSource];
          }
          id v23 = (void *)v30;
          char v24 = self;
          uint64_t v25 = 2;
          uint64_t v26 = 0;
        }
LABEL_32:
        [(ICMoveDecision *)v24 _setDecisionWithType:v25 additionalStep:v26 guiltyObjects:v23];
        goto LABEL_17;
      }
    }
  }
LABEL_19:
}

- (void)_makeDecisionForMovingHTMLObjectsToModernDestination
{
  if ([(ICMoveDecision *)self shouldContinueDecisionMaking])
  {
    id v3 = [(ICMoveDecision *)self modernDestinationFolder];
    char v4 = [v3 isSharedReadOnly];

    if ((v4 & 1) != 0
      || ([(ICMoveDecision *)self modernDestinationFolder],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isSmartFolder],
          v5,
          v6))
    {
      [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:0];
    }
  }
}

- (void)_makeDecisionForMovingHTMLObjectsToHTMLDestination
{
  if ([(ICMoveDecision *)self shouldContinueDecisionMaking])
  {
    [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:0];
  }
}

- (void)_makeDecisionForMovingHTMLObjectsToVirtualDestination
{
  if ([(ICMoveDecision *)self shouldContinueDecisionMaking])
  {
    [(ICMoveDecision *)self _sanitizeAndScreenFilteredModernSourceObjectsIfNecessary];
    id v3 = [(ICMoveDecision *)self modernSourceObjects];
    [(ICMoveDecision *)self _setDecisionWithType:2 guiltyObjects:v3];
  }
}

- (void)_sanitizeAndScreenFilteredModernSourceObjectsIfNecessary
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  if ([(ICMoveDecision *)self hasSanitizedAndScreenedModernSourceObjects]) {
    return;
  }
  id v3 = [(ICMoveDecision *)self filteredModernSourceObjects];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v5 = [(ICMoveDecision *)self modernSourceObjects];
    int v6 = (void *)[v4 initWithArray:v5];
    [(ICMoveDecision *)self setFilteredModernSourceObjects:v6];
  }
  uint64_t v7 = [(ICMoveDecision *)self filteredModernSourceObjects];
  uint64_t v8 = [v7 allObjects];
  uint64_t v9 = objc_msgSend(v8, "ic_objectsPassingTest:", &__block_literal_global_65);
  [(ICMoveDecision *)self setModernFoldersInSource:v9];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v11 = [(ICMoveDecision *)self filteredModernSourceObjects];
  uint64_t v12 = [v11 allObjects];
  id v13 = (void *)[v12 mutableCopy];

  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_2;
  v115[3] = &unk_1E5FDE2E8;
  id v14 = v10;
  id v116 = v14;
  [v13 enumerateObjectsUsingBlock:v115];
  [v13 removeObjectsInArray:v14];
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_3;
  v112[3] = &unk_1E5FDE310;
  id v15 = v13;
  id v113 = v15;
  v114 = self;
  v102 = v14;
  [v14 enumerateObjectsUsingBlock:v112];
  v101 = v15;
  [(ICMoveDecision *)self setSanitizedFilteredModernSourceObjects:v15];
  id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v17 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  uint64_t v18 = objc_msgSend(v16, "initWithCapacity:", objc_msgSend(v17, "count"));
  [(ICMoveDecision *)self setOwnedSharedRootObjectsInSource:v18];

  id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v20 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  uint64_t v21 = objc_msgSend(v19, "initWithCapacity:", objc_msgSend(v20, "count"));
  [(ICMoveDecision *)self setJoinedSharedRootObjectsInSource:v21];

  id v22 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v23 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  char v24 = objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));
  [(ICMoveDecision *)self setReadWriteSharedSubObjectsInSource:v24];

  id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v26 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  v27 = objc_msgSend(v25, "initWithCapacity:", objc_msgSend(v26, "count"));
  [(ICMoveDecision *)self setReadOnlySharedSubObjectsInSource:v27];

  id v28 = objc_alloc(MEMORY[0x1E4F1CA80]);
  int v29 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  uint64_t v30 = objc_msgSend(v28, "initWithCapacity:", objc_msgSend(v29, "count"));
  [(ICMoveDecision *)self setAccountsOfModernSourceObjects:v30];

  id v31 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v32 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  int v33 = objc_msgSend(v31, "initWithCapacity:", objc_msgSend(v32, "count"));
  [(ICMoveDecision *)self setSharedObjectsInSource:v33];

  id v34 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v35 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  v36 = objc_msgSend(v34, "initWithCapacity:", objc_msgSend(v35, "count"));
  [(ICMoveDecision *)self setLockedObjectsInSource:v36];

  id v37 = objc_alloc(MEMORY[0x1E4F1CA48]);
  int v38 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  v39 = objc_msgSend(v37, "initWithCapacity:", objc_msgSend(v38, "count"));
  [(ICMoveDecision *)self setUnsupportedObjectsInSource:v39];

  id v40 = objc_alloc(MEMORY[0x1E4F1CA48]);
  unint64_t v41 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  unint64_t v42 = objc_msgSend(v40, "initWithCapacity:", objc_msgSend(v41, "count"));
  [(ICMoveDecision *)self setPrivateModernNoteWithAttachmentsInSource:v42];

  id v43 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v44 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  uint64_t v45 = objc_msgSend(v43, "initWithCapacity:", objc_msgSend(v44, "count"));
  [(ICMoveDecision *)self setSharedObjectsNotFromDestinationFolderInSource:v45];

  id v46 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v47 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  id v48 = objc_msgSend(v46, "initWithCapacity:", objc_msgSend(v47, "count"));
  [(ICMoveDecision *)self setSystemPaperNotesInSource:v48];

  id v49 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v50 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  uint64_t v51 = objc_msgSend(v49, "initWithCapacity:", objc_msgSend(v50, "count"));
  [(ICMoveDecision *)self setNonSystemPaperNotesInSource:v51];

  id v52 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v53 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  uint64_t v54 = objc_msgSend(v52, "initWithCapacity:", objc_msgSend(v53, "count"));
  [(ICMoveDecision *)self setMathNotesNotesInSource:v54];

  id v55 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v56 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  int v57 = objc_msgSend(v55, "initWithCapacity:", objc_msgSend(v56, "count"));
  [(ICMoveDecision *)self setNonMathNotesNotesInSource:v57];

  id v58 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v59 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  BOOL v60 = objc_msgSend(v58, "initWithCapacity:", objc_msgSend(v59, "count"));
  [(ICMoveDecision *)self setCallNotesInSource:v60];

  id v61 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v62 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  v63 = objc_msgSend(v61, "initWithCapacity:", objc_msgSend(v62, "count"));
  [(ICMoveDecision *)self setNonCallNotesInSource:v63];

  v64 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_4;
  v111[3] = &unk_1E5FDE2E8;
  v111[4] = self;
  [v64 enumerateObjectsUsingBlock:v111];

  v65 = [(ICMoveDecision *)self sharedObjectsInSource];
  uint64_t v66 = [(ICMoveDecision *)self ownedSharedRootObjectsInSource];
  [v65 addObjectsFromArray:v66];

  v67 = [(ICMoveDecision *)self sharedObjectsInSource];
  uint64_t v68 = [(ICMoveDecision *)self joinedSharedRootObjectsInSource];
  [v67 addObjectsFromArray:v68];

  v69 = [(ICMoveDecision *)self sharedObjectsInSource];
  uint64_t v70 = [(ICMoveDecision *)self readWriteSharedSubObjectsInSource];
  [v69 addObjectsFromArray:v70];

  v71 = [(ICMoveDecision *)self sharedObjectsInSource];
  uint64_t v72 = [(ICMoveDecision *)self readOnlySharedSubObjectsInSource];
  [v71 addObjectsFromArray:v72];

  v73 = [(ICMoveDecision *)self modernDestinationFolder];
  int v74 = [v73 rootSharingFolder];

  if (v74)
  {
    v75 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_5;
    v108[3] = &unk_1E5FDE310;
    id v109 = v74;
    v110 = self;
    [v75 enumerateObjectsUsingBlock:v108];
  }
  v76 = [(ICMoveDecision *)self sharedObjectsInSource];
  uint64_t v77 = [v76 count];

  if (v77)
  {
    id v78 = [(ICMoveDecision *)self accountsOfModernSourceObjects];
    unint64_t v79 = [v78 count];

    if (v79 < 2)
    {
      v80 = [(ICMoveDecision *)self accountsOfModernSourceObjects];
      if ([v80 count] == 1)
      {
        v81 = [(ICMoveDecision *)self accountsOfModernSourceObjects];
        v82 = [v81 anyObject];
        v83 = [v82 identifier];
        v84 = [(ICMoveDecision *)self modernDestinationAccount];
        v85 = [v84 identifier];
        char v86 = [v83 isEqualToString:v85];

        if ((v86 & 1) == 0) {
          [(ICMoveDecision *)self setHasSharedObjectsNotFromDestinationAccountInSource:1];
        }
        goto LABEL_13;
      }
    }
    else
    {
      v80 = [(ICMoveDecision *)self sharedObjectsInSource];
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_6;
      v107[3] = &unk_1E5FDE378;
      v107[4] = self;
      -[ICMoveDecision setHasSharedObjectsNotFromDestinationAccountInSource:](self, "setHasSharedObjectsNotFromDestinationAccountInSource:", objc_msgSend(v80, "ic_containsObjectPassingTest:", v107));
    }
  }
LABEL_13:
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v87 = [(ICMoveDecision *)self sanitizedFilteredModernSourceObjects];
  uint64_t v88 = [v87 countByEnumeratingWithState:&v103 objects:v117 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    uint64_t v90 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v89; ++i)
      {
        if (*(void *)v104 != v90) {
          objc_enumerationMutation(v87);
        }
        v92 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v93 = v92;
          if ([v93 isSystemPaper]) {
            [(ICMoveDecision *)self systemPaperNotesInSource];
          }
          else {
          v94 = [(ICMoveDecision *)self nonSystemPaperNotesInSource];
          }
          [v94 addObject:v93];

          if ([v93 isMathNote]) {
            [(ICMoveDecision *)self mathNotesNotesInSource];
          }
          else {
          v95 = [(ICMoveDecision *)self nonMathNotesNotesInSource];
          }
          [v95 addObject:v93];

          if ([v93 isCallNote]) {
            [(ICMoveDecision *)self callNotesInSource];
          }
          else {
          v96 = [(ICMoveDecision *)self nonCallNotesInSource];
          }
          [v96 addObject:v93];

          if ([v93 isPasswordProtected])
          {
            v97 = [v93 account];
            v98 = [(ICMoveDecision *)self modernDestinationAccount];
            BOOL v99 = [(ICMoveDecision *)self hasLockedNotesNotFromDestinationAccountInSource];
            uint64_t v100 = v97 != v98 || v99;
            [(ICMoveDecision *)self setHasLockedNotesNotFromDestinationAccountInSource:v100];
          }
        }
      }
      uint64_t v89 = [v87 countByEnumeratingWithState:&v103 objects:v117 count:16];
    }
    while (v89);
  }

  [(ICMoveDecision *)self setHasSanitizedAndScreenedModernSourceObjects:1];
}

uint64_t __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4
    && ([v4 isSharedViaICloud] & 1) == 0
    && ([v4 visibleNotesCount] || objc_msgSend(v4, "visibleNoteContainerChildrenCount")))
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [(id)objc_opt_class() objectsForMakingDecisionForNonSharedFolder:v6];
  [v4 addObjectsFromArray:v5];
}

void __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accountForObject:v3];
  uint64_t v5 = [*(id *)(a1 + 32) accountsOfModernSourceObjects];
  objc_msgSend(v5, "ic_addNonNilObject:", v4);

  objc_opt_class();
  id v6 = ICDynamicCast();
  if ([v3 isPasswordProtected])
  {
    uint64_t v7 = [*(id *)(a1 + 32) lockedObjectsInSource];
    [v7 addObject:v3];
  }
  if ([v3 isUnsupported])
  {
    uint64_t v8 = [*(id *)(a1 + 32) unsupportedObjectsInSource];
    [v8 addObject:v3];
  }
  if ([v3 isSharedViaICloud])
  {
    if ([v3 isSharedRootObject])
    {
      int v9 = [v3 isOwnedByCurrentUser];
      id v10 = *(void **)(a1 + 32);
      if (v9) {
        [v10 ownedSharedRootObjectsInSource];
      }
      else {
      id v13 = [v10 joinedSharedRootObjectsInSource];
      }
      id v14 = v13;
      id v15 = v3;
      goto LABEL_16;
    }
    int v16 = [v3 isSharedReadOnly];
    uint64_t v17 = *(void **)(a1 + 32);
    if (v16) {
      [v17 readOnlySharedSubObjectsInSource];
    }
    else {
    uint64_t v18 = [v17 readWriteSharedSubObjectsInSource];
    }
    [v18 addObject:v3];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v19 = objc_msgSend(v6, "attachments", 0);
    uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v19);
          }
          char v24 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v24 isUnsupported])
          {
            id v25 = [*(id *)(a1 + 32) unsupportedObjectsInSource];
            [v25 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v21);
    }
  }
  else if (v6)
  {
    int v11 = [v6 attachments];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      id v13 = [*(id *)(a1 + 32) privateModernNoteWithAttachmentsInSource];
      id v14 = v13;
      id v15 = v6;
LABEL_16:
      [v13 addObject:v15];
    }
  }
}

uint64_t __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_5(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 isSharedViaICloud];
  if (v3)
  {
    id v4 = [v10 parentCloudObject];
    objc_opt_class();
    uint64_t v5 = ICCheckedDynamicCast();
    if ([v5 isSharedViaICloud])
    {
      id v6 = [v5 identifier];
      uint64_t v7 = [*(id *)(a1 + 32) identifier];
      if ([v6 isEqualToString:v7])
      {

LABEL_7:
        goto LABEL_8;
      }
      char v8 = [v5 isDescendantOfFolder:*(void *)(a1 + 32)];

      if (v8)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    id v6 = [*(id *)(a1 + 40) sharedObjectsNotFromDestinationFolderInSource];
    [v6 addObject:v10];
    goto LABEL_7;
  }
LABEL_9:
  return MEMORY[0x1F41817F8](v3);
}

uint64_t __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) accountForObject:a2];
  id v4 = [v3 identifier];
  uint64_t v5 = [*(id *)(a1 + 32) modernDestinationAccount];
  id v6 = [v5 identifier];
  uint64_t v7 = [v4 isEqualToString:v6] ^ 1;

  return v7;
}

- (BOOL)hasLockedObjects
{
  id v2 = [(ICMoveDecision *)self lockedObjectsInSource];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)accountForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = ICDynamicCast();
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 account];
    if (v6) {
      goto LABEL_11;
    }
  }
  else
  {
    objc_opt_class();
    uint64_t v7 = ICDynamicCast();
    char v8 = v7;
    if (v7)
    {
      id v6 = [v7 account];
    }
    else
    {
      id v6 = 0;
    }

    if (v6) {
      goto LABEL_11;
    }
  }
  int v9 = os_log_create("com.apple.notes", "Move");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[ICMoveDecision accountForObject:]((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
  }

LABEL_11:
  return v6;
}

- (id)htmlAccountForObject:(id)a3
{
  id v3 = a3;
  id v4 = ICProtocolCast();
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 folder];
    uint64_t v7 = v6;
LABEL_4:
    char v8 = [v6 account];
    int v9 = ICProtocolCast();

    goto LABEL_5;
  }
  id v6 = ICProtocolCast();
  uint64_t v7 = v6;
  if (v6) {
    goto LABEL_4;
  }
  int v9 = 0;
LABEL_5:

  if (!v9)
  {
    uint64_t v10 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ICMoveDecision htmlAccountForObject:]((uint64_t)v3, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  return v9;
}

+ (id)objectsForMakingDecisionForNonSharedFolder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (([v4 isSharedViaICloud] & 1) != 0 || objc_msgSend(v4, "isSmartFolder"))
  {
    [v5 addObject:v4];
  }
  else
  {
    id v6 = [v4 visibleNotes];
    [v5 addObjectsFromArray:v6];

    uint64_t v7 = [v4 visibleNoteContainerChildrenUnsorted];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__ICMoveDecision_objectsForMakingDecisionForNonSharedFolder___block_invoke;
    v9[3] = &unk_1E5FDE3A0;
    id v10 = v5;
    id v11 = a1;
    [v7 enumerateObjectsUsingBlock:v9];
  }
  return v5;
}

void __61__ICMoveDecision_objectsForMakingDecisionForNonSharedFolder___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectsForMakingDecisionForNonSharedFolder:a2];
  [v2 addObjectsFromArray:v3];
}

+ (BOOL)isValidModernSourceObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)isValidHTMLSourceObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)isValidModernDestinationObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)isValidHTMLDestinationObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)isValidVirtualDestinationObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)shouldContinueDecisionMaking
{
  return [(ICMoveDecision *)self type] != 3;
}

- (ICFolder)modernDestinationFolder
{
  objc_opt_class();
  id v3 = [(ICMoveDecision *)self modernDestination];
  id v4 = ICDynamicCast();

  return (ICFolder *)v4;
}

- (ICAccount)modernDestinationAccount
{
  id v3 = [(ICMoveDecision *)self modernSourceObjects];
  id v4 = [v3 firstObject];
  id v5 = [v4 managedObjectContext];

  objc_opt_class();
  id v6 = [(ICMoveDecision *)self modernDestination];
  uint64_t v7 = ICDynamicCast();
  char v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = [(ICMoveDecision *)self modernDestinationFolder];
    id v11 = [v10 account];
    uint64_t v12 = v11;
    if (v11)
    {
      id v9 = v11;
    }
    else
    {
      uint64_t v13 = [(ICMoveDecision *)self virtualDestinationFolder];
      uint64_t v14 = [v13 accountObjectID];
      if (v14)
      {
        uint64_t v15 = [(ICMoveDecision *)self virtualDestinationFolder];
        uint64_t v16 = [v15 accountObjectID];
        id v9 = [v5 objectWithID:v16];
      }
      else
      {
        id v9 = 0;
      }
    }
  }

  return (ICAccount *)v9;
}

+ (BOOL)shouldCopyThenDeleteWhenMovingObject:(id)a3 toNoteContainer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  uint64_t v7 = ICDynamicCast();
  objc_opt_class();
  char v8 = ICDynamicCast();
  id v9 = v8;
  if (v7) {
    char v8 = v7;
  }
  id v10 = [v8 account];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v6;
    id v12 = [v11 account];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v17 = os_log_create("com.apple.notes", "Move");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[ICMoveDecision shouldCopyThenDeleteWhenMovingObject:toNoteContainer:]((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);
      }

      id v11 = 0;
      id v12 = 0;
      LOBYTE(v13) = 0;
      goto LABEL_23;
    }
    id v12 = v6;
    id v11 = 0;
  }
  if (v10 == v12)
  {
    int v13 = [v11 isSharedViaICloud];
    if ([v5 isSharedViaICloud])
    {
      char v14 = [v5 isSharedRootObject];
      if (!v13 || (v14 & 1) != 0)
      {
        id v12 = v10;
        LOBYTE(v13) = v13 | v14 ^ 1;
        goto LABEL_23;
      }
      if (v7)
      {
        uint64_t v15 = [v7 folder];
        char v16 = [v15 isSharedViaSharedFolder:v11];
      }
      else if (v9)
      {
        char v16 = [v9 isSharedViaSharedFolder:v11];
      }
      else
      {
        char v16 = 0;
      }
      LOBYTE(v13) = v16 ^ 1;
    }
    id v12 = v10;
    goto LABEL_23;
  }
  LOBYTE(v13) = 1;
LABEL_23:

  return v13;
}

- (NSArray)modernSourceObjects
{
  return self->_modernSourceObjects;
}

- (NSArray)htmlSourceObjects
{
  return self->_htmlSourceObjects;
}

- (ICCloudSyncingObject)modernDestination
{
  return self->_modernDestination;
}

- (NoteStoreObject)htmlDestinationFolder
{
  return self->_htmlDestinationFolder;
}

- (ICVirtualSmartFolderItemIdentifier)virtualDestinationFolder
{
  return self->_virtualDestinationFolder;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)additionalStep
{
  return self->_additionalStep;
}

- (NSArray)guiltyObjects
{
  return self->_guiltyObjects;
}

- (NSArray)modernNotes
{
  return self->_modernNotes;
}

- (void)setModernNotes:(id)a3
{
}

- (NSMutableSet)filteredModernSourceObjects
{
  return self->_filteredModernSourceObjects;
}

- (void)setFilteredModernSourceObjects:(id)a3
{
}

- (NSMutableArray)sanitizedFilteredModernSourceObjects
{
  return self->_sanitizedFilteredModernSourceObjects;
}

- (void)setSanitizedFilteredModernSourceObjects:(id)a3
{
}

- (NSMutableArray)ownedSharedRootObjectsInSource
{
  return self->_ownedSharedRootObjectsInSource;
}

- (void)setOwnedSharedRootObjectsInSource:(id)a3
{
}

- (NSMutableArray)joinedSharedRootObjectsInSource
{
  return self->_joinedSharedRootObjectsInSource;
}

- (void)setJoinedSharedRootObjectsInSource:(id)a3
{
}

- (NSMutableArray)readWriteSharedSubObjectsInSource
{
  return self->_readWriteSharedSubObjectsInSource;
}

- (void)setReadWriteSharedSubObjectsInSource:(id)a3
{
}

- (NSMutableArray)readOnlySharedSubObjectsInSource
{
  return self->_readOnlySharedSubObjectsInSource;
}

- (void)setReadOnlySharedSubObjectsInSource:(id)a3
{
}

- (NSMutableArray)lockedObjectsInSource
{
  return self->_lockedObjectsInSource;
}

- (void)setLockedObjectsInSource:(id)a3
{
}

- (NSMutableArray)unsupportedObjectsInSource
{
  return self->_unsupportedObjectsInSource;
}

- (void)setUnsupportedObjectsInSource:(id)a3
{
}

- (NSArray)modernFoldersInSource
{
  return self->_modernFoldersInSource;
}

- (void)setModernFoldersInSource:(id)a3
{
}

- (NSMutableSet)accountsOfModernSourceObjects
{
  return self->_accountsOfModernSourceObjects;
}

- (void)setAccountsOfModernSourceObjects:(id)a3
{
}

- (NSMutableSet)accountsOfHTMLSourceObjects
{
  return self->_accountsOfHTMLSourceObjects;
}

- (void)setAccountsOfHTMLSourceObjects:(id)a3
{
}

- (NSMutableArray)privateModernNoteWithAttachmentsInSource
{
  return self->_privateModernNoteWithAttachmentsInSource;
}

- (void)setPrivateModernNoteWithAttachmentsInSource:(id)a3
{
}

- (NSMutableArray)sharedObjectsNotFromDestinationFolderInSource
{
  return self->_sharedObjectsNotFromDestinationFolderInSource;
}

- (void)setSharedObjectsNotFromDestinationFolderInSource:(id)a3
{
}

- (NSMutableArray)sharedObjectsInSource
{
  return self->_sharedObjectsInSource;
}

- (void)setSharedObjectsInSource:(id)a3
{
}

- (NSMutableArray)systemPaperNotesInSource
{
  return self->_systemPaperNotesInSource;
}

- (void)setSystemPaperNotesInSource:(id)a3
{
}

- (NSMutableArray)nonSystemPaperNotesInSource
{
  return self->_nonSystemPaperNotesInSource;
}

- (void)setNonSystemPaperNotesInSource:(id)a3
{
}

- (NSMutableArray)mathNotesNotesInSource
{
  return self->_mathNotesNotesInSource;
}

- (void)setMathNotesNotesInSource:(id)a3
{
}

- (NSMutableArray)nonMathNotesNotesInSource
{
  return self->_nonMathNotesNotesInSource;
}

- (void)setNonMathNotesNotesInSource:(id)a3
{
}

- (NSMutableArray)callNotesInSource
{
  return self->_callNotesInSource;
}

- (void)setCallNotesInSource:(id)a3
{
}

- (NSMutableArray)nonCallNotesInSource
{
  return self->_nonCallNotesInSource;
}

- (void)setNonCallNotesInSource:(id)a3
{
}

- (BOOL)hasSharedObjectsNotFromDestinationAccountInSource
{
  return self->_hasSharedObjectsNotFromDestinationAccountInSource;
}

- (void)setHasSharedObjectsNotFromDestinationAccountInSource:(BOOL)a3
{
  self->_hasSharedObjectsNotFromDestinationAccountInSource = a3;
}

- (BOOL)hasLockedNotesNotFromDestinationAccountInSource
{
  return self->_hasLockedNotesNotFromDestinationAccountInSource;
}

- (void)setHasLockedNotesNotFromDestinationAccountInSource:(BOOL)a3
{
  self->_hasLockedNotesNotFromDestinationAccountInSource = a3;
}

- (BOOL)hasSanitizedAndScreenedModernSourceObjects
{
  return self->_hasSanitizedAndScreenedModernSourceObjects;
}

- (void)setHasSanitizedAndScreenedModernSourceObjects:(BOOL)a3
{
  self->_hasSanitizedAndScreenedModernSourceObjects = a3;
}

- (BOOL)allowsManagedToUnmanagedMove
{
  return self->_allowsManagedToUnmanagedMove;
}

- (void)setAllowsManagedToUnmanagedMove:(BOOL)a3
{
  self->_allowsManagedToUnmanagedMove = a3;
}

- (BOOL)allowsUnmanagedToManagedMove
{
  return self->_allowsUnmanagedToManagedMove;
}

- (void)setAllowsUnmanagedToManagedMove:(BOOL)a3
{
  self->_allowsUnmanagedToManagedMove = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonCallNotesInSource, 0);
  objc_storeStrong((id *)&self->_callNotesInSource, 0);
  objc_storeStrong((id *)&self->_nonMathNotesNotesInSource, 0);
  objc_storeStrong((id *)&self->_mathNotesNotesInSource, 0);
  objc_storeStrong((id *)&self->_nonSystemPaperNotesInSource, 0);
  objc_storeStrong((id *)&self->_systemPaperNotesInSource, 0);
  objc_storeStrong((id *)&self->_sharedObjectsInSource, 0);
  objc_storeStrong((id *)&self->_sharedObjectsNotFromDestinationFolderInSource, 0);
  objc_storeStrong((id *)&self->_privateModernNoteWithAttachmentsInSource, 0);
  objc_storeStrong((id *)&self->_accountsOfHTMLSourceObjects, 0);
  objc_storeStrong((id *)&self->_accountsOfModernSourceObjects, 0);
  objc_storeStrong((id *)&self->_modernFoldersInSource, 0);
  objc_storeStrong((id *)&self->_unsupportedObjectsInSource, 0);
  objc_storeStrong((id *)&self->_lockedObjectsInSource, 0);
  objc_storeStrong((id *)&self->_readOnlySharedSubObjectsInSource, 0);
  objc_storeStrong((id *)&self->_readWriteSharedSubObjectsInSource, 0);
  objc_storeStrong((id *)&self->_joinedSharedRootObjectsInSource, 0);
  objc_storeStrong((id *)&self->_ownedSharedRootObjectsInSource, 0);
  objc_storeStrong((id *)&self->_sanitizedFilteredModernSourceObjects, 0);
  objc_storeStrong((id *)&self->_filteredModernSourceObjects, 0);
  objc_storeStrong((id *)&self->_modernNotes, 0);
  objc_storeStrong((id *)&self->_guiltyObjects, 0);
  objc_storeStrong((id *)&self->_virtualDestinationFolder, 0);
  objc_storeStrong((id *)&self->_htmlDestinationFolder, 0);
  objc_storeStrong((id *)&self->_modernDestination, 0);
  objc_storeStrong((id *)&self->_htmlSourceObjects, 0);
  objc_storeStrong((id *)&self->_modernSourceObjects, 0);
}

- (void)accountForObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)htmlAccountForObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)shouldCopyThenDeleteWhenMovingObject:(uint64_t)a3 toNoteContainer:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end