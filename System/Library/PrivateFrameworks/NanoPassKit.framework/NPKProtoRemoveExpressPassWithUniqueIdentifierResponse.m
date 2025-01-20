@interface NPKProtoRemoveExpressPassWithUniqueIdentifierResponse
+ (Class)currentExpressPassesInformationType;
+ (Class)expressPassConfigurationsType;
- (BOOL)hasActualExpressPassInformation;
- (BOOL)hasPending;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSData)actualExpressPassInformation;
- (NSMutableArray)currentExpressPassesInformations;
- (NSMutableArray)expressPassConfigurations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentExpressPassesInformationAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)expressPassConfigurationsAtIndex:(unint64_t)a3;
- (unint64_t)currentExpressPassesInformationsCount;
- (unint64_t)expressPassConfigurationsCount;
- (unint64_t)hash;
- (void)addCurrentExpressPassesInformation:(id)a3;
- (void)addExpressPassConfigurations:(id)a3;
- (void)clearCurrentExpressPassesInformations;
- (void)clearExpressPassConfigurations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActualExpressPassInformation:(id)a3;
- (void)setCurrentExpressPassesInformations:(id)a3;
- (void)setExpressPassConfigurations:(id)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRemoveExpressPassWithUniqueIdentifierResponse

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPending
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasActualExpressPassInformation
{
  return self->_actualExpressPassInformation != 0;
}

- (void)clearCurrentExpressPassesInformations
{
}

- (void)addCurrentExpressPassesInformation:(id)a3
{
  id v4 = a3;
  currentExpressPassesInformations = self->_currentExpressPassesInformations;
  id v8 = v4;
  if (!currentExpressPassesInformations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_currentExpressPassesInformations;
    self->_currentExpressPassesInformations = v6;

    id v4 = v8;
    currentExpressPassesInformations = self->_currentExpressPassesInformations;
  }
  [(NSMutableArray *)currentExpressPassesInformations addObject:v4];
}

- (unint64_t)currentExpressPassesInformationsCount
{
  return [(NSMutableArray *)self->_currentExpressPassesInformations count];
}

- (id)currentExpressPassesInformationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_currentExpressPassesInformations objectAtIndex:a3];
}

+ (Class)currentExpressPassesInformationType
{
  return (Class)objc_opt_class();
}

- (void)clearExpressPassConfigurations
{
}

- (void)addExpressPassConfigurations:(id)a3
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

- (id)expressPassConfigurationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_expressPassConfigurations objectAtIndex:a3];
}

