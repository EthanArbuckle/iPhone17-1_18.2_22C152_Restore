@interface TRIDynamicNamespaceRecord
+ (BOOL)supportsSecureCoding;
+ (id)dynamicNamespaceRecordWithName:(id)a3 teamId:(id)a4 appContainer:(id)a5 cloudKitContainer:(int)a6 compatibilityVersion:(unsigned int)a7 defaultsFileURL:(id)a8 hasFetched:(BOOL)a9;
- (BOOL)hasFetched;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDynamicNamespaceRecord:(id)a3;
- (NSString)name;
- (NSString)teamId;
- (NSURL)defaultsFileURL;
- (TRIAppContainer)appContainer;
- (TRIDynamicNamespaceRecord)initWithCoder:(id)a3;
- (TRIDynamicNamespaceRecord)initWithName:(id)a3 teamId:(id)a4 appContainer:(id)a5 cloudKitContainer:(int)a6 compatibilityVersion:(unsigned int)a7 defaultsFileURL:(id)a8 hasFetched:(BOOL)a9;
- (id)copyWithReplacementAppContainer:(id)a3;
- (id)copyWithReplacementCloudKitContainer:(int)a3;
- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3;
- (id)copyWithReplacementDefaultsFileURL:(id)a3;
- (id)copyWithReplacementHasFetched:(BOOL)a3;
- (id)copyWithReplacementName:(id)a3;
- (id)copyWithReplacementTeamId:(id)a3;
- (id)description;
- (int)cloudKitContainer;
- (unint64_t)hash;
- (unsigned)compatibilityVersion;
- (void)defaultEncodeWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIDynamicNamespaceRecord

- (TRIDynamicNamespaceRecord)initWithName:(id)a3 teamId:(id)a4 appContainer:(id)a5 cloudKitContainer:(int)a6 compatibilityVersion:(unsigned int)a7 defaultsFileURL:(id)a8 hasFetched:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_8:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 60, @"Invalid parameter not satisfying: %@", @"teamId != nil" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 59, @"Invalid parameter not satisfying: %@", @"name != nil" object file lineNumber description];

  if (!v16) {
    goto LABEL_8;
  }
LABEL_3:
  if (v17) {
    goto LABEL_4;
  }
LABEL_9:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 61, @"Invalid parameter not satisfying: %@", @"appContainer != nil" object file lineNumber description];

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)TRIDynamicNamespaceRecord;
  v19 = [(TRIDynamicNamespaceRecord *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_name, a3);
    objc_storeStrong((id *)&v20->_teamId, a4);
    objc_storeStrong((id *)&v20->_appContainer, a5);
    v20->_cloudKitContainer = a6;
    v20->_compatibilityVersion = a7;
    objc_storeStrong((id *)&v20->_defaultsFileURL, a8);
    v20->_hasFetched = a9;
  }

  return v20;
}

+ (id)dynamicNamespaceRecordWithName:(id)a3 teamId:(id)a4 appContainer:(id)a5 cloudKitContainer:(int)a6 compatibilityVersion:(unsigned int)a7 defaultsFileURL:(id)a8 hasFetched:(BOOL)a9
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v10 = *(void *)&a6;
  id v15 = a8;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  LOBYTE(v21) = a9;
  v19 = (void *)[objc_alloc((Class)a1) initWithName:v18 teamId:v17 appContainer:v16 cloudKitContainer:v10 compatibilityVersion:v9 defaultsFileURL:v15 hasFetched:v21];

  return v19;
}

- (id)copyWithReplacementName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_hasFetched;
  v6 = (void *)[v5 initWithName:v4 teamId:self->_teamId appContainer:self->_appContainer cloudKitContainer:self->_cloudKitContainer compatibilityVersion:self->_compatibilityVersion defaultsFileURL:self->_defaultsFileURL hasFetched:v8];

  return v6;
}

