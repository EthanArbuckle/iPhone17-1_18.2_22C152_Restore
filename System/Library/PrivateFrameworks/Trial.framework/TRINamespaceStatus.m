@interface TRINamespaceStatus
+ (BOOL)supportsSecureCoding;
+ (id)statusFromData:(id)a3;
+ (id)statusWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 lastFetchAttempt:(id)a5 lastFetchWasSuccess:(BOOL)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStatus:(id)a3;
- (BOOL)lastFetchWasSuccess;
- (NSDate)lastFetchAttempt;
- (NSString)namespaceName;
- (TRINamespaceStatus)initWithCoder:(id)a3;
- (TRINamespaceStatus)initWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 lastFetchAttempt:(id)a5 lastFetchWasSuccess:(BOOL)a6;
- (id)asData;
- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3;
- (id)copyWithReplacementLastFetchAttempt:(id)a3;
- (id)copyWithReplacementLastFetchWasSuccess:(BOOL)a3;
- (id)copyWithReplacementNamespaceName:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)compatibilityVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRINamespaceStatus

+ (id)statusFromData:(id)a3
{
  uint64_t v16 = 0;
  v3 = +[TRIPBMessage parseFromData:a3 error:&v16];
  v4 = v3;
  if (!v3)
  {
    v6 = TRILogCategory_ClientFramework();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v15 = 0;
    v7 = "failed to parse persisted namespace status from data";
    v8 = (uint8_t *)&v15;
LABEL_12:
    _os_log_error_impl(&dword_19D909000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
    goto LABEL_13;
  }
  if (([v3 hasNamespaceName] & 1) == 0)
  {
    v6 = TRILogCategory_ClientFramework();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    __int16 v14 = 0;
    v7 = "parsed persisted namespace status from data but name is not set";
    v8 = (uint8_t *)&v14;
    goto LABEL_12;
  }
  if ([v4 hasNamespaceCompatibilityVersion])
  {
    if ([v4 hasLatestNotificationQueryLocalTime])
    {
      v5 = [v4 latestNotificationQueryLocalTime];
      v6 = [v5 date];
    }
    else
    {
      v6 = 0;
    }
    if ([v4 hasLastFetchWasSuccess]) {
      uint64_t v11 = [v4 lastFetchWasSuccess];
    }
    else {
      uint64_t v11 = 0;
    }
    v12 = [v4 namespaceName];
    v9 = +[TRINamespaceStatus statusWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:](TRINamespaceStatus, "statusWithNamespaceName:compatibilityVersion:lastFetchAttempt:lastFetchWasSuccess:", v12, [v4 namespaceCompatibilityVersion], v6, v11);

    goto LABEL_14;
  }
  v6 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = 0;
    v7 = "parsed persisted namespace status from data but compatibility version is not set";
    v8 = (uint8_t *)&v13;
    goto LABEL_12;
  }
LABEL_13:
  v9 = 0;
LABEL_14:

  return v9;
}

- (id)asData
{
  v4 = [(TRINamespaceStatus *)self namespaceName];

  if (!v4)
  {
    __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRINamespaceStatusProvider.m", 59, @"Invalid parameter not satisfying: %@", @"self.namespaceName != nil" object file lineNumber description];
  }
  v5 = objc_opt_new();
  v6 = [(TRINamespaceStatus *)self namespaceName];
  [v5 setNamespaceName:v6];

  objc_msgSend(v5, "setNamespaceCompatibilityVersion:", -[TRINamespaceStatus compatibilityVersion](self, "compatibilityVersion"));
  v7 = [(TRINamespaceStatus *)self lastFetchAttempt];

  if (v7)
  {
    v8 = objc_opt_new();
    [v5 setLatestNotificationQueryLocalTime:v8];

    v9 = [(TRINamespaceStatus *)self lastFetchAttempt];
    v10 = [v5 latestNotificationQueryLocalTime];
    [v10 setDate:v9];
  }
  objc_msgSend(v5, "setLastFetchWasSuccess:", -[TRINamespaceStatus lastFetchWasSuccess](self, "lastFetchWasSuccess"));
  uint64_t v11 = [v5 data];
  if (!v11)
  {
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"TRINamespaceStatusProvider.m" lineNumber:69 description:@"failed to serialize persisted namespace status to data"];
  }
  return v11;
}

