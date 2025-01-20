@interface REMBaseSectionStorage
+ (BOOL)supportsSecureCoding;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
+ (void)cdEntityName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnsupported;
- (NSData)resolutionTokenMapData;
- (NSDate)creationDate;
- (NSString)displayName;
- (REMBaseSectionStorage)initWithCoder:(id)a3;
- (REMBaseSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 parentID:(id)a5 displayName:(id)a6;
- (REMObjectID)accountID;
- (REMObjectID)objectID;
- (REMObjectID)parentID;
- (REMResolutionTokenMap)resolutionTokenMap;
- (id)cdKeyToStorageKeyMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)effectiveMinimumSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)hash;
- (unint64_t)storeGeneration;
- (void)cdKeyToStorageKeyMap;
- (void)encodeWithCoder:(id)a3;
- (void)resolutionTokenMap;
- (void)setAccountID:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setObjectID:(id)a3;
- (void)setParentID:(id)a3;
- (void)setResolutionTokenMap:(id)a3;
- (void)setResolutionTokenMapData:(id)a3;
- (void)setStoreGenerationIfNeeded:(unint64_t)a3;
@end

@implementation REMBaseSectionStorage

- (REMBaseSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 parentID:(id)a5 displayName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)REMBaseSectionStorage;
  v15 = [(REMBaseSectionStorage *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_objectID, a3);
    objc_storeStrong((id *)&v16->_accountID, a4);
    objc_storeStrong((id *)&v16->_parentID, a5);
    v17 = objc_alloc_init(REMResolutionTokenMap);
    resolutionTokenMap = v16->_resolutionTokenMap;
    v16->_resolutionTokenMap = v17;

    uint64_t v19 = [MEMORY[0x1E4F1C9B8] data];
    resolutionTokenMapData = v16->_resolutionTokenMapData;
    v16->_resolutionTokenMapData = (NSData *)v19;

    objc_storeStrong((id *)&v16->_displayName, a6);
    creationDate = v16->_creationDate;
    v16->_creationDate = 0;
  }
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(REMBaseSectionStorage *)self objectID];
  v6 = [(REMBaseSectionStorage *)self accountID];
  v7 = [(REMBaseSectionStorage *)self parentID];
  v8 = [(REMBaseSectionStorage *)self displayName];
  v9 = (void *)[v4 initWithObjectID:v5 accountID:v6 parentID:v7 displayName:v8];

  v10 = [(REMBaseSectionStorage *)self creationDate];
  [v9 setCreationDate:v10];

  uint64_t v11 = [(REMResolutionTokenMap *)self->_resolutionTokenMap copy];
  id v12 = (void *)v9[10];
  v9[10] = v11;

  id v13 = [(REMBaseSectionStorage *)self resolutionTokenMapData];
  [v9 setResolutionTokenMapData:v13];

  v9[1] = self->_storeGeneration;
  v9[2] = self->_copyGeneration + 1;
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = (REMBaseSectionStorage *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(REMBaseSectionStorage *)self objectID];
      uint64_t v8 = [(REMBaseSectionStorage *)v6 objectID];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(REMBaseSectionStorage *)self objectID];
        uint64_t v11 = [(REMBaseSectionStorage *)v6 objectID];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_22;
        }
      }
      id v14 = [(REMBaseSectionStorage *)self accountID];
      uint64_t v15 = [(REMBaseSectionStorage *)v6 accountID];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMBaseSectionStorage *)self accountID];
        v18 = [(REMBaseSectionStorage *)v6 accountID];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_22;
        }
      }
      v20 = [(REMBaseSectionStorage *)self parentID];
      uint64_t v21 = [(REMBaseSectionStorage *)v6 parentID];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        objc_super v23 = [(REMBaseSectionStorage *)self parentID];
        v24 = [(REMBaseSectionStorage *)v6 parentID];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_22;
        }
      }
      v26 = [(REMBaseSectionStorage *)self displayName];
      uint64_t v27 = [(REMBaseSectionStorage *)v6 displayName];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(REMBaseSectionStorage *)self displayName];
        v30 = [(REMBaseSectionStorage *)v6 displayName];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_22;
        }
      }
      v32 = [(REMBaseSectionStorage *)self creationDate];
      uint64_t v33 = [(REMBaseSectionStorage *)v6 creationDate];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        v35 = [(REMBaseSectionStorage *)self creationDate];
        v36 = [(REMBaseSectionStorage *)v6 creationDate];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_22;
        }
      }
      if (!self->_resolutionTokenMap || v6->_resolutionTokenMap)
      {
        v39 = +[REMLogStore read];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v45 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v45);
          resolutionTokenMap = self->_resolutionTokenMap;
          v48 = v6->_resolutionTokenMap;
          int v49 = 138543874;
          v50 = v46;
          __int16 v51 = 2112;
          v52 = resolutionTokenMap;
          __int16 v53 = 2112;
          v54 = v48;
          _os_log_error_impl(&dword_1B9AA2000, v39, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v49, 0x20u);
        }
      }
      v40 = [(REMBaseSectionStorage *)self resolutionTokenMap];
      uint64_t v41 = [(REMBaseSectionStorage *)v6 resolutionTokenMap];
      if (v40 == (void *)v41)
      {
        char v13 = 1;
        v42 = v40;
      }
      else
      {
        v42 = (void *)v41;
        v43 = [(REMBaseSectionStorage *)self resolutionTokenMap];
        v44 = [(REMBaseSectionStorage *)v6 resolutionTokenMap];
        char v13 = [v43 isEqual:v44];
      }
      goto LABEL_23;
    }