- (id)copyWithReplacementTeamId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_hasFetched;
  v6 = (void *)[v5 initWithName:self->_name teamId:v4 appContainer:self->_appContainer cloudKitContainer:self->_cloudKitContainer compatibilityVersion:self->_compatibilityVersion defaultsFileURL:self->_defaultsFileURL hasFetched:v8];

  return v6;
}

- (id)copyWithReplacementAppContainer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_hasFetched;
  v6 = (void *)[v5 initWithName:self->_name teamId:self->_teamId appContainer:v4 cloudKitContainer:self->_cloudKitContainer compatibilityVersion:self->_compatibilityVersion defaultsFileURL:self->_defaultsFileURL hasFetched:v8];

  return v6;
}

- (id)copyWithReplacementCloudKitContainer:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_hasFetched;
  return (id)[v5 initWithName:self->_name teamId:self->_teamId appContainer:self->_appContainer cloudKitContainer:v3 compatibilityVersion:self->_compatibilityVersion defaultsFileURL:self->_defaultsFileURL hasFetched:v7];
}

- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v7) = self->_hasFetched;
  return (id)[v5 initWithName:self->_name teamId:self->_teamId appContainer:self->_appContainer cloudKitContainer:self->_cloudKitContainer compatibilityVersion:v3 defaultsFileURL:self->_defaultsFileURL hasFetched:v7];
}

- (id)copyWithReplacementDefaultsFileURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v8) = self->_hasFetched;
  v6 = (void *)[v5 initWithName:self->_name teamId:self->_teamId appContainer:self->_appContainer cloudKitContainer:self->_cloudKitContainer compatibilityVersion:self->_compatibilityVersion defaultsFileURL:v4 hasFetched:v8];

  return v6;
}

- (id)copyWithReplacementHasFetched:(BOOL)a3
{
  LOBYTE(v4) = a3;
  return (id)[objc_alloc((Class)objc_opt_class()) initWithName:self->_name teamId:self->_teamId appContainer:self->_appContainer cloudKitContainer:self->_cloudKitContainer compatibilityVersion:self->_compatibilityVersion defaultsFileURL:self->_defaultsFileURL hasFetched:v4];
}

- (BOOL)isEqualToDynamicNamespaceRecord:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_17;
  }
  int v6 = self->_name != 0;
  uint64_t v7 = [v4 name];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_17;
  }
  name = self->_name;
  if (name)
  {
    uint64_t v10 = [v5 name];
    int v11 = [(NSString *)name isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  int v12 = self->_teamId != 0;
  v13 = [v5 teamId];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_17;
  }
  teamId = self->_teamId;
  if (teamId)
  {
    id v16 = [v5 teamId];
    int v17 = [(NSString *)teamId isEqual:v16];

    if (!v17) {
      goto LABEL_17;
    }
  }
  int v18 = self->_appContainer != 0;
  v19 = [v5 appContainer];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_17;
  }
  appContainer = self->_appContainer;
  if (appContainer)
  {
    v22 = [v5 appContainer];
    int v23 = [(TRIAppContainer *)appContainer isEqual:v22];

    if (!v23) {
      goto LABEL_17;
    }
  }
  int cloudKitContainer = self->_cloudKitContainer;
  if (cloudKitContainer != [v5 cloudKitContainer]) {
    goto LABEL_17;
  }
  unsigned int compatibilityVersion = self->_compatibilityVersion;
  if (compatibilityVersion != [v5 compatibilityVersion]) {
    goto LABEL_17;
  }
  int v26 = self->_defaultsFileURL != 0;
  objc_super v27 = [v5 defaultsFileURL];
  int v28 = v27 == 0;

  if (v26 == v28
    || (defaultsFileURL = self->_defaultsFileURL) != 0
    && ([v5 defaultsFileURL],
        v30 = objc_claimAutoreleasedReturnValue(),
        int v31 = [(NSURL *)defaultsFileURL isEqual:v30],
        v30,
        !v31))
  {
LABEL_17:
    BOOL v33 = 0;
  }
  else
  {
    int hasFetched = self->_hasFetched;
    BOOL v33 = hasFetched == [v5 hasFetched];
  }

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIDynamicNamespaceRecord *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIDynamicNamespaceRecord *)self isEqualToDynamicNamespaceRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_teamId hash] - v3 + 32 * v3;
  uint64_t v5 = [(TRIAppContainer *)self->_appContainer hash];
  uint64_t v6 = self->_cloudKitContainer - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  uint64_t v7 = self->_compatibilityVersion - v6 + 32 * v6;
  uint64_t v8 = [(NSURL *)self->_defaultsFileURL hash];
  return self->_hasFetched - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIDynamicNamespaceRecord)initWithCoder:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamId"];
    if (!v6)
    {
      id v15 = [v4 error];

      if (v15)
      {
        uint64_t v6 = 0;
        v13 = 0;
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43 = @"Retrieved nil serialized value for nonnull TRIDynamicNamespaceRecord.teamId";
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      int v11 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIDynamicNamespaceRecordOCNTErrorDomain" code:2 userInfo:v8];
      [v4 failWithError:v11];
      goto LABEL_30;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v16 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v16);
      int v17 = (objc_class *)objc_opt_class();
      int v11 = NSStringFromClass(v17);
      int v18 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIDynamicNamespaceRecord key \"teamId\" (expected %@, decoded %@)", v8, v11, 0];
      uint64_t v40 = *MEMORY[0x1E4F28568];
      v41 = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      int v20 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIDynamicNamespaceRecordOCNTErrorDomain" code:3 userInfo:v19];
      [v4 failWithError:v20];

