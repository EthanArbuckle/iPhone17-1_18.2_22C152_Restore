@interface ICVirtualSmartFolderItemIdentifier
+ (NSArray)allTypes;
- (BOOL)isEmptyInContext:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHiddenInContext:(id)a3;
- (BOOL)isShowingDateHeaders;
- (BOOL)isTrashFolder;
- (BOOL)isType:(id)a3;
- (BOOL)supportsDateHeaders;
- (ICFolderCustomNoteSortType)noteSortType;
- (ICItemIdentifier)parentIdentifier;
- (ICQuery)query;
- (ICVirtualSmartFolderItemIdentifier)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 context:(id)a5;
- (ICVirtualSmartFolderItemIdentifier)initWithType:(id)a3 parentIdentifier:(id)a4;
- (ICVirtualSmartFolderItemIdentifier)initWithType:(id)a3 parentIdentifier:(id)a4 accountObjectID:(id)a5;
- (NSManagedObjectID)accountObjectID;
- (NSString)dateHeadersTypeUserDefaultsKey;
- (NSString)defaultTitle;
- (NSString)description;
- (NSString)identifier;
- (NSString)noteSortTypeUserDefaultsKey;
- (NSString)systemImageName;
- (NSString)title;
- (NSString)type;
- (NSString)visibilityUserDefaultsKey;
- (id)predicateForContext:(id)a3;
- (int)dateHeadersType;
- (int64_t)visibility;
- (unint64_t)hash;
- (unint64_t)visibleInvitationCountInContext:(id)a3;
- (unint64_t)visibleItemCountInContext:(id)a3;
- (unint64_t)visibleNoteCountInContext:(id)a3;
- (void)setDateHeadersType:(int)a3;
- (void)setNoteSortType:(id)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation ICVirtualSmartFolderItemIdentifier

- (ICVirtualSmartFolderItemIdentifier)initWithType:(id)a3 parentIdentifier:(id)a4 accountObjectID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICVirtualSmartFolderItemIdentifier;
  v12 = [(ICVirtualSmartFolderItemIdentifier *)&v17 init];
  if (v12)
  {
    v13 = [(id)objc_opt_class() allTypes];
    char v14 = [v13 containsObject:v9];

    if ((v14 & 1) == 0)
    {
      id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Invalid virtual smart folder type" userInfo:0];
      objc_exception_throw(v16);
    }
    objc_storeStrong((id *)&v12->_type, a3);
    objc_storeStrong((id *)&v12->_parentIdentifier, a4);
    objc_storeStrong((id *)&v12->_accountObjectID, a5);
  }

  return v12;
}

+ (NSArray)allTypes
{
  if (allTypes_onceToken != -1) {
    dispatch_once(&allTypes_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)allTypes_allTypes;
  return (NSArray *)v2;
}

- (ICVirtualSmartFolderItemIdentifier)initWithType:(id)a3 parentIdentifier:(id)a4
{
  return [(ICVirtualSmartFolderItemIdentifier *)self initWithType:a3 parentIdentifier:a4 accountObjectID:0];
}

- (BOOL)isHiddenInContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICVirtualSmartFolderItemIdentifier *)self visibility];
  if (v5 == 2)
  {
    BOOL v6 = 1;
  }
  else if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(ICVirtualSmartFolderItemIdentifier *)self isEmptyInContext:v4];
  }

  return v6;
}

- (int64_t)visibility
{
  objc_opt_class();
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(ICVirtualSmartFolderItemIdentifier *)self visibilityUserDefaultsKey];
  int64_t v5 = [v3 objectForKey:v4];
  BOOL v6 = ICCheckedDynamicCast();

  if (v6)
  {
    if ([v6 BOOLValue]) {
      int64_t v7 = 2;
    }
    else {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSString)visibilityUserDefaultsKey
{
  v2 = NSString;
  v3 = [(ICVirtualSmartFolderItemIdentifier *)self identifier];
  id v4 = [v2 stringWithFormat:@"%@:hidden", v3];

  return (NSString *)v4;
}

- (BOOL)isEmptyInContext:(id)a3
{
  return [(ICVirtualSmartFolderItemIdentifier *)self visibleItemCountInContext:a3] == 0;
}

- (unint64_t)visibleItemCountInContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICVirtualSmartFolderItemIdentifier *)self visibleNoteCountInContext:v4];
  unint64_t v6 = [(ICVirtualSmartFolderItemIdentifier *)self visibleInvitationCountInContext:v4];

  return v6 + v5;
}

