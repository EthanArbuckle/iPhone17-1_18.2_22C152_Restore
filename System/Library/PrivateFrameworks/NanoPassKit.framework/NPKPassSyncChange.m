@interface NPKPassSyncChange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChange:(id)a3;
- (BOOL)isEqualToChangeIgnoringUUID:(id)a3;
- (NPKPassSyncChange)initWithChangeUUID:(id)a3 reconciledStateHash:(id)a4 reconciledStateVersion:(unint64_t)a5 changeType:(unint64_t)a6 uniqueID:(id)a7 syncStateItem:(id)a8 passData:(id)a9;
- (NPKPassSyncChange)initWithChangeUUID:(id)a3 reconciledStateHash:(id)a4 reconciledStateVersion:(unint64_t)a5 changeType:(unint64_t)a6 uniqueID:(id)a7 syncStateItem:(id)a8 passData:(id)a9 baseManifestHashForPartialUpdate:(id)a10 remoteAssetsForPartialUpdate:(id)a11;
- (NPKPassSyncChange)initWithCoder:(id)a3;
- (NPKPassSyncChange)initWithProtoPassSyncChange:(id)a3;
- (NPKPassSyncStateItem)syncStateItem;
- (NSData)baseManifestHashForPartialUpdate;
- (NSData)passData;
- (NSData)reconciledStateHash;
- (NSDictionary)remoteAssetsForPartialUpdate;
- (NSString)uniqueID;
- (NSUUID)changeUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protoPassSyncChange;
- (unint64_t)changeType;
- (unint64_t)hash;
- (unint64_t)reconciledStateVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseManifestHashForPartialUpdate:(id)a3;
- (void)setChangeType:(unint64_t)a3;
- (void)setChangeUUID:(id)a3;
- (void)setPassData:(id)a3;
- (void)setReconciledStateHash:(id)a3;
- (void)setReconciledStateVersion:(unint64_t)a3;
- (void)setRemoteAssetsForPartialUpdate:(id)a3;
- (void)setSyncStateItem:(id)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation NPKPassSyncChange

- (NPKPassSyncChange)initWithChangeUUID:(id)a3 reconciledStateHash:(id)a4 reconciledStateVersion:(unint64_t)a5 changeType:(unint64_t)a6 uniqueID:(id)a7 syncStateItem:(id)a8 passData:(id)a9 baseManifestHashForPartialUpdate:(id)a10 remoteAssetsForPartialUpdate:(id)a11
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v16 = a10;
  id v17 = a11;
  v28.receiver = self;
  v28.super_class = (Class)NPKPassSyncChange;
  v18 = [(NPKPassSyncChange *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_changeUUID, a3);
    objc_storeStrong((id *)&v19->_reconciledStateHash, a4);
    v19->_reconciledStateVersion = a5;
    v19->_changeType = a6;
    objc_storeStrong((id *)&v19->_uniqueID, a7);
    objc_storeStrong((id *)&v19->_syncStateItem, a8);
    objc_storeStrong((id *)&v19->_passData, a9);
    objc_storeStrong((id *)&v19->_baseManifestHashForPartialUpdate, a10);
    objc_storeStrong((id *)&v19->_remoteAssetsForPartialUpdate, a11);
  }

  return v19;
}

- (NPKPassSyncChange)initWithChangeUUID:(id)a3 reconciledStateHash:(id)a4 reconciledStateVersion:(unint64_t)a5 changeType:(unint64_t)a6 uniqueID:(id)a7 syncStateItem:(id)a8 passData:(id)a9
{
  return [(NPKPassSyncChange *)self initWithChangeUUID:a3 reconciledStateHash:a4 reconciledStateVersion:a5 changeType:a6 uniqueID:a7 syncStateItem:a8 passData:a9 baseManifestHashForPartialUpdate:0 remoteAssetsForPartialUpdate:0];
}

