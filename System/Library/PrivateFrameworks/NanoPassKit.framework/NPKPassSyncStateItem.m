@interface NPKPassSyncStateItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassSyncStateItem:(id)a3;
- (NPKPassSyncStateItem)initWithCoder:(id)a3;
- (NPKPassSyncStateItem)initWithPass:(id)a3;
- (NPKPassSyncStateItem)initWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 sequenceCounter:(id)a5 manifestHash:(id)a6 manifest:(id)a7;
- (NPKPassSyncStateItem)initWithProtoSyncStateItem:(id)a3;
- (NSData)manifestHash;
- (NSDictionary)manifest;
- (NSNumber)sequenceCounter;
- (NSString)passTypeIdentifier;
- (NSString)serialNumber;
- (NSString)uniqueID;
- (id)description;
- (id)protoSyncStateItem;
- (id)shortDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setManifest:(id)a3;
- (void)setManifestHash:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setSequenceCounter:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation NPKPassSyncStateItem

- (NPKPassSyncStateItem)initWithProtoSyncStateItem:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v21 = [v4 passTypeIdentifier];
    v19 = [v5 serialNumber];
    v20 = self;
    if ([v5 hasSequenceCounter])
    {
      v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "sequenceCounter"));
    }
    else
    {
      v6 = 0;
    }
    v8 = [v5 manifestHash];
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v10 = [v5 manifestEntrys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v16 = [v15 fileHash];
          v17 = [v15 relativePath];
          [v9 setObject:v16 forKey:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    v7 = [(NPKPassSyncStateItem *)v20 initWithPassTypeIdentifier:v21 serialNumber:v19 sequenceCounter:v6 manifestHash:v8 manifest:v9];
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

- (id)protoSyncStateItem
{
  v3 = objc_alloc_init(NPKProtoPassSyncStateItem);
  id v4 = [(NPKPassSyncStateItem *)self passTypeIdentifier];
  [(NPKProtoPassSyncStateItem *)v3 setPassTypeIdentifier:v4];

  v5 = [(NPKPassSyncStateItem *)self serialNumber];
  [(NPKProtoPassSyncStateItem *)v3 setSerialNumber:v5];

  v6 = [(NPKPassSyncStateItem *)self sequenceCounter];

  if (v6)
  {
    v7 = [(NPKPassSyncStateItem *)self sequenceCounter];
    -[NPKProtoPassSyncStateItem setSequenceCounter:](v3, "setSequenceCounter:", [v7 unsignedIntValue]);

    [(NPKProtoPassSyncStateItem *)v3 setHasSequenceCounter:1];
  }
  v8 = [(NPKPassSyncStateItem *)self manifestHash];
  [(NPKProtoPassSyncStateItem *)v3 setManifestHash:v8];

  v9 = [(NPKPassSyncStateItem *)self manifest];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__NPKPassSyncStateItem_ProtobufSupport__protoSyncStateItem__block_invoke;
  v12[3] = &unk_2644D6A50;
  v10 = v3;
  uint64_t v13 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];

  return v10;
}

void __59__NPKPassSyncStateItem_ProtobufSupport__protoSyncStateItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = objc_alloc_init(NPKProtoPassSyncStateManifestEntry);
  [(NPKProtoPassSyncStateManifestEntry *)v7 setRelativePath:v6];

  [(NPKProtoPassSyncStateManifestEntry *)v7 setFileHash:v5];
  [*(id *)(a1 + 32) addManifestEntry:v7];
}

- (NPKPassSyncStateItem)initWithPass:(id)a3
{
  id v4 = a3;
  id v5 = [v4 passTypeIdentifier];
  id v6 = [v4 serialNumber];
  v7 = [v4 sequenceCounter];
  v8 = NPKManifestHashForPass(v4);
  v9 = NPKManifestForPass(v4);

  v10 = [(NPKPassSyncStateItem *)self initWithPassTypeIdentifier:v5 serialNumber:v6 sequenceCounter:v7 manifestHash:v8 manifest:v9];
  return v10;
}