- (unint64_t)visibleNoteCountInContext:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__ICVirtualSmartFolderItemIdentifier_visibleNoteCountInContext___block_invoke;
  v8[3] = &unk_1E5FD9870;
  id v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [v5 performBlockAndWait:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (unint64_t)visibleInvitationCountInContext:(id)a3
{
  id v4 = a3;
  id v5 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  int v6 = [v5 isEqual:@"ICVirtualSmartFolderItemIdentifierTypeSharedWithYou"];

  if (v6)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__ICVirtualSmartFolderItemIdentifier_visibleInvitationCountInContext___block_invoke;
    v9[3] = &unk_1E5FD93E0;
    v9[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    [v10 performBlockAndWait:v9];
    unint64_t v7 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  v3 = [(ICVirtualSmartFolderItemIdentifier *)self accountObjectID];
  if (v3)
  {
    id v4 = NSString;
    id v5 = [(ICVirtualSmartFolderItemIdentifier *)self type];
    int v6 = [(ICVirtualSmartFolderItemIdentifier *)self accountObjectID];
    unint64_t v7 = [v6 URIRepresentation];
    v8 = [v4 stringWithFormat:@"%@:%@", v5, v7];
  }
  else
  {
    v8 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  }

  return (NSString *)v8;
}

void __58__ICVirtualSmartFolderItemIdentifier_predicateForContext___block_invoke(uint64_t a1)
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) accountObjectID];

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) accountObjectID];
    id v5 = [v3 objectWithID:v4];

    int v6 = (void *)MEMORY[0x1E4F28BA0];
    unint64_t v7 = [*(id *)(a1 + 32) query];
    v8 = [v7 predicate];
    v22[0] = v8;
    id v9 = (void *)MEMORY[0x1E4F83418];
    id v10 = [v5 identifier];
    uint64_t v11 = [v9 predicateForNotesInAccountWithIdentifier:v10];
    v22[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F83418] predicateForFetchedFromCloudObjects];
    v22[2] = v12;
    uint64_t v13 = [MEMORY[0x1E4F83418] predicateForUnmarkedForDeletionObjects];
    v22[3] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    uint64_t v15 = [v6 andPredicateWithSubpredicates:v14];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    objc_super v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F28BA0];
    id v5 = [*(id *)(a1 + 32) query];
    unint64_t v7 = [v5 predicate];
    v8 = objc_msgSend(MEMORY[0x1E4F83418], "predicateForFetchedFromCloudObjects", v7);
    v21[1] = v8;
    id v10 = [MEMORY[0x1E4F83418] predicateForUnmarkedForDeletionObjects];
    v21[2] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    uint64_t v19 = [v18 andPredicateWithSubpredicates:v11];
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = ICDynamicCast();

  if (v5)
  {
    int v6 = [(ICVirtualSmartFolderItemIdentifier *)self type];
    unint64_t v7 = [v5 type];
    if (![v6 isEqualToString:v7])
    {
      char v17 = 0;
LABEL_33:

      goto LABEL_34;
    }
    v8 = [(ICVirtualSmartFolderItemIdentifier *)self parentIdentifier];
    id v9 = [v5 parentIdentifier];
    id v10 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v8) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v8;
    }
    uint64_t v12 = v11;
    if (v10 == v9) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v9;
    }
    unint64_t v14 = v13;
    if (v12 | v14)
    {
      uint64_t v15 = (void *)v14;
      if (v12) {
        BOOL v16 = v14 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (v16)
      {
        char v17 = 0;
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      int v18 = [(id)v12 isEqual:v14];

      if (!v18)
      {
        char v17 = 0;
        goto LABEL_32;
      }
    }
    uint64_t v12 = [(ICVirtualSmartFolderItemIdentifier *)self accountObjectID];
    uint64_t v15 = [v5 accountObjectID];
    if (v10 == (void *)v12) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = (void *)v12;
    }
    unint64_t v20 = v19;
    if (v10 == v15) {
      v21 = 0;
    }
    else {
      v21 = v15;
    }
    unint64_t v22 = v21;
    v23 = (void *)v22;
    if (v20 | v22)
    {
      char v17 = 0;
      if (v20 && v22) {
        char v17 = [(id)v20 isEqual:v22];
      }
    }
    else
    {
      char v17 = 1;
    }

    goto LABEL_31;
  }
  char v17 = 0;