+ (Class)expressPassConfigurationsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemoveExpressPassWithUniqueIdentifierResponse;
  id v4 = [(NPKProtoRemoveExpressPassWithUniqueIdentifierResponse *)&v8 description];
  v5 = [(NPKProtoRemoveExpressPassWithUniqueIdentifierResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v5 forKey:@"pending"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_success];
    [v3 setObject:v6 forKey:@"success"];
  }
  actualExpressPassInformation = self->_actualExpressPassInformation;
  if (actualExpressPassInformation) {
    [v3 setObject:actualExpressPassInformation forKey:@"actualExpressPassInformation"];
  }
  currentExpressPassesInformations = self->_currentExpressPassesInformations;
  if (currentExpressPassesInformations) {
    [v3 setObject:currentExpressPassesInformations forKey:@"currentExpressPassesInformation"];
  }
  expressPassConfigurations = self->_expressPassConfigurations;
  if (expressPassConfigurations) {
    [v3 setObject:expressPassConfigurations forKey:@"expressPassConfigurations"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemoveExpressPassWithUniqueIdentifierResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_actualExpressPassInformation) {
    PBDataWriterWriteDataField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = self->_currentExpressPassesInformations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_expressPassConfigurations;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[32] = self->_pending;
    v4[36] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[33] = self->_success;
    v4[36] |= 2u;
  }
  id v14 = v4;
  if (self->_actualExpressPassInformation) {
    objc_msgSend(v4, "setActualExpressPassInformation:");
  }
  if ([(NPKProtoRemoveExpressPassWithUniqueIdentifierResponse *)self currentExpressPassesInformationsCount])
  {
    [v14 clearCurrentExpressPassesInformations];
    unint64_t v6 = [(NPKProtoRemoveExpressPassWithUniqueIdentifierResponse *)self currentExpressPassesInformationsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(NPKProtoRemoveExpressPassWithUniqueIdentifierResponse *)self currentExpressPassesInformationAtIndex:i];
        [v14 addCurrentExpressPassesInformation:v9];
      }
    }
  }
  if ([(NPKProtoRemoveExpressPassWithUniqueIdentifierResponse *)self expressPassConfigurationsCount])
  {
    [v14 clearExpressPassConfigurations];
    unint64_t v10 = [(NPKProtoRemoveExpressPassWithUniqueIdentifierResponse *)self expressPassConfigurationsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(NPKProtoRemoveExpressPassWithUniqueIdentifierResponse *)self expressPassConfigurationsAtIndex:j];
        [v14 addExpressPassConfigurations:v13];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[32] = self->_pending;
    v5[36] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[33] = self->_success;
    v5[36] |= 2u;
  }
  uint64_t v8 = [(NSData *)self->_actualExpressPassInformation copyWithZone:a3];
  uint64_t v9 = (void *)v6[1];
  v6[1] = v8;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v10 = self->_currentExpressPassesInformations;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        [v6 addCurrentExpressPassesInformation:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v16 = self->_expressPassConfigurations;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "copyWithZone:", a3, (void)v23);
        [v6 addExpressPassConfigurations:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0) {
      goto LABEL_24;
    }
    if (self->_pending)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_success)
      {
        if (!*((unsigned char *)v4 + 33)) {
          goto LABEL_24;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_18;
      }
    }
LABEL_24:
    char v8 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0) {
    goto LABEL_24;
  }
LABEL_18:
  actualExpressPassInformation = self->_actualExpressPassInformation;
  if ((unint64_t)actualExpressPassInformation | *((void *)v4 + 1)
    && !-[NSData isEqual:](actualExpressPassInformation, "isEqual:"))
  {
    goto LABEL_24;
  }
  currentExpressPassesInformations = self->_currentExpressPassesInformations;
  if ((unint64_t)currentExpressPassesInformations | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](currentExpressPassesInformations, "isEqual:")) {
      goto LABEL_24;
    }
  }
  expressPassConfigurations = self->_expressPassConfigurations;
  if ((unint64_t)expressPassConfigurations | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](expressPassConfigurations, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_pending;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_success;
LABEL_6:
  uint64_t v5 = v4 ^ v3 ^ [(NSData *)self->_actualExpressPassInformation hash];
  uint64_t v6 = [(NSMutableArray *)self->_currentExpressPassesInformations hash];
  return v5 ^ v6 ^ [(NSMutableArray *)self->_expressPassConfigurations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  char v6 = *((unsigned char *)v4 + 36);
  if (v6)
  {
    self->_pending = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 36);
  }
  if ((v6 & 2) != 0)
  {
    self->_success = *((unsigned char *)v4 + 33);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1)) {
    -[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse setActualExpressPassInformation:](self, "setActualExpressPassInformation:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5[2];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
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
        [(NPKProtoRemoveExpressPassWithUniqueIdentifierResponse *)self addCurrentExpressPassesInformation:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v5[3];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[NPKProtoRemoveExpressPassWithUniqueIdentifierResponse addExpressPassConfigurations:](self, "addExpressPassConfigurations:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (BOOL)pending
{
  return self->_pending;
}

- (BOOL)success
{
  return self->_success;
}

- (NSData)actualExpressPassInformation
{
  return self->_actualExpressPassInformation;
}

- (void)setActualExpressPassInformation:(id)a3
{
}

- (NSMutableArray)currentExpressPassesInformations
{
  return self->_currentExpressPassesInformations;
}

- (void)setCurrentExpressPassesInformations:(id)a3
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
  objc_storeStrong((id *)&self->_expressPassConfigurations, 0);
  objc_storeStrong((id *)&self->_currentExpressPassesInformations, 0);
  objc_storeStrong((id *)&self->_actualExpressPassInformation, 0);
}

@end