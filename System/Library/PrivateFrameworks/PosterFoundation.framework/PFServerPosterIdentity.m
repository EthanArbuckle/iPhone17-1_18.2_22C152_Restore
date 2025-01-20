@interface PFServerPosterIdentity
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)configurationIdentityWithProvider:(id)a3 identifier:(id)a4 role:(id)a5 posterUUID:(id)a6 version:(unint64_t)a7 supplement:(unint64_t)a8;
+ (id)debugDescription;
+ (id)descriptorIdentityWithProvider:(id)a3 identifier:(id)a4 role:(id)a5 posterUUID:(id)a6 version:(unint64_t)a7;
+ (id)incomingConfigurationIdentityWithProvider:(id)a3 role:(id)a4 posterUUID:(id)a5 version:(unint64_t)a6 supplement:(unint64_t)a7;
+ (id)staticDescriptorIdentityWithProvider:(id)a3 identifier:(id)a4 role:(id)a5 posterUUID:(id)a6 version:(unint64_t)a7;
+ (void)_setDisableUniquing:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIncomingConfiguration;
- (BOOL)isNewerVersionOfIdentity:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)descriptorIdentifier;
- (NSString)provider;
- (NSString)role;
- (NSString)stablePersistenceIdentifier;
- (NSUUID)posterUUID;
- (PFServerPosterIdentity)init;
- (PFServerPosterIdentity)initWithBSXPCCoder:(id)a3;
- (PFServerPosterIdentity)initWithCoder:(id)a3;
- (id)_initWithProvider:(uint64_t)a3 type:(void *)a4 role:(void *)a5 posterUUID:(uint64_t)a6 version:(uint64_t)a7 supplement:(void *)a8 descriptorIdentifier:;
- (id)_initWithProvider:(uint64_t)a3 type:(void *)a4 role:(void *)a5 posterUUID:(uint64_t)a6 version:(uint64_t)a7 supplement:(void *)a8 descriptorIdentifier:(char)a9 isIncomingConfiguration:;
- (int64_t)compare:(id)a3;
- (int64_t)type;
- (uint64_t)_isRootEqual:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)supplement;
- (unint64_t)version;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PFServerPosterIdentity

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_provider hash];
  uint64_t v4 = [(NSUUID *)self->_posterUUID hash] ^ v3;
  unint64_t supplement = self->_supplement;
  unint64_t v6 = 0xBF58476D1CE4E5B9 * (v4 ^ self->_version ^ ((v4 ^ self->_version) >> 30));
  return [(NSString *)self->_role hash] ^ supplement ^ ((0x94D049BB133111EBLL * (v6 ^ (v6 >> 27))) >> 31) ^ (0x94D049BB133111EBLL * (v6 ^ (v6 >> 27)));
}

- (NSString)descriptorIdentifier
{
  return self->_descriptorIdentifier;
}

- (id)_initWithProvider:(uint64_t)a3 type:(void *)a4 role:(void *)a5 posterUUID:(uint64_t)a6 version:(uint64_t)a7 supplement:(void *)a8 descriptorIdentifier:(char)a9 isIncomingConfiguration:
{
  id v16 = a2;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  if (!a1) {
    goto LABEL_13;
  }
  if (!v16)
  {
    v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"provider"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:]();
    }
