@interface PRIncomingPosterConfiguration
- (BOOL)isEqual:(id)a3;
- (NSDictionary)attributes;
- (NSString)description;
- (NSString)descriptorIdentifier;
- (NSString)role;
- (NSURL)assetDirectory;
- (NSUUID)destinationUUID;
- (NSUUID)originalPosterUUID;
- (NSUUID)parentPosterUUID;
- (PFPosterPath)path;
- (PFServerPosterIdentity)sourceIdentity;
- (PRIncomingPosterConfiguration)initWithConfigurationToDuplicate:(id)a3 destinationPosterUUID:(id)a4;
- (PRIncomingPosterConfiguration)initWithNewPath:(id)a3 destinationPosterUUID:(id)a4 parentPosterUUID:(id)a5 sourceIdentity:(id)a6 configuredProperties:(id)a7 attributes:(id)a8;
- (PRIncomingPosterConfiguration)initWithNewPath:(id)a3 destinationPosterUUID:(id)a4 sourceIdentity:(id)a5 configuredProperties:(id)a6 attributes:(id)a7;
- (PRIncomingPosterConfiguration)initWithType:(unint64_t)a3 path:(id)a4 sourceIdentity:(id)a5 configuredProperties:(id)a6 attributes:(id)a7;
- (PRIncomingPosterConfiguration)initWithUpdatedPath:(id)a3 updatedPosterUUID:(id)a4 parentPosterUUID:(id)a5 sourceIdentity:(id)a6 configuredProperties:(id)a7 attributes:(id)a8;
- (PRIncomingPosterConfiguration)initWithUpdatedPath:(id)a3 updatedPosterUUID:(id)a4 sourceIdentity:(id)a5 configuredProperties:(id)a6 attributes:(id)a7;
- (PRPosterConfiguredProperties)configuredProperties;
- (id)_path;
- (id)loadUserInfoWithError:(id *)a3;
- (id)objectForUserInfoKey:(id)a3;
- (unint64_t)hash;
- (unint64_t)incomingPosterType;
- (void)dealloc;
- (void)setPath:(id)a3;
- (void)setSourceIdentity:(id)a3;
- (void)trackTemporaryState:(id)a3;
@end

@implementation PRIncomingPosterConfiguration

- (PRIncomingPosterConfiguration)initWithUpdatedPath:(id)a3 updatedPosterUUID:(id)a4 sourceIdentity:(id)a5 configuredProperties:(id)a6 attributes:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v13;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v17)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:]();
    }
LABEL_11:
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CCB7CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:]();
    }
    goto LABEL_11;
  }

  v18 = [(PRIncomingPosterConfiguration *)self initWithType:2 path:v12 sourceIdentity:v14 configuredProperties:v15 attributes:v16];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_destinationUUID, a4);
    objc_storeStrong((id *)&v19->_originalPosterUUID, a4);
  }

  return v19;
}

- (PRIncomingPosterConfiguration)initWithUpdatedPath:(id)a3 updatedPosterUUID:(id)a4 parentPosterUUID:(id)a5 sourceIdentity:(id)a6 configuredProperties:(id)a7 attributes:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v15;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v20)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:]();
    }
LABEL_19:
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CCD84);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CCDE8);
  }

  id v21 = v16;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v21)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:](a2);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CCE4CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithUpdatedPath:updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:](a2);
    }
    goto LABEL_19;
  }

  v22 = [(PRIncomingPosterConfiguration *)self initWithType:5 path:v14 sourceIdentity:v17 configuredProperties:v18 attributes:v19];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_destinationUUID, a4);
    objc_storeStrong((id *)&v23->_parentPosterUUID, a5);
  }

  return v23;
}

- (PRIncomingPosterConfiguration)initWithNewPath:(id)a3 destinationPosterUUID:(id)a4 parentPosterUUID:(id)a5 sourceIdentity:(id)a6 configuredProperties:(id)a7 attributes:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v15;
  if (v20)
  {
    NSClassFromString(&cfstr_Nsuuid.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRIncomingPosterConfiguration initWithNewPath:destinationPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:]();
      }
