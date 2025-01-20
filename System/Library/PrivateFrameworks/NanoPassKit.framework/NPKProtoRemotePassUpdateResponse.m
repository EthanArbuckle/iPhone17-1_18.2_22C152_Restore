@interface NPKProtoRemotePassUpdateResponse
+ (Class)expressPassConfigurationType;
+ (Class)expressPassInformationType;
- (BOOL)hasErrorData;
- (BOOL)hasPass;
- (BOOL)hasPending;
- (BOOL)hasUpgradeStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (NPKProtoPass)pass;
- (NSData)errorData;
- (NSMutableArray)expressPassConfigurations;
- (NSMutableArray)expressPassInformations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)expressPassConfigurationAtIndex:(unint64_t)a3;
- (id)expressPassInformationAtIndex:(unint64_t)a3;
- (id)upgradeStatusAsString:(int)a3;
- (int)StringAsUpgradeStatus:(id)a3;
- (int)upgradeStatus;
- (unint64_t)expressPassConfigurationsCount;
- (unint64_t)expressPassInformationsCount;
- (unint64_t)hash;
- (void)addExpressPassConfiguration:(id)a3;
- (void)addExpressPassInformation:(id)a3;
- (void)clearExpressPassConfigurations;
- (void)clearExpressPassInformations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setExpressPassConfigurations:(id)a3;
- (void)setExpressPassInformations:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setHasUpgradeStatus:(BOOL)a3;
- (void)setPass:(id)a3;
- (void)setPending:(BOOL)a3;
- (void)setUpgradeStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRemotePassUpdateResponse

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPending
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPass
{
  return self->_pass != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (int)upgradeStatus
{
  if (*(unsigned char *)&self->_has) {
    return self->_upgradeStatus;
  }
  else {
    return 0;
  }
}

- (void)setUpgradeStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_upgradeStatus = a3;
}

- (void)setHasUpgradeStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUpgradeStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)upgradeStatusAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_2644D85A0[a3];
  }
  return v3;
}

- (int)StringAsUpgradeStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KeepAlive"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UpgradeStarted"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UpgradeCompleted"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ExpressModeSetupCompleted"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearExpressPassInformations
{
}

- (void)addExpressPassInformation:(id)a3
{
  id v4 = a3;
  expressPassInformations = self->_expressPassInformations;
  id v8 = v4;
  if (!expressPassInformations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_expressPassInformations;
    self->_expressPassInformations = v6;

    id v4 = v8;
    expressPassInformations = self->_expressPassInformations;
  }
  [(NSMutableArray *)expressPassInformations addObject:v4];
}

- (unint64_t)expressPassInformationsCount
{
  return [(NSMutableArray *)self->_expressPassInformations count];
}

- (id)expressPassInformationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_expressPassInformations objectAtIndex:a3];
}

+ (Class)expressPassInformationType
{
  return (Class)objc_opt_class();
}

- (void)clearExpressPassConfigurations
{
}

- (void)addExpressPassConfiguration:(id)a3
{
  id v4 = a3;
  expressPassConfigurations = self->_expressPassConfigurations;
  id v8 = v4;
  if (!expressPassConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_expressPassConfigurations;
    self->_expressPassConfigurations = v6;

    id v4 = v8;
    expressPassConfigurations = self->_expressPassConfigurations;
  }
  [(NSMutableArray *)expressPassConfigurations addObject:v4];
}

- (unint64_t)expressPassConfigurationsCount
{
  return [(NSMutableArray *)self->_expressPassConfigurations count];
}

- (id)expressPassConfigurationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_expressPassConfigurations objectAtIndex:a3];
}

