@interface REMTemplateChangeItem
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (void)initialize;
- (BOOL)isUnsupported;
- (BOOL)respondsToSelector:(SEL)a3;
- (REMAccountCapabilities)accountCapabilities;
- (REMChangedKeysObserver)changedKeysObserver;
- (REMListBadge)badge;
- (REMSaveRequest)saveRequest;
- (REMTemplateChangeItem)initWithObjectID:(id)a3 name:(id)a4 configuration:(id)a5 insertIntoAccountChangeItem:(id)a6;
- (REMTemplateChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 changedKeysObserver:(id)a5;
- (REMTemplateChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 observeInitialValues:(BOOL)a5;
- (REMTemplateSectionContextChangeItem)sectionsContextChangeItem;
- (REMTemplateStorage)storage;
- (id)changedKeys;
- (id)resolutionTokenKeyForChangedKey:(id)a3;
- (id)shallowCopyWithSaveRequest:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (void)removeFromParentAccount;
- (void)setBadge:(id)a3;
- (void)setChangedKeysObserver:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation REMTemplateChangeItem

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)__sKeysToObserve_1;
    __sKeysToObserve_1 = (uint64_t)&unk_1F136C0E0;

    __resolutionTokenKeyDenylist_0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F136C0F8];
    MEMORY[0x1F41817F8]();
  }
}

- (REMTemplateChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 changedKeysObserver:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    v18.receiver = self;
    v18.super_class = (Class)REMTemplateChangeItem;
    v13 = [(REMTemplateChangeItem *)&v18 init];
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_saveRequest, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    v16 = +[REMLogStore write];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[REMTemplateChangeItem initWithSaveRequest:storage:changedKeysObserver:]((uint64_t)self, a2);
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "storage");
    v15 = 0;
  }

  return v15;
}

- (REMTemplateChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 observeInitialValues:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = (void *)[a4 copy];
  id v10 = [REMChangedKeysObserver alloc];
  id v11 = [(REMChangedKeysObserver *)v10 initWithTarget:v9 keysToObserve:__sKeysToObserve_1 includeInitial:v5];
  id v12 = [(REMTemplateChangeItem *)self initWithSaveRequest:v8 storage:v9 changedKeysObserver:v11];

  return v12;
}

- (REMTemplateChangeItem)initWithObjectID:(id)a3 name:(id)a4 configuration:(id)a5 insertIntoAccountChangeItem:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 capabilities];
  LOBYTE(a3) = [v14 supportsTemplates];

  if ((a3 & 1) == 0)
  {
    v28 = +[REMLogStore write];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[REMTemplateChangeItem initWithObjectID:name:configuration:insertIntoAccountChangeItem:](v10, v28);
    }
  }
  v15 = [REMTemplateStorage alloc];
  v16 = [v10 objectID];
  v17 = [(REMTemplateStorage *)v15 initWithObjectID:v13 accountID:v16 name:v12];

  objc_super v18 = [v10 objectID];
  [(REMTemplateStorage *)v17 setParentAccountID:v18];

  [(REMTemplateStorage *)v17 setConfiguration:v11];
  id v19 = +[REMManualOrdering newObjectID];
  v20 = [REMManualOrdering alloc];
  v21 = [v13 uuid];

  v22 = [v21 UUIDString];
  v23 = objc_opt_new();
  v24 = [(REMManualOrdering *)v20 initWithObjectID:v19 listType:6 listID:v22 modifiedDate:v23];

  [(REMTemplateStorage *)v17 setUnsavedManualOrdering:v24];
  v25 = [v10 saveRequest];
  v26 = [(REMTemplateChangeItem *)self initWithSaveRequest:v25 storage:v17 observeInitialValues:1];

  return v26;
}