LABEL_22:
    char v13 = 0;
LABEL_23:

    goto LABEL_24;
  }
  char v13 = 1;
LABEL_24:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(REMBaseSectionStorage *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMBaseSectionStorage *)self objectID];
  v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMBaseSectionStorage *)self displayName];
  v6 = [(REMBaseSectionStorage *)self objectID];
  v7 = [v3 stringWithFormat:@"<%@: %p %@ %@ [%ld.%ld]>", v4, self, v5, v6, self->_storeGeneration, self->_copyGeneration];

  return v7;
}

- (unint64_t)storeGeneration
{
  return self->_storeGeneration;
}

- (void)setStoreGenerationIfNeeded:(unint64_t)a3
{
  if (!self->_storeGeneration) {
    self->_storeGeneration = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMBaseSectionStorage)initWithCoder:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentID"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  v9 = (void *)v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v8 == 0)
  {
    int v12 = +[REMLogStore read];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      int v23 = 138544131;
      v24 = v5;
      __int16 v25 = 2114;
      v26 = v6;
      __int16 v27 = 2114;
      v28 = v7;
      __int16 v29 = 2117;
      v30 = v9;
      _os_log_fault_impl(&dword_1B9AA2000, v12, OS_LOG_TYPE_FAULT, "Attempted to decode REMBaseSectionStorage missing objectID, accountID, displayName {objectID: %{public}@, accountID:%{public}@ parentID:%{public}@ displayName: %{sensitive}@}", (uint8_t *)&v23, 0x2Au);
    }

    char v13 = 0;
  }
  else
  {
    id v14 = [(REMBaseSectionStorage *)self initWithObjectID:v5 accountID:v6 parentID:v7 displayName:v8];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMapData"];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMap"];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v14->_resolutionTokenMap, v16);
      resolutionTokenMapData = v14->_resolutionTokenMapData;
      v14->_resolutionTokenMapData = 0;
    }
    else
    {
      resolutionTokenMap = v14->_resolutionTokenMap;
      v14->_resolutionTokenMap = 0;

      v20 = v15;
      resolutionTokenMapData = v14->_resolutionTokenMapData;
      v14->_resolutionTokenMapData = v20;
    }

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    [(REMBaseSectionStorage *)v14 setCreationDate:v21];

    self = v14;
    char v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(REMBaseSectionStorage *)self objectID];
  [v11 encodeObject:v4 forKey:@"objectID"];

  v5 = [(REMBaseSectionStorage *)self accountID];
  [v11 encodeObject:v5 forKey:@"accountID"];

  v6 = [(REMBaseSectionStorage *)self parentID];
  [v11 encodeObject:v6 forKey:@"parentID"];

  v7 = [(REMBaseSectionStorage *)self displayName];
  [v11 encodeObject:v7 forKey:@"displayName"];

  uint64_t v8 = [(REMBaseSectionStorage *)self creationDate];
  [v11 encodeObject:v8 forKey:@"creationDate"];

  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    [v11 encodeObject:resolutionTokenMap forKey:@"resolutionTokenMap"];
    [v11 encodeObject:0 forKey:@"resolutionTokenMapData"];
  }
  else
  {
    [v11 encodeObject:0 forKey:@"resolutionTokenMap"];
    BOOL v10 = [(REMBaseSectionStorage *)self resolutionTokenMapData];
    [v11 encodeObject:v10 forKey:@"resolutionTokenMapData"];
  }
}