LABEL_19:
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18C1CD070);
    }
  }

  id v21 = v16;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v21)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithNewPath:destinationPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:]();
    }
    goto LABEL_19;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithNewPath:destinationPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CD0D4);
  }

  v22 = [(PRIncomingPosterConfiguration *)self initWithType:4 path:v14 sourceIdentity:v17 configuredProperties:v18 attributes:v19];
  if (v22)
  {
    if (v20)
    {
      v23 = (NSUUID *)v20;
    }
    else
    {
      v23 = [MEMORY[0x1E4F29128] UUID];
    }
    destinationUUID = v22->_destinationUUID;
    v22->_destinationUUID = v23;

    objc_storeStrong((id *)&v22->_parentPosterUUID, a5);
  }

  return v22;
}

- (PRIncomingPosterConfiguration)initWithNewPath:(id)a3 destinationPosterUUID:(id)a4 sourceIdentity:(id)a5 configuredProperties:(id)a6 attributes:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v13;
  if (v17 && (NSClassFromString(&cfstr_Nsuuid.isa), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithNewPath:destinationPosterUUID:sourceIdentity:configuredProperties:attributes:]();
    }
    [v22 UTF8String];
    result = (PRIncomingPosterConfiguration *)_bs_set_crash_log_message();
    __break(0);
  }
  else
  {

    id v18 = [(PRIncomingPosterConfiguration *)self initWithType:1 path:v12 sourceIdentity:v14 configuredProperties:v15 attributes:v16];
    if (v18)
    {
      if (v17)
      {
        id v19 = (NSUUID *)v17;
      }
      else
      {
        id v19 = [MEMORY[0x1E4F29128] UUID];
      }
      destinationUUID = v18->_destinationUUID;
      v18->_destinationUUID = v19;
    }
    return v18;
  }
  return result;
}

- (PRIncomingPosterConfiguration)initWithConfigurationToDuplicate:(id)a3 destinationPosterUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Prposterconfig.isa);
  if (!v8)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithConfigurationToDuplicate:destinationPosterUUID:]();
    }
LABEL_19:
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CD49CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfigurationClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithConfigurationToDuplicate:destinationPosterUUID:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CD500);
  }

  id v9 = v7;
  if (v9)
  {
    NSClassFromString(&cfstr_Nsuuid.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRIncomingPosterConfiguration initWithConfigurationToDuplicate:destinationPosterUUID:]();
      }
      goto LABEL_19;
    }
  }

  v10 = [v8 _path];
  v11 = [v8 _path];
  id v12 = [v11 serverIdentity];
  id v13 = [v8 loadConfiguredPropertiesWithError:0];
  id v14 = [(PRIncomingPosterConfiguration *)self initWithType:3 path:v10 sourceIdentity:v12 configuredProperties:v13 attributes:0];

  if (v14)
  {
    id v15 = [v8 _path];
    id v16 = [v15 serverIdentity];
    uint64_t v17 = [v16 posterUUID];
    originalPosterUUID = v14->_originalPosterUUID;
    v14->_originalPosterUUID = (NSUUID *)v17;

    if (v9)
    {
      id v19 = (NSUUID *)v9;
    }
    else
    {
      id v19 = [MEMORY[0x1E4F29128] UUID];
    }
    destinationUUID = v14->_destinationUUID;
    v14->_destinationUUID = v19;
  }
  return v14;
}

- (PRIncomingPosterConfiguration)initWithType:(unint64_t)a3 path:(id)a4 sourceIdentity:(id)a5 configuredProperties:(id)a6 attributes:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v13;
  NSClassFromString(&cfstr_Pfposterpath.isa);
  if (!v17)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:]();
    }
LABEL_27:
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CD75CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CD7C0);
  }

  id v18 = v14;
  NSClassFromString(&cfstr_Pfserverposter.isa);
  if (!v18)
  {
    v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CD824);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CD888);
  }

  id v19 = v15;
  NSClassFromString(&cfstr_Prposterconfig_0.isa);
  if (!v19)
  {
    v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CD8ECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterConfiguredPropertiesClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration initWithType:path:sourceIdentity:configuredProperties:attributes:]();
    }
    goto LABEL_27;
  }

  v32.receiver = self;
  v32.super_class = (Class)PRIncomingPosterConfiguration;
  id v20 = [(PRIncomingPosterConfiguration *)&v32 init];
  id v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_path, a4);
    objc_storeStrong((id *)&v21->_sourceIdentity, a5);
    objc_storeStrong((id *)&v21->_configuredProperties, a6);
    v21->_incomingPosterType = a3;
    uint64_t v22 = [MEMORY[0x1E4F29128] UUID];
    destinationUUID = v21->_destinationUUID;
    v21->_destinationUUID = (NSUUID *)v22;

    uint64_t v24 = [v16 copy];
    attributes = v21->_attributes;
    v21->_attributes = (NSDictionary *)v24;
  }
  return v21;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_temporaryState;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 invalidate];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  temporaryState = self->_temporaryState;
  self->_temporaryState = 0;

  v10.receiver = self;
  v10.super_class = (Class)PRIncomingPosterConfiguration;
  [(PRIncomingPosterConfiguration *)&v10 dealloc];
}

