@interface HKSPPersistentSyncAnchorContainer
+ (BOOL)supportsSecureCoding;
- (HKSPPersistentSyncAnchorContainer)initWithIdentifier:(id)a3 defaults:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)inMemoryCopy;
- (id)lock_getSyncAnchorForKey:(id)a3;
- (void)lock_removeSyncAnchorForKey:(id)a3;
- (void)lock_setSyncAnchor:(id)a3 forKey:(id)a4;
@end

@implementation HKSPPersistentSyncAnchorContainer

- (id)lock_getSyncAnchorForKey:(id)a3
{
  v3 = [(HKSPUserDefaults *)self->_defaults hksp_objectForKey:a3];
  HKSPSyncAnchorClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v4 = HKSPSyncAnchorDefaultValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (void).cxx_destruct
{
}

- (id)inMemoryCopy
{
  v3 = [HKSPSyncAnchorContainer alloc];
  uint64_t v4 = [(HKSPSyncAnchorContainer *)self identifier];
  v5 = [(HKSPSyncAnchorContainer *)v3 initWithIdentifier:v4];

  [(HKSPSyncAnchorContainer *)v5 updateWithContainer:self];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKSPPersistentSyncAnchorContainer;
  uint64_t v4 = [(HKSPSyncAnchorContainer *)&v8 copyWithZone:a3];
  v5 = v4;
  if (self) {
    defaults = self->_defaults;
  }
  else {
    defaults = 0;
  }
  objc_storeStrong(v4 + 4, defaults);
  return v5;
}

- (HKSPPersistentSyncAnchorContainer)initWithIdentifier:(id)a3 defaults:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKSPPersistentSyncAnchorContainer;
  objc_super v8 = [(HKSPSyncAnchorContainer *)&v13 initWithIdentifier:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_defaults, a4);
    v10 = HKSPLogForCategory(0xAuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, "Initialized %{public}@", buf, 0xCu);
    }

    v11 = v9;
  }

  return v9;
}

- (void)lock_setSyncAnchor:(id)a3 forKey:(id)a4
{
  defaults = self->_defaults;
  id v6 = a4;
  id v7 = (id)[a3 copyWithZone:0];
  [(HKSPUserDefaults *)defaults hksp_setObject:v7 forKey:v6];
}

- (void)lock_removeSyncAnchorForKey:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end