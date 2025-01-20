@interface REMAccount
+ (BOOL)canCopyReminderLosslesslyFromAccountWithType:(int64_t)a3 toAccountWithType:(int64_t)a4 accountTypeHost:(id)a5;
+ (BOOL)isCloudBasedAccountType:(int64_t)a3;
+ (NSString)cdEntityName;
+ (REMObjectID)localAccountID;
+ (REMObjectID)localInternalAccountID;
+ (id)_accountTypeMaskWithBitMask:(int64_t)a3;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (BOOL)MCIsManagedWithResultPtr:(BOOL *)a3 error:(id *)a4;
- (BOOL)canCopyReminderLosslesslyToAccount:(id)a3;
- (BOOL)daSupportsPhoneNumbers;
- (BOOL)isConsideredEmptyWithResultPtr:(BOOL *)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnsupported;
- (BOOL)markedForRemoval;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldUseExternalIdentifierAsDeletionKey;
- (BOOL)supportsSharingLists;
- (NSOrderedSet)listIDsOrdering;
- (REMAccount)initWithStore:(id)a3 storage:(id)a4;
- (REMAccountCapabilities)capabilities;
- (REMAccountGroupContext)groupContext;
- (REMAccountStorage)storage;
- (REMAccountTemplatesContext)templatesContext;
- (REMStore)store;
- (id)accountTypeHost;
- (id)debugDescription;
- (id)description;
- (id)externalIdentifierForMarkedForDeletionObject;
- (id)fetchCustomSmartListsWithError:(id *)a3;
- (id)fetchListIncludingSpecialContainerWithExternalIdentifier:(id)a3 error:(id *)a4;
- (id)fetchListsAndSublistsWithError:(id *)a3;
- (id)fetchListsIncludingSpecialContainersWithError:(id *)a3;
- (id)fetchListsWithError:(id *)a3;
- (id)optionalObjectID;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)listIDsOrdering;
- (void)setCapabilities:(id)a3;
- (void)setMarkedForRemoval:(BOOL)a3;
- (void)setStore:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation REMAccount

- (id)accountTypeHost
{
  v2 = [(REMAccount *)self storage];
  v3 = [v2 accountTypeHost];

  return v3;
}

- (id)optionalObjectID
{
  v2 = [(REMAccount *)self storage];
  v3 = [v2 optionalObjectID];

  return v3;
}

- (REMAccountStorage)storage
{
  return self->_storage;
}

- (BOOL)supportsSharingLists
{
  unint64_t v3 = [(REMAccount *)self type];
  BOOL result = 1;
  if (v3 <= 7)
  {
    if (((1 << v3) & 0xB3) != 0)
    {
      return 0;
    }
    else if (v3 == 3)
    {
      return [(REMAccount *)self daSupportsSharedCalendars];
    }
  }
  return result;
}

- (REMAccount)initWithStore:(id)a3 storage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REMAccount;
  v9 = [(REMAccount *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a4);
    objc_storeStrong((id *)&v10->_store, a3);
    v11 = -[REMAccountCapabilities initWithAccountType:]([REMAccountCapabilities alloc], "initWithAccountType:", [v8 type]);
    capabilities = v10->_capabilities;
    v10->_capabilities = v11;

    -[REMAccountStorage setStoreGenerationIfNeeded:](v10->_storage, "setStoreGenerationIfNeeded:", [v7 storeGeneration]);
  }

  return v10;
}

- (REMAccountCapabilities)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

+ (REMObjectID)localInternalAccountID
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"5d18e4d0-8a71-406c-899d-6ff8e3e94c37"];
  unint64_t v3 = +[REMAccount objectIDWithUUID:v2];

  return (REMObjectID *)v3;
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMAccountStorage objectIDWithUUID:a3];
}

- (REMStore)store
{
  return self->_store;
}

+ (REMObjectID)localAccountID
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"3B242529-8F5D-47A1-9351-444101218C30"];
  unint64_t v3 = +[REMAccount objectIDWithUUID:v2];

  return (REMObjectID *)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REMAccount *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(REMAccount *)v5 store];
      id v7 = [(REMAccount *)self store];
      int v8 = [v6 isEqual:v7];

      if (v8)
      {
        v9 = [(REMAccount *)v5 storage];
        v10 = [(REMAccount *)self storage];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v2 = [(REMAccount *)self storage];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMAccount *)self storage];
  v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMAccount *)self storage];
  v6 = [v5 debugDescription];
  id v7 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v6];

  return v7;
}

