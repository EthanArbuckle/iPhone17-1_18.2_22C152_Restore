@interface TRITaskAttributionInternalInsecure
+ (id)taskAttributionFirstPartyWithNetworkOptions:(id)a3;
+ (id)taskAttributionFromPersistedTask:(id)a3;
+ (id)taskAttributionWithTeamIdentifier:(id)a3 triCloudKitContainer:(int)a4 applicationBundleIdentifier:(id)a5 networkOptions:(id)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTaskAttribution:(id)a3;
- (NSString)applicationBundleIdentifier;
- (NSString)description;
- (NSString)teamIdentifier;
- (TRIDownloadOptions)networkOptions;
- (TRITaskAttributionInternalInsecure)initWithTeamIdentifier:(id)a3 triCloudKitContainer:(int)a4 applicationBundleIdentifier:(id)a5 networkOptions:(id)a6;
- (id)asPersistedTaskAttribution;
- (id)copyWithReplacementApplicationBundleIdentifier:(id)a3;
- (id)copyWithReplacementNetworkOptions:(id)a3;
- (id)copyWithReplacementTeamIdentifier:(id)a3;
- (id)copyWithReplacementTriCloudKitContainer:(int)a3;
- (int)triCloudKitContainer;
- (unint64_t)hash;
@end

@implementation TRITaskAttributionInternalInsecure

- (TRITaskAttributionInternalInsecure)initWithTeamIdentifier:(id)a3 triCloudKitContainer:(int)a4 applicationBundleIdentifier:(id)a5 networkOptions:(id)a6
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 866, @"Invalid parameter not satisfying: %@", @"applicationBundleIdentifier != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 867, @"Invalid parameter not satisfying: %@", @"networkOptions != nil" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)TRITaskAttributionInternalInsecure;
  v16 = [(TRITaskAttributionInternalInsecure *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_teamIdentifier, a3);
    v17->_triCloudKitContainer = a4;
    objc_storeStrong((id *)&v17->_applicationBundleIdentifier, a5);
    objc_storeStrong((id *)&v17->_networkOptions, a6);
  }

  return v17;
}

+ (id)taskAttributionWithTeamIdentifier:(id)a3 triCloudKitContainer:(int)a4 applicationBundleIdentifier:(id)a5 networkOptions:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) initWithTeamIdentifier:v12 triCloudKitContainer:v7 applicationBundleIdentifier:v11 networkOptions:v10];

  return v13;
}

- (id)copyWithReplacementTeamIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTeamIdentifier:v4 triCloudKitContainer:self->_triCloudKitContainer applicationBundleIdentifier:self->_applicationBundleIdentifier networkOptions:self->_networkOptions];

  return v5;
}

- (id)copyWithReplacementTriCloudKitContainer:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  teamIdentifier = self->_teamIdentifier;
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  networkOptions = self->_networkOptions;
  return (id)[v5 initWithTeamIdentifier:teamIdentifier triCloudKitContainer:v3 applicationBundleIdentifier:applicationBundleIdentifier networkOptions:networkOptions];
}

- (id)copyWithReplacementApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTeamIdentifier:self->_teamIdentifier triCloudKitContainer:self->_triCloudKitContainer applicationBundleIdentifier:v4 networkOptions:self->_networkOptions];

  return v5;
}

- (id)copyWithReplacementNetworkOptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTeamIdentifier:self->_teamIdentifier triCloudKitContainer:self->_triCloudKitContainer applicationBundleIdentifier:self->_applicationBundleIdentifier networkOptions:v4];

  return v5;
}

- (BOOL)isEqualToTaskAttribution:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  int v6 = self->_teamIdentifier != 0;
  uint64_t v7 = [v4 teamIdentifier];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_12;
  }
  teamIdentifier = self->_teamIdentifier;
  if (teamIdentifier)
  {
    id v10 = [v5 teamIdentifier];
    int v11 = [(NSString *)teamIdentifier isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  int triCloudKitContainer = self->_triCloudKitContainer;
  if (triCloudKitContainer != [v5 triCloudKitContainer]) {
    goto LABEL_12;
  }
  int v13 = self->_applicationBundleIdentifier != 0;
  id v14 = [v5 applicationBundleIdentifier];
  int v15 = v14 == 0;

  if (v13 == v15) {
    goto LABEL_12;
  }
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  if (applicationBundleIdentifier)
  {
    v17 = [v5 applicationBundleIdentifier];
    int v18 = [(NSString *)applicationBundleIdentifier isEqual:v17];

    if (!v18) {
      goto LABEL_12;
    }
  }
  int v19 = self->_networkOptions != 0;
  v20 = [v5 networkOptions];
  int v21 = v20 == 0;

  if (v19 == v21)
  {
LABEL_12:
    char v24 = 0;
  }
  else
  {
    networkOptions = self->_networkOptions;
    if (networkOptions)
    {
      v23 = [v5 networkOptions];
      char v24 = [(TRIDownloadOptions *)networkOptions isEqual:v23];
    }
    else
    {
      char v24 = 1;
    }
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRITaskAttributionInternalInsecure *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRITaskAttributionInternalInsecure *)self isEqualToTaskAttribution:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_teamIdentifier hash];
  uint64_t v4 = self->_triCloudKitContainer - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_applicationBundleIdentifier hash] - v4 + 32 * v4;
  return [(TRIDownloadOptions *)self->_networkOptions hash] - v5 + 32 * v5;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  teamIdentifier = self->_teamIdentifier;
  NSUInteger v5 = [NSNumber numberWithInt:self->_triCloudKitContainer];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRITaskAttributionInternalInsecure | teamIdentifier:%@ triCloudKitContainer:%@ applicationBundleIdentifier:%@ networkOptions:%@>", teamIdentifier, v5, self->_applicationBundleIdentifier, self->_networkOptions];

  return (NSString *)v6;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (int)triCloudKitContainer
{
  return self->_triCloudKitContainer;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (TRIDownloadOptions)networkOptions
{
  return self->_networkOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkOptions, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
}

+ (id)taskAttributionFirstPartyWithNetworkOptions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[TRITaskAttributionInternalInsecure alloc] initWithTeamIdentifier:0 triCloudKitContainer:1 applicationBundleIdentifier:@"com.apple.triald" networkOptions:v3];

  return v4;
}

