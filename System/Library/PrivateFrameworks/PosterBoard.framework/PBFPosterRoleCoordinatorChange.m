@interface PBFPosterRoleCoordinatorChange
+ (id)addPosterToRole:(id)a3 incomingPoster:(id)a4;
+ (id)assignAttributeToPosterWithinRole:(id)a3 matchingUUID:(id)a4 attribute:(id)a5;
+ (id)distillArrayOfChangesIntoChangesOrderedByPosterRoleEntropy:(id)a3;
+ (id)duplicatePosterWithinRole:(id)a3 matchingUUID:(id)a4 toUUID:(id)a5;
+ (id)refreshRoleCoordinator:(id)a3;
+ (id)removeAttributeFromPosterWithinRole:(id)a3 matchingUUID:(id)a4 attributeType:(id)a5;
+ (id)removePosterFromRole:(id)a3 matchingUUID:(id)a4;
+ (id)reorderPostersForRole:(id)a3 sortedPosterUUIDs:(id)a4;
+ (id)resetRole:(id)a3;
+ (id)selectPosterForRole:(id)a3 matchingUUID:(id)a4;
+ (id)updateConfiguredProperties:(id)a3 forPosterWithinRole:(id)a4 matchingUUID:(id)a5;
+ (id)updatePosterWithinRole:(id)a3 incomingPoster:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChange:(id)a3;
- (BOOL)isValidWithError:(id *)a3;
- (NSDictionary)userInfo;
- (NSString)changeType;
- (NSString)role;
- (NSUUID)uniqueIdentifier;
- (PBFPosterRoleCoordinatorChange)initWithType:(id)a3 role:(id)a4 userInfo:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation PBFPosterRoleCoordinatorChange

+ (id)addPosterToRole:(id)a3 incomingPoster:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [PBFPosterRoleCoordinatorChange alloc];
  v11 = @"PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration";
  v12[0] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = [(PBFPosterRoleCoordinatorChange *)v7 initWithType:@"PBFPosterRoleCoordinatorChangeTypeAddPoster" role:v6 userInfo:v8];
  return v9;
}

+ (id)updatePosterWithinRole:(id)a3 incomingPoster:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [PBFPosterRoleCoordinatorChange alloc];
  v11 = @"PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration";
  v12[0] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = [(PBFPosterRoleCoordinatorChange *)v7 initWithType:@"PBFPosterRoleCoordinatorChangeTypeUpdatePoster" role:v6 userInfo:v8];
  return v9;
}

+ (id)removePosterFromRole:(id)a3 matchingUUID:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [PBFPosterRoleCoordinatorChange alloc];
  v11 = @"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID";
  v12[0] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = [(PBFPosterRoleCoordinatorChange *)v7 initWithType:@"PBFPosterRoleCoordinatorChangeTypeRemovePoster" role:v6 userInfo:v8];
  return v9;
}

+ (id)reorderPostersForRole:(id)a3 sortedPosterUUIDs:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [PBFPosterRoleCoordinatorChange alloc];
  v11 = @"PBFPosterRoleCoordinatorChangeUserInfoKeyOrderedUUIDs";
  v12[0] = v5;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v9 = [(PBFPosterRoleCoordinatorChange *)v7 initWithType:@"PBFPosterRoleCoordinatorChangeTypeReorderPosters" role:v6 userInfo:v8];
  return v9;
}

+ (id)duplicatePosterWithinRole:(id)a3 matchingUUID:(id)a4 toUUID:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [PBFPosterRoleCoordinatorChange alloc];
  v14[0] = @"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID";
  v14[1] = @"PBFPosterRoleCoordinatorChangeUserInfoKeyOutPosterUUID";
  v15[0] = v8;
  v15[1] = v7;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  v12 = [(PBFPosterRoleCoordinatorChange *)v10 initWithType:@"PBFPosterRoleCoordinatorChangeTypeDuplicatePoster" role:v9 userInfo:v11];
  return v12;
}

+ (id)assignAttributeToPosterWithinRole:(id)a3 matchingUUID:(id)a4 attribute:(id)a5
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [PBFPosterRoleCoordinatorChange alloc];
  v16[0] = v8;
  v15[0] = @"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID";
  v15[1] = @"PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType";
  v11 = [v7 attributeType];
  v15[2] = @"PBFPosterRoleCoordinatorChangeUserInfoKeyAttribute";
  v16[1] = v11;
  v16[2] = v7;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  v13 = [(PBFPosterRoleCoordinatorChange *)v10 initWithType:@"PBFPosterRoleCoordinatorChangeTypeAssignAttribute" role:v9 userInfo:v12];
  return v13;
}

+ (id)removeAttributeFromPosterWithinRole:(id)a3 matchingUUID:(id)a4 attributeType:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [PBFPosterRoleCoordinatorChange alloc];
  v14[0] = @"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID";
  v14[1] = @"PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType";
  v15[0] = v8;
  v15[1] = v7;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  v12 = [(PBFPosterRoleCoordinatorChange *)v10 initWithType:@"PBFPosterRoleCoordinatorChangeTypeRemoveAttribute" role:v9 userInfo:v11];
  return v12;
}