LABEL_34:

  return v17;
}

- (ICQuery)query
{
  v3 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  int v4 = [v3 isEqual:@"ICVirtualSmartFolderItemIdentifierTypeSharedWithYou"];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F83488] queryForSharedNotes:1 allowsRecentlyDeleted:0];
  }
  else
  {
    int v6 = [(ICVirtualSmartFolderItemIdentifier *)self type];
    int v7 = [v6 isEqual:@"ICVirtualSmartFolderItemIdentifierTypeSystemPaper"];

    if (v7)
    {
      id v5 = [MEMORY[0x1E4F83488] queryForSystemPaperNotesAllowsRecentlyDeleted:0];
    }
    else
    {
      v8 = [(ICVirtualSmartFolderItemIdentifier *)self type];
      int v9 = [v8 isEqual:@"ICVirtualSmartFolderItemIdentifierTypeMathNotes"];

      if (v9)
      {
        id v5 = [MEMORY[0x1E4F83488] queryForMathNotesAllowsRecentlyDeleted:0];
      }
      else
      {
        id v10 = [(ICVirtualSmartFolderItemIdentifier *)self type];
        int v11 = [v10 isEqual:@"ICVirtualSmartFolderItemIdentifierTypeCallNotes"];

        if (v11)
        {
          id v5 = [MEMORY[0x1E4F83488] queryForCallNotesAllowsRecentlyDeleted:0];
        }
        else
        {
          uint64_t v12 = [(ICVirtualSmartFolderItemIdentifier *)self type];
          int v13 = [v12 isEqual:@"ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes"];

          if (!v13)
          {
            id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Invalid virtual smart folder type" userInfo:0];
            objc_exception_throw(v15);
          }
          id v5 = [MEMORY[0x1E4F83488] queryForRecentlyDeletedMathNotes];
        }
      }
    }
  }
  return (ICQuery *)v5;
}

- (NSString)type
{
  return self->_type;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    int v4 = [(ICVirtualSmartFolderItemIdentifier *)self type];
    uint64_t v5 = [v4 hash];
    int v6 = [(ICVirtualSmartFolderItemIdentifier *)self parentIdentifier];
    char v7 = [v6 hash];
    v8 = [(ICVirtualSmartFolderItemIdentifier *)self accountObjectID];
    [v8 hash];
    self->_hash = ICHashWithHashKeys(v5, v9, v10, v11, v12, v13, v14, v15, v7);

    return self->_hash;
  }
  return result;
}

- (NSManagedObjectID)accountObjectID
{
  return self->_accountObjectID;
}

- (ICItemIdentifier)parentIdentifier
{
  return self->_parentIdentifier;
}

void __64__ICVirtualSmartFolderItemIdentifier_visibleNoteCountInContext___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F83418];
  id v3 = [*(id *)(a1 + 32) predicateForContext:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 countOfNotesMatchingPredicate:v3 context:*(void *)(a1 + 40)];
}

- (id)predicateForContext:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__4;
  uint64_t v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ICVirtualSmartFolderItemIdentifier_predicateForContext___block_invoke;
  v8[3] = &unk_1E5FD93E0;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __70__ICVirtualSmartFolderItemIdentifier_visibleInvitationCountInContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accountObjectID];
  if (v2)
  {
    objc_opt_class();
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) accountObjectID];
    id v5 = [v3 objectWithID:v4];
    ICCheckedDynamicCast();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  id v6 = (void *)MEMORY[0x1E4F833B8];
  char v7 = +[ICInvitationsCoreDataIndexer defaultReceivedSince];
  v8 = [v6 predicateForPendingInvitationsInAccount:v10 receivedSince:v7];

  id v9 = [MEMORY[0x1E4F833B8] invitationsMatchingPredicate:v8 context:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v9 count];
}

