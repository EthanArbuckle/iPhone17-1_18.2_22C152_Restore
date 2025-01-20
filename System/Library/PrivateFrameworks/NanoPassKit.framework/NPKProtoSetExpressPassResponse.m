@interface NPKProtoSetExpressPassResponse
+ (Class)currentExpressPassesInformationType;
+ (Class)currentUniqueIDsType;
+ (Class)expressPassConfigurationsType;
- (BOOL)cancelled;
- (BOOL)hasActualExpressPassInformation;
- (BOOL)hasActualUniqueID;
- (BOOL)hasCancelled;
- (BOOL)hasNeedsUnlock;
- (BOOL)hasPending;
- (BOOL)hasSuccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsUnlock;
- (BOOL)pending;
- (BOOL)readFrom:(id)a3;
- (BOOL)success;
- (NSData)actualExpressPassInformation;
- (NSMutableArray)currentExpressPassesInformations;
- (NSMutableArray)currentUniqueIDs;
- (NSMutableArray)expressPassConfigurations;
- (NSString)actualUniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentExpressPassesInformationAtIndex:(unint64_t)a3;
- (id)currentUniqueIDsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)expressPassConfigurationsAtIndex:(unint64_t)a3;
- (unint64_t)currentExpressPassesInformationsCount;
- (unint64_t)currentUniqueIDsCount;
- (unint64_t)expressPassConfigurationsCount;
- (unint64_t)hash;
- (void)addCurrentExpressPassesInformation:(id)a3;
- (void)addCurrentUniqueIDs:(id)a3;
- (void)addExpressPassConfigurations:(id)a3;
- (void)clearCurrentExpressPassesInformations;
- (void)clearCurrentUniqueIDs;
- (void)clearExpressPassConfigurations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActualExpressPassInformation:(id)a3;
- (void)setActualUniqueID:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setCurrentExpressPassesInformations:(id)a3;
- (void)setCurrentUniqueIDs:(id)a3;
- (void)setExpressPassConfigurations:(id)a3;
- (void)setHasCancelled:(BOOL)a3;
- (void)setHasNeedsUnlock:(BOOL)a3;
- (void)setHasPending:(BOOL)a3;
- (void)setHasSuccess:(BOOL)a3;
- (void)setNeedsUnlock:(BOOL)a3;
- (void)setPending:(BOOL)a3;
- (void)setSuccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSetExpressPassResponse

- (void)setPending:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_pending = a3;
}

- (void)setHasPending:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPending
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSuccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_success = a3;
}

- (void)setHasSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSuccess
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCancelled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cancelled = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCancelled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNeedsUnlock:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_needsUnlock = a3;
}

- (void)setHasNeedsUnlock:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNeedsUnlock
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasActualUniqueID
{
  return self->_actualUniqueID != 0;
}

- (void)clearCurrentUniqueIDs
{
}

- (void)addCurrentUniqueIDs:(id)a3
{
  id v4 = a3;
  currentUniqueIDs = self->_currentUniqueIDs;
  id v8 = v4;
  if (!currentUniqueIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_currentUniqueIDs;
    self->_currentUniqueIDs = v6;

    id v4 = v8;
    currentUniqueIDs = self->_currentUniqueIDs;
  }
  [(NSMutableArray *)currentUniqueIDs addObject:v4];
}

- (unint64_t)currentUniqueIDsCount
{
  return [(NSMutableArray *)self->_currentUniqueIDs count];
}

- (id)currentUniqueIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_currentUniqueIDs objectAtIndex:a3];
}