- (id)changedKeys
{
  v2 = [(REMTemplateChangeItem *)self changedKeysObserver];
  v3 = [v2 changedKeys];

  return v3;
}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  v3 = (void *)__resolutionTokenKeyDenylist_0;
  id v4 = a3;
  if ([v3 containsObject:v4]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (REMAccountCapabilities)accountCapabilities
{
  v2 = [(REMTemplateChangeItem *)self storage];
  v3 = [v2 accountCapabilities];

  return (REMAccountCapabilities *)v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(REMTemplateChangeItem *)self storage];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMTemplateChangeItem;
  if (-[REMTemplateChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    BOOL v5 = [(REMTemplateChangeItem *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMTemplateChangeItem *)self saveRequest];
  int v9 = [v8 isSaved];

  if (v9)
  {
    id v10 = +[REMLogStore write];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_INFO, "REMSaveRequest.isSaved MUST be FALSE", v12, 2u);
    }
  }
  id v11 = [(REMTemplateChangeItem *)self storage];
  [v11 setValue:v7 forKey:v6];
}

- (void)setBadge:(id)a3
{
  id v4 = [a3 rawValue];
  [(REMTemplateChangeItem *)self setBadgeEmblem:v4];
}

- (REMListBadge)badge
{
  v2 = [(REMTemplateChangeItem *)self badgeEmblem];
  if (v2) {
    v3 = [[REMListBadge alloc] initWithRawValue:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

+ (id)newObjectID
{
  return +[REMTemplateStorage newObjectID];
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMTemplateStorage objectIDWithUUID:a3];
}

+ (NSString)cdEntityName
{
  return +[REMTemplateStorage cdEntityName];
}

- (BOOL)isUnsupported
{
  v2 = [(REMTemplateChangeItem *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (id)shallowCopyWithSaveRequest:(id)a3
{
  id v5 = a3;
  id v6 = [(REMTemplateChangeItem *)self storage];

  if (v6)
  {
    id v7 = [REMTemplateChangeItem alloc];
    id v8 = [(REMTemplateChangeItem *)self storage];
    int v9 = [(REMTemplateChangeItem *)self changedKeysObserver];
    id v10 = [(REMTemplateChangeItem *)v7 initWithSaveRequest:v5 storage:v8 changedKeysObserver:v9];
  }
  else
  {
    id v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[REMTemplateChangeItem shallowCopyWithSaveRequest:]((uint64_t)self, a2);
    }

    id v10 = [(REMTemplateChangeItem *)self storage];

    if (v10) {
      id v10 = 0;
    }
    else {
      NSLog(&cfstr_SIsUnexpectedl.isa, "self.storage");
    }
  }

  return v10;
}

- (void)removeFromParentAccount
{
}

- (REMTemplateSectionContextChangeItem)sectionsContextChangeItem
{
  char v3 = [(REMTemplateChangeItem *)self accountCapabilities];
  int v4 = [v3 supportsSections];

  if (v4) {
    id v5 = [[REMTemplateSectionContextChangeItem alloc] initWithTemplateChangeItem:self];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMTemplateStorage)storage
{
  return self->_storage;
}

- (REMChangedKeysObserver)changedKeysObserver
{
  return self->_changedKeysObserver;
}

- (void)setChangedKeysObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedKeysObserver, 0);
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_saveRequest, 0);
}

- (void)initWithSaveRequest:(uint64_t)a1 storage:(const char *)a2 changedKeysObserver:.cold.1(uint64_t a1, const char *a2)
{
  char v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = NSStringFromSelector(a2);
  id v7 = [v3 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v8, v9, "[%{public}@] Passing in nil '%s'", v10, v11, v12, v13, (uint64_t)v5, (uint64_t)v6, v14);
}

- (void)initWithObjectID:(void *)a1 name:(NSObject *)a2 configuration:insertIntoAccountChangeItem:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v3 = [a1 remObjectID];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!accountChangeItem.capabilities.supportsTemplates) -- Attempt to create REMTemplateChangeItem into account not supporting templates {account: %{public}@}", (uint8_t *)&v4, 0xCu);
}

- (void)shallowCopyWithSaveRequest:(uint64_t)a1 .cold.1(uint64_t a1, const char *a2)
{
  char v3 = NSString;
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = NSStringFromSelector(a2);
  id v7 = [v3 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v8, v9, "[%{public}@] Passing in nil '%s'", v10, v11, v12, v13, (uint64_t)v5, (uint64_t)v6, v14);
}

@end