void __46__ICVirtualSmartFolderItemIdentifier_allTypes__block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"ICVirtualSmartFolderItemIdentifierTypeSystemPaper";
  v2[1] = @"ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes";
  v2[2] = @"ICVirtualSmartFolderItemIdentifierTypeMathNotes";
  v2[3] = @"ICVirtualSmartFolderItemIdentifierTypeCallNotes";
  v2[4] = @"ICVirtualSmartFolderItemIdentifierTypeSharedWithYou";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  v1 = (void *)allTypes_allTypes;
  allTypes_allTypes = v0;
}

- (ICVirtualSmartFolderItemIdentifier)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a3 componentsSeparatedByString:@":"];
  uint64_t v11 = (void *)v10;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    uint64_t v12 = (void *)v10;
  }
  id v13 = v12;

  if ([v13 count])
  {
    uint64_t v14 = [v13 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v14 = &stru_1F0973378;
  }
  if ((unint64_t)[v13 count] < 2)
  {
    char v17 = 0;
  }
  else
  {
    uint64_t v15 = [v9 persistentStoreCoordinator];
    id v16 = [v13 objectAtIndexedSubscript:1];
    char v17 = objc_msgSend(v15, "ic_managedObjectIDForURIString:", v16);
  }
  int v18 = [(id)objc_opt_class() allTypes];
  if ([v18 containsObject:v14])
  {
    self = [(ICVirtualSmartFolderItemIdentifier *)self initWithType:v14 parentIdentifier:v8 accountObjectID:v17];
    uint64_t v19 = self;
  }
  else
  {
    uint64_t v19 = 0;
  }
  unint64_t v20 = v19;

  return v20;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  char v7 = [(ICVirtualSmartFolderItemIdentifier *)self parentIdentifier];
  id v8 = [(ICVirtualSmartFolderItemIdentifier *)self accountObjectID];
  id v9 = [(ICVirtualSmartFolderItemIdentifier *)self title];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p, type: %@, parentIdentifier: %@, accountID: %@, title: %@>", v5, self, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (NSString)title
{
  id v3 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  int v4 = [v3 isEqualToString:@"ICVirtualSmartFolderItemIdentifierTypeSharedWithYou"];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F83770];
    id v6 = @"Shared";
  }
  else
  {
    char v7 = [(ICVirtualSmartFolderItemIdentifier *)self type];
    int v8 = [v7 isEqualToString:@"ICVirtualSmartFolderItemIdentifierTypeSystemPaper"];

    if (v8)
    {
      id v5 = (void *)MEMORY[0x1E4F83770];
      id v6 = @"Quick Notes";
    }
    else
    {
      id v9 = [(ICVirtualSmartFolderItemIdentifier *)self type];
      int v10 = [v9 isEqualToString:@"ICVirtualSmartFolderItemIdentifierTypeMathNotes"];

      if (v10)
      {
        id v5 = (void *)MEMORY[0x1E4F83770];
        id v6 = @"Math Notes";
      }
      else
      {
        uint64_t v11 = [(ICVirtualSmartFolderItemIdentifier *)self type];
        int v12 = [v11 isEqualToString:@"ICVirtualSmartFolderItemIdentifierTypeCallNotes"];

        if (v12)
        {
          id v5 = (void *)MEMORY[0x1E4F83770];
          id v6 = @"Call Recordings";
        }
        else
        {
          id v13 = [(ICVirtualSmartFolderItemIdentifier *)self type];
          int v14 = [v13 isEqualToString:@"ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes"];

          if (!v14)
          {
            id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Invalid virtual smart folder type" userInfo:0];
            objc_exception_throw(v17);
          }
          id v5 = (void *)MEMORY[0x1E4F83770];
          id v6 = @"Recently Deleted";
        }
      }
    }
  }
  uint64_t v15 = [v5 localizedFrameworkStringForKey:v6 value:v6 table:0 allowSiri:1];
  return (NSString *)v15;
}