- (TRINamespaceStatus)initWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 lastFetchAttempt:(id)a5 lastFetchWasSuccess:(BOOL)a6
{
  id v12 = a3;
  id v13 = a5;
  if (!v12)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 142, @"Invalid parameter not satisfying: %@", @"namespaceName != nil" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)TRINamespaceStatus;
  __int16 v14 = [(TRINamespaceStatus *)&v18 init];
  __int16 v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_namespaceName, a3);
    v15->_compatibilityVersion = a4;
    objc_storeStrong((id *)&v15->_lastFetchAttempt, a5);
    v15->_lastFetchWasSuccess = a6;
  }

  return v15;
}

+ (id)statusWithNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 lastFetchAttempt:(id)a5 lastFetchWasSuccess:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = (void *)[objc_alloc((Class)a1) initWithNamespaceName:v11 compatibilityVersion:v7 lastFetchAttempt:v10 lastFetchWasSuccess:v6];

  return v12;
}

- (id)copyWithReplacementNamespaceName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNamespaceName:v4 compatibilityVersion:self->_compatibilityVersion lastFetchAttempt:self->_lastFetchAttempt lastFetchWasSuccess:self->_lastFetchWasSuccess];

  return v5;
}

- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  namespaceName = self->_namespaceName;
  lastFetchAttempt = self->_lastFetchAttempt;
  BOOL lastFetchWasSuccess = self->_lastFetchWasSuccess;
  return (id)[v5 initWithNamespaceName:namespaceName compatibilityVersion:v3 lastFetchAttempt:lastFetchAttempt lastFetchWasSuccess:lastFetchWasSuccess];
}

- (id)copyWithReplacementLastFetchAttempt:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNamespaceName:self->_namespaceName compatibilityVersion:self->_compatibilityVersion lastFetchAttempt:v4 lastFetchWasSuccess:self->_lastFetchWasSuccess];

  return v5;
}

- (id)copyWithReplacementLastFetchWasSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t compatibilityVersion = self->_compatibilityVersion;
  namespaceName = self->_namespaceName;
  lastFetchAttempt = self->_lastFetchAttempt;
  return (id)[v5 initWithNamespaceName:namespaceName compatibilityVersion:compatibilityVersion lastFetchAttempt:lastFetchAttempt lastFetchWasSuccess:v3];
}