+ (Class)currentUniqueIDsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)NPKProtoSetExpressPassResponse;
  id v4 = [(NPKProtoSetExpressPassResponse *)&v8 description];
  v5 = [(NPKProtoSetExpressPassResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_pending];
    [v3 setObject:v12 forKey:@"pending"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v13 = [NSNumber numberWithBool:self->_success];
  [v3 setObject:v13 forKey:@"success"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_21:
  v14 = [NSNumber numberWithBool:self->_cancelled];
  [v3 setObject:v14 forKey:@"cancelled"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = [NSNumber numberWithBool:self->_needsUnlock];
    [v3 setObject:v5 forKey:@"needsUnlock"];
  }
LABEL_6:
  actualUniqueID = self->_actualUniqueID;
  if (actualUniqueID) {
    [v3 setObject:actualUniqueID forKey:@"actualUniqueID"];
  }
  currentUniqueIDs = self->_currentUniqueIDs;
  if (currentUniqueIDs) {
    [v3 setObject:currentUniqueIDs forKey:@"currentUniqueIDs"];
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
  return NPKProtoSetExpressPassResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_actualUniqueID) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    PBDataWriterWriteBOOLField();
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v7 = self->_currentUniqueIDs;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v9);
  }

  if (self->_actualExpressPassInformation) {
    PBDataWriterWriteDataField();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v12 = self->_currentExpressPassesInformations;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v14);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v17 = self->_expressPassConfigurations;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v19);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[50] = self->_pending;
    v4[52] |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[51] = self->_success;
    v4[52] |= 8u;
  }
  uint64_t v19 = v4;
  if (self->_actualUniqueID)
  {
    objc_msgSend(v4, "setActualUniqueID:");
    id v4 = v19;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    v4[48] = self->_cancelled;
    v4[52] |= 1u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    v4[49] = self->_needsUnlock;
    v4[52] |= 2u;
  }
  if ([(NPKProtoSetExpressPassResponse *)self currentUniqueIDsCount])
  {
    [v19 clearCurrentUniqueIDs];
    unint64_t v7 = [(NPKProtoSetExpressPassResponse *)self currentUniqueIDsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(NPKProtoSetExpressPassResponse *)self currentUniqueIDsAtIndex:i];
        [v19 addCurrentUniqueIDs:v10];
      }
    }
  }
  if (self->_actualExpressPassInformation) {
    objc_msgSend(v19, "setActualExpressPassInformation:");
  }
  if ([(NPKProtoSetExpressPassResponse *)self currentExpressPassesInformationsCount])
  {
    [v19 clearCurrentExpressPassesInformations];
    unint64_t v11 = [(NPKProtoSetExpressPassResponse *)self currentExpressPassesInformationsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(NPKProtoSetExpressPassResponse *)self currentExpressPassesInformationAtIndex:j];
        [v19 addCurrentExpressPassesInformation:v14];
      }
    }
  }
  if ([(NPKProtoSetExpressPassResponse *)self expressPassConfigurationsCount])
  {
    [v19 clearExpressPassConfigurations];
    unint64_t v15 = [(NPKProtoSetExpressPassResponse *)self expressPassConfigurationsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        uint64_t v18 = [(NPKProtoSetExpressPassResponse *)self expressPassConfigurationsAtIndex:k];
        [v19 addExpressPassConfigurations:v18];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[50] = self->_pending;
    v5[52] |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v5[51] = self->_success;
    v5[52] |= 8u;
  }
  uint64_t v8 = [(NSString *)self->_actualUniqueID copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v8;

  char v10 = (char)self->_has;
  if (v10)
  {
    v6[48] = self->_cancelled;
    v6[52] |= 1u;
    char v10 = (char)self->_has;
  }
  if ((v10 & 2) != 0)
  {
    v6[49] = self->_needsUnlock;
    v6[52] |= 2u;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v11 = self->_currentUniqueIDs;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v11);
        }
        unint64_t v16 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * i) copyWithZone:a3];
        [v6 addCurrentUniqueIDs:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v13);
  }

  uint64_t v17 = [(NSData *)self->_actualExpressPassInformation copyWithZone:a3];
  uint64_t v18 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v17;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v19 = self->_currentExpressPassesInformations;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * j) copyWithZone:a3];
        [v6 addCurrentExpressPassesInformation:v24];
      }
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v21);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v25 = self->_expressPassConfigurations;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * k), "copyWithZone:", a3, (void)v32);
        [v6 addExpressPassConfigurations:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v27);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0) {
      goto LABEL_45;
    }
    if (self->_pending)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0) {
      goto LABEL_45;
    }
    if (self->_success)
    {
      if (!*((unsigned char *)v4 + 51)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v4 + 51))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_45;
  }
  actualUniqueID = self->_actualUniqueID;
  if ((unint64_t)actualUniqueID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](actualUniqueID, "isEqual:")) {
      goto LABEL_45;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0) {
      goto LABEL_45;
    }
    if (self->_cancelled)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_45;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_45;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) != 0)
    {
      if (self->_needsUnlock)
      {
        if (!*((unsigned char *)v4 + 49)) {
          goto LABEL_45;
        }
        goto LABEL_37;
      }
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_37;
      }
    }