- (REMAccountGroupContext)groupContext
{
  unint64_t v3 = [(REMAccount *)self capabilities];
  int v4 = [v3 supportsGroups];

  if (v4) {
    v5 = [[REMAccountGroupContext alloc] initWithAccount:self];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (REMAccountTemplatesContext)templatesContext
{
  unint64_t v3 = [(REMAccount *)self capabilities];
  int v4 = [v3 supportsTemplates];

  if (v4) {
    v5 = [[REMAccountTemplatesContext alloc] initWithAccount:self];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (id)fetchListsWithError:(id *)a3
{
  v5 = [REMListsDataView alloc];
  v6 = [(REMAccount *)self store];
  id v7 = [(REMListsDataView *)v5 initWithStore:v6];

  int v8 = [(REMListsDataView *)v7 fetchListsInAccount:self error:a3];

  return v8;
}

- (id)fetchListsAndSublistsWithError:(id *)a3
{
  v5 = [REMListsDataView alloc];
  v6 = [(REMAccount *)self store];
  id v7 = [(REMListsDataView *)v5 initWithStore:v6];

  int v8 = [(REMListsDataView *)v7 fetchListsAndSublistsInAccount:self error:a3];

  return v8;
}

- (id)fetchCustomSmartListsWithError:(id *)a3
{
  v5 = [REMSmartListsDataView alloc];
  v6 = [(REMAccount *)self store];
  id v7 = [(REMSmartListsDataView *)v5 initWithStore:v6];

  int v8 = [(REMSmartListsDataView *)v7 fetchCustomSmartListsInAccount:self error:a3];

  return v8;
}

+ (BOOL)canCopyReminderLosslesslyFromAccountWithType:(int64_t)a3 toAccountWithType:(int64_t)a4 accountTypeHost:(id)a5
{
  if (a3 == a4) {
    return 1;
  }
  else {
    return [a5 isCloudKit];
  }
}

- (BOOL)canCopyReminderLosslesslyToAccount:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(REMAccount *)self type];
  uint64_t v7 = [v4 type];
  int v8 = [v4 accountTypeHost];

  LOBYTE(v6) = [v5 canCopyReminderLosslesslyFromAccountWithType:v6 toAccountWithType:v7 accountTypeHost:v8];
  return v6;
}

- (BOOL)isConsideredEmptyWithResultPtr:(BOOL *)a3 withError:(id *)a4
{
  id v25 = 0;
  uint64_t v7 = [(REMAccount *)self fetchListsWithError:&v25];
  id v8 = v25;
  id v9 = v8;
  if (!v7 || v8)
  {
    char v11 = +[REMLogStore read];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[REMAccount isConsideredEmptyWithResultPtr:withError:]();
    }
  }
  else if ((unint64_t)[v7 count] < 2)
  {
    v12 = [v7 firstObject];
    if (v12)
    {
      v13 = [REMRemindersDataView alloc];
      objc_super v14 = [(REMAccount *)self store];
      v15 = [(REMRemindersDataView *)v13 initWithStore:v14];

      v16 = [v12 objectID];
      id v24 = 0;
      v17 = [(REMRemindersDataView *)v15 fetchRemindersCountWithListID:v16 error:&v24];
      id v9 = v24;

      if (v9)
      {
        v18 = +[REMLogStore read];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[REMAccount isConsideredEmptyWithResultPtr:withError:].cold.6(v12, (uint64_t)v9, v18);
        }
      }
      else
      {
        int v20 = [v17 intValue];
        v21 = +[REMLogStore read];
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
        if (v20)
        {
          if (v22) {
            -[REMAccount isConsideredEmptyWithResultPtr:withError:].cold.5();
          }

          *a3 = 0;
        }
        else
        {
          if (v22) {
            -[REMAccount isConsideredEmptyWithResultPtr:withError:].cold.4();
          }

          *a3 = 1;
        }
      }
    }
    else
    {
      v19 = +[REMLogStore read];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[REMAccount isConsideredEmptyWithResultPtr:withError:]();
      }

      id v9 = 0;
      *a3 = 1;
    }
  }
  else
  {
    v10 = +[REMLogStore read];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[REMAccount isConsideredEmptyWithResultPtr:withError:]();
    }

    id v9 = 0;
    *a3 = 0;
  }

  if (a4) {
    *a4 = v9;
  }

  return v9 == 0;
}

- (id)fetchListsIncludingSpecialContainersWithError:(id *)a3
{
  v5 = [(REMAccount *)self store];
  uint64_t v6 = [v5 fetchListsIncludingSpecialContainersInAccount:self error:a3];

  uint64_t v7 = [v6 allValues];

  return v7;
}

- (id)fetchListIncludingSpecialContainerWithExternalIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [REMListsDataView alloc];
  id v8 = [(REMAccount *)self store];
  id v9 = [(REMListsDataView *)v7 initWithStore:v8];

  v10 = [(REMListsDataView *)v9 fetchListIncludingSpecialContainerWithExternalIdentifier:v6 inAccount:self error:a4];

  return v10;
}

