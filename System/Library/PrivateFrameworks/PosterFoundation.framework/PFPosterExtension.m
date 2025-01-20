@interface PFPosterExtension
+ (id)extensionWithIdentity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (LSPropertyList)posterExtensionEntitlementsPlist;
- (LSPropertyList)posterExtensionInfoPlist;
- (NSBundle)posterExtensionBundle;
- (NSData)persistentIdentifier;
- (NSSet)supportedRoles;
- (NSString)localizedName;
- (NSString)posterExtensionBundleIdentifier;
- (NSString)posterExtensionContainerBundleIdentifier;
- (NSUUID)uniqueIdentifier;
- (PFPosterExtension)initWithIdentity:(id)a3;
- (_EXExtensionIdentity)identity;
- (id)applicationExtensionRecord;
- (id)description;
- (id)instanceIdentifier;
- (unint64_t)hash;
@end

@implementation PFPosterExtension

- (PFPosterExtension)initWithIdentity:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v15.receiver = self;
    v15.super_class = (Class)PFPosterExtension;
    v8 = [(PFPosterExtension *)&v15 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_identity, a3);
      uint64_t v10 = [v7 uniqueIdentifier];
      uuid = v9->_uuid;
      v9->_uuid = (NSUUID *)v10;

      id v12 = [(PFPosterExtension *)v9 applicationExtensionRecord];
    }

    return v9;
  }
  else
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"identity"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      [(PFPosterExtension *)a2 initWithIdentity:(uint64_t)v14];
    }
    [v14 UTF8String];
    result = (PFPosterExtension *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)extensionWithIdentity:(id)a3
{
  id v3 = a3;
  v4 = [[PFPosterExtension alloc] initWithIdentity:v3];

  return v4;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_uuid hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PFPosterExtension *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(NSUUID *)self->_uuid isEqual:v4->_uuid]
      && [(RBSProcessIdentity *)self->_processIdentity isEqual:v4->_processIdentity]
      && [(_EXHostConfiguration *)self->_hostConfiguration isEqual:v4->_hostConfiguration])
    {
      [(_EXExtensionIdentity *)self->_identity isEqual:v4->_identity];
    }
  }

  return v4 == self;
}

- (id)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = [(NSUUID *)self->_uuid UUIDString];
  [v3 appendString:v4 withName:@"instanceIdentifier"];

  v5 = [(PFPosterExtension *)self posterExtensionBundleIdentifier];
  [v3 appendString:v5 withName:@"posterExtensionBundleIdentifier"];

  id v6 = [(PFPosterExtension *)self localizedName];
  [v3 appendString:v6 withName:@"localizedName"];

  v7 = [v3 build];

  return v7;
}

- (id)applicationExtensionRecord
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  record = self->_record;
  if (record)
  {
    v5 = record;
  }
  else
  {
    id v6 = [(_EXExtensionIdentity *)self->_identity applicationExtensionRecord];
    v7 = self->_record;
    self->_record = v6;

    if (self->_record)
    {
      id v8 = 0;
    }
    else
    {
      id v8 = [(_EXExtensionIdentity *)self->_identity uniqueIdentifier];

      if (v8)
      {
        id v9 = objc_alloc(MEMORY[0x263F01858]);
        uuid = self->_uuid;
        id v24 = 0;
        v11 = (LSApplicationExtensionRecord *)[v9 initWithUUID:uuid error:&v24];
        id v8 = v24;
        id v12 = self->_record;
        self->_record = v11;
      }
      if (!self->_record)
      {
        v13 = [(_EXExtensionIdentity *)self->_identity bundleIdentifier];

        if (v13)
        {
          id v14 = objc_alloc(MEMORY[0x263F01858]);
          objc_super v15 = [(_EXExtensionIdentity *)self->_identity bundleIdentifier];
          id v23 = v8;
          v16 = (LSApplicationExtensionRecord *)[v14 initWithBundleIdentifier:v15 error:&v23];
          id v17 = v23;

          v18 = self->_record;
          self->_record = v16;

          id v8 = v17;
        }
        if (!self->_record)
        {
          v19 = PFLogHosting();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            identity = self->_identity;
            *(_DWORD *)buf = 134218498;
            v26 = self;
            __int16 v27 = 2114;
            v28 = identity;
            __int16 v29 = 2114;
            id v30 = v8;
            _os_log_error_impl(&dword_25A085000, v19, OS_LOG_TYPE_ERROR, "%p Failure to fault in application extensionRecord for identity %{public}@: %{public}@", buf, 0x20u);
          }
        }
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
  v20 = self->_record;

  return v20;
}

- (NSString)localizedName
{
  return (NSString *)[(_EXExtensionIdentity *)self->_identity localizedName];
}

- (id)instanceIdentifier
{
  return self->_uuid;
}

- (NSString)posterExtensionBundleIdentifier
{
  return (NSString *)[(_EXExtensionIdentity *)self->_identity bundleIdentifier];
}

- (NSString)posterExtensionContainerBundleIdentifier
{
  v2 = [(PFPosterExtension *)self applicationExtensionRecord];
  id v3 = [v2 containingBundleRecord];
  v4 = [v3 bundleIdentifier];

  return (NSString *)v4;
}

- (LSPropertyList)posterExtensionInfoPlist
{
  v2 = [(PFPosterExtension *)self applicationExtensionRecord];
  id v3 = [v2 infoDictionary];

  return (LSPropertyList *)v3;
}

- (LSPropertyList)posterExtensionEntitlementsPlist
{
  v2 = [(PFPosterExtension *)self applicationExtensionRecord];
  id v3 = [v2 entitlements];

  return (LSPropertyList *)v3;
}

- (NSData)persistentIdentifier
{
  v2 = [(PFPosterExtension *)self applicationExtensionRecord];
  id v3 = [v2 persistentIdentifier];

  return (NSData *)v3;
}

- (NSBundle)posterExtensionBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  id v3 = [(PFPosterExtension *)self applicationExtensionRecord];
  v4 = [v3 URL];
  v5 = objc_msgSend(v2, "pf_uniqueBundleWithURL:", v4);

  return (NSBundle *)v5;
}

- (NSSet)supportedRoles
{
  v2 = [(PFPosterExtension *)self posterExtensionInfoPlist];
  id v3 = objc_msgSend(v2, "pf_supportedRoles");

  return (NSSet *)v3;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uuid;
}

- (_EXExtensionIdentity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)initWithIdentity:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  id v12 = @"PFPosterExtension.m";
  __int16 v13 = 1024;
  int v14 = 35;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

@end