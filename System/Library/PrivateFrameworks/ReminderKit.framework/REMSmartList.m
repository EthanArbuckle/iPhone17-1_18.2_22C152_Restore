@interface REMSmartList
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOriginOfExistingTemplate;
- (BOOL)isPinned;
- (BOOL)isUnsupported;
- (BOOL)respondsToSelector:(SEL)a3;
- (REMAccount)account;
- (REMAccountCapabilities)accountCapabilities;
- (REMList)parentList;
- (REMSmartList)initWithStore:(id)a3 account:(id)a4 parentList:(id)a5 storage:(id)a6;
- (REMSmartList)initWithStore:(id)a3 storage:(id)a4;
- (REMSmartListCustomContext)customContext;
- (REMSmartListSectionContext)sectionContext;
- (REMSmartListStorage)storage;
- (REMStore)store;
- (id)debugDescription;
- (id)description;
- (id)optionalObjectID;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)customContext;
- (void)setAccount:(id)a3;
- (void)setParentList:(id)a3;
- (void)setStorage:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation REMSmartList

- (REMSmartList)initWithStore:(id)a3 storage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMSmartList;
  v9 = [(REMSmartList *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_storage, a4);
    -[REMSmartListStorage setStoreGenerationIfNeeded:](v10->_storage, "setStoreGenerationIfNeeded:", [v7 storeGeneration]);
  }

  return v10;
}

- (REMSmartList)initWithStore:(id)a3 account:(id)a4 parentList:(id)a5 storage:(id)a6
{
  v10 = (REMAccount *)a4;
  v11 = (REMList *)a5;
  objc_super v12 = [(REMSmartList *)self initWithStore:a3 storage:a6];
  account = v12->_account;
  v12->_account = v10;
  v14 = v10;

  parentList = v12->_parentList;
  v12->_parentList = v11;

  return v12;
}

- (id)optionalObjectID
{
  v2 = [(REMSmartList *)self storage];
  v3 = [v2 optionalObjectID];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  v5 = [(REMSmartList *)self store];
  uint64_t v6 = [v4 store];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    id v8 = [(REMSmartList *)self store];
    v9 = [v4 store];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_12;
    }
  }
  v11 = [(REMSmartList *)self account];
  uint64_t v12 = [v4 account];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    v14 = [(REMSmartList *)self account];
    v15 = [v4 account];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  v17 = [(REMSmartList *)self parentList];
  uint64_t v18 = [v4 parentList];
  if (v17 == (void *)v18)
  {
  }
  else
  {
    v19 = (void *)v18;
    v20 = [(REMSmartList *)self parentList];
    v21 = [v4 parentList];
    int v22 = [v20 isEqual:v21];

    if (!v22)
    {
LABEL_12:
      char v23 = 0;
      goto LABEL_13;
    }
  }
  v25 = [(REMSmartList *)self storage];
  uint64_t v26 = [v4 storage];
  if (v25 == (void *)v26)
  {
    char v23 = 1;
    v27 = v25;
  }
  else
  {
    v27 = (void *)v26;
    v28 = [(REMSmartList *)self storage];
    v29 = [v4 storage];
    char v23 = [v28 isEqual:v29];
  }
LABEL_13:

  return v23;
}

- (unint64_t)hash
{
  v2 = [(REMSmartList *)self storage];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMSmartList *)self storage];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMSmartList *)self storage];
  uint64_t v6 = [v5 debugDescription];
  id v7 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v6];

  return v7;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  v5 = [(REMSmartList *)self storage];
  uint64_t v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMSmartList;
  if (-[REMSmartList respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(REMSmartList *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMSmartList *)self storage];
  [v8 setValue:v7 forKey:v6];
}

- (REMAccountCapabilities)accountCapabilities
{
  v2 = [(REMSmartList *)self storage];
  unint64_t v3 = [v2 accountCapabilities];

  return (REMAccountCapabilities *)v3;
}

- (BOOL)isPinned
{
  v2 = [(REMSmartList *)self pinnedDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isOriginOfExistingTemplate
{
  v2 = [(REMSmartList *)self mostRecentTargetTemplateIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)newObjectID
{
  return +[REMSmartListStorage newObjectID];
}

+ (id)objectIDWithUUID:(id)a3
{
  return +[REMSmartListStorage objectIDWithUUID:a3];
}

+ (NSString)cdEntityName
{
  return +[REMSmartListStorage cdEntityName];
}

- (BOOL)isUnsupported
{
  v2 = [(REMSmartList *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (REMSmartListCustomContext)customContext
{
  char v3 = [(REMSmartList *)self smartListType];
  int v4 = [v3 isEqualToString:@"com.apple.reminders.smartlist.custom"];

  if (v4)
  {
    v5 = [(REMSmartList *)self account];

    if (!v5)
    {
      v11 = +[REMLogStore read];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[REMSmartList customContext](v11);
      }
    }
    id v6 = [REMSmartListCustomContext alloc];
    id v7 = [(REMSmartList *)self account];
    id v8 = [(REMSmartList *)self parentList];
    v9 = [(REMSmartListCustomContext *)v6 initWithSmartList:self account:v7 parentList:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (REMSmartListSectionContext)sectionContext
{
  char v3 = [(REMSmartList *)self account];
  int v4 = [v3 capabilities];
  int v5 = [v4 supportsSections];

  if (v5) {
    id v6 = [[REMSmartListSectionContext alloc] initWithSmartList:self];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (REMStore)store
{
  return self->_store;
}

- (REMSmartListStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (REMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (REMList)parentList
{
  return self->_parentList;
}

- (void)setParentList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentList, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

- (void)customContext
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "self.account";
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!self.account) -- invalid nil value for '%s'", (uint8_t *)&v1, 0xCu);
}

@end