+ (id)selectPosterForRole:(id)a3 matchingUUID:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [PBFPosterRoleCoordinatorChange alloc];
  v11 = @"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID";
  v12[0] = v5;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  id v9 = [(PBFPosterRoleCoordinatorChange *)v7 initWithType:@"PBFPosterRoleCoordinatorChangeTypeSelectPoster" role:v6 userInfo:v8];
  return v9;
}

+ (id)updateConfiguredProperties:(id)a3 forPosterWithinRole:(id)a4 matchingUUID:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [PBFPosterRoleCoordinatorChange alloc];
  v14[0] = @"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID";
  v14[1] = @"PBFPosterRoleCoordinatorChangeUserInfoKeyConfiguredProperties";
  v15[0] = v7;
  v15[1] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  v12 = [(PBFPosterRoleCoordinatorChange *)v10 initWithType:@"PBFPosterRoleCoordinatorChangeTypeUpdateConfiguredProperties" role:v8 userInfo:v11];
  return v12;
}

+ (id)refreshRoleCoordinator:(id)a3
{
  id v3 = a3;
  v4 = [PBFPosterRoleCoordinatorChange alloc];
  id v5 = [(PBFPosterRoleCoordinatorChange *)v4 initWithType:@"PBFPosterRoleCoordinatorChangeTypeRefreshRoleCoordinator" role:v3 userInfo:MEMORY[0x1E4F1CC08]];

  return v5;
}

+ (id)resetRole:(id)a3
{
  id v3 = a3;
  v4 = [PBFPosterRoleCoordinatorChange alloc];
  id v5 = [(PBFPosterRoleCoordinatorChange *)v4 initWithType:@"PBFPosterRoleCoordinatorChangeTypeResetRoleCoordinator" role:v3 userInfo:MEMORY[0x1E4F1CC08]];

  return v5;
}

+ (id)distillArrayOfChangesIntoChangesOrderedByPosterRoleEntropy:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (!v9
          || (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "role", (void)v19),
              v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [v9 isEqual:v13],
              v13,
              (v14 & 1) == 0))
        {
          uint64_t v15 = objc_msgSend(v12, "role", (void)v19);

          uint64_t v16 = objc_opt_new();
          [v4 addObject:v16];
          id v8 = (void *)v16;
          id v9 = (void *)v15;
        }
        [v8 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
  }

  v17 = (void *)[v4 copy];
  return v17;
}

- (PBFPosterRoleCoordinatorChange)initWithType:(id)a3 role:(id)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v12)
  {
    long long v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:]();
    }
LABEL_27:
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D320ADC0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D320AE24);
  }

  id v13 = v10;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v13)
  {
    uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D320AE88);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D320AEECLL);
  }

  id v14 = v11;
  NSClassFromString(&cfstr_Nsdictionary.isa);
  if (!v14)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D320AF50);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterRoleCoordinatorChange initWithType:role:userInfo:]();
    }
    goto LABEL_27;
  }

  v27.receiver = self;
  v27.super_class = (Class)PBFPosterRoleCoordinatorChange;
  uint64_t v15 = [(PBFPosterRoleCoordinatorChange *)&v27 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_changeType, a3);
    objc_storeStrong((id *)&v16->_role, a4);
    uint64_t v17 = [v14 copy];
    userInfo = v16->_userInfo;
    v16->_userInfo = (NSDictionary *)v17;

    uint64_t v19 = [MEMORY[0x1E4F29128] UUID];
    uniqueIdentifier = v16->_uniqueIdentifier;
    v16->_uniqueIdentifier = (NSUUID *)v19;
  }
  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_changeType hash];
  NSUInteger v4 = [(NSString *)self->_role hash] ^ v3;
  uint64_t v5 = [(NSDictionary *)self->_userInfo hash];
  unint64_t v6 = 0xBF58476D1CE4E5B9 * (v4 ^ v5 ^ ((v4 ^ v5) >> 30));
  return (0x94D049BB133111EBLL * (v6 ^ (v6 >> 27))) ^ ((0x94D049BB133111EBLL * (v6 ^ (v6 >> 27))) >> 31);
}