- (id)_path
{
  return self->_path;
}

- (NSURL)assetDirectory
{
  return (NSURL *)[(PFPosterPath *)self->_path contentsURL];
}

- (NSString)descriptorIdentifier
{
  return (NSString *)[(PFPosterPath *)self->_path descriptorIdentifier];
}

- (NSString)role
{
  return (NSString *)[(PFPosterPath *)self->_path role];
}

- (id)objectForUserInfoKey:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration objectForUserInfoKey:]();
    }
LABEL_11:
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1CDBBCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PRIncomingPosterConfiguration objectForUserInfoKey:]();
    }
    goto LABEL_11;
  }

  uint64_t v5 = [(PRIncomingPosterConfiguration *)self loadUserInfoWithError:0];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)loadUserInfoWithError:(id *)a3
{
  return (id)[(PFPosterPath *)self->_path loadUserInfoWithError:a3];
}

- (unint64_t)hash
{
  v3 = [(PFPosterPath *)self->_path contentsURL];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(PFServerPosterIdentity *)self->_sourceIdentity hash];
  unint64_t v6 = v5 ^ [(PRPosterConfiguredProperties *)self->_configuredProperties hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PRIncomingPosterConfiguration *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() && BSEqualObjects() && BSEqualObjects())
    {
      int v6 = [(PFPosterPath *)self->_path isServerPosterPath];
      path = self->_path;
      if (v6)
      {
        id v8 = [(PFPosterPath *)path contentsURL];
        id v9 = [(PFPosterPath *)v4->_path contentsURL];
        char v10 = BSEqualObjects();
      }
      else
      {
        char v10 = [(PFPosterPath *)path isEqual:v4->_path];
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = [(PFServerPosterIdentity *)self->_sourceIdentity provider];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p provider=%@ path=%@>", v5, self, v6, self->_path];

  return (NSString *)v7;
}

- (void)trackTemporaryState:(id)a3
{
  id v4 = a3;
  temporaryState = self->_temporaryState;
  id v8 = v4;
  if (!temporaryState)
  {
    int v6 = (NSMutableSet *)objc_opt_new();
    uint64_t v7 = self->_temporaryState;
    self->_temporaryState = v6;

    id v4 = v8;
    temporaryState = self->_temporaryState;
  }
  [(NSMutableSet *)temporaryState addObject:v4];
}

- (unint64_t)incomingPosterType
{
  return self->_incomingPosterType;
}

- (PRPosterConfiguredProperties)configuredProperties
{
  return self->_configuredProperties;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSUUID)destinationUUID
{
  return self->_destinationUUID;
}

- (NSUUID)originalPosterUUID
{
  return self->_originalPosterUUID;
}

- (NSUUID)parentPosterUUID
{
  return self->_parentPosterUUID;
}

- (PFServerPosterIdentity)sourceIdentity
{
  return self->_sourceIdentity;
}

- (void)setSourceIdentity:(id)a3
{
}

- (PFPosterPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_sourceIdentity, 0);
  objc_storeStrong((id *)&self->_parentPosterUUID, 0);
  objc_storeStrong((id *)&self->_originalPosterUUID, 0);
  objc_storeStrong((id *)&self->_destinationUUID, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_configuredProperties, 0);
  objc_storeStrong((id *)&self->_temporaryState, 0);
}

- (void)initWithUpdatedPath:updatedPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatedPath:updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithUpdatedPath:(const char *)a1 updatedPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithNewPath:destinationPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithNewPath:destinationPosterUUID:parentPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithNewPath:destinationPosterUUID:sourceIdentity:configuredProperties:attributes:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfigurationToDuplicate:destinationPosterUUID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithConfigurationToDuplicate:destinationPosterUUID:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithType:path:sourceIdentity:configuredProperties:attributes:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithType:path:sourceIdentity:configuredProperties:attributes:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithType:path:sourceIdentity:configuredProperties:attributes:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)objectForUserInfoKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end