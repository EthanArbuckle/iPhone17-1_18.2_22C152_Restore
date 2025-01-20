@interface NPKPassSyncState
+ (BOOL)supportsSecureCoding;
+ (id)_deviceDomainAccessor;
+ (unint64_t)minRemoteDevicePassSyncStateVersionSupport;
+ (void)setMinRemoteDevicePassSyncStateVersionSupport:(unint64_t)a3;
- (BOOL)diffWithBaselineState:(id)a3 representsMaterialDifferenceFromState:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassSyncState:(id)a3;
- (BOOL)stateContainsSyncStateItem:(id)a3;
- (BOOL)stateIsSubsetOfUnionOfPassSyncStates:(id)a3;
- (NPKPassSyncState)init;
- (NPKPassSyncState)initWithCoder:(id)a3;
- (NPKPassSyncState)initWithPasses:(id)a3;
- (NPKPassSyncState)initWithPasses:(id)a3 version:(unint64_t)a4;
- (NPKPassSyncState)initWithProtoSyncState:(id)a3;
- (NPKPassSyncState)initWithSyncStateItems:(id)a3;
- (NPKPassSyncState)initWithSyncStateItems:(id)a3 version:(unint64_t)a4;
- (NPKPassSyncState)initWithVersion:(unint64_t)a3;
- (NSData)syncStateHash;
- (NSMutableDictionary)syncStateItems;
- (id)commonBaselinePassSyncStateWithState:(id)a3 version:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)passSyncStateByAddingOrUpdatingSyncStateItem:(id)a3;
- (id)passSyncStateByApplyingChange:(id)a3;
- (id)passSyncStateByRemovingPassWithUniqueID:(id)a3;
- (id)protoSyncState;
- (unint64_t)hash;
- (unint64_t)version;
- (void)_commonInitWithVersion:(unint64_t)a3;
- (void)compareWithBaselinePassSyncState:(id)a3 outAddedSyncItems:(id *)a4 outUpdatedSyncItems:(id *)a5 outRemovedSyncItems:(id *)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setSyncStateItems:(id)a3;
@end

@implementation NPKPassSyncState

- (NPKPassSyncState)initWithProtoSyncState:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x263EFF9C0] set];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = objc_msgSend(v4, "passSyncStateItems", 0);
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
          v11 = [[NPKPassSyncStateItem alloc] initWithProtoSyncStateItem:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    v12 = -[NPKPassSyncState initWithSyncStateItems:version:](self, "initWithSyncStateItems:version:", v5, [v4 version]);
  }
  else
  {

    v12 = 0;
  }

  return v12;
}

- (id)protoSyncState
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(NPKProtoPassSyncState);
  [(NPKProtoPassSyncState *)v3 setVersion:[(NPKPassSyncState *)self version]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NPKPassSyncState *)self syncStateItems];
  v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) protoSyncStateItem];
        [(NPKProtoPassSyncState *)v3 addPassSyncStateItems:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (NPKPassSyncState)init
{
  uint64_t v3 = [(id)objc_opt_class() minRemoteDevicePassSyncStateVersionSupport];
  return [(NPKPassSyncState *)self initWithVersion:v3];
}

- (NPKPassSyncState)initWithVersion:(unint64_t)a3
{
  v5 = [MEMORY[0x263EFFA08] set];
  uint64_t v6 = [(NPKPassSyncState *)self initWithPasses:v5 version:a3];

  return v6;
}

- (NPKPassSyncState)initWithPasses:(id)a3
{
  id v4 = a3;
  v5 = -[NPKPassSyncState initWithPasses:version:](self, "initWithPasses:version:", v4, [(id)objc_opt_class() minRemoteDevicePassSyncStateVersionSupport]);

  return v5;
}

- (NPKPassSyncState)initWithPasses:(id)a3 version:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NPKPassSyncState;
  uint64_t v7 = [(NPKPassSyncState *)&v23 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(NPKPassSyncState *)v7 _commonInitWithVersion:a4];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
          long long v15 = [NPKPassSyncStateItem alloc];
          long long v16 = -[NPKPassSyncStateItem initWithPass:](v15, "initWithPass:", v14, (void)v19);
          uint64_t v17 = [(NPKPassSyncStateItem *)v16 uniqueID];
          if (v17) {
            [(NSMutableDictionary *)v8->_syncStateItems setObject:v16 forKey:v17];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }
  }
  return v8;
}

