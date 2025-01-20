@interface HDSPSyncedDefaultsKeySet
- (HDSPSyncedDefaultsKeySet)initWithIdentifier:(id)a3 modficationDateKey:(id)a4 keysToPersist:(id)a5 keysToSync:(id)a6;
- (HDSPSyncedDefaultsKeySet)initWithIdentifier:(id)a3 modficationDateKey:(id)a4 keysToPersist:(id)a5 keysToSync:(id)a6 perGizmoKeys:(id)a7 defaultValues:(id)a8;
- (NSDictionary)defaultValues;
- (NSSet)keysToPersist;
- (NSSet)keysToSync;
- (NSSet)perGizmoKeys;
- (NSString)identifier;
- (NSString)modificationDateKey;
@end

@implementation HDSPSyncedDefaultsKeySet

- (HDSPSyncedDefaultsKeySet)initWithIdentifier:(id)a3 modficationDateKey:(id)a4 keysToPersist:(id)a5 keysToSync:(id)a6
{
  v10 = (objc_class *)MEMORY[0x263EFFA08];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(v10);
  id v16 = objc_alloc_init(NSDictionary);
  v17 = [(HDSPSyncedDefaultsKeySet *)self initWithIdentifier:v14 modficationDateKey:v13 keysToPersist:v12 keysToSync:v11 perGizmoKeys:v15 defaultValues:v16];

  return v17;
}

- (HDSPSyncedDefaultsKeySet)initWithIdentifier:(id)a3 modficationDateKey:(id)a4 keysToPersist:(id)a5 keysToSync:(id)a6 perGizmoKeys:(id)a7 defaultValues:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v26 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HDSPSyncedDefaultsKeySet;
  v19 = [(HDSPSyncedDefaultsKeySet *)&v27 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    modificationDateKey = v19->_modificationDateKey;
    v19->_modificationDateKey = (NSString *)v22;

    objc_storeStrong((id *)&v19->_keysToPersist, a5);
    objc_storeStrong((id *)&v19->_keysToSync, a6);
    objc_storeStrong((id *)&v19->_perGizmoKeys, a7);
    objc_storeStrong((id *)&v19->_defaultValues, a8);
    v24 = v19;
  }

  return v19;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)modificationDateKey
{
  return self->_modificationDateKey;
}

- (NSSet)keysToPersist
{
  return self->_keysToPersist;
}

- (NSSet)keysToSync
{
  return self->_keysToSync;
}

- (NSSet)perGizmoKeys
{
  return self->_perGizmoKeys;
}

- (NSDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_perGizmoKeys, 0);
  objc_storeStrong((id *)&self->_keysToSync, 0);
  objc_storeStrong((id *)&self->_keysToPersist, 0);
  objc_storeStrong((id *)&self->_modificationDateKey, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end