- (BOOL)isEqualToStatus:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  int v6 = self->_namespaceName != 0;
  uint64_t v7 = [v4 namespaceName];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_10;
  }
  namespaceName = self->_namespaceName;
  if (namespaceName)
  {
    id v10 = [v5 namespaceName];
    int v11 = [(NSString *)namespaceName isEqual:v10];

    if (!v11) {
      goto LABEL_10;
    }
  }
  unsigned int compatibilityVersion = self->_compatibilityVersion;
  if (compatibilityVersion != [v5 compatibilityVersion]) {
    goto LABEL_10;
  }
  int v13 = self->_lastFetchAttempt != 0;
  __int16 v14 = [v5 lastFetchAttempt];
  int v15 = v14 == 0;

  if (v13 == v15
    || (lastFetchAttempt = self->_lastFetchAttempt) != 0
    && ([v5 lastFetchAttempt],
        v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [(NSDate *)lastFetchAttempt isEqual:v17],
        v17,
        !v18))
  {
LABEL_10:
    BOOL v20 = 0;
  }
  else
  {
    int lastFetchWasSuccess = self->_lastFetchWasSuccess;
    BOOL v20 = lastFetchWasSuccess == [v5 lastFetchWasSuccess];
  }

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRINamespaceStatus *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRINamespaceStatus *)self isEqualToStatus:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_namespaceName hash];
  uint64_t v4 = self->_compatibilityVersion - v3 + 32 * v3;
  uint64_t v5 = [(NSDate *)self->_lastFetchAttempt hash];
  return self->_lastFetchWasSuccess - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRINamespaceStatus)initWithCoder:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"namespaceName"];
  if (!v5)
  {
    int v15 = [v4 error];

    if (v15) {
      goto LABEL_10;
    }
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31[0] = @"Retrieved nil serialized value for nonnull TRINamespaceStatus.namespaceName";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = 2;
LABEL_17:
    v9 = (void *)[v16 initWithDomain:@"TRINamespaceStatusOCNTErrorDomain" code:v17 userInfo:v7];
    [v4 failWithError:v9];
    goto LABEL_18;
  }
  uint64_t v6 = [v4 decodeInt64ForKey:@"compatibilityVersion"];
  if (v6) {
    goto LABEL_3;
  }
  int v18 = [v4 error];

  if (!v18)
  {
    if ([v4 containsValueForKey:@"compatibilityVersion"])
    {
LABEL_3:
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFetchAttempt"];
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v8 = (objc_class *)objc_opt_class();
          v9 = NSStringFromClass(v8);
          id v10 = (objc_class *)objc_opt_class();
          int v11 = NSStringFromClass(v10);
          id v12 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRINamespaceStatus key \"lastFetchAttempt\" (expected %@, decoded %@)", v9, v11, 0];
          uint64_t v26 = *MEMORY[0x1E4F28568];
          v27 = v12;
          int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRINamespaceStatusOCNTErrorDomain" code:3 userInfo:v13];
          [v4 failWithError:v14];

LABEL_6:
LABEL_18:

          goto LABEL_19;
        }
      }
      else
      {
        BOOL v20 = [v4 error];

        if (v20)
        {
          uint64_t v7 = 0;
LABEL_19:
          v19 = 0;
          goto LABEL_20;
        }
      }
      uint64_t v21 = [v4 decodeInt64ForKey:@"lastFetchWasSuccess"];
      if (v21) {
        goto LABEL_14;
      }
      v23 = [v4 error];

      if (v23) {
        goto LABEL_19;
      }
      if ([v4 containsValueForKey:@"lastFetchWasSuccess"])
      {
LABEL_14:
        self = [(TRINamespaceStatus *)self initWithNamespaceName:v5 compatibilityVersion:v6 lastFetchAttempt:v7 lastFetchWasSuccess:v21 != 0];
        v19 = self;
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v24 = *MEMORY[0x1E4F28568];
      v25 = @"Missing serialized value for TRINamespaceStatus.lastFetchWasSuccess";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRINamespaceStatusOCNTErrorDomain" code:1 userInfo:v9];
      [v4 failWithError:v11];
      goto LABEL_6;
    }
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29 = @"Missing serialized value for TRINamespaceStatus.compatibilityVersion";
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = 1;
    goto LABEL_17;
  }
LABEL_10:
  v19 = 0;
LABEL_21:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  namespaceName = self->_namespaceName;
  if (namespaceName) {
    [v6 encodeObject:namespaceName forKey:@"namespaceName"];
  }
  [v6 encodeInt64:self->_compatibilityVersion forKey:@"compatibilityVersion"];
  lastFetchAttempt = self->_lastFetchAttempt;
  if (lastFetchAttempt) {
    [v6 encodeObject:lastFetchAttempt forKey:@"lastFetchAttempt"];
  }
  [v6 encodeInt64:self->_lastFetchWasSuccess forKey:@"lastFetchWasSuccess"];
}

- (id)description
{
  id v3 = [NSString alloc];
  namespaceName = self->_namespaceName;
  uint64_t v5 = [NSNumber numberWithUnsignedInt:self->_compatibilityVersion];
  lastFetchAttempt = self->_lastFetchAttempt;
  uint64_t v7 = [NSNumber numberWithBool:self->_lastFetchWasSuccess];
  int v8 = (void *)[v3 initWithFormat:@"<TRINamespaceStatus | namespaceName:%@ compatibilityVersion:%@ lastFetchAttempt:%@ lastFetchWasSuccess:%@>", namespaceName, v5, lastFetchAttempt, v7];

  return v8;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (unsigned)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSDate)lastFetchAttempt
{
  return self->_lastFetchAttempt;
}

- (BOOL)lastFetchWasSuccess
{
  return self->_lastFetchWasSuccess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchAttempt, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
}

@end