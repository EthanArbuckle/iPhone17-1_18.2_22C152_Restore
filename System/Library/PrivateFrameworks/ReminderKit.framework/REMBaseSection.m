@interface REMBaseSection
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (void)cdEntityName;
+ (void)newObjectID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnsupported;
- (BOOL)respondsToSelector:(SEL)a3;
- (REMAccountCapabilities)accountCapabilities;
- (REMBaseSection)initWithStore:(id)a3 accountCapabilities:(id)a4 storage:(id)a5;
- (REMBaseSectionStorage)storage;
- (REMStore)store;
- (id)debugDescription;
- (id)description;
- (id)valueForUndefinedKey:(id)a3;
- (unint64_t)hash;
- (void)setStorage:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation REMBaseSection

- (REMBaseSection)initWithStore:(id)a3 accountCapabilities:(id)a4 storage:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMBaseSection;
  v12 = [(REMBaseSection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_store, a3);
    objc_storeStrong((id *)&v13->_accountCapabilities, a4);
    objc_storeStrong((id *)&v13->_storage, a5);
    -[REMBaseSectionStorage setStoreGenerationIfNeeded:](v13->_storage, "setStoreGenerationIfNeeded:", [v9 storeGeneration]);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REMBaseSection *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(REMBaseSection *)self store];
      uint64_t v8 = [(REMBaseSection *)v6 store];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        id v10 = [(REMBaseSection *)self store];
        id v11 = [(REMBaseSection *)v6 store];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_10;
        }
      }
      v14 = [(REMBaseSection *)self accountCapabilities];
      uint64_t v15 = [(REMBaseSection *)v6 accountCapabilities];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMBaseSection *)self accountCapabilities];
        v18 = [(REMBaseSection *)v6 accountCapabilities];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_10;
        }
      }
      v20 = [(REMBaseSection *)self storage];
      uint64_t v21 = [(REMBaseSection *)v6 storage];
      if (v20 == (void *)v21)
      {
        char v13 = 1;
        v22 = v20;
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(REMBaseSection *)self storage];
        v24 = [(REMBaseSection *)v6 storage];
        char v13 = [v23 isEqual:v24];
      }
      goto LABEL_16;
    }
LABEL_10:
    char v13 = 0;
LABEL_16:

    goto LABEL_17;
  }
  char v13 = 1;
LABEL_17:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(REMBaseSection *)self storage];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMBaseSection *)self storage];
  v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMBaseSection *)self storage];
  v6 = [v5 debugDescription];
  v7 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v6];

  return v7;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  v5 = [(REMBaseSection *)self storage];
  v6 = [v5 valueForKey:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)REMBaseSection;
  if (-[REMBaseSection respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(REMBaseSection *)self storage];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(REMBaseSection *)self storage];
  [v8 setValue:v7 forKey:v6];
}

+ (id)newObjectID
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  char v4 = NSStringFromClass(v3);
  v5 = NSStringFromClass((Class)a1);
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v8 = +[REMLogStore read];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[REMBaseSection newObjectID]();
    }
  }
  return +[REMBaseSectionStorage newObjectID];
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  char v6 = NSStringFromClass(v5);
  id v7 = NSStringFromClass((Class)a1);
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    id v11 = +[REMLogStore read];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[REMBaseSection objectIDWithUUID:]();
    }
  }
  id v9 = +[REMBaseSectionStorage objectIDWithUUID:v4];

  return v9;
}

+ (NSString)cdEntityName
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = NSStringFromClass((Class)a1);
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v9 = +[REMLogStore read];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[REMBaseSection cdEntityName]();
    }
  }
  id v7 = +[REMBaseSectionStorage cdEntityName];

  return (NSString *)v7;
}

- (BOOL)isUnsupported
{
  v2 = [(REMBaseSection *)self storage];
  char v3 = [v2 isUnsupported];

  return v3;
}

- (REMStore)store
{
  return self->_store;
}

- (REMBaseSectionStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (REMAccountCapabilities)accountCapabilities
{
  return self->_accountCapabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountCapabilities, 0);
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

+ (void)newObjectID
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSection class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage newObjectID]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, 2u);
}

+ (void)objectIDWithUUID:.cold.1()
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSection class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage objectIDWithUUID:]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, 2u);
}

+ (void)cdEntityName
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSection class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage cdEntityName]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, 2u);
}

@end