LABEL_45:
    char v11 = 0;
    goto LABEL_46;
  }
  if ((*((unsigned char *)v4 + 52) & 2) != 0) {
    goto LABEL_45;
  }
LABEL_37:
  currentUniqueIDs = self->_currentUniqueIDs;
  if ((unint64_t)currentUniqueIDs | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](currentUniqueIDs, "isEqual:"))
  {
    goto LABEL_45;
  }
  actualExpressPassInformation = self->_actualExpressPassInformation;
  if ((unint64_t)actualExpressPassInformation | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](actualExpressPassInformation, "isEqual:")) {
      goto LABEL_45;
    }
  }
  currentExpressPassesInformations = self->_currentExpressPassesInformations;
  if ((unint64_t)currentExpressPassesInformations | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](currentExpressPassesInformations, "isEqual:")) {
      goto LABEL_45;
    }
  }
  expressPassConfigurations = self->_expressPassConfigurations;
  if ((unint64_t)expressPassConfigurations | *((void *)v4 + 5)) {
    char v11 = -[NSMutableArray isEqual:](expressPassConfigurations, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_46:

  return v11;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_pending;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_success;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_actualUniqueID hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_cancelled;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v7 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v7 = 2654435761 * self->_needsUnlock;
LABEL_11:
  NSUInteger v8 = v4 ^ v3 ^ v6 ^ v7 ^ v5;
  uint64_t v9 = [(NSMutableArray *)self->_currentUniqueIDs hash];
  uint64_t v10 = v8 ^ v9 ^ [(NSData *)self->_actualExpressPassInformation hash];
  uint64_t v11 = [(NSMutableArray *)self->_currentExpressPassesInformations hash];
  return v10 ^ v11 ^ [(NSMutableArray *)self->_expressPassConfigurations hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3;
  id v5 = v4;
  char v6 = v4[52];
  if ((v6 & 4) != 0)
  {
    self->_pending = v4[50];
    *(unsigned char *)&self->_has |= 4u;
    char v6 = v4[52];
  }
  if ((v6 & 8) != 0)
  {
    self->_success = v4[51];
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 2)) {
    -[NPKProtoSetExpressPassResponse setActualUniqueID:](self, "setActualUniqueID:");
  }
  char v7 = *((unsigned char *)v5 + 52);
  if (v7)
  {
    self->_cancelled = *((unsigned char *)v5 + 48);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v5 + 52);
  }
  if ((v7 & 2) != 0)
  {
    self->_needsUnlocuint64_t k = *((unsigned char *)v5 + 49);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = *((id *)v5 + 4);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NPKProtoSetExpressPassResponse *)self addCurrentUniqueIDs:*(void *)(*((void *)&v31 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v10);
  }

  if (*((void *)v5 + 1)) {
    -[NPKProtoSetExpressPassResponse setActualExpressPassInformation:](self, "setActualExpressPassInformation:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = *((id *)v5 + 3);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        [(NPKProtoSetExpressPassResponse *)self addCurrentExpressPassesInformation:*(void *)(*((void *)&v27 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v15);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = *((id *)v5 + 5);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        -[NPKProtoSetExpressPassResponse addExpressPassConfigurations:](self, "addExpressPassConfigurations:", *(void *)(*((void *)&v23 + 1) + 8 * k), (void)v23);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v20);
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

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (BOOL)needsUnlock
{
  return self->_needsUnlock;
}

- (NSString)actualUniqueID
{
  return self->_actualUniqueID;
}

- (void)setActualUniqueID:(id)a3
{
}

- (NSMutableArray)currentUniqueIDs
{
  return self->_currentUniqueIDs;
}

- (void)setCurrentUniqueIDs:(id)a3
{
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
  objc_storeStrong((id *)&self->_currentUniqueIDs, 0);
  objc_storeStrong((id *)&self->_currentExpressPassesInformations, 0);
  objc_storeStrong((id *)&self->_actualUniqueID, 0);
  objc_storeStrong((id *)&self->_actualExpressPassInformation, 0);
}

@end