- (NPKPassSyncState)initWithSyncStateItems:(id)a3
{
  id v4 = a3;
  v5 = -[NPKPassSyncState initWithSyncStateItems:version:](self, "initWithSyncStateItems:version:", v4, [(id)objc_opt_class() minRemoteDevicePassSyncStateVersionSupport]);

  return v5;
}

- (NPKPassSyncState)initWithSyncStateItems:(id)a3 version:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NPKPassSyncState;
  uint64_t v7 = [(NPKPassSyncState *)&v21 init];
  uint64_t v8 = v7;
  if (v7)
  {
    [(NPKPassSyncState *)v7 _commonInitWithVersion:a4];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          long long v15 = objc_msgSend(v14, "uniqueID", (void)v17);
          if (v15) {
            [(NSMutableDictionary *)v8->_syncStateItems setObject:v14 forKey:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }
  }
  return v8;
}

- (void)_commonInitWithVersion:(unint64_t)a3
{
  self->_version = a3;
  id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  syncStateItems = self->_syncStateItems;
  self->_syncStateItems = v4;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  syncStateItems = self->_syncStateItems;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __31__NPKPassSyncState_description__block_invoke;
  long long v15 = &unk_2644D6E90;
  id v16 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)syncStateItems enumerateKeysAndObjectsUsingBlock:&v12];
  id v6 = NSString;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [(NPKPassSyncState *)self syncStateHash];
  id v9 = [v8 hexEncoding];
  uint64_t v10 = [v6 stringWithFormat:@"<%@: %p sync state hash: %@, items: %@ version:%lu>", v7, self, v9, v5, self->_version, v12, v13, v14, v15];

  return v10;
}

void __31__NPKPassSyncState_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [a3 shortDescription];
  [v3 addObject:v4];
}

- (void)compareWithBaselinePassSyncState:(id)a3 outAddedSyncItems:(id *)a4 outUpdatedSyncItems:(id *)a5 outRemovedSyncItems:(id *)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = [v10 syncStateItems];
  uint64_t v13 = [v12 allKeys];
  uint64_t v14 = [v11 setWithArray:v13];

  long long v15 = (void *)MEMORY[0x263EFFA08];
  id v16 = [(NSMutableDictionary *)self->_syncStateItems allKeys];
  long long v17 = [v15 setWithArray:v16];

  if (a4)
  {
    long long v18 = (void *)[v17 mutableCopy];
    [v18 minusSet:v14];
    _sortedSyncItemsByUniqueID(v18, self->_syncStateItems);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    v33 = a5;
    v34 = v14;
    v35 = a6;
    long long v19 = (void *)[v14 mutableCopy];
    v32 = v17;
    [v19 intersectSet:v17];
    id v20 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v21 = v19;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * v25);
          v27 = [v10 syncStateItems];
          v28 = [v27 objectForKey:v26];

          v29 = [(NSMutableDictionary *)self->_syncStateItems objectForKey:v26];
          if (([v28 isEqualToPassSyncStateItem:v29] & 1) == 0) {
            [v20 addObject:v26];
          }

          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v23);
    }

    _sortedSyncItemsByUniqueID(v20, self->_syncStateItems);
    id *v33 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = v34;
    a6 = v35;
    long long v17 = v32;
  }
  if (a6)
  {
    v30 = (void *)[v14 mutableCopy];
    [v30 minusSet:v17];
    v31 = [v10 syncStateItems];
    _sortedSyncItemsByUniqueID(v30, v31);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)passSyncStateByApplyingChange:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 changeType] > 1)
  {
    id v5 = [v4 uniqueID];

    [(NPKPassSyncState *)self passSyncStateByRemovingPassWithUniqueID:v5];
  }
  else
  {
    id v5 = [v4 syncStateItem];

    [(NPKPassSyncState *)self passSyncStateByAddingOrUpdatingSyncStateItem:v5];
  id v6 = };

  return v6;
}