LABEL_22:
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A086F1CLL);
  }
  if (!v17)
  {
    v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"role"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:]();
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A086F80);
  }
  if ((unint64_t)(a3 - 1) >= 3)
  {
    v34 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFServerPosterTypeIsValid(type)"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:]();
    }
    goto LABEL_22;
  }
  v36.receiver = a1;
  v36.super_class = (Class)PFServerPosterIdentity;
  a1 = objc_msgSendSuper2(&v36, sel_init);
  if (a1)
  {
    uint64_t v20 = [v16 copy];
    v21 = (void *)*((void *)a1 + 2);
    *((void *)a1 + 2) = v20;

    *((void *)a1 + 3) = a3;
    uint64_t v22 = [v17 copy];
    v23 = (void *)*((void *)a1 + 8);
    *((void *)a1 + 8) = v22;

    uint64_t v24 = [v18 copy];
    v25 = (void *)*((void *)a1 + 4);
    *((void *)a1 + 4) = v24;

    *((void *)a1 + 5) = a6;
    *((void *)a1 + 6) = a7;
    uint64_t v26 = [v19 copy];
    v27 = (void *)*((void *)a1 + 7);
    *((void *)a1 + 7) = v26;

    *((unsigned char *)a1 + 8) = a9;
    if (!__disableUniquing)
    {
      os_unfair_lock_lock(&__allIdentitiesLock);
      v28 = [(id)__allIdentities member:a1];
      if (v28)
      {
        os_unfair_lock_unlock(&__allIdentitiesLock);
        id v29 = v28;

        a1 = v29;
      }
      else
      {
        v30 = (void *)__allIdentities;
        if (!__allIdentities)
        {
          uint64_t v31 = [MEMORY[0x263F088B0] hashTableWithOptions:5];
          v32 = (void *)__allIdentities;
          __allIdentities = v31;

          v30 = (void *)__allIdentities;
        }
        [v30 addObject:a1];
        os_unfair_lock_unlock(&__allIdentitiesLock);
      }
    }
  }
LABEL_13:

  return a1;
}

- (PFServerPosterIdentity)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeStringForKey:@"p"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"t"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"u"];
  uint64_t v8 = [v4 decodeInt64ForKey:@"v"];
  uint64_t v9 = [v4 decodeInt64ForKey:@"s"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"r"];

  if (PFPosterRoleIsValid(v11))
  {
    v12 = v11;
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v12 = PFPosterDefaultRoleForBundleIdentifier(v5);

  v13 = PFLogPosterContents();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[PFServerPosterIdentity initWithBSXPCCoder:]();
  }

  if (v5)
  {
LABEL_7:
    if ((unint64_t)(v6 - 1) <= 2 && v7) {
      PFPosterRoleIsValid(v12);
    }
  }
LABEL_10:
  if (self) {
    self = (PFServerPosterIdentity *)-[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](self, v5, v6, v12, v7, v8, v9, v10, 0);
  }

  return self;
}

- (void)dealloc
{
  os_unfair_lock_lock(&__allIdentitiesLock);
  NSUInteger v3 = [(id)__allIdentities member:self];
  id v4 = v3;
  if (v3 == self || v3 == 0) {
    [(id)__allIdentities removeObject:self];
  }
  os_unfair_lock_unlock(&__allIdentitiesLock);

  v6.receiver = self;
  v6.super_class = (Class)PFServerPosterIdentity;
  [(PFServerPosterIdentity *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);
  objc_storeStrong((id *)&self->_posterUUID, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PFServerPosterIdentity)init
{
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  objc_super v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  uint64_t v8 = [v4 stringWithFormat:@"%@ is not allowed on %@", v5, v7];

  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = NSStringFromSelector(a2);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    v14 = v9;
    __int16 v15 = 2114;
    id v16 = v11;
    __int16 v17 = 2048;
    id v18 = self;
    __int16 v19 = 2114;
    uint64_t v20 = @"PFServerPosterIdentity.m";
    __int16 v21 = 1024;
    int v22 = 87;
    __int16 v23 = 2114;
    uint64_t v24 = v8;
    _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  result = (PFServerPosterIdentity *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)_initWithProvider:(uint64_t)a3 type:(void *)a4 role:(void *)a5 posterUUID:(uint64_t)a6 version:(uint64_t)a7 supplement:(void *)a8 descriptorIdentifier:
{
  if (result) {
    return -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](result, a2, a3, a4, a5, a6, a7, a8, 0);
  }
  return result;
}

+ (id)staticDescriptorIdentityWithProvider:(id)a3 identifier:(id)a4 role:(id)a5 posterUUID:(id)a6 version:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v11;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v15)
  {
    __int16 v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092238);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09229CLL);
  }

  id v16 = v12;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v16)
  {
    __int16 v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092300);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092364);
  }

  id v17 = v14;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v17)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0923C8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09242CLL);
  }

  id v18 = [PFServerPosterIdentity alloc];
  if (v18) {
    id v19 = -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](v18, v15, 2, v13, v17, a7, 0, v16, 0);
  }
  else {
    id v19 = 0;
  }

  return v19;
}

