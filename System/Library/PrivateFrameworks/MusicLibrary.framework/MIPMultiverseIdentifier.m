@interface MIPMultiverseIdentifier
+ (Class)libraryIdentifiersType;
- (BOOL)hasAccountId;
- (BOOL)hasCloudLibraryId;
- (BOOL)hasCloudUniversalLibraryId;
- (BOOL)hasMediaObjectType;
- (BOOL)hasMediaType;
- (BOOL)hasName;
- (BOOL)hasPurchaseHistoryId;
- (BOOL)hasSagaId;
- (BOOL)hasStoreId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)libraryIdentifiers;
- (NSString)cloudLibraryId;
- (NSString)cloudUniversalLibraryId;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)libraryIdentifiersAtIndex:(unint64_t)a3;
- (id)mediaObjectTypeAsString:(int)a3;
- (id)mediaTypeAsString:(int)a3;
- (int)StringAsMediaObjectType:(id)a3;
- (int)StringAsMediaType:(id)a3;
- (int)mediaObjectType;
- (int)mediaType;
- (int64_t)accountId;
- (int64_t)purchaseHistoryId;
- (int64_t)sagaId;
- (int64_t)storeId;
- (unint64_t)hash;
- (unint64_t)libraryIdentifiersCount;
- (void)addLibraryIdentifiers:(id)a3;
- (void)clearLibraryIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountId:(int64_t)a3;
- (void)setCloudLibraryId:(id)a3;
- (void)setCloudUniversalLibraryId:(id)a3;
- (void)setHasAccountId:(BOOL)a3;
- (void)setHasMediaObjectType:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasPurchaseHistoryId:(BOOL)a3;
- (void)setHasSagaId:(BOOL)a3;
- (void)setHasStoreId:(BOOL)a3;
- (void)setLibraryIdentifiers:(id)a3;
- (void)setMediaObjectType:(int)a3;
- (void)setMediaType:(int)a3;
- (void)setName:(id)a3;
- (void)setPurchaseHistoryId:(int64_t)a3;
- (void)setSagaId:(int64_t)a3;
- (void)setStoreId:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPMultiverseIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_libraryIdentifiers, 0);
  objc_storeStrong((id *)&self->_cloudUniversalLibraryId, 0);

  objc_storeStrong((id *)&self->_cloudLibraryId, 0);
}

- (void)setLibraryIdentifiers:(id)a3
{
}

- (NSMutableArray)libraryIdentifiers
{
  return self->_libraryIdentifiers;
}

- (void)setCloudLibraryId:(id)a3
{
}

- (NSString)cloudLibraryId
{
  return self->_cloudLibraryId;
}

- (void)setCloudUniversalLibraryId:(id)a3
{
}

- (NSString)cloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId;
}

- (int64_t)purchaseHistoryId
{
  return self->_purchaseHistoryId;
}

- (int64_t)sagaId
{
  return self->_sagaId;
}

- (int64_t)storeId
{
  return self->_storeId;
}

