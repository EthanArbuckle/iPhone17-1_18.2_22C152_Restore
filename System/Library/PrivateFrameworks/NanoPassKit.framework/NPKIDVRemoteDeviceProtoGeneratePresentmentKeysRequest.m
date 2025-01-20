@interface NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest
+ (Class)configuredPartitionsIdentifiersType;
- (BOOL)hasCredentialIdentifier;
- (BOOL)hasNumKeys;
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
- (unsigned)numKeys;
- (void)addConfiguredPartitionsIdentifiers:(id)a3;
- (void)clearConfiguredPartitionsIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfiguredPartitionsIdentifiers:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setHasNumKeys:(BOOL)a3;
- (void)setNumKeys:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest

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

- (void)setNumKeys:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numKeys = a3;
}

- (void)setHasNumKeys:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumKeys
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest;
  id v4 = [(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_numKeys];
    [v4 setObject:v7 forKey:@"numKeys"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequestReadFrom((uint64_t)self, (uint64_t)a3);
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_credentialIdentifier) {
    objc_msgSend(v8, "setCredentialIdentifier:");
  }
  if ([(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest *)self configuredPartitionsIdentifiersCount])
  {
    [v8 clearConfiguredPartitionsIdentifiers];
    unint64_t v4 = [(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest *)self configuredPartitionsIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest *)self configuredPartitionsIdentifiersAtIndex:i];
        [v8 addConfiguredPartitionsIdentifiers:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v8 + 6) = self->_numKeys;
    *((unsigned char *)v8 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_credentialIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

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
        [(id)v5 addConfiguredPartitionsIdentifiers:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_numKeys;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  credentialIdentifier = self->_credentialIdentifier;
  if ((unint64_t)credentialIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](credentialIdentifier, "isEqual:")) {
      goto LABEL_10;
    }
  }
  configuredPartitionsIdentifiers = self->_configuredPartitionsIdentifiers;
  if ((unint64_t)configuredPartitionsIdentifiers | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](configuredPartitionsIdentifiers, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) != 0 && self->_numKeys == *((_DWORD *)v4 + 6))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_credentialIdentifier hash];
  uint64_t v4 = [(NSMutableArray *)self->_configuredPartitionsIdentifiers hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_numKeys;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest setCredentialIdentifier:](self, "setCredentialIdentifier:");
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
        -[NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest addConfiguredPartitionsIdentifiers:](self, "addConfiguredPartitionsIdentifiers:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 28))
  {
    self->_numKeys = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
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

- (unsigned)numKeys
{
  return self->_numKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_configuredPartitionsIdentifiers, 0);
}

@end