+ (id)descriptorIdentityWithProvider:(id)a3 identifier:(id)a4 role:(id)a5 posterUUID:(id)a6 version:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v11;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v15)
  {
    __int16 v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0925ECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092650);
  }

  id v16 = v12;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v16)
  {
    __int16 v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0926B4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092718);
  }

  id v17 = v14;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v17)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A09277CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity descriptorIdentityWithProvider:identifier:role:posterUUID:version:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A0927E0);
  }

  id v18 = [PFServerPosterIdentity alloc];
  if (v18) {
    id v19 = -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](v18, v15, 1, v13, v17, a7, 0, v16, 0);
  }
  else {
    id v19 = 0;
  }

  return v19;
}

+ (id)configurationIdentityWithProvider:(id)a3 identifier:(id)a4 role:(id)a5 posterUUID:(id)a6 version:(unint64_t)a7 supplement:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = v13;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v17)
  {
    uint64_t v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092A2CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092A90);
  }

  id v18 = v14;
  if (v18)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:].cold.7();
      }
      [v32 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x25A092C84);
    }
  }

  id v19 = v16;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v19)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092AF4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v29 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:]();
    }
    [v29 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092B58);
  }

  if (PFPosterRoleIsValid(v15))
  {
    uint64_t v20 = v15;
  }
  else
  {
    uint64_t v20 = PFPosterDefaultRoleForBundleIdentifier(v17);

    __int16 v21 = PFLogPosterContents();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:].cold.5();
    }
  }
  id v22 = v20;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v22)
  {
    v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:]();
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092BBCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v31 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:]();
    }
    [v31 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092C20);
  }

  __int16 v23 = [PFServerPosterIdentity alloc];
  if (v23) {
    id v24 = -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](v23, v17, 3, v22, v19, a7, a8, v18, 0);
  }
  else {
    id v24 = 0;
  }

  return v24;
}

+ (id)incomingConfigurationIdentityWithProvider:(id)a3 role:(id)a4 posterUUID:(id)a5 version:(unint64_t)a6 supplement:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v11;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v14)
  {
    id v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:]();
    }
LABEL_19:
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092E0CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092E70);
  }

  id v15 = v13;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v15)
  {
    uint64_t v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A092ED4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      +[PFServerPosterIdentity incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:]();
    }
    goto LABEL_19;
  }

  id v16 = -[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:]([PFServerPosterIdentity alloc], v14, 3, v12, v15, a6, a7, 0, 1);
  return v16;
}