LABEL_15:
LABEL_16:

LABEL_30:
      v13 = 0;
      goto LABEL_31;
    }
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appContainer"];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [v4 decodeInt64ForKey:@"cloudKitContainer"];
      if (!v9)
      {
        v22 = [v4 error];

        if (v22) {
          goto LABEL_25;
        }
        if (([v4 containsValueForKey:@"cloudKitContainer"] & 1) == 0)
        {
          uint64_t v36 = *MEMORY[0x1E4F28568];
          v37 = @"Missing serialized value for TRIDynamicNamespaceRecord.cloudKitContainer";
          int v23 = (void *)MEMORY[0x1E4F1C9E8];
          v24 = &v37;
          v25 = &v36;
          goto LABEL_37;
        }
      }
      uint64_t v10 = [v4 decodeInt64ForKey:@"compatibilityVersion"];
      if (v10) {
        goto LABEL_7;
      }
      int v26 = [v4 error];

      if (!v26)
      {
        if ([v4 containsValueForKey:@"compatibilityVersion"])
        {
LABEL_7:
          int v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultsFileURL"];
          if (!v11)
          {
            int v28 = [v4 error];

            if (v28)
            {
              int v11 = 0;
              goto LABEL_30;
            }
          }
          uint64_t v12 = [v4 decodeInt64ForKey:@"hasFetched"];
          if (v12) {
            goto LABEL_9;
          }
          v29 = [v4 error];

          if (v29) {
            goto LABEL_30;
          }
          if ([v4 containsValueForKey:@"hasFetched"])
          {
LABEL_9:
            LOBYTE(v31) = v12 != 0;
            self = [(TRIDynamicNamespaceRecord *)self initWithName:v5 teamId:v6 appContainer:v8 cloudKitContainer:v9 compatibilityVersion:v10 defaultsFileURL:v11 hasFetched:v31];
            v13 = self;
LABEL_31:

            goto LABEL_32;
          }
          uint64_t v32 = *MEMORY[0x1E4F28568];
          BOOL v33 = @"Missing serialized value for TRIDynamicNamespaceRecord.hasFetched";
          int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIDynamicNamespaceRecordOCNTErrorDomain" code:1 userInfo:v18];
          [v4 failWithError:v19];
          goto LABEL_15;
        }
        uint64_t v34 = *MEMORY[0x1E4F28568];
        v35 = @"Missing serialized value for TRIDynamicNamespaceRecord.compatibilityVersion";
        int v23 = (void *)MEMORY[0x1E4F1C9E8];
        v24 = &v35;
        v25 = &v34;
LABEL_37:
        int v11 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:1];
        int v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIDynamicNamespaceRecordOCNTErrorDomain" code:1 userInfo:v11];
        [v4 failWithError:v18];
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v21 = [v4 error];

      if (!v21)
      {
        uint64_t v38 = *MEMORY[0x1E4F28568];
        v39 = @"Retrieved nil serialized value for nonnull TRIDynamicNamespaceRecord.appContainer";
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        objc_super v27 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIDynamicNamespaceRecordOCNTErrorDomain" code:2 userInfo:v11];
        [v4 failWithError:v27];

        uint64_t v8 = 0;
        goto LABEL_30;
      }
      uint64_t v8 = 0;
    }
