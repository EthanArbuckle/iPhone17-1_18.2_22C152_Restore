@interface NPKIDVRemoteDeviceProtoGenerateKeyRequest
+ (Class)configuredPartitionsIdentifiersType;
- (BOOL)hasCredentialIdentifier;
- (BOOL)hasKeyTypeString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)configuredPartitionsIdentifiers;
- (NSString)credentialIdentifier;
- (NSString)keyTypeString;
- (id)configuredPartitionsIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)configuredPartitionsIdentifiersCount;
- (unint64_t)hash;
- (void)addConfiguredPartitionsIdentifiers:(id)a3;
- (void)clearConfiguredPartitionsIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfiguredPartitionsIdentifiers:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setKeyTypeString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoGenerateKeyRequest

- (BOOL)hasCredentialIdentifier
{
  return self->_credentialIdentifier != 0;
}

- (BOOL)hasKeyTypeString
{
  return self->_keyTypeString != 0;
}

- (void)clearConfiguredPartitionsIdentifiers
{
}

- (void)addConfiguredPartitionsIdentifiers:(id)a3
{
  id v4 = a3;
  configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
  id v8 = v4;
  if (!configuredPartitionsIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_configuredPartitionsIdentifiers;
    self->_configuredPartitionsIdentifiers = v6;

    id v4 = v8;
    configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
  }
  [(NSMutableArray *)configuredPartitionsIdentifiers addObject:v4];
}

- (unint64_t)configuredPartitionsIdentifiersCount
{
  return [(NSMutableArray *)self->_configuredPartitionsIdentifiers count];
}

- (id)configuredPartitionsIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_configuredPartitionsIdentifiers objectAtIndex:a3];
}

+ (Class)configuredPartitionsIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoGenerateKeyRequest;
  id v4 = [(NPKIDVRemoteDeviceProtoGenerateKeyRequest *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoGenerateKeyRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  credentialIdentifier = self->_credentialIdentifier;
  if (credentialIdentifier) {
    [v3 setObject:credentialIdentifier forKey:@"credentialIdentifier"];
  }
  keyTypeString = self->_keyTypeString;
  if (keyTypeString) {
    [v4 setObject:keyTypeString forKey:@"keyTypeString"];
  }
  configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
  if (configuredPartitionsIdentifiers) {
    [v4 setObject:configuredPartitionsIdentifiers forKey:@"configuredPartitionsIdentifiers"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoGenerateKeyRequestReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_credentialIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_keyTypeString) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_configuredPartitionsIdentifiers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_credentialIdentifier) {
    objc_msgSend(v8, "setCredentialIdentifier:");
  }
  if (self->_keyTypeString) {
    objc_msgSend(v8, "setKeyTypeString:");
  }
  if ([(NPKIDVRemoteDeviceProtoGenerateKeyRequest *)self configuredPartitionsIdentifiersCount])
  {
    [v8 clearConfiguredPartitionsIdentifiers];
    unint64_t v4 = [(NPKIDVRemoteDeviceProtoGenerateKeyRequest *)self configuredPartitionsIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKIDVRemoteDeviceProtoGenerateKeyRequest *)self configuredPartitionsIdentifiersAtIndex:i];
        [v8 addConfiguredPartitionsIdentifiers:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_credentialIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_keyTypeString copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_configuredPartitionsIdentifiers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addConfiguredPartitionsIdentifiers:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((credentialIdentifier = self->_credentialIdentifier, !((unint64_t)credentialIdentifier | v4[2]))
     || -[NSString isEqual:](credentialIdentifier, "isEqual:"))
    && ((keyTypeString = self->_keyTypeString, !((unint64_t)keyTypeString | v4[3]))
     || -[NSString isEqual:](keyTypeString, "isEqual:")))
  {
    configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
    if ((unint64_t)configuredPartitionsIdentifiers | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](configuredPartitionsIdentifiers, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_credentialIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_keyTypeString hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_configuredPartitionsIdentifiers hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NPKIDVRemoteDeviceProtoGenerateKeyRequest setCredentialIdentifier:](self, "setCredentialIdentifier:");
  }
  if (*((void *)v4 + 3)) {
    -[NPKIDVRemoteDeviceProtoGenerateKeyRequest setKeyTypeString:](self, "setKeyTypeString:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NPKIDVRemoteDeviceProtoGenerateKeyRequest addConfiguredPartitionsIdentifiers:](self, "addConfiguredPartitionsIdentifiers:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (NSString)keyTypeString
{
  return self->_keyTypeString;
}

- (void)setKeyTypeString:(id)a3
{
}

- (NSMutableArray)configuredPartitionsIdentifiers
{
  return self->_configuredPartitionsIdentifiers;
}

- (void)setConfiguredPartitionsIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyTypeString, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_configuredPartitionsIdentifiers, 0);
}

@end