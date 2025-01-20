@interface REMBaseSectionChangeItem
+ (id)cdEntityName;
+ (id)keysToObserve;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (void)cdEntityName;
+ (void)initialize;
+ (void)newObjectID;
- (BOOL)isUnsupported;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSString)description;
- (REMAccountCapabilities)accountCapabilities;
- (REMBaseSectionChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 changedKeysObserver:(id)a6;
- (REMBaseSectionChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 observeInitialValues:(BOOL)a6;
- (REMBaseSectionStorage)storage;
- (REMChangedKeysObserver)changedKeysObserver;
- (REMSaveRequest)saveRequest;
- (id)changedKeys;
- (id)resolutionTokenKeyForChangedKey:(id)a3;
- (id)shallowCopyWithSaveRequest:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (void)accountCapabilities;
- (void)setChangedKeysObserver:(id)a3;
- (void)setStorage:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation REMBaseSectionChangeItem

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __resolutionTokenKeyDenylist_1 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F136C140];
    MEMORY[0x1F41817F8]();
  }
}

+ (id)keysToObserve
{
  if (keysToObserve_onceToken_0 != -1) {
    dispatch_once(&keysToObserve_onceToken_0, &__block_literal_global_20);
  }
  v2 = (void *)keysToObserve___sKeysToObserve_0;

  return v2;
}

void __41__REMBaseSectionChangeItem_keysToObserve__block_invoke()
{
  v0 = (void *)keysToObserve___sKeysToObserve_0;
  keysToObserve___sKeysToObserve_0 = (uint64_t)&unk_1F136C158;
}

- (REMBaseSectionChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 changedKeysObserver:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v13)
  {
    v23.receiver = self;
    v23.super_class = (Class)REMBaseSectionChangeItem;
    v16 = [(REMBaseSectionChangeItem *)&v23 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_saveRequest, a3);
      objc_storeStrong((id *)&v17->_storage, a4);
      objc_storeStrong((id *)&v17->_changedKeysObserver, a6);
      saveRequest = v17->_saveRequest;
      v19 = [(REMBaseSectionStorage *)v17->_storage objectID];
      [(REMSaveRequest *)saveRequest _trackAccountCapabilities:v14 forObjectID:v19];
    }
    self = v17;
    v20 = self;
  }
  else
  {
    v21 = +[REMLogStore write];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[REMTemplateChangeItem initWithSaveRequest:storage:changedKeysObserver:]((uint64_t)self, a2);
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "storage");
    v20 = 0;
  }

  return v20;
}

- (REMBaseSectionChangeItem)initWithSaveRequest:(id)a3 storage:(id)a4 accountCapabilities:(id)a5 observeInitialValues:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_6:
    NSLog(&cfstr_SIsUnexpectedl.isa, "storage");
    if (v12) {
      goto LABEL_4;
    }
LABEL_7:
    NSLog(&cfstr_SIsUnexpectedl.isa, "accountCapabilities");
    goto LABEL_4;
  }
  NSLog(&cfstr_SIsUnexpectedl.isa, "saveRequest");
  if (!v11) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v12) {
    goto LABEL_7;
  }
LABEL_4:
  id v13 = (void *)[v11 copy];
  id v14 = [REMChangedKeysObserver alloc];
  id v15 = [(id)objc_opt_class() keysToObserve];
  v16 = [(REMChangedKeysObserver *)v14 initWithTarget:v13 keysToObserve:v15 includeInitial:v6];

  v17 = [(REMBaseSectionChangeItem *)self initWithSaveRequest:v10 storage:v13 accountCapabilities:v12 changedKeysObserver:v16];
  return v17;
}

- (REMAccountCapabilities)accountCapabilities
{
  uint64_t v3 = [(REMBaseSectionChangeItem *)self storage];
  if (!v3) {
    goto LABEL_3;
  }
  v4 = (void *)v3;
  v5 = [(REMBaseSectionChangeItem *)self saveRequest];
  BOOL v6 = [(REMBaseSectionChangeItem *)self objectID];
  v7 = [v5 _trackedAccountCapabilitiesForObjectID:v6];

  if (!v7)
  {
LABEL_3:
    v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMBaseSectionChangeItem accountCapabilities](self);
    }

    v7 = [[REMAccountCapabilities alloc] initWithAccountType:0];
  }

  return v7;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMBaseSectionChangeItem *)self storage];
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