- (BOOL)isNewerVersionOfIdentity:(id)a3
{
  id v4 = a3;
  BOOL v7 = 0;
  if (-[PFServerPosterIdentity _isRootEqual:]((uint64_t)self, v4))
  {
    unint64_t version = self->_version;
    unint64_t v6 = v4[5];
    if (version > v6 || version == v6 && self->_supplement > v4[6]) {
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (uint64_t)_isRootEqual:(uint64_t)a1
{
  NSUInteger v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ((void *)a1 == v3)
    {
      a1 = 1;
    }
    else
    {
      uint64_t v5 = objc_opt_class();
      if (v5 == objc_opt_class()
        && (*(void *)(a1 + 24) == 3 || BSEqualStrings())
        && BSEqualStrings()
        && *(void *)(a1 + 24) == v4[3]
        && BSEqualObjects())
      {
        a1 = [*(id *)(a1 + 64) isEqualToString:v4[8]];
      }
      else
      {
        a1 = 0;
      }
    }
  }

  return a1;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    NSComparisonResult v6 = [(NSString *)self->_role compare:v4[8]];
    if (v6 == NSOrderedSame)
    {
      NSComparisonResult v6 = [(NSString *)self->_provider compare:v5[2]];
      if (v6 == NSOrderedSame)
      {
        int64_t type = self->_type;
        int64_t v8 = v5[3];
        if (type == v8)
        {
          NSComparisonResult v6 = [(NSUUID *)self->_posterUUID compare:v5[4]];
          if (v6 == NSOrderedSame)
          {
            unint64_t version = self->_version;
            unint64_t v10 = v5[5];
            if (version == v10)
            {
              unint64_t supplement = self->_supplement;
              unint64_t v12 = v5[6];
              BOOL v13 = supplement >= v12;
              BOOL v14 = supplement == v12;
              uint64_t v15 = -1;
              if (v13) {
                uint64_t v15 = 1;
              }
              if (v14) {
                NSComparisonResult v6 = NSOrderedSame;
              }
              else {
                NSComparisonResult v6 = v15;
              }
            }
            else if (version < v10)
            {
              NSComparisonResult v6 = NSOrderedAscending;
            }
            else
            {
              NSComparisonResult v6 = NSOrderedDescending;
            }
          }
        }
        else if (type < v8)
        {
          NSComparisonResult v6 = NSOrderedAscending;
        }
        else
        {
          NSComparisonResult v6 = NSOrderedDescending;
        }
      }
    }

    return v6;
  }
  else
  {
    id v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"other"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFServerPosterIdentity compare:]();
    }
    [v17 UTF8String];
    int64_t result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (void)_setDisableUniquing:(BOOL)a3
{
  __disableUniquing = a3;
}

+ (id)debugDescription
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x25A2F4780](a1, a2);
  os_unfair_lock_lock(&__allIdentitiesLock);
  NSUInteger v3 = [(id)__allIdentities allObjects];
  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  os_unfair_lock_unlock(&__allIdentitiesLock);
  uint64_t v5 = objc_msgSend(MEMORY[0x263F089D8], "stringWithFormat:", @"allIdentities = %llu {", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v5 appendString:@"\n\t"];
        unint64_t v12 = [v11 debugDescription];
        [v5 appendString:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [v5 appendString:@"\n}"];
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  provider = self->_provider;
  id v5 = a3;
  [v5 encodeObject:provider forKey:@"p"];
  [v5 encodeInt64:self->_type forKey:@"t"];
  [v5 encodeObject:self->_posterUUID forKey:@"u"];
  [v5 encodeInt64:self->_version forKey:@"v"];
  [v5 encodeInt64:self->_supplement forKey:@"s"];
  [v5 encodeObject:self->_descriptorIdentifier forKey:@"d"];
  [v5 encodeObject:self->_role forKey:@"r"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  provider = self->_provider;
  id v5 = a3;
  [v5 encodeObject:provider forKey:@"p"];
  [v5 encodeInt64:self->_type forKey:@"t"];
  [v5 encodeObject:self->_posterUUID forKey:@"u"];
  [v5 encodeInt64:self->_version forKey:@"v"];
  [v5 encodeInt64:self->_supplement forKey:@"s"];
  [v5 encodeObject:self->_descriptorIdentifier forKey:@"d"];
  [v5 encodeObject:self->_role forKey:@"r"];
}

- (PFServerPosterIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];
  uint64_t v6 = [v4 decodeInt64ForKey:@"t"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"u"];
  uint64_t v8 = [v4 decodeInt64ForKey:@"v"];
  uint64_t v9 = [v4 decodeInt64ForKey:@"s"];
  unint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"r"];

  if (PFPosterRoleIsValid(v11))
  {
    unint64_t v12 = v11;
    if (!v5) {
      goto LABEL_8;
    }
LABEL_7:
    PFPosterRoleIsValid(v12);
    goto LABEL_8;
  }
  unint64_t v12 = PFPosterDefaultRoleForBundleIdentifier(v5);

  BOOL v13 = PFLogPosterContents();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[PFServerPosterIdentity initWithCoder:]();
  }

  if (v5) {
    goto LABEL_7;
  }