+ (id)taskAttributionFromPersistedTask:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 hasApplicationBundleId] & 1) == 0)
  {
    int v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v23 = (objc_class *)objc_opt_class();
      char v24 = NSStringFromClass(v23);
      int v25 = 138412290;
      v26 = v24;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Cannot decode message of type %@ with missing field: applicationBundleId", (uint8_t *)&v25, 0xCu);
    }
    uint64_t v7 = TRILogCategory_Server();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    int v25 = 138412290;
    v26 = v10;
    int v11 = "Cannot decode message of type %@ with missing field: applicationBundleId";
    goto LABEL_14;
  }
  uint64_t v4 = [v3 applicationBundleId];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v12 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v12);
      int v25 = 138412290;
      v26 = v10;
      int v11 = "Cannot decode message of type %@ with field of length 0: applicationBundleId";
LABEL_14:
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v25, 0xCu);
    }
LABEL_15:
    id v14 = 0;
    goto LABEL_16;
  }
  if (([v3 hasCloudKitContainer] & 1) == 0)
  {
    uint64_t v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v13);
      int v25 = 138412290;
      v26 = v10;
      int v11 = "Cannot decode message of type %@ with missing field: cloudKitContainer";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  BOOL v6 = [v3 teamId];
  if ([v6 length])
  {
    uint64_t v7 = [v3 teamId];
  }
  else
  {
    uint64_t v7 = 0;
  }

  if (![v3 hasNetworkBehavior]
    || (id v16 = objc_alloc(MEMORY[0x1E4FB00D8]),
        [v3 networkBehavior],
        v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = (void *)[v16 initFromPersistedBehavior:v17],
        v17,
        !v18))
  {
    int v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_1DA291000, v19, OS_LOG_TYPE_DEFAULT, "unable to parse persisted network behavior, assuming discretionary", (uint8_t *)&v25, 2u);
    }

    int v18 = [MEMORY[0x1E4FB00D8] inexpensiveOptions];
  }
  v20 = [TRITaskAttributionInternalInsecure alloc];
  uint64_t v21 = [v3 cloudKitContainer];
  v22 = [v3 applicationBundleId];
  id v14 = [(TRITaskAttributionInternalInsecure *)v20 initWithTeamIdentifier:v7 triCloudKitContainer:v21 applicationBundleIdentifier:v22 networkOptions:v18];

LABEL_16:
  return v14;
}

- (id)asPersistedTaskAttribution
{
  id v3 = objc_alloc_init(TRIPersistedTaskAttribution);
  uint64_t v4 = [(TRITaskAttributionInternalInsecure *)self teamIdentifier];
  if ([v4 length])
  {
    uint64_t v5 = [(TRITaskAttributionInternalInsecure *)self teamIdentifier];
    [(TRIPersistedTaskAttribution *)v3 setTeamId:v5];
  }
  else
  {
    [(TRIPersistedTaskAttribution *)v3 setTeamId:0];
  }

  BOOL v6 = [(TRITaskAttributionInternalInsecure *)self applicationBundleIdentifier];
  [(TRIPersistedTaskAttribution *)v3 setApplicationBundleId:v6];

  [(TRIPersistedTaskAttribution *)v3 setCloudKitContainer:[(TRITaskAttributionInternalInsecure *)self triCloudKitContainer]];
  uint64_t v7 = [(TRITaskAttributionInternalInsecure *)self networkOptions];
  int v8 = [v7 serializeToPersistedBehavior];
  [(TRIPersistedTaskAttribution *)v3 setNetworkBehavior:v8];

  return v3;
}

@end