- (NSString)systemImageName
{
  id v3 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  char v4 = [v3 isEqualToString:@"ICVirtualSmartFolderItemIdentifierTypeSharedWithYou"];

  if (v4) {
    return (NSString *)@"person.crop.circle";
  }
  id v6 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  char v7 = [v6 isEqualToString:@"ICVirtualSmartFolderItemIdentifierTypeSystemPaper"];

  if (v7) {
    return (NSString *)@"quicknote";
  }
  int v8 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  char v9 = [v8 isEqualToString:@"ICVirtualSmartFolderItemIdentifierTypeMathNotes"];

  if (v9) {
    return (NSString *)@"apple.math.notes";
  }
  int v10 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  char v11 = [v10 isEqualToString:@"ICVirtualSmartFolderItemIdentifierTypeCallNotes"];

  if (v11) {
    return (NSString *)@"phone.badge.waveform.fill";
  }
  int v12 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  char v13 = [v12 isEqualToString:@"ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes"];

  if ((v13 & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Invalid virtual smart folder type" userInfo:0];
    objc_exception_throw(v14);
  }
  return (NSString *)@"trash";
}

- (BOOL)isTrashFolder
{
  v2 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  char v3 = [v2 isEqualToString:@"ICVirtualSmartFolderItemIdentifierTypeRecentlyDeletedMathNotes"];

  return v3;
}

- (BOOL)isType:(id)a3
{
  id v4 = a3;
  id v5 = [(ICVirtualSmartFolderItemIdentifier *)self type];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (void)setVisibility:(int64_t)a3
{
  if (a3 == 2)
  {
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [(ICVirtualSmartFolderItemIdentifier *)self visibilityUserDefaultsKey];
    id v5 = v7;
    uint64_t v6 = 1;
LABEL_7:
    [v5 setBool:v6 forKey:v4];
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [(ICVirtualSmartFolderItemIdentifier *)self visibilityUserDefaultsKey];
    id v5 = v7;
    uint64_t v6 = 0;
    goto LABEL_7;
  }
  if (a3) {
    return;
  }
  id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(ICVirtualSmartFolderItemIdentifier *)self visibilityUserDefaultsKey];
  [v7 removeObjectForKey:v4];
LABEL_8:
}

- (NSString)noteSortTypeUserDefaultsKey
{
  v2 = NSString;
  char v3 = [(ICVirtualSmartFolderItemIdentifier *)self identifier];
  id v4 = [v2 stringWithFormat:@"%@:noteSortType", v3];

  return (NSString *)v4;
}

- (ICFolderCustomNoteSortType)noteSortType
{
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(ICVirtualSmartFolderItemIdentifier *)self noteSortTypeUserDefaultsKey];
  uint64_t v5 = [v3 integerForKey:v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F83758];
  id v7 = [NSNumber numberWithInteger:v5];
  int v8 = [v6 folderNoteSortTypeFromValue:v7];

  return (ICFolderCustomNoteSortType *)v8;
}

- (void)setNoteSortType:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CB18];
  id v5 = a3;
  id v8 = [v4 standardUserDefaults];
  uint64_t v6 = [v5 valueRepresentation];

  id v7 = [(ICVirtualSmartFolderItemIdentifier *)self noteSortTypeUserDefaultsKey];
  [v8 setValue:v6 forKey:v7];
}

- (NSString)dateHeadersTypeUserDefaultsKey
{
  v2 = NSString;
  char v3 = [(ICVirtualSmartFolderItemIdentifier *)self identifier];
  id v4 = [v2 stringWithFormat:@"%@:dateHeadersType", v3];

  return (NSString *)v4;
}

- (int)dateHeadersType
{
  char v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [(ICVirtualSmartFolderItemIdentifier *)self dateHeadersTypeUserDefaultsKey];
  int v5 = [v3 integerForKey:v4];

  return v5;
}

- (void)setDateHeadersType:(int)a3
{
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = [(ICVirtualSmartFolderItemIdentifier *)self dateHeadersTypeUserDefaultsKey];
  [v6 setInteger:a3 forKey:v5];
}

- (BOOL)supportsDateHeaders
{
  v2 = [(ICVirtualSmartFolderItemIdentifier *)self noteSortType];
  BOOL v3 = [v2 resolvedCustomSortTypeOrder] != 3;

  return v3;
}

- (BOOL)isShowingDateHeaders
{
  BOOL v3 = [(ICVirtualSmartFolderItemIdentifier *)self supportsDateHeaders];
  if (v3)
  {
    int v4 = [(ICVirtualSmartFolderItemIdentifier *)self dateHeadersType];
    if (v4 == 2)
    {
      LOBYTE(v3) = 1;
    }
    else if (v4)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = [MEMORY[0x1E4F83730] defaultDateHeadersType] == 2;
    }
  }
  return v3;
}

- (NSString)defaultTitle
{
  return self->_defaultTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTitle, 0);
  objc_storeStrong((id *)&self->_accountObjectID, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end