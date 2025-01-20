@interface ICFoldersFilterTypeSelection
+ (id)keyPathsForValuesAffectingIsEmpty;
- (BOOL)containsSharedFolder;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToICFoldersFilterTypeSelection:(id)a3;
- (BOOL)isValid;
- (ICFoldersFilterTypeSelection)initWithManagedObjectContext:(id)a3 inclusionType:(unint64_t)a4 folderIdentifiers:(id)a5;
- (NSArray)folderIdentifiers;
- (NSManagedObjectContext)managedObjectContext;
- (NSString)folderSummaryList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)emptySummary;
- (id)emptySummaryTitle;
- (id)filterName;
- (id)folderTitlesForIdentifiers:(id)a3;
- (id)rawFilterValue;
- (id)shortEmptySummary;
- (int64_t)filterType;
- (unint64_t)hash;
- (unint64_t)inclusionType;
- (void)addFolderIdentifier:(id)a3;
- (void)removeFolderIdentifier:(id)a3;
- (void)setFolderIdentifiers:(id)a3;
- (void)setInclusionType:(unint64_t)a3;
@end

@implementation ICFoldersFilterTypeSelection

- (ICFoldersFilterTypeSelection)initWithManagedObjectContext:(id)a3 inclusionType:(unint64_t)a4 folderIdentifiers:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICFoldersFilterTypeSelection;
  v11 = [(ICFoldersFilterTypeSelection *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_managedObjectContext, a3);
    v12->_inclusionType = a4;
    objc_storeStrong((id *)&v12->_folderIdentifiers, a5);
  }

  return v12;
}

- (id)debugDescription
{
  v3 = NSString;
  unint64_t v4 = [(ICFoldersFilterTypeSelection *)self inclusionType];
  v5 = @"Exclude";
  if (!v4) {
    v5 = @"Include";
  }
  v6 = v5;
  v7 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
  v8 = [v7 componentsJoinedByString:@", "];
  id v9 = [v3 stringWithFormat:@"inclusionType: %@\nfolder identifiers: %@", v6, v8];

  return v9;
}

- (void)addFolderIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
  v5 = [v6 arrayByAddingObject:v4];

  [(ICFoldersFilterTypeSelection *)self setFolderIdentifiers:v5];
}

- (void)removeFolderIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
  id v7 = (id)[v5 mutableCopy];

  [v7 removeObject:v4];
  id v6 = (void *)[v7 copy];
  [(ICFoldersFilterTypeSelection *)self setFolderIdentifiers:v6];
}

- (NSString)folderSummaryList
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v3 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"0 selected" value:@"0 selected" table:0 allowSiri:1];
    goto LABEL_10;
  }
  v5 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
  uint64_t v6 = [v5 count];

  id v7 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
  v8 = v7;
  if (v6 == 1)
  {
    id v9 = [(ICFoldersFilterTypeSelection *)self folderTitlesForIdentifiers:v7];
    uint64_t v10 = [v9 firstObject];
  }
  else
  {
    uint64_t v12 = [v7 count];

    v13 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
    objc_super v14 = v13;
    if (v12 != 2)
    {
      v15 = [v13 firstObject];
      v22[0] = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      v17 = [(ICFoldersFilterTypeSelection *)self folderTitlesForIdentifiers:v16];
      v8 = [v17 firstObject];

      v18 = NSString;
      v19 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"FOLDERS_%@_AND_%lu_OTHERS" value:@"FOLDERS_%@_AND_%lu_OTHERS" table:0 allowSiri:1];
      v20 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
      v11 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v8, objc_msgSend(v20, "count") - 1);

      goto LABEL_9;
    }
    v8 = [(ICFoldersFilterTypeSelection *)self folderTitlesForIdentifiers:v13];

    id v9 = objc_alloc_init(MEMORY[0x1E4F28DF8]);
    uint64_t v10 = [v9 stringFromItems:v8];
  }
  v11 = (void *)v10;

LABEL_9:
LABEL_10:
  return (NSString *)v11;
}

- (BOOL)containsSharedFolder
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ICFoldersFilterTypeSelection *)self managedObjectContext];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__ICFoldersFilterTypeSelection_containsSharedFolder__block_invoke;
  v5[3] = &unk_1E64A44A8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performBlockAndWait:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __52__ICFoldersFilterTypeSelection_containsSharedFolder__block_invoke(uint64_t a1)
{
  v2 = +[ICFolder fetchRequest];
  v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [*(id *)(a1 + 32) folderIdentifiers];
  v5 = [v3 predicateWithFormat:@"identifier in %@", v4];
  [v2 setPredicate:v5];

  [v2 setResultType:0];
  uint64_t v6 = [*(id *)(a1 + 32) managedObjectContext];
  id v10 = 0;
  id v7 = [v6 executeFetchRequest:v2 error:&v10];
  id v8 = v10;

  if (v8)
  {
    char v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __52__ICFoldersFilterTypeSelection_containsSharedFolder__block_invoke_cold_1((id *)(a1 + 32), (uint64_t)v8, v9);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "ic_containsObjectPassingTest:", &__block_literal_global_39);
}