- (BOOL)MCIsManagedWithResultPtr:(BOOL *)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(REMAccount *)self store];
  id v8 = [(REMAccount *)self objectID];
  id v13 = 0;
  id v9 = [v7 MCIsManagedAccountWithObjectID:v8 error:&v13];
  id v10 = v13;

  if (v9 || !v10)
  {
    *a3 = [v9 BOOLValue];
    char v11 = +[REMLogStore read];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v15 = self;
      __int16 v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_INFO, "Performed XPC -MCIsManagedAccountWithObjectID: successful {account: %@, result: %@}", buf, 0x16u);
    }
  }
  else
  {
    char v11 = +[REMLogStore read];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[REMAccount MCIsManagedWithResultPtr:error:]();
    }
  }

  if (a4) {
    *a4 = v10;
  }

  return v10 == 0;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  v5 = [(REMAccount *)self storage];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMAccount;
  if (-[REMAccount respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(REMAccount *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMAccount *)self storage];
  [v8 setValue:v7 forKey:v6];
}

- (NSOrderedSet)listIDsOrdering
{
  unint64_t v3 = [(REMAccount *)self storage];
  char v4 = [v3 listIDsMergeableOrdering];

  if (!v4)
  {
    id v7 = +[REMLogStore read];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      [(REMAccount *)self listIDsOrdering];
    }
  }
  v5 = [v4 orderedSet];

  return (NSOrderedSet *)v5;
}

- (BOOL)daSupportsPhoneNumbers
{
  return 0;
}

+ (id)newObjectID
{
  return +[REMAccountStorage newObjectID];
}

+ (NSString)cdEntityName
{
  return +[REMAccountStorage cdEntityName];
}

- (BOOL)isUnsupported
{
  v2 = [(REMAccount *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (id)externalIdentifierForMarkedForDeletionObject
{
  v2 = [(REMAccount *)self externalIdentifier];
  char v3 = +[REMExternalSyncMetadataUtils decodeExternalIdentifierForMarkedForDeletionObject:v2];

  return v3;
}

- (BOOL)shouldUseExternalIdentifierAsDeletionKey
{
  uint64_t v2 = [(REMAccount *)self type];

  return +[REMExternalSyncMetadataUtils shouldUseExternalIdentifierAsDeletionKeyWithAccountType:v2];
}

+ (id)_accountTypeMaskWithBitMask:(int64_t)a3
{
  int v3 = a3;
  char v4 = [MEMORY[0x1E4F1CA80] set];
  for (uint64_t i = 0; i != 7; ++i)
  {
    if (((1 << i) & v3) != 0)
    {
      id v6 = [NSNumber numberWithUnsignedInteger:i];
      [v4 addObject:v6];
    }
  }

  return v4;
}

+ (BOOL)isCloudBasedAccountType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v4 = cloudBasedAccountTypes();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "integerValue", (void)v11) == a3)
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (void)setStore:(id)a3
{
}

- (void)setCapabilities:(id)a3
{
}

- (BOOL)markedForRemoval
{
  return self->_markedForRemoval;
}

- (void)setMarkedForRemoval:(BOOL)a3
{
  self->_markedForRemoval = a3;
}

- (void)isConsideredEmptyWithResultPtr:withError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "isConsideredEmpty: Error fetching lists from local account {error: %@}.", v1, 0xCu);
}

- (void)isConsideredEmptyWithResultPtr:withError:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_5(&dword_1B9AA2000, v0, v1, "isConsideredEmpty: Account thas more than 1 lists. Treating as non-empty.", v2, v3, v4, v5, v6);
}

- (void)isConsideredEmptyWithResultPtr:withError:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_5(&dword_1B9AA2000, v0, v1, "isConsideredEmpty: Account has no lists. Treating as empty.", v2, v3, v4, v5, v6);
}

- (void)isConsideredEmptyWithResultPtr:withError:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_5(&dword_1B9AA2000, v0, v1, "isConsideredEmpty: Account has no reminders. Treating as empty.", v2, v3, v4, v5, v6);
}

- (void)isConsideredEmptyWithResultPtr:withError:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_5(&dword_1B9AA2000, v0, v1, "isConsideredEmpty: Account has reminders. Treating as non-empty.", v2, v3, v4, v5, v6);
}

- (void)isConsideredEmptyWithResultPtr:(NSObject *)a3 withError:.cold.6(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 objectID];
  OUTLINED_FUNCTION_4_5();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_ERROR, "isConsideredEmpty: Error fetching reminders from list in local account {listID: %@, error: %@}.", v6, 0x16u);
}

- (void)MCIsManagedWithResultPtr:error:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_5();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1B9AA2000, v1, OS_LOG_TYPE_ERROR, "Performed XPC -MCIsManagedAccountWithObjectID: failed {account: %@, error: %@}", v2, 0x16u);
}

- (void)listIDsOrdering
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "rem_log_fault_if (listIDsMergeableOrdering == nil) -- account.storage.listIDsMergeableOrdering should not be nil {objectID: %{public}@}", v4, 0xCu);
}

@end