- (BOOL)isEqualToChange:(id)a3
{
  NSUInteger v4 = (PBFPosterRoleCoordinatorChange *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else if (BSEqualStrings() && BSEqualStrings())
  {
    char v5 = BSEqualDictionaries();
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (PBFPosterRoleCoordinatorChange *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    char v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v7 = (isKindOfClass & 1) != 0 && [(PBFPosterRoleCoordinatorChange *)self isEqualToChange:v4];
  }

  return v7;
}

- (BOOL)isValidWithError:(id *)a3
{
  v33[3] = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_changeType isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeAddPoster"]|| [(NSString *)self->_changeType isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeUpdatePoster"])
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PBFPosterRoleCoordinatorChangeUserInfoKeyIncomingPosterConfiguration", 0, v30, v31);
    uint64_t v6 = LABEL_8:;
LABEL_9:
    BOOL v7 = (void *)v6;
    goto LABEL_10;
  }
  if ([(NSString *)self->_changeType isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeRemovePoster"]|| [(NSString *)self->_changeType isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeSelectPoster"])
  {
    char v5 = (void *)MEMORY[0x1E4F1CAD0];
    v29 = 0;
LABEL_7:
    objc_msgSend(v5, "setWithObjects:", @"PBFPosterRoleCoordinatorChangeUserInfoKeyPosterUUID", v29, v30, v31);
    goto LABEL_8;
  }
  if ([(NSString *)self->_changeType isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeReorderPosters"])
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PBFPosterRoleCoordinatorChangeUserInfoKeyOrderedUUIDs", 0, v30, v31);
    goto LABEL_8;
  }
  if ([(NSString *)self->_changeType isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeDuplicatePoster"])
  {
    char v5 = (void *)MEMORY[0x1E4F1CAD0];
    v28 = @"PBFPosterRoleCoordinatorChangeUserInfoKeyOutPosterUUID";
LABEL_44:
    v29 = v28;
    v30 = 0;
    goto LABEL_7;
  }
  if ([(NSString *)self->_changeType isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeAssignAttribute"])
  {
    char v5 = (void *)MEMORY[0x1E4F1CAD0];
    v30 = @"PBFPosterRoleCoordinatorChangeUserInfoKeyAttribute";
    uint64_t v31 = 0;
    v29 = @"PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType";
    goto LABEL_7;
  }
  if ([(NSString *)self->_changeType isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeRemoveAttribute"])
  {
    char v5 = (void *)MEMORY[0x1E4F1CAD0];
    v28 = @"PBFPosterRoleCoordinatorChangeUserInfoKeyAttributeType";
    goto LABEL_44;
  }
  if ([(NSString *)self->_changeType isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeUpdateConfiguredProperties"])
  {
    char v5 = (void *)MEMORY[0x1E4F1CAD0];
    v28 = @"PBFPosterRoleCoordinatorChangeUserInfoKeyConfiguredProperties";
    goto LABEL_44;
  }
  if ([(NSString *)self->_changeType isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeRefreshRoleCoordinator"]|| [(NSString *)self->_changeType isEqualToString:@"PBFPosterRoleCoordinatorChangeTypeResetRoleCoordinator"])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_9;
  }
  BOOL v7 = 0;
LABEL_10:
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = [(NSDictionary *)self->_userInfo allKeys];
  id v10 = [v8 setWithArray:v9];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v13 = v12;

  id v14 = (void *)MEMORY[0x1E4F1CA60];
  v32[0] = @"expectedUserInfoKeys";
  uint64_t v15 = [v7 allObjects];
  uint64_t v16 = (void *)v15;
  uint64_t v17 = MEMORY[0x1E4F1CBF0];
  if (v15) {
    uint64_t v18 = v15;
  }
  else {
    uint64_t v18 = MEMORY[0x1E4F1CBF0];
  }
  v33[0] = v18;
  v32[1] = @"receivedUserInfoKeys";
  uint64_t v19 = [v13 allObjects];
  long long v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v17;
  }
  v32[2] = @"changeType";
  changeType = (__CFString *)self->_changeType;
  if (!changeType) {
    changeType = @"PBFPosterRoleCoordinatorChangeTypeUnknown";
  }
  v33[1] = v21;
  v33[2] = changeType;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
  uint64_t v24 = [v14 dictionaryWithDictionary:v23];

  if (![(NSDictionary *)self->_userInfo count])
  {
    if (!a3) {
      goto LABEL_32;
    }
    uint64_t v26 = -3343;
LABEL_31:
    [MEMORY[0x1E4F28C58] errorWithDomain:@"PBFPosterRoleCoordinatorChangeErrorDomain" code:v26 userInfo:v24];
    BOOL v25 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  if (!v7)
  {
    if (!a3) {
      goto LABEL_32;
    }
    uint64_t v26 = -3342;
    goto LABEL_31;
  }
  if (([v13 isSubsetOfSet:v7] & 1) == 0)
  {
    if (a3)
    {
      uint64_t v26 = -3341;
      goto LABEL_31;
    }
LABEL_32:
    BOOL v25 = 0;
    goto LABEL_33;
  }
  BOOL v25 = 1;
LABEL_33:

  return v25;
}

- (id)description
{
  NSUInteger v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_changeType withName:@"changeType"];
  [v3 appendString:self->_role withName:@"role"];
  id v4 = (id)[v3 appendObject:self->_uniqueIdentifier withName:@"uniqueIdentifier"];
  char v5 = [v3 build];

  return v5;
}

- (NSString)changeType
{
  return self->_changeType;
}

- (NSString)role
{
  return self->_role;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_changeType, 0);
}

- (void)initWithType:role:userInfo:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithType:role:userInfo:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithType:role:userInfo:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end