uint64_t __52__ICFoldersFilterTypeSelection_containsSharedFolder__block_invoke_35(uint64_t a1, void *a2)
{
  return [a2 isSharedViaICloud];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[ICFoldersFilterTypeSelection allocWithZone:](ICFoldersFilterTypeSelection, "allocWithZone:");
  uint64_t v6 = [(ICFoldersFilterTypeSelection *)self managedObjectContext];
  unint64_t v7 = [(ICFoldersFilterTypeSelection *)self inclusionType];
  id v8 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
  char v9 = (void *)[v8 copyWithZone:a3];
  id v10 = [(ICFoldersFilterTypeSelection *)v5 initWithManagedObjectContext:v6 inclusionType:v7 folderIdentifiers:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICFoldersFilterTypeSelection *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ICFoldersFilterTypeSelection *)self isEqualToICFoldersFilterTypeSelection:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICFoldersFilterTypeSelection inclusionType](self, "inclusionType"));
  uint64_t v4 = [v3 hash];
  id v5 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
  BOOL v6 = (objc_class *)objc_opt_class();
  unint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [v7 hash];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v8 = ICHashWithObject(*(void **)(*((void *)&v23 + 1) + 8 * i)) - v8 + 32 * v8;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  unint64_t v21 = ICHashWithHashKeys(v4, v14, v15, v16, v17, v18, v19, v20, v8);
  return v21;
}

- (int64_t)filterType
{
  return 7;
}

- (id)filterName
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Folders" value:@"Folders" table:0 allowSiri:1];
}

- (id)rawFilterValue
{
  if ([(ICFoldersFilterTypeSelection *)self inclusionType]) {
    v2 = @"Exclude";
  }
  else {
    v2 = @"Include";
  }
  return v2;
}

- (BOOL)isEmpty
{
  v2 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingIsEmpty
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ICFoldersFilterTypeSelection;
  v2 = objc_msgSendSuper2(&v6, sel_keyPathsForValuesAffectingIsValid);
  BOOL v3 = (void *)[v2 mutableCopy];

  [v3 addObjectsFromArray:&unk_1F1F62CA0];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)isValid
{
  return ![(ICFoldersFilterTypeSelection *)self isEmpty];
}

- (id)emptySummaryTitle
{
  if ([(ICFoldersFilterTypeSelection *)self isEmpty])
  {
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Folders Filter Incomplete" value:@"Folders Filter Incomplete" table:0 allowSiri:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)emptySummary
{
  if ([(ICFoldersFilterTypeSelection *)self isEmpty])
  {
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You must select at least one folder for the Folders filter." value:@"You must select at least one folder for the Folders filter." table:0 allowSiri:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)shortEmptySummary
{
  if ([(ICFoldersFilterTypeSelection *)self isEmpty])
  {
    v2 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Folder for the Folders filter" value:@"Folder for the Folders filter" table:0 allowSiri:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)folderTitlesForIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__35;
  uint64_t v18 = __Block_byref_object_dispose__35;
  id v19 = 0;
  id v5 = [(ICFoldersFilterTypeSelection *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__ICFoldersFilterTypeSelection_folderTitlesForIdentifiers___block_invoke;
  v9[3] = &unk_1E64A5820;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = @"title";
  uint64_t v12 = self;
  v13 = &v14;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __59__ICFoldersFilterTypeSelection_folderTitlesForIdentifiers___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v2 = +[ICFolder fetchRequest];
  BOOL v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier in %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  v13[0] = *(void *)(a1 + 40);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v2 setPropertiesToFetch:v4];

  [v2 setResultType:0];
  id v5 = [*(id *)(a1 + 48) managedObjectContext];
  id v12 = 0;
  id v6 = [v5 executeFetchRequest:v2 error:&v12];
  id v7 = v12;

  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __59__ICFoldersFilterTypeSelection_folderTitlesForIdentifiers___block_invoke_cold_1((uint64_t *)(a1 + 32), (uint64_t)v7, v8);
    }
  }
  uint64_t v9 = objc_msgSend(v6, "ic_compactMap:", &__block_literal_global_64);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __59__ICFoldersFilterTypeSelection_folderTitlesForIdentifiers___block_invoke_61(uint64_t a1, void *a2)
{
  return [a2 localizedTitle];
}

- (BOOL)isEqualToICFoldersFilterTypeSelection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICFoldersFilterTypeSelection *)self inclusionType];
  if (v5 == [v4 inclusionType])
  {
    id v6 = [(ICFoldersFilterTypeSelection *)self folderIdentifiers];
    id v7 = [v4 folderIdentifiers];
    char v8 = [v6 isEqualToArray:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (unint64_t)inclusionType
{
  return self->_inclusionType;
}

- (void)setInclusionType:(unint64_t)a3
{
  self->_inclusionType = a3;
}

- (NSArray)folderIdentifiers
{
  return self->_folderIdentifiers;
}

- (void)setFolderIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIdentifiers, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

void __52__ICFoldersFilterTypeSelection_containsSharedFolder__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [*a1 folderIdentifiers];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_ERROR, "Error fetching folders for identifiers: %@ : %@", (uint8_t *)&v6, 0x16u);
}

void __59__ICFoldersFilterTypeSelection_folderTitlesForIdentifiers___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Error fetching folder titles for identifiers: %@ : %@", (uint8_t *)&v4, 0x16u);
}

@end