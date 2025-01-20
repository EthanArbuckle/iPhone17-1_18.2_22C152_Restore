@interface NPKIDVRemoteDeviceProtoDeleteCredentialRequest
+ (Class)configuredPartitionsIdentifiersType;
- (BOOL)hasCredentialIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)configuredPartitionsIdentifiers;
- (NSString)credentialIdentifier;
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
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoDeleteCredentialRequest

- (BOOL)hasCredentialIdentifier
{
  return self->_credentialIdentifier != 0;
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
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoDeleteCredentialRequest;
  id v4 = [(NPKIDVRemoteDeviceProtoDeleteCredentialRequest *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoDeleteCredentialRequest *)self dictionaryRepresentation];
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
  configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
  if (configuredPartitionsIdentifiers) {
    [v4 setObject:configuredPartitionsIdentifiers forKey:@"configuredPartitionsIdentifiers"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoDeleteCredentialRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_credentialIdentifier) {
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
  if ([(NPKIDVRemoteDeviceProtoDeleteCredentialRequest *)self configuredPartitionsIdentifiersCount])
  {
    [v8 clearConfiguredPartitionsIdentifiers];
    unint64_t v4 = [(NPKIDVRemoteDeviceProtoDeleteCredentialRequest *)self configuredPartitionsIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKIDVRemoteDeviceProtoDeleteCredentialRequest *)self configuredPartitionsIdentifiersAtIndex:i];
        [v8 addConfiguredPartitionsIdentifiers:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_credentialIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_configuredPartitionsIdentifiers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addConfiguredPartitionsIdentifiers:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((credentialIdentifier = self->_credentialIdentifier, !((unint64_t)credentialIdentifier | v4[2]))
     || -[NSString isEqual:](credentialIdentifier, "isEqual:")))
  {
    configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
    if ((unint64_t)configuredPartitionsIdentifiers | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](configuredPartitionsIdentifiers, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_credentialIdentifier hash];
  return [(NSMutableArray *)self->_configuredPartitionsIdentifiers hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NPKIDVRemoteDeviceProtoDeleteCredentialRequest setCredentialIdentifier:](self, "setCredentialIdentifier:");
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
        -[NPKIDVRemoteDeviceProtoDeleteCredentialRequest addConfiguredPartitionsIdentifiers:](self, "addConfiguredPartitionsIdentifiers:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
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

- (NSMutableArray)configuredPartitionsIdentifiers
{
  return self->_configuredPartitionsIdentifiers;
}

- (void)setConfiguredPartitionsIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_configuredPartitionsIdentifiers, 0);
}

@end