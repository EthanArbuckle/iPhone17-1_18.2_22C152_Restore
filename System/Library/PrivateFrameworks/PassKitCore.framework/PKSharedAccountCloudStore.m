@interface PKSharedAccountCloudStore
+ (BOOL)supportsSecureCoding;
- (BOOL)isDirty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSharedAccountCloudStore:(id)a3;
- (NSArray)sharedAccountCloudStoreZones;
- (NSDate)lastUpdated;
- (NSString)accountIdentifier;
- (PKSharedAccountCloudStore)initWithArray:(id)a3 lastUpdated:(id)a4;
- (PKSharedAccountCloudStore)initWithCoder:(id)a3;
- (id)allPossibleZonesForAccountUser:(id)a3 access:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)primaryZoneForAccountUser:(id)a3 inAccountUserCollection:(id)a4 access:(unint64_t)a5;
- (id)sharedAccountCloudStoreZonesWithAccess:(unint64_t)a3;
- (id)sharedAccountCloudStoreZonesWithAccess:(unint64_t)a3 forAccountUser:(id)a4;
- (id)sharedAccountZoneWithName:(id)a3 access:(unint64_t)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setDirty:(BOOL)a3;
- (void)setLastUpdated:(id)a3;
- (void)setSharedAccountCloudStoreZones:(id)a3;
@end

@implementation PKSharedAccountCloudStore

- (PKSharedAccountCloudStore)initWithArray:(id)a3 lastUpdated:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKSharedAccountCloudStore;
  v8 = [(PKSharedAccountCloudStore *)&v26 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lastUpdated, a4);
    v9->_dirty = 0;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
          v17 = [PKSharedAccountCloudStoreZone alloc];
          v18 = -[PKSharedAccountCloudStoreZone initWithDictionary:](v17, "initWithDictionary:", v16, (void)v22);
          [v10 addObject:v18];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v13);
    }

    uint64_t v19 = [v10 copy];
    sharedAccountCloudStoreZones = v9->_sharedAccountCloudStoreZones;
    v9->_sharedAccountCloudStoreZones = (NSArray *)v19;
  }
  return v9;
}

- (id)sharedAccountCloudStoreZonesWithAccess:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_sharedAccountCloudStoreZones;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        if (objc_msgSend(v11, "access", (void)v14) == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];
  return v12;
}

- (id)sharedAccountCloudStoreZonesWithAccess:(unint64_t)a3 forAccountUser:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_sharedAccountCloudStoreZones;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "access", (void)v13);
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v11 = (void *)[v5 copy];
  return v11;
}

- (id)sharedAccountZoneWithName:(id)a3 access:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_sharedAccountCloudStoreZones;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v13 = objc_msgSend(v12, "zoneName", (void)v21);
          id v14 = v6;
          id v15 = v13;
          long long v16 = v15;
          if (v15 == v14)
          {
          }
          else
          {
            if (!v15)
            {

LABEL_15:
              continue;
            }
            int v17 = [v14 isEqualToString:v15];

            if (!v17) {
              goto LABEL_15;
            }
          }
          uint64_t v18 = [v12 access];

          if (v18 == a4)
          {
            id v19 = v12;
            goto LABEL_20;
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
    id v19 = 0;
LABEL_20:
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)primaryZoneForAccountUser:(id)a3 inAccountUserCollection:(id)a4 access:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 accountIdentifier];
  id v11 = self->_accountIdentifier;
  uint64_t v12 = v10;
  long long v13 = v12;
  if (v11 == v12)
  {
  }
  else
  {
    if (!v12 || !v11)
    {

LABEL_12:
      id v15 = 0;
      goto LABEL_18;
    }
    BOOL v14 = [(NSString *)v11 isEqualToString:v12];

    if (!v14)
    {
      id v15 = 0;
      goto LABEL_19;
    }
  }
  id v11 = [v8 altDSID];
  uint64_t v16 = [v8 accessLevel];
  if (v16 != 2)
  {
    if (v16 == 1)
    {
      int v17 = [v9 accountUsers];
      uint64_t v18 = [v17 objectsPassingTest:&__block_literal_global_214];
      unint64_t v19 = [v18 count];

      if (v19 >= 2)
      {
        uint64_t v20 = PKSharedAccountMergedCloudStoreZoneName((uint64_t)v13);
LABEL_15:
        long long v22 = (void *)v20;
        id v15 = [(PKSharedAccountCloudStore *)self sharedAccountZoneWithName:v20 access:a5];

        goto LABEL_18;
      }
      if ([v8 isCurrentUser])
      {
        id v15 = [(PKSharedAccountCloudStore *)self sharedAccountZoneWithName:@"transactions" access:a5];
        goto LABEL_18;
      }
    }
    goto LABEL_12;
  }
  long long v21 = PKSharedAccountParticpantCloudStoreZoneName((uint64_t)v13, (uint64_t)v11, 1);
  id v15 = [(PKSharedAccountCloudStore *)self sharedAccountZoneWithName:v21 access:a5];

  if (!v15)
  {
    uint64_t v20 = PKSharedAccountParticpantCloudStoreZoneName((uint64_t)v13, (uint64_t)v11, 0);
    goto LABEL_15;
  }
LABEL_18:

LABEL_19:
  return v15;
}

BOOL __86__PKSharedAccountCloudStore_primaryZoneForAccountUser_inAccountUserCollection_access___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessLevel] == 1;
}

- (id)allPossibleZonesForAccountUser:(id)a3 access:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 accountIdentifier];
  id v8 = self->_accountIdentifier;
  id v9 = v7;
  uint64_t v10 = v9;
  if (v8 == v9)
  {
  }
  else
  {
    id v11 = 0;
    if (!v9 || !v8)
    {
      uint64_t v18 = v9;
LABEL_16:

      goto LABEL_17;
    }
    BOOL v12 = [(NSString *)v8 isEqualToString:v9];

    if (!v12)
    {
      id v11 = 0;
      goto LABEL_18;
    }
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [v6 altDSID];
  uint64_t v13 = [v6 accessLevel];
  if (v13 != 2)
  {
    if (v13 != 1) {
      goto LABEL_17;
    }
    if (a4 - 1 > 1) {
      goto LABEL_17;
    }
    BOOL v14 = PKSharedAccountMergedCloudStoreZoneName((uint64_t)v10);
    id v15 = [(PKSharedAccountCloudStore *)self sharedAccountZoneWithName:v14 access:a4];
    [v11 safelyAddObject:v15];

    if (![v6 isCurrentUser]) {
      goto LABEL_17;
    }
    uint64_t v16 = [(PKSharedAccountCloudStore *)self sharedAccountZoneWithName:@"transactions" access:a4];
    [v11 safelyAddObject:v16];

    uint64_t v17 = PKSharedAccountCardCloudStoreZoneName((uint64_t)v10);
    goto LABEL_15;
  }
  if (a4 - 1 <= 1)
  {
    unint64_t v19 = PKSharedAccountParticpantCloudStoreZoneName((uint64_t)v10, (uint64_t)v8, 1);
    uint64_t v20 = [(PKSharedAccountCloudStore *)self sharedAccountZoneWithName:v19 access:a4];
    [v11 safelyAddObject:v20];

    uint64_t v17 = PKSharedAccountParticpantCloudStoreZoneName((uint64_t)v10, (uint64_t)v8, 0);
LABEL_15:
    uint64_t v18 = (void *)v17;
    long long v21 = [(PKSharedAccountCloudStore *)self sharedAccountZoneWithName:v17 access:a4];
    [v11 safelyAddObject:v21];

    goto LABEL_16;
  }
LABEL_17:

LABEL_18:
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharedAccountCloudStore)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKSharedAccountCloudStore;
  id v5 = [(PKSharedAccountCloudStore *)&v16 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sharedAccountCloudStoreZones"];
    sharedAccountCloudStoreZones = v5->_sharedAccountCloudStoreZones;
    v5->_sharedAccountCloudStoreZones = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v11;

    v5->_dirty = [v4 decodeBoolForKey:@"dirty"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sharedAccountCloudStoreZones = self->_sharedAccountCloudStoreZones;
  id v5 = a3;
  [v5 encodeObject:sharedAccountCloudStoreZones forKey:@"sharedAccountCloudStoreZones"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdated"];
  [v5 encodeBool:self->_dirty forKey:@"dirty"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKSharedAccountCloudStore *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKSharedAccountCloudStore *)self isEqualToSharedAccountCloudStore:v5];

  return v6;
}

- (BOOL)isEqualToSharedAccountCloudStore:(id)a3
{
  sharedAccountCloudStoreZones = self->_sharedAccountCloudStoreZones;
  id v4 = (NSArray *)*((void *)a3 + 2);
  if (sharedAccountCloudStoreZones) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return sharedAccountCloudStoreZones == v4;
  }
  else {
    return -[NSArray isEqual:](sharedAccountCloudStoreZones, "isEqual:");
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_sharedAccountCloudStoreZones];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = [+[PKSharedAccountCloudStore allocWithZone:](PKSharedAccountCloudStore, "allocWithZone:") init];
  uint64_t v6 = [(NSArray *)self->_sharedAccountCloudStoreZones copyWithZone:a3];
  sharedAccountCloudStoreZones = v5->_sharedAccountCloudStoreZones;
  v5->_sharedAccountCloudStoreZones = (NSArray *)v6;

  uint64_t v8 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v8;

  v5->_dirty = self->_dirty;
  objc_storeStrong((id *)&v5->_accountIdentifier, self->_accountIdentifier);
  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"sharedAccountCloudStoreZones: %@; ", self->_sharedAccountCloudStoreZones];
  [v3 appendFormat:@"lastUpdated: %@; ", self->_lastUpdated];
  if (self->_dirty) {
    unint64_t v4 = @"YES";
  }
  else {
    unint64_t v4 = @"NO";
  }
  [v3 appendFormat:@"dirty: %@; ", v4];
  [v3 appendFormat:@"accountIdentifier: %@; ", self->_accountIdentifier];
  [v3 appendString:@">"];
  BOOL v5 = (void *)[v3 copy];

  return v5;
}

- (NSArray)sharedAccountCloudStoreZones
{
  return self->_sharedAccountCloudStoreZones;
}

- (void)setSharedAccountCloudStoreZones:(id)a3
{
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_sharedAccountCloudStoreZones, 0);
}

@end