LABEL_25:
    v13 = 0;
LABEL_32:

    goto LABEL_33;
  }
  int v14 = [v4 error];

  if (!v14)
  {
    uint64_t v44 = *MEMORY[0x1E4F28568];
    v45[0] = @"Retrieved nil serialized value for nonnull TRIDynamicNamespaceRecord.name";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIDynamicNamespaceRecordOCNTErrorDomain" code:2 userInfo:v6];
    [v4 failWithError:v8];
    goto LABEL_25;
  }
  v13 = 0;
LABEL_34:

  return v13;
}

- (void)defaultEncodeWithCoder:(id)a3
{
  id v4 = a3;
  name = self->_name;
  id v9 = v4;
  if (name)
  {
    [v4 encodeObject:name forKey:@"name"];
    id v4 = v9;
  }
  teamId = self->_teamId;
  if (teamId)
  {
    [v9 encodeObject:teamId forKey:@"teamId"];
    id v4 = v9;
  }
  appContainer = self->_appContainer;
  if (appContainer)
  {
    [v9 encodeObject:appContainer forKey:@"appContainer"];
    id v4 = v9;
  }
  [v4 encodeInt64:self->_cloudKitContainer forKey:@"cloudKitContainer"];
  [v9 encodeInt64:self->_compatibilityVersion forKey:@"compatibilityVersion"];
  defaultsFileURL = self->_defaultsFileURL;
  if (defaultsFileURL) {
    [v9 encodeObject:defaultsFileURL forKey:@"defaultsFileURL"];
  }
  [v9 encodeInt64:self->_hasFetched forKey:@"hasFetched"];
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 314, @"Do not use NSKeyedArchiver to persist instances of TRIDynamicNamespaceRecord to disk. If you want to persist this object to disk, create a protobuf schema." object file lineNumber description];
  }
  [(TRIDynamicNamespaceRecord *)self defaultEncodeWithCoder:v6];
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v11 = *(_OWORD *)&self->_name;
  appContainer = self->_appContainer;
  uint64_t v5 = [NSNumber numberWithInt:self->_cloudKitContainer];
  id v6 = [NSNumber numberWithUnsignedInt:self->_compatibilityVersion];
  defaultsFileURL = self->_defaultsFileURL;
  uint64_t v8 = [NSNumber numberWithBool:self->_hasFetched];
  id v9 = (void *)[v3 initWithFormat:@"<TRIDynamicNamespaceRecord | name:%@ teamId:%@ appContainer:%@ cloudKitContainer:%@ compatibilityVersion:%@ defaultsFileURL:%@ hasFetched:%@>", v11, appContainer, v5, v6, defaultsFileURL, v8];

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)teamId
{
  return self->_teamId;
}

- (TRIAppContainer)appContainer
{
  return self->_appContainer;
}

- (int)cloudKitContainer
{
  return self->_cloudKitContainer;
}

- (unsigned)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSURL)defaultsFileURL
{
  return self->_defaultsFileURL;
}

- (BOOL)hasFetched
{
  return self->_hasFetched;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsFileURL, 0);
  objc_storeStrong((id *)&self->_appContainer, 0);
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end