- (id)description
{
  id v17 = NSString;
  uint64_t v3 = objc_opt_class();
  changeUUID = self->_changeUUID;
  v5 = [(NSData *)self->_reconciledStateHash hexEncoding];
  v6 = @"Add";
  unint64_t reconciledStateVersion = self->_reconciledStateVersion;
  unint64_t changeType = self->_changeType;
  if (changeType == 1) {
    v6 = @"Update";
  }
  if (changeType == 2) {
    v6 = @"Remove";
  }
  uniqueID = self->_uniqueID;
  syncStateItem = self->_syncStateItem;
  passData = self->_passData;
  v12 = v6;
  v13 = [(NSData *)passData npkDescription];
  v14 = [(NSData *)self->_baseManifestHashForPartialUpdate hexEncoding];
  v15 = [v17 stringWithFormat:@"<%@: %p change UUID %@ reconciled state hash %@ version:%lu change type %@ unique ID %@ sync state item %@ pass data %@ base manifest hash for partial update %@>", v3, self, changeUUID, v5, reconciledStateVersion, v12, uniqueID, syncStateItem, v13, v14];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NPKPassSyncChange *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(NPKPassSyncChange *)self isEqualToChange:v5];

  return v6;
}

- (BOOL)isEqualToChange:(id)a3
{
  id v4 = a3;
  if (PKEqualObjects()) {
    BOOL v5 = [(NPKPassSyncChange *)self isEqualToChangeIgnoringUUID:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToChangeIgnoringUUID:(id)a3
{
  id v4 = a3;
  if (PKEqualObjects()
    && self->_changeType == v4[4]
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects())
  {
    char v5 = PKEqualObjects();
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  [v3 safelyAddObject:self->_changeUUID];
  [v3 safelyAddObject:self->_reconciledStateHash];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_reconciledStateVersion];
  [v3 safelyAddObject:v4];

  char v5 = [NSNumber numberWithUnsignedInteger:self->_changeType];
  [v3 safelyAddObject:v5];

  [v3 safelyAddObject:self->_uniqueID];
  [v3 safelyAddObject:self->_syncStateItem];
  [v3 safelyAddObject:self->_passData];
  [v3 safelyAddObject:self->_baseManifestHashForPartialUpdate];
  [v3 safelyAddObject:self->_remoteAssetsForPartialUpdate];
  unint64_t v6 = PKCombinedHash();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NPKPassSyncChange allocWithZone:a3] init];
  [(NPKPassSyncChange *)v4 setChangeUUID:self->_changeUUID];
  [(NPKPassSyncChange *)v4 setReconciledStateHash:self->_reconciledStateHash];
  [(NPKPassSyncChange *)v4 setReconciledStateVersion:self->_reconciledStateVersion];
  [(NPKPassSyncChange *)v4 setChangeType:self->_changeType];
  [(NPKPassSyncChange *)v4 setUniqueID:self->_uniqueID];
  [(NPKPassSyncChange *)v4 setSyncStateItem:self->_syncStateItem];
  [(NPKPassSyncChange *)v4 setPassData:self->_passData];
  [(NPKPassSyncChange *)v4 setBaseManifestHashForPartialUpdate:self->_baseManifestHashForPartialUpdate];
  [(NPKPassSyncChange *)v4 setRemoteAssetsForPartialUpdate:self->_remoteAssetsForPartialUpdate];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  changeUUID = self->_changeUUID;
  id v7 = a3;
  [v7 encodeObject:changeUUID forKey:@"changeUUID"];
  [v7 encodeObject:self->_reconciledStateHash forKey:@"reconciledStateHash"];
  char v5 = [NSNumber numberWithUnsignedInteger:self->_reconciledStateVersion];
  [v7 encodeObject:v5 forKey:@"reconciledStateVersion"];

  unint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_changeType];
  [v7 encodeObject:v6 forKey:@"changeType"];

  [v7 encodeObject:self->_uniqueID forKey:@"uniqueID"];
  [v7 encodeObject:self->_syncStateItem forKey:@"syncStateItem"];
  [v7 encodeObject:self->_passData forKey:@"passData"];
  [v7 encodeObject:self->_baseManifestHashForPartialUpdate forKey:@"baseManifestHashForPartialUpdate"];
  [v7 encodeObject:self->_remoteAssetsForPartialUpdate forKey:@"remoteAssetsForPartialUpdate"];
}