- (id)passSyncStateByAddingOrUpdatingSyncStateItem:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(NPKPassSyncState *)self copy];
  id v6 = [v5 syncStateItems];
  uint64_t v7 = [v4 uniqueID];
  [v6 setObject:v4 forKey:v7];

  return v5;
}

- (id)passSyncStateByRemovingPassWithUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(NPKPassSyncState *)self copy];
  id v6 = [v5 syncStateItems];
  [v6 removeObjectForKey:v4];

  return v5;
}

- (id)commonBaselinePassSyncStateWithState:(id)a3 version:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v6 = (void *)[(NPKPassSyncState *)self copy];
  v6[2] = a4;
  id v21 = v6;
  uint64_t v7 = [v6 syncStateItems];
  uint64_t v8 = [v7 allKeys];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v14 = [v23 syncStateItems];
        long long v15 = [v14 objectForKey:v13];
        id v16 = [(NPKPassSyncState *)self syncStateItems];
        long long v17 = [v16 objectForKey:v13];
        char v18 = [v15 isEqual:v17];

        if ((v18 & 1) == 0)
        {
          long long v19 = [v21 syncStateItems];
          [v19 removeObjectForKey:v13];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  return v21;
}

- (BOOL)stateIsSubsetOfUnionOfPassSyncStates:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v20 = a3;
  [(NSMutableDictionary *)self->_syncStateItems allKeys];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v18 = *(void *)v26;
    while (1)
    {
      uint64_t v5 = 0;
LABEL_4:
      if (*(void *)v26 != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void *)(*((void *)&v25 + 1) + 8 * v5);
      uint64_t v7 = [(NSMutableDictionary *)self->_syncStateItems objectForKey:v6];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v8 = v20;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (!v9) {
        break;
      }
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
LABEL_8:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v21 + 1) + 8 * v12) syncStateItems];
        uint64_t v14 = [(id)v13 objectForKey:v6];

        LOBYTE(v13) = [v7 isEqual:v14];
        if (v13) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v10) {
            goto LABEL_8;
          }
          goto LABEL_18;
        }
      }

      if (++v5 != v4) {
        goto LABEL_4;
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      BOOL v15 = 1;
      if (!v4) {
        goto LABEL_20;
      }
    }
LABEL_18:

    BOOL v15 = 0;
  }
  else
  {
    BOOL v15 = 1;
  }
LABEL_20:

  return v15;
}

- (BOOL)diffWithBaselineState:(id)a3 representsMaterialDifferenceFromState:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(NPKPassSyncState *)self version];
  if (v8 == [v6 version])
  {
    id v29 = 0;
    id v30 = 0;
    id v28 = 0;
    [(NPKPassSyncState *)self compareWithBaselinePassSyncState:v6 outAddedSyncItems:&v30 outUpdatedSyncItems:&v29 outRemovedSyncItems:&v28];
    id v9 = v30;
    id v10 = v29;
    id v11 = v28;
    if ([v11 count])
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v13 = [v9 arrayByAddingObjectsFromArray:v10];
      uint64_t v12 = [v13 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v12)
      {
        id v21 = v11;
        id v22 = v10;
        id v23 = v9;
        uint64_t v14 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v13);
            }
            id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            long long v17 = [v7 syncStateItems];
            uint64_t v18 = [v16 uniqueID];
            long long v19 = [v17 objectForKey:v18];

            LODWORD(v16) = PKEqualObjects();
            if (!v16)
            {
              LOBYTE(v12) = 1;
              goto LABEL_15;
            }
          }
          uint64_t v12 = [v13 countByEnumeratingWithState:&v24 objects:v31 count:16];
          if (v12) {
            continue;
          }
          break;
        }
LABEL_15:
        id v10 = v22;
        id v9 = v23;
        id v11 = v21;
      }
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (BOOL)stateContainsSyncStateItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uniqueID];
  if (v5)
  {
    syncStateItems = self->_syncStateItems;
    id v7 = [v4 uniqueID];
    unint64_t v8 = [(NSMutableDictionary *)syncStateItems objectForKey:v7];

    char v9 = PKEqualObjects();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSData)syncStateHash
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableDictionary *)self->_syncStateItems allKeys];
  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = [(NSMutableDictionary *)self->_syncStateItems objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        id v11 = [v10 manifestHash];
        if (v11)
        {
          if (!v7)
          {
            id v7 = [MEMORY[0x263EFF990] data];
          }
          [v7 appendData:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v12 = [v7 SHA256Hash];

  return (NSData *)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NPKPassSyncState *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(NPKPassSyncState *)self isEqualToPassSyncState:v5];

  return v6;
}

- (BOOL)isEqualToPassSyncState:(id)a3
{
  if (self->_version == *((void *)a3 + 2)) {
    return PKEqualObjects();
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  [v3 safelyAddObject:self->_syncStateItems];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [+[NPKPassSyncState allocWithZone:a3] initWithVersion:self->_version];
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_syncStateItems mutableCopy];
  [(NPKPassSyncState *)v4 setSyncStateItems:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  syncStateItems = self->_syncStateItems;
  id v5 = a3;
  [v5 encodeObject:syncStateItems forKey:@"syncStateItems"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_version];
  [v5 encodeObject:v6 forKey:@"syncStateVersion"];
}

- (NPKPassSyncState)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPKPassSyncState;
  id v5 = [(NPKPassSyncState *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"syncStateItems"];
    syncStateItems = v5->_syncStateItems;
    v5->_syncStateItems = (NSMutableDictionary *)v7;

    char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"syncStateVersion"];
    v5->_version = [v9 unsignedIntegerValue];
  }
  return v5;
}

- (NSMutableDictionary)syncStateItems
{
  return self->_syncStateItems;
}

- (void)setSyncStateItems:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
}

+ (unint64_t)minRemoteDevicePassSyncStateVersionSupport
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!PKCloudKitPassSyncEnabled()) {
    return 0;
  }
  uint64_t v3 = [a1 _deviceDomainAccessor];
  char v13 = 0;
  uint64_t v4 = [v3 integerForKey:@"NPKPassSyncStateVersion" keyExistsAndHasValidFormat:&v13];
  if (v13)
  {
    unint64_t v5 = v4;
    uint64_t v6 = pk_Sync_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      uint64_t v8 = pk_Sync_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v15 = v5;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: fetched from user defaults version:%lu", buf, 0xCu);
      }
    }
  }
  else
  {
    char v9 = [a1 _currentActiveDevice];
    id v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AAA2622E-C2DC-45BF-A337-F8A4BCED8CFD"];
    unsigned int v11 = [v9 supportsCapability:v10];

    unint64_t v5 = v11;
  }

  return v5;
}

+ (void)setMinRemoteDevicePassSyncStateVersionSupport:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v5 = pk_Sync_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Sync_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      unint64_t v10 = a3;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Updated expected pass sync state version to:%lu", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = [a1 _deviceDomainAccessor];
  [v8 setInteger:a3 forKey:@"NPKPassSyncStateVersion"];
}

+ (id)_deviceDomainAccessor
{
  return NPKDomainAccessorForDomain(@"com.apple.nanopassbook");
}

@end