+ (Class)expressPassConfigurationType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemotePassUpdateResponse;
  id v4 = [(NPKProtoRemotePassUpdateResponse *)&v8 description];
  v5 = [(NPKProtoRemotePassUpdateResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v4 forKey:@"pending"];
  }
  pass = self->_pass;
  if (pass)
  {
    v6 = [(NPKProtoPass *)pass dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"pass"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v3 setObject:errorData forKey:@"errorData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t upgradeStatus = self->_upgradeStatus;
    if (upgradeStatus >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_upgradeStatus);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_2644D85A0[upgradeStatus];
    }
    [v3 setObject:v9 forKey:@"upgradeStatus"];
  }
  expressPassInformations = self->_expressPassInformations;
  if (expressPassInformations) {
    [v3 setObject:expressPassInformations forKey:@"expressPassInformation"];
  }
  expressPassConfigurations = self->_expressPassConfigurations;
  if (expressPassConfigurations) {
    [v3 setObject:expressPassConfigurations forKey:@"expressPassConfiguration"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassUpdateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_pass) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_errorData) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_expressPassInformations;
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
        PBDataWriterWriteDataField();
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
  v10 = self->_expressPassConfigurations;
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
        PBDataWriterWriteDataField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[44] = self->_pending;
    v4[48] |= 2u;
  }
  uint64_t v13 = v4;
  if (self->_pass)
  {
    objc_msgSend(v4, "setPass:");
    id v4 = v13;
  }
  if (self->_errorData)
  {
    objc_msgSend(v13, "setErrorData:");
    id v4 = v13;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 10) = self->_upgradeStatus;
    v4[48] |= 1u;
  }
  if ([(NPKProtoRemotePassUpdateResponse *)self expressPassInformationsCount])
  {
    [v13 clearExpressPassInformations];
    unint64_t v5 = [(NPKProtoRemotePassUpdateResponse *)self expressPassInformationsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NPKProtoRemotePassUpdateResponse *)self expressPassInformationAtIndex:i];
        [v13 addExpressPassInformation:v8];
      }
    }
  }
  if ([(NPKProtoRemotePassUpdateResponse *)self expressPassConfigurationsCount])
  {
    [v13 clearExpressPassConfigurations];
    unint64_t v9 = [(NPKProtoRemotePassUpdateResponse *)self expressPassConfigurationsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(NPKProtoRemotePassUpdateResponse *)self expressPassConfigurationAtIndex:j];
        [v13 addExpressPassConfiguration:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 44) = self->_pending;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  id v7 = [(NPKProtoPass *)self->_pass copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  uint64_t v9 = [(NSData *)self->_errorData copyWithZone:a3];
  unint64_t v10 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v9;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 40) = self->_upgradeStatus;
    *(unsigned char *)(v6 + 48) |= 1u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v11 = self->_expressPassInformations;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v29;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * v15) copyWithZone:a3];
        [(id)v6 addExpressPassInformation:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v13);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v17 = self->_expressPassConfigurations;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (void)v24);
        [(id)v6 addExpressPassConfiguration:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v19);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) != 0)
    {
      if (self->_pending)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_23;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_10;
      }
    }
LABEL_23:
    char v9 = 0;
    goto LABEL_24;
  }
  if ((*((unsigned char *)v4 + 48) & 2) != 0) {
    goto LABEL_23;
  }
LABEL_10:
  pass = self->_pass;
  if ((unint64_t)pass | *((void *)v4 + 4) && !-[NPKProtoPass isEqual:](pass, "isEqual:")) {
    goto LABEL_23;
  }
  errorData = self->_errorData;
  if ((unint64_t)errorData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](errorData, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_upgradeStatus != *((_DWORD *)v4 + 10)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_23;
  }
  expressPassInformations = self->_expressPassInformations;
  if ((unint64_t)expressPassInformations | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](expressPassInformations, "isEqual:"))
  {
    goto LABEL_23;
  }
  expressPassConfigurations = self->_expressPassConfigurations;
  if ((unint64_t)expressPassConfigurations | *((void *)v4 + 2)) {
    char v9 = -[NSMutableArray isEqual:](expressPassConfigurations, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_pending;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NPKProtoPass *)self->_pass hash];
  uint64_t v5 = [(NSData *)self->_errorData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_upgradeStatus;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v8 = [(NSMutableArray *)self->_expressPassInformations hash];
  return v7 ^ v8 ^ [(NSMutableArray *)self->_expressPassConfigurations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t v4 = a3;
  id v5 = v4;
  if ((v4[48] & 2) != 0)
  {
    self->_pending = v4[44];
    *(unsigned char *)&self->_has |= 2u;
  }
  pass = self->_pass;
  uint64_t v7 = *((void *)v5 + 4);
  if (pass)
  {
    if (v7) {
      -[NPKProtoPass mergeFrom:](pass, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[NPKProtoRemotePassUpdateResponse setPass:](self, "setPass:");
  }
  if (*((void *)v5 + 1)) {
    -[NPKProtoRemotePassUpdateResponse setErrorData:](self, "setErrorData:");
  }
  if (*((unsigned char *)v5 + 48))
  {
    self->_uint64_t upgradeStatus = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = *((id *)v5 + 3);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NPKProtoRemotePassUpdateResponse *)self addExpressPassInformation:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = *((id *)v5 + 2);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[NPKProtoRemotePassUpdateResponse addExpressPassConfiguration:](self, "addExpressPassConfiguration:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (NPKProtoPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (NSMutableArray)expressPassInformations
{
  return self->_expressPassInformations;
}

- (void)setExpressPassInformations:(id)a3
{
}

- (NSMutableArray)expressPassConfigurations
{
  return self->_expressPassConfigurations;
}

- (void)setExpressPassConfigurations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_expressPassInformations, 0);
  objc_storeStrong((id *)&self->_expressPassConfigurations, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
}

@end