- (NPKPassSyncChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NPKPassSyncChange;
  char v5 = [(NPKPassSyncChange *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changeUUID"];
    changeUUID = v5->_changeUUID;
    v5->_changeUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reconciledStateHash"];
    reconciledStateHash = v5->_reconciledStateHash;
    v5->_reconciledStateHash = (NSData *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reconciledStateVersion"];
    v5->_unint64_t reconciledStateVersion = [v10 unsignedIntValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changeType"];
    v5->_unint64_t changeType = [v11 unsignedIntValue];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"syncStateItem"];
    syncStateItem = v5->_syncStateItem;
    v5->_syncStateItem = (NPKPassSyncStateItem *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passData"];
    passData = v5->_passData;
    v5->_passData = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseManifestHashForPartialUpdate"];
    baseManifestHashForPartialUpdate = v5->_baseManifestHashForPartialUpdate;
    v5->_baseManifestHashForPartialUpdate = (NSData *)v18;

    uint64_t v20 = objc_opt_class();
    uint64_t v21 = [v4 decodeDictionaryWithKeysOfClass:v20 objectsOfClass:objc_opt_class() forKey:@"remoteAssetsForPartialUpdate"];
    remoteAssetsForPartialUpdate = v5->_remoteAssetsForPartialUpdate;
    v5->_remoteAssetsForPartialUpdate = (NSDictionary *)v21;
  }
  return v5;
}

- (NSUUID)changeUUID
{
  return self->_changeUUID;
}

- (void)setChangeUUID:(id)a3
{
}

- (NSData)reconciledStateHash
{
  return self->_reconciledStateHash;
}

- (void)setReconciledStateHash:(id)a3
{
}

- (unint64_t)reconciledStateVersion
{
  return self->_reconciledStateVersion;
}

- (void)setReconciledStateVersion:(unint64_t)a3
{
  self->_unint64_t reconciledStateVersion = a3;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_unint64_t changeType = a3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NPKPassSyncStateItem)syncStateItem
{
  return self->_syncStateItem;
}

- (void)setSyncStateItem:(id)a3
{
}

- (NSData)passData
{
  return self->_passData;
}

- (void)setPassData:(id)a3
{
}

- (NSData)baseManifestHashForPartialUpdate
{
  return self->_baseManifestHashForPartialUpdate;
}

- (void)setBaseManifestHashForPartialUpdate:(id)a3
{
}

- (NSDictionary)remoteAssetsForPartialUpdate
{
  return self->_remoteAssetsForPartialUpdate;
}

- (void)setRemoteAssetsForPartialUpdate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAssetsForPartialUpdate, 0);
  objc_storeStrong((id *)&self->_baseManifestHashForPartialUpdate, 0);
  objc_storeStrong((id *)&self->_passData, 0);
  objc_storeStrong((id *)&self->_syncStateItem, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_reconciledStateHash, 0);
  objc_storeStrong((id *)&self->_changeUUID, 0);
}

- (NPKPassSyncChange)initWithProtoPassSyncChange:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    v30 = self;
    uint64_t v6 = [v4 changeUUID];
    v31 = v6;
    if (v6) {
      v29 = objc_msgSend(objc_alloc(MEMORY[0x263F08C38]), "initWithUUIDBytes:", objc_msgSend(v6, "bytes"));
    }
    else {
      v29 = 0;
    }
    objc_super v28 = [v5 lastKnownReconciledPassSyncStateHash];
    uint64_t v26 = [v5 lastKnownReconciledPassSyncStateHashVersion];
    int v8 = [v5 changeType];
    uint64_t v9 = v8 == 1;
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    uint64_t v25 = v9;
    id v27 = [v5 uniqueID];
    v10 = [NPKPassSyncStateItem alloc];
    v11 = [v5 syncStateItem];
    objc_super v24 = [(NPKPassSyncStateItem *)v10 initWithProtoSyncStateItem:v11];

    uint64_t v12 = [v5 passData];
    v13 = [v5 baseManifestHashForPartialUpdate];
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v15 = [v5 remoteAssetsForPartialUpdates];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v21 = [v20 fileHash];
          v22 = [v20 relativePath];
          [v14 setObject:v21 forKey:v22];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v17);
    }

    id v7 = [(NPKPassSyncChange *)v30 initWithChangeUUID:v29 reconciledStateHash:v28 reconciledStateVersion:v26 changeType:v25 uniqueID:v27 syncStateItem:v24 passData:v12 baseManifestHashForPartialUpdate:v13 remoteAssetsForPartialUpdate:v14];
  }
  else
  {

    id v7 = 0;
  }

  return v7;
}