LABEL_8:
  if (self) {
    self = (PFServerPosterIdentity *)-[PFServerPosterIdentity _initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:](self, v5, v6, v12, v7, v8, v9, v10, 0);
  }

  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[PFServerPosterIdentity _isRootEqual:]((uint64_t)self, v4)
    && self->_version == v4[5]
    && self->_supplement == v4[6]
    && [(NSString *)self->_role isEqualToString:v4[8]];

  return v5;
}

- (NSString)description
{
  descriptorIdentifier = self->_descriptorIdentifier;
  id v4 = NSString;
  provider = self->_provider;
  uint64_t v6 = NSStringFromPFServerPosterType(self->_type);
  uint64_t v7 = (void *)v6;
  if (descriptorIdentifier) {
    [v4 stringWithFormat:@"%@:%@:%@(%@)/%@/%llu-%llu", provider, v6, self->_descriptorIdentifier, self->_posterUUID, self->_role, self->_version, self->_supplement];
  }
  else {
  uint64_t v8 = [v4 stringWithFormat:@"%@:%@:%@/%@/%llu-%llu", provider, v6, self->_posterUUID, self->_role, self->_version, self->_supplement, v10];
  }

  return (NSString *)v8;
}

- (NSString)stablePersistenceIdentifier
{
  descriptorIdentifier = self->_descriptorIdentifier;
  id v4 = NSString;
  provider = self->_provider;
  uint64_t v6 = NSStringFromPFServerPosterType(self->_type);
  uint64_t v7 = (void *)v6;
  if (descriptorIdentifier) {
    [v4 stringWithFormat:@"%@_%@_%@(%@)_%@_%llu-%llu", provider, v6, self->_descriptorIdentifier, self->_posterUUID, self->_role, self->_version, self->_supplement];
  }
  else {
  uint64_t v8 = [v4 stringWithFormat:@"%@_%@_%@_%@_%llu-%llu", provider, v6, self->_posterUUID, self->_role, self->_version, self->_supplement, v10];
  }

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  NSUInteger v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PFServerPosterIdentity *)self description];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v6];

  return (NSString *)v7;
}

- (NSString)provider
{
  return self->_provider;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)posterUUID
{
  return self->_posterUUID;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)supplement
{
  return self->_supplement;
}

- (BOOL)isIncomingConfiguration
{
  return self->_isIncomingConfiguration;
}

- (NSString)role
{
  return self->_role;
}

- (void)_initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithProvider:type:role:posterUUID:version:supplement:descriptorIdentifier:isIncomingConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)staticDescriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)descriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)descriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)descriptorIdentityWithProvider:identifier:role:posterUUID:version:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:.cold.3()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  NSUInteger v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_25A085000, v0, v1, "[Invalid Role][%{public}s] role was invalid, recovered: %@", v2, v3, v4, v5, 2u);
}

+ (void)configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:.cold.7()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)incomingConfigurationIdentityWithProvider:role:posterUUID:version:supplement:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)compare:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_5();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_25A085000, MEMORY[0x263EF8438], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithBSXPCCoder:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_25A085000, v0, v1, "[Invalid Role][%{public}s] role was invalid, recovered: %@", v2, v3, v4, v5, 2u);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7_0(&dword_25A085000, v0, v1, "[Invalid Role][%{public}s] role was invalid, recovered: %@", v2, v3, v4, v5, 2u);
}

@end