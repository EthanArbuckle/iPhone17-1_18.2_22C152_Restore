@interface PXSharedLibraryRulePeopleDataManager
- (NSArray)currentPersonIdentifiers;
- (NSDiffableDataSourceSnapshot)currentSnapshot;
- (NSString)statusMessage;
- (PXSharedLibraryRulePeopleDataManager)initWithSharedLibraryStatusProvider:(id)a3;
- (PXSharedLibraryRulePeopleDataManagerDelegate)delegate;
- (PXSharedLibraryStatusProvider)statusProvider;
- (void)_updateCurrentSnapshot;
- (void)_updateIfNeeded;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDelegate:(id)a3;
@end

@implementation PXSharedLibraryRulePeopleDataManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_currentPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_currentSharedLibraryRule, 0);
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void)setDelegate:(id)a3
{
}

- (PXSharedLibraryRulePeopleDataManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSharedLibraryRulePeopleDataManagerDelegate *)WeakRetained;
}

- (NSString)statusMessage
{
  return self->_statusMessage;
}

- (NSArray)currentPersonIdentifiers
{
  return self->_currentPersonIdentifiers;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_196063 != a5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryRulePeopleDataManager.m" lineNumber:127 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [(PXSharedLibraryRulePeopleDataManager *)self _updateIfNeeded];
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  currentSnapshot = self->_currentSnapshot;
  if (!currentSnapshot)
  {
    [(PXSharedLibraryRulePeopleDataManager *)self _updateCurrentSnapshot];
    currentSnapshot = self->_currentSnapshot;
  }
  return currentSnapshot;
}

- (void)_updateIfNeeded
{
  v3 = [(PXSharedLibraryRulePeopleDataManager *)self statusProvider];
  v4 = [v3 sharedLibrary];
  obj = [v4 rule];

  v5 = self->_currentSharedLibraryRule;
  if (v5 == obj)
  {
  }
  else
  {
    char v6 = [(PXSharedLibraryRule *)v5 isEqual:obj];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentSharedLibraryRule, obj);
      [(PXSharedLibraryRulePeopleDataManager *)self _updateCurrentSnapshot];
    }
  }
}

- (void)_updateCurrentSnapshot
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v3 = [(PXSharedLibraryRulePeopleDataManager *)self statusProvider];
  v4 = [v3 sharedLibrary];

  v5 = [(PXSharedLibraryRule *)self->_currentSharedLibraryRule personUUIDs];
  char v6 = (void *)[v5 mutableCopy];

  v53 = v6;
  v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  statusMessage = self->_statusMessage;
  v52 = self;
  self->_statusMessage = 0;

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v10 = [v4 participants];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v61;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v61 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v60 + 1) + 8 * v14);
        if (([v15 isCurrentUser] & 1) == 0)
        {
          v16 = [v15 person];
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v48 = [MEMORY[0x1E4F28B00] currentHandler];
              v23 = (objc_class *)objc_opt_class();
              v24 = NSStringFromClass(v23);
              v47 = objc_msgSend(v16, "px_descriptionForAssertionMessage");
              [v48 handleFailureInMethod:a2, v52, @"PXSharedLibraryRulePeopleDataManager.m", 70, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"participant.person", v24, v47 object file lineNumber description];
            }
            v17 = [v16 uuid];
            [v53 removeObject:v17];

            v18 = +[PXSharedLibraryRulePerson rulePersonWithParticipant:v15];
            [v9 addObject:v18];

            v19 = (void *)MEMORY[0x1E4F391F0];
            v20 = [v16 uuid];
            v21 = [v19 localIdentifierWithUUID:v20];
            [(NSArray *)v7 addObject:v21];

LABEL_11:
          }
          else if (!v52->_statusMessage && ([v15 isCurrentUser] & 1) == 0)
          {
            uint64_t v22 = PXSharedLibrarySettingsTextForIdentifyingParticipant(v15);
            v20 = v52->_statusMessage;
            v52->_statusMessage = (NSString *)v22;
            goto LABEL_11;
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v25 = [v10 countByEnumeratingWithState:&v60 objects:v65 count:16];
      uint64_t v12 = v25;
    }
    while (v25);
  }

  id v26 = v4;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v27 = v26;
  }
  else {
    id v27 = 0;
  }

  v28 = [v27 libraryScope];
  v29 = [v28 photoLibrary];

  if (v29)
  {
    v50 = v29;
    id v51 = v26;
    v30 = [v29 librarySpecificFetchOptions];
    v31 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v53 options:v30];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v57 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          v37 = +[PXSharedLibraryRulePerson rulePersonWithPerson:v36];
          [v9 addObject:v37];

          v38 = (void *)MEMORY[0x1E4F391F0];
          v39 = [v36 uuid];
          v40 = [v38 localIdentifierWithUUID:v39];
          [(NSArray *)v7 addObject:v40];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v33);
    }

    v29 = v50;
    id v26 = v51;
  }
  else
  {
    v30 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_ERROR, "Unable to add people to the snapshot without a valid Photo Library", buf, 2u);
    }
  }

  v41 = (NSDiffableDataSourceSnapshot *)objc_opt_new();
  [(NSDiffableDataSourceSnapshot *)v41 appendSectionsWithIdentifiers:&unk_1F02D4D38];
  [(NSDiffableDataSourceSnapshot *)v41 appendItemsWithIdentifiers:v9];
  currentSnapshot = v52->_currentSnapshot;
  v52->_currentSnapshot = v41;
  v43 = v41;

  currentPersonIdentifiers = v52->_currentPersonIdentifiers;
  v52->_currentPersonIdentifiers = v7;
  v45 = v7;

  v46 = [(PXSharedLibraryRulePeopleDataManager *)v52 delegate];
  [v46 sharedLibraryRulePeopleControllerDidChangeCurrentSnapshot:v52];

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __62__PXSharedLibraryRulePeopleDataManager__updateCurrentSnapshot__block_invoke;
  v54[3] = &unk_1E5DD0FA8;
  v54[4] = v52;
  [(PXSharedLibraryRulePeopleDataManager *)v52 performChanges:v54];
}

uint64_t __62__PXSharedLibraryRulePeopleDataManager__updateCurrentSnapshot__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:1];
}

- (PXSharedLibraryRulePeopleDataManager)initWithSharedLibraryStatusProvider:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibraryRulePeopleDataManager;
  char v6 = [(PXSharedLibraryRulePeopleDataManager *)&v14 init];
  v7 = v6;
  if (v6)
  {
    p_statusProvider = (id *)&v6->_statusProvider;
    objc_storeStrong((id *)&v6->_statusProvider, a3);
    [*p_statusProvider registerChangeObserver:v7 context:PXSharedLibraryStatusProviderObservationContext_196063];
    id v9 = [*p_statusProvider sharedLibrary];
    uint64_t v10 = [v9 rule];
    currentSharedLibraryRule = v7->_currentSharedLibraryRule;
    v7->_currentSharedLibraryRule = (PXSharedLibraryRule *)v10;

    currentPersonIdentifiers = v7->_currentPersonIdentifiers;
    v7->_currentPersonIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

@end