+ (id)newObjectID
{
  unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [a1 cdEntityName];
  v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = NSStringFromClass((Class)a1);
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = +[REMLogStore read];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[REMBaseSectionStorage cdEntityName]();
    }
  }
  return (NSString *)@"REMCDBaseSection";
}

- (BOOL)isUnsupported
{
  uint64_t v2 = [(REMBaseSectionStorage *)self effectiveMinimumSupportedVersion];

  return rem_isUnsupportedVersionByRuntime(v2);
}

- (id)cdKeyToStorageKeyMap
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  unint64_t v3 = NSStringFromClass(v2);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  char v6 = [v3 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = +[REMLogStore read];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[REMBaseSectionStorage cdKeyToStorageKeyMap]();
    }
  }
  return (id)MEMORY[0x1E4F1CC08];
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  p_resolutionTokenMap = &self->_resolutionTokenMap;
  id v4 = self->_resolutionTokenMap;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    char v6 = [(REMBaseSectionStorage *)self resolutionTokenMapData];
    if (!v6)
    {
      v7 = +[REMLogStore read];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(REMBaseSectionStorage *)(uint64_t)self resolutionTokenMap];
      }
    }
    uint64_t v8 = [(REMBaseSectionStorage *)self cdKeyToStorageKeyMap];
    v9 = +[REMResolutionTokenMap resolutionTokenMapWithJSONData:v6 keyMap:v8];

    objc_storeStrong((id *)p_resolutionTokenMap, v9);
    v5 = v9;
  }

  return v5;
}

- (int64_t)minimumSupportedVersion
{
  return self->minimumSupportedVersion;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  self->minimumSupportedVersion = a3;
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return self->effectiveMinimumSupportedVersion;
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  self->effectiveMinimumSupportedVersion = a3;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (REMObjectID)parentID
{
  return self->_parentID;
}

- (void)setParentID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (void)setResolutionTokenMap:(id)a3
{
}

- (NSData)resolutionTokenMapData
{
  return self->_resolutionTokenMapData;
}

- (void)setResolutionTokenMapData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionTokenMapData, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMap, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

+ (void)cdEntityName
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSectionStorage class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage cdEntityName]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, 2u);
}

- (void)cdKeyToStorageKeyMap
{
  v0 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSectionStorage class]) isEqualToString:NSStringFromClass([self class])]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage cdKeyToStorageKeyMap]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, 2u);
}

- (void)resolutionTokenMap
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Nil resolutionTokenMapData when reading resolutionTokenMap from account storage. Initialize an empty map {list: %@}", (uint8_t *)&v2, 0xCu);
}

@end