- (int64_t)accountId
{
  return self->_accountId;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (int *)a3;
  v5 = v4;
  char v6 = *((unsigned char *)v4 + 80);
  if ((v6 & 0x10) != 0)
  {
    self->_mediaObjectType = v4[16];
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 80);
  }
  if ((v6 & 0x20) != 0)
  {
    self->_mediaType = v4[17];
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 9)) {
    -[MIPMultiverseIdentifier setName:](self, "setName:");
  }
  char v7 = *((unsigned char *)v5 + 80);
  if (v7)
  {
    self->_accountId = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v5 + 80);
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_26;
    }
  }
  else if ((v5[20] & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_storeId = *((void *)v5 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v7 = *((unsigned char *)v5 + 80);
  if ((v7 & 4) == 0)
  {
LABEL_10:
    if ((v7 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_26:
  self->_sagaId = *((void *)v5 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((v5[20] & 2) != 0)
  {
LABEL_11:
    self->_purchaseHistoryId = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_12:
  if (*((void *)v5 + 6)) {
    -[MIPMultiverseIdentifier setCloudUniversalLibraryId:](self, "setCloudUniversalLibraryId:");
  }
  if (*((void *)v5 + 5)) {
    -[MIPMultiverseIdentifier setCloudLibraryId:](self, "setCloudLibraryId:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v5 + 7);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[MIPMultiverseIdentifier addLibraryIdentifiers:](self, "addLibraryIdentifiers:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_mediaObjectType;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_mediaType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_accountId;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_8:
      uint64_t v7 = 2654435761 * self->_storeId;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v9 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v8 = 2654435761 * self->_sagaId;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_purchaseHistoryId;
LABEL_15:
  NSUInteger v10 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v5;
  NSUInteger v11 = [(NSString *)self->_cloudUniversalLibraryId hash];
  NSUInteger v12 = v10 ^ v11 ^ [(NSString *)self->_cloudLibraryId hash];
  return v12 ^ [(NSMutableArray *)self->_libraryIdentifiers hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 80);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x10) == 0 || self->_mediaObjectType != *((_DWORD *)v4 + 16)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x20) == 0 || self->_mediaType != *((_DWORD *)v4 + 17)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_41:
      char v11 = 0;
      goto LABEL_42;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 80);
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_accountId != *((void *)v4 + 1)) {
      goto LABEL_41;
    }
  }
  else if (v6)
  {
    goto LABEL_41;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_storeId != *((void *)v4 + 4)) {
      goto LABEL_41;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_sagaId != *((void *)v4 + 3)) {
      goto LABEL_41;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_purchaseHistoryId != *((void *)v4 + 2)) {
      goto LABEL_41;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_41;
  }
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if ((unint64_t)cloudUniversalLibraryId | *((void *)v4 + 6)
    && !-[NSString isEqual:](cloudUniversalLibraryId, "isEqual:"))
  {
    goto LABEL_41;
  }
  cloudLibraryId = self->_cloudLibraryId;
  if ((unint64_t)cloudLibraryId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](cloudLibraryId, "isEqual:")) {
      goto LABEL_41;
    }
  }
  libraryIdentifiers = self->_libraryIdentifiers;
  if ((unint64_t)libraryIdentifiers | *((void *)v4 + 7)) {
    char v11 = -[NSMutableArray isEqual:](libraryIdentifiers, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_42:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_mediaObjectType;
    *(unsigned char *)(v5 + 80) |= 0x10u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_mediaType;
    *(unsigned char *)(v5 + 80) |= 0x20u;
  }
  uint64_t v8 = [(NSString *)self->_name copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v8;

  char v10 = (char)self->_has;
  if (v10)
  {
    *(void *)(v6 + 8) = self->_accountId;
    *(unsigned char *)(v6 + 80) |= 1u;
    char v10 = (char)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_7:
      if ((v10 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v6 + 32) = self->_storeId;
  *(unsigned char *)(v6 + 80) |= 8u;
  char v10 = (char)self->_has;
  if ((v10 & 4) == 0)
  {
LABEL_8:
    if ((v10 & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_20:
  *(void *)(v6 + 24) = self->_sagaId;
  *(unsigned char *)(v6 + 80) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_9:
    *(void *)(v6 + 16) = self->_purchaseHistoryId;
    *(unsigned char *)(v6 + 80) |= 2u;
  }
LABEL_10:
  uint64_t v11 = [(NSString *)self->_cloudUniversalLibraryId copyWithZone:a3];
  NSUInteger v12 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v11;

  uint64_t v13 = [(NSString *)self->_cloudLibraryId copyWithZone:a3];
  long long v14 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v13;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v15 = self->_libraryIdentifiers;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        [(id)v6 addLibraryIdentifiers:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[16] = self->_mediaObjectType;
    *((unsigned char *)v4 + 80) |= 0x10u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v4[17] = self->_mediaType;
    *((unsigned char *)v4 + 80) |= 0x20u;
  }
  uint64_t v11 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v11;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    *((void *)v4 + 1) = self->_accountId;
    *((unsigned char *)v4 + 80) |= 1u;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 4) = self->_storeId;
  *((unsigned char *)v4 + 80) |= 8u;
  char v6 = (char)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_10:
    if ((v6 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_25:
  *((void *)v4 + 3) = self->_sagaId;
  *((unsigned char *)v4 + 80) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_11:
    *((void *)v4 + 2) = self->_purchaseHistoryId;
    *((unsigned char *)v4 + 80) |= 2u;
  }
LABEL_12:
  if (self->_cloudUniversalLibraryId) {
    objc_msgSend(v11, "setCloudUniversalLibraryId:");
  }
  if (self->_cloudLibraryId) {
    objc_msgSend(v11, "setCloudLibraryId:");
  }
  if ([(MIPMultiverseIdentifier *)self libraryIdentifiersCount])
  {
    [v11 clearLibraryIdentifiers];
    unint64_t v7 = [(MIPMultiverseIdentifier *)self libraryIdentifiersCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        char v10 = [(MIPMultiverseIdentifier *)self libraryIdentifiersAtIndex:i];
        [v11 addLibraryIdentifiers:v10];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    PBDataWriterWriteInt64Field();
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  char v6 = (char)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_10:
    if ((v6 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_26:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt64Field();
LABEL_12:
  if (self->_cloudUniversalLibraryId) {
    PBDataWriterWriteStringField();
  }
  if (self->_cloudLibraryId) {
    PBDataWriterWriteStringField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v7 = self->_libraryIdentifiers;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPMultiverseIdentifierReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    unsigned int v5 = self->_mediaObjectType - 1;
    if (v5 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mediaObjectType);
      char v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v6 = off_1E5FB5F30[v5];
    }
    [v3 setObject:v6 forKey:@"mediaObjectType"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    unsigned int v7 = self->_mediaType - 1;
    if (v7 >= 0xD)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mediaType);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E5FB5F70[v7];
    }
    [v3 setObject:v8 forKey:@"mediaType"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  char v10 = (char)self->_has;
  if (v10)
  {
    long long v22 = [NSNumber numberWithLongLong:self->_accountId];
    [v3 setObject:v22 forKey:@"accountId"];

    char v10 = (char)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_15:
      if ((v10 & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_15;
  }
  long long v23 = [NSNumber numberWithLongLong:self->_storeId];
  [v3 setObject:v23 forKey:@"storeId"];

  char v10 = (char)self->_has;
  if ((v10 & 4) == 0)
  {
LABEL_16:
    if ((v10 & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_36:
  long long v24 = [NSNumber numberWithLongLong:self->_sagaId];
  [v3 setObject:v24 forKey:@"sagaId"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_17:
    uint64_t v11 = [NSNumber numberWithLongLong:self->_purchaseHistoryId];
    [v3 setObject:v11 forKey:@"purchaseHistoryId"];
  }
LABEL_18:
  cloudUniversalLibraryId = self->_cloudUniversalLibraryId;
  if (cloudUniversalLibraryId) {
    [v3 setObject:cloudUniversalLibraryId forKey:@"cloudUniversalLibraryId"];
  }
  cloudLibraryId = self->_cloudLibraryId;
  if (cloudLibraryId) {
    [v3 setObject:cloudLibraryId forKey:@"cloudLibraryId"];
  }
  if ([(NSMutableArray *)self->_libraryIdentifiers count])
  {
    long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_libraryIdentifiers, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v15 = self->_libraryIdentifiers;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"libraryIdentifiers"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPMultiverseIdentifier;
  id v4 = [(MIPMultiverseIdentifier *)&v8 description];
  unsigned int v5 = [(MIPMultiverseIdentifier *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)libraryIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_libraryIdentifiers objectAtIndex:a3];
}

- (unint64_t)libraryIdentifiersCount
{
  return [(NSMutableArray *)self->_libraryIdentifiers count];
}

- (void)addLibraryIdentifiers:(id)a3
{
  id v4 = a3;
  libraryIdentifiers = self->_libraryIdentifiers;
  id v8 = v4;
  if (!libraryIdentifiers)
  {
    char v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unsigned int v7 = self->_libraryIdentifiers;
    self->_libraryIdentifiers = v6;

    id v4 = v8;
    libraryIdentifiers = self->_libraryIdentifiers;
  }
  [(NSMutableArray *)libraryIdentifiers addObject:v4];
}

- (void)clearLibraryIdentifiers
{
}

- (BOOL)hasCloudLibraryId
{
  return self->_cloudLibraryId != 0;
}

- (BOOL)hasCloudUniversalLibraryId
{
  return self->_cloudUniversalLibraryId != 0;
}

- (BOOL)hasPurchaseHistoryId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasPurchaseHistoryId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setPurchaseHistoryId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_purchaseHistoryId = a3;
}

- (BOOL)hasSagaId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasSagaId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setSagaId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sagaId = a3;
}

- (BOOL)hasStoreId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasStoreId:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setStoreId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_storeId = a3;
}

- (BOOL)hasAccountId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAccountId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAccountId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_accountId = a3;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (int)StringAsMediaType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Song"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Movie"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TVShow"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Podcast"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"VoiceMemo"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"VideoPodcast"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MusicVideo"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AudioBook"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"DigitalBooklet"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ITunesUAudio"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ITunesUVideo"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"HomeVideo"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MusicQuiz"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)mediaTypeAsString:(int)a3
{
  if ((a3 - 1) >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5FB5F70[a3 - 1];
  }

  return v3;
}

- (BOOL)hasMediaType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasMediaType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setMediaType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_mediaType = a3;
}

- (int)mediaType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_mediaType;
  }
  else {
    return 1;
  }
}

- (int)StringAsMediaObjectType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Album"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Artist"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Composer"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Genre"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Series"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MediaItem"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Playlist"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AlbumArtist"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)mediaObjectTypeAsString:(int)a3
{
  if ((a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5FB5F30[a3 - 1];
  }

  return v3;
}

- (BOOL)hasMediaObjectType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasMediaObjectType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setMediaObjectType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_mediaObjectType = a3;
}

- (int)mediaObjectType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_mediaObjectType;
  }
  else {
    return 1;
  }
}

+ (Class)libraryIdentifiersType
{
  return (Class)objc_opt_class();
}

@end