+ (id)newObjectID
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = NSStringFromClass((Class)a1);
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v8 = +[REMLogStore write];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[REMBaseSectionChangeItem newObjectID]();
    }
  }
  return +[REMBaseSectionStorage newObjectID];
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  char v6 = NSStringFromClass(v5);
  v7 = NSStringFromClass((Class)a1);
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    id v11 = +[REMLogStore write];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[REMBaseSectionChangeItem objectIDWithUUID:]();
    }
  }
  v9 = +[REMBaseSectionStorage objectIDWithUUID:v4];

  return v9;
}

+ (id)cdEntityName
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = NSStringFromClass((Class)a1);
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v9 = +[REMLogStore write];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[REMBaseSectionChangeItem cdEntityName]();
    }
  }
  v7 = +[REMBaseSectionStorage cdEntityName];

  return v7;
}

- (BOOL)isUnsupported
{
  v2 = [(REMBaseSectionChangeItem *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (id)resolutionTokenKeyForChangedKey:(id)a3
{
  char v3 = (void *)__resolutionTokenKeyDenylist_1;
  id v4 = a3;
  if ([v3 containsObject:v4]) {
    v5 = 0;
  }
  else {
    v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (id)shallowCopyWithSaveRequest:(id)a3
{
  id v5 = a3;
  id v6 = [(REMBaseSectionChangeItem *)self storage];

  if (v6)
  {
    v7 = [(REMBaseSectionChangeItem *)self objectID];
    char v8 = [v5 _trackedAccountCapabilitiesForObjectID:v7];

    if (v8)
    {
LABEL_16:
      id v13 = objc_alloc((Class)objc_opt_class());
      id v14 = [(REMBaseSectionChangeItem *)self storage];
      id v15 = [(REMBaseSectionChangeItem *)self changedKeysObserver];
      id v12 = (void *)[v13 initWithSaveRequest:v5 storage:v14 accountCapabilities:v8 changedKeysObserver:v15];

      goto LABEL_17;
    }
    v9 = [(REMBaseSectionChangeItem *)self objectID];

    if (v9)
    {
      if (!v5)
      {
LABEL_15:
        char v8 = [[REMAccountCapabilities alloc] initWithAccountType:0];
        goto LABEL_16;
      }
      id v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        [(REMReminderChangeItem *)self shallowCopyWithSaveRequest:v10];
      }
    }
    else
    {
      id v10 = +[REMLogStore write];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[REMBaseSectionChangeItem shallowCopyWithSaveRequest:]((uint64_t)self, a2);
      }
    }

    goto LABEL_15;
  }
  id v11 = +[REMLogStore write];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    -[REMTemplateChangeItem shallowCopyWithSaveRequest:]((uint64_t)self, a2);
  }

  id v12 = [(REMBaseSectionChangeItem *)self storage];

  if (v12) {
    id v12 = 0;
  }
  else {
    NSLog(&cfstr_SIsUnexpectedl.isa, "self.storage");
  }
LABEL_17:

  return v12;
}

- (id)changedKeys
{
  v2 = [(REMBaseSectionChangeItem *)self changedKeysObserver];
  char v3 = [v2 changedKeys];

  return v3;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  id v5 = [(REMBaseSectionChangeItem *)self storage];
  id v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMBaseSectionChangeItem;
  if (-[REMBaseSectionChangeItem respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(REMBaseSectionChangeItem *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(REMBaseSectionChangeItem *)self saveRequest];
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
  id v11 = [(REMBaseSectionChangeItem *)self storage];
  [v11 setValue:v7 forKey:v6];
}

- (REMSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (REMBaseSectionStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
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

- (void)accountCapabilities
{
  v1 = [a1 objectID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "trackedAccountCapabilities is unexpectedly nil when getting baseSectionChangeItem.accountCapabilities {objectID: %{public}@}", v4, v5, v6, v7, v8);
}

+ (void)newObjectID
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSectionChangeItem class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage newObjectID]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, v7);
}

+ (void)objectIDWithUUID:.cold.1()
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSectionChangeItem class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage objectIDWithUUID:]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, v7);
}

+ (void)cdEntityName
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSectionChangeItem class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage cdEntityName]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, v7);
}

- (void)shallowCopyWithSaveRequest:(uint64_t)a1 .cold.2(uint64_t a1, const char *a2)
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = NSStringFromSelector(a2);
  uint8_t v7 = [v3 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v8, v9, "[%{public}@] self.objectID should not be nil when copying this change item {self: %@}", v10, v11, v12, v13, (uint64_t)v5, (uint64_t)v6, 2u);
}

@end