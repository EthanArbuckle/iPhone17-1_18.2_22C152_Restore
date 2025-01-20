@interface NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext
+ (Class)credentialsType;
+ (Class)remoteCredentialsType;
- (BOOL)allowsManualEntry;
- (BOOL)hasAllowsManualEntry;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)credentials;
- (NSMutableArray)remoteCredentials;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credentialsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)remoteCredentialsAtIndex:(unint64_t)a3;
- (unint64_t)credentialsCount;
- (unint64_t)hash;
- (unint64_t)remoteCredentialsCount;
- (void)addCredentials:(id)a3;
- (void)addRemoteCredentials:(id)a3;
- (void)clearCredentials;
- (void)clearRemoteCredentials;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowsManualEntry:(BOOL)a3;
- (void)setCredentials:(id)a3;
- (void)setHasAllowsManualEntry:(BOOL)a3;
- (void)setRemoteCredentials:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext

- (void)clearRemoteCredentials
{
}

- (void)addRemoteCredentials:(id)a3
{
  id v4 = a3;
  remoteCredentials = self->_remoteCredentials;
  id v8 = v4;
  if (!remoteCredentials)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_remoteCredentials;
    self->_remoteCredentials = v6;

    id v4 = v8;
    remoteCredentials = self->_remoteCredentials;
  }
  [(NSMutableArray *)remoteCredentials addObject:v4];
}

- (unint64_t)remoteCredentialsCount
{
  return [(NSMutableArray *)self->_remoteCredentials count];
}

- (id)remoteCredentialsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_remoteCredentials objectAtIndex:a3];
}

+ (Class)remoteCredentialsType
{
  return (Class)objc_opt_class();
}

- (void)clearCredentials
{
}

- (void)addCredentials:(id)a3
{
  id v4 = a3;
  credentials = self->_credentials;
  id v8 = v4;
  if (!credentials)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_credentials;
    self->_credentials = v6;

    id v4 = v8;
    credentials = self->_credentials;
  }
  [(NSMutableArray *)credentials addObject:v4];
}

- (unint64_t)credentialsCount
{
  return [(NSMutableArray *)self->_credentials count];
}

- (id)credentialsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_credentials objectAtIndex:a3];
}

+ (Class)credentialsType
{
  return (Class)objc_opt_class();
}

- (void)setAllowsManualEntry:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_allowsManualEntry = a3;
}

- (void)setHasAllowsManualEntry:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowsManualEntry
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext;
  id v4 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_remoteCredentials count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_remoteCredentials, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v5 = self->_remoteCredentials;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"remoteCredentials"];
  }
  if ([(NSMutableArray *)self->_credentials count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_credentials, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v12 = self->_credentials;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "dictionaryRepresentation", (void)v20);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"credentials"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v18 = [NSNumber numberWithBool:self->_allowsManualEntry];
    [v3 setObject:v18 forKey:@"allowsManualEntry"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContextReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_remoteCredentials;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_credentials;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v12 = a3;
  if ([(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)self remoteCredentialsCount])
  {
    [v12 clearRemoteCredentials];
    unint64_t v4 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)self remoteCredentialsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)self remoteCredentialsAtIndex:i];
        [v12 addRemoteCredentials:v7];
      }
    }
  }
  if ([(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)self credentialsCount])
  {
    [v12 clearCredentials];
    unint64_t v8 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)self credentialsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)self credentialsAtIndex:j];
        [v12 addCredentials:v11];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v12[24] = self->_allowsManualEntry;
    v12[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unint64_t v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_remoteCredentials;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addRemoteCredentials:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_credentials;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addCredentials:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  if (*(unsigned char *)&self->_has)
  {
    v5[24] = self->_allowsManualEntry;
    v5[28] |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  remoteCredentials = self->_remoteCredentials;
  if ((unint64_t)remoteCredentials | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](remoteCredentials, "isEqual:")) {
      goto LABEL_8;
    }
  }
  credentials = self->_credentials;
  if ((unint64_t)credentials | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](credentials, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_allowsManualEntry)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_remoteCredentials hash];
  uint64_t v4 = [(NSMutableArray *)self->_credentials hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_allowsManualEntry;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *)self addRemoteCredentials:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 1);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext addCredentials:](self, "addCredentials:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((unsigned char *)v4 + 28))
  {
    self->_allowsManualEntry = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)remoteCredentials
{
  return self->_remoteCredentials;
}

- (void)setRemoteCredentials:(id)a3
{
}

- (NSMutableArray)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
}

- (BOOL)allowsManualEntry
{
  return self->_allowsManualEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCredentials, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end