- (NPKPassSyncStateItem)initWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4 sequenceCounter:(id)a5 manifestHash:(id)a6 manifest:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NPKPassSyncStateItem;
  v17 = [(NPKPassSyncStateItem *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_passTypeIdentifier, a3);
    objc_storeStrong((id *)&v18->_serialNumber, a4);
    objc_storeStrong((id *)&v18->_sequenceCounter, a5);
    objc_storeStrong((id *)&v18->_manifestHash, a6);
    objc_storeStrong((id *)&v18->_manifest, a7);
  }

  return v18;
}

- (NSString)uniqueID
{
  return (NSString *)PKGeneratePassUniqueID();
}

- (id)description
{
  sequenceCounter = self->_sequenceCounter;
  if (sequenceCounter)
  {
    id v4 = [NSString stringWithFormat:@", sequence counter %@", sequenceCounter];
  }
  else
  {
    id v4 = &stru_26CFEBA18;
  }
  id v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = [(NPKPassSyncStateItem *)self uniqueID];
  v8 = objc_msgSend(v5, "stringWithFormat:", @"<%@: %p unique ID %@ manifest hash %@ manifest %@ (pass type identifier %@, serial number %@%@>"), v6, self, v7, self->_manifestHash, self->_manifest, self->_passTypeIdentifier, self->_serialNumber, v4;

  return v8;
}

- (id)shortDescription
{
  sequenceCounter = self->_sequenceCounter;
  if (sequenceCounter)
  {
    id v4 = [NSString stringWithFormat:@" seq %@", sequenceCounter];
  }
  else
  {
    id v4 = &stru_26CFEBA18;
  }
  id v5 = NSString;
  uint64_t v6 = [(NPKPassSyncStateItem *)self uniqueID];
  passTypeIdentifier = self->_passTypeIdentifier;
  serialNumber = self->_serialNumber;
  v9 = [(NSData *)self->_manifestHash hexEncoding];
  v10 = [v5 stringWithFormat:@"%@ %@ %@ (hash %@%@)", v6, passTypeIdentifier, serialNumber, v9, v4];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NPKPassSyncStateItem *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(NPKPassSyncStateItem *)self isEqualToPassSyncStateItem:v5];

  return v6;
}

- (BOOL)isEqualToPassSyncStateItem:(id)a3
{
  id v4 = a3;
  if (!PKEqualObjects()) {
    goto LABEL_11;
  }
  id v5 = (void *)v4[2];
  BOOL v6 = self->_serialNumber;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

      goto LABEL_11;
    }
    BOOL v9 = [(NSString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_11;
    }
  }
  if (!PKEqualObjects())
  {
LABEL_11:
    char v10 = 0;
    goto LABEL_12;
  }
  char v10 = PKEqualObjects();
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263EFF980] array];
  [v3 safelyAddObject:self->_passTypeIdentifier];
  [v3 safelyAddObject:self->_serialNumber];
  [v3 safelyAddObject:self->_sequenceCounter];
  [v3 safelyAddObject:self->_manifestHash];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  passTypeIdentifier = self->_passTypeIdentifier;
  id v5 = a3;
  [v5 encodeObject:passTypeIdentifier forKey:@"passTypeIdentifier"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v5 encodeObject:self->_sequenceCounter forKey:@"sequenceCounter"];
  [v5 encodeObject:self->_manifestHash forKey:@"manifestHash"];
  [v5 encodeObject:self->_manifest forKey:@"manifest"];
}

- (NPKPassSyncStateItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NPKPassSyncStateItem;
  id v5 = [(NPKPassSyncStateItem *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sequenceCounter"];
    sequenceCounter = v5->_sequenceCounter;
    v5->_sequenceCounter = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifestHash"];
    manifestHash = v5->_manifestHash;
    v5->_manifestHash = (NSData *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v4 decodeDictionaryWithKeysOfClass:v14 objectsOfClass:objc_opt_class() forKey:@"manifest"];
    manifest = v5->_manifest;
    v5->_manifest = (NSDictionary *)v15;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSNumber)sequenceCounter
{
  return self->_sequenceCounter;
}

- (void)setSequenceCounter:(id)a3
{
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
}

- (NSDictionary)manifest
{
  return self->_manifest;
}

- (void)setManifest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_sequenceCounter, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

@end