- (id)protoPassSyncChange
{
  v20[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_alloc_init(NPKProtoPassSyncStateChange);
  id v4 = [(NPKPassSyncChange *)self changeUUID];
  char v5 = v4;
  if (v4)
  {
    v20[0] = 0;
    v20[1] = 0;
    [v4 getUUIDBytes:v20];
    uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:v20 length:16];
    [(NPKProtoPassSyncStateChange *)v3 setChangeUUID:v6];
  }
  id v7 = [(NPKPassSyncChange *)self reconciledStateHash];
  [(NPKProtoPassSyncStateChange *)v3 setLastKnownReconciledPassSyncStateHash:v7];

  [(NPKProtoPassSyncStateChange *)v3 setLastKnownReconciledPassSyncStateHashVersion:[(NPKPassSyncChange *)self reconciledStateVersion]];
  unint64_t v8 = [(NPKPassSyncChange *)self changeType];
  if (v8 == 2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = v8 == 1;
  }
  [(NPKProtoPassSyncStateChange *)v3 setChangeType:v9];
  v10 = [(NPKPassSyncChange *)self uniqueID];
  [(NPKProtoPassSyncStateChange *)v3 setUniqueID:v10];

  v11 = [(NPKPassSyncChange *)self syncStateItem];
  uint64_t v12 = [v11 protoSyncStateItem];
  [(NPKProtoPassSyncStateChange *)v3 setSyncStateItem:v12];

  v13 = [(NPKPassSyncChange *)self passData];
  [(NPKProtoPassSyncStateChange *)v3 setPassData:v13];

  uint64_t v14 = [(NPKPassSyncChange *)self baseManifestHashForPartialUpdate];
  [(NPKProtoPassSyncStateChange *)v3 setBaseManifestHashForPartialUpdate:v14];

  v15 = [(NPKPassSyncChange *)self remoteAssetsForPartialUpdate];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__NPKPassSyncChange_ProtobufSupport__protoPassSyncChange__block_invoke;
  v18[3] = &unk_2644D6A50;
  uint64_t v16 = v3;
  v19 = v16;
  [v15 enumerateKeysAndObjectsUsingBlock:v18];

  return v16;
}

void __57__NPKPassSyncChange_ProtobufSupport__protoPassSyncChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc_init(NPKProtoPassSyncStateManifestEntry);
  [(NPKProtoPassSyncStateManifestEntry *)v7 setRelativePath:v6];

  [(NPKProtoPassSyncStateManifestEntry *)v7 setFileHash:v5];
  [*(id *)(a1 + 32) addRemoteAssetsForPartialUpdate:v7];
}

@end