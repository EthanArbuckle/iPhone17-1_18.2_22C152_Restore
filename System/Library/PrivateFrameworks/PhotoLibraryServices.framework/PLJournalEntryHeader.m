@interface PLJournalEntryHeader
+ (Class)nilPropertiesType;
- (BOOL)hasEntryType;
- (BOOL)hasPayloadCRC;
- (BOOL)hasPayloadID;
- (BOOL)hasPayloadLength;
- (BOOL)hasPayloadUUID;
- (BOOL)hasPayloadVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)payloadUUID;
- (NSMutableArray)nilProperties;
- (NSString)payloadID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entryTypeAsString:(int)a3;
- (id)nilPropertiesAtIndex:(unint64_t)a3;
- (int)StringAsEntryType:(id)a3;
- (int)entryType;
- (unint64_t)hash;
- (unint64_t)nilPropertiesCount;
- (unint64_t)payloadLength;
- (unsigned)payloadCRC;
- (unsigned)payloadVersion;
- (void)addNilProperties:(id)a3;
- (void)clearNilProperties;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEntryType:(int)a3;
- (void)setHasEntryType:(BOOL)a3;
- (void)setHasPayloadCRC:(BOOL)a3;
- (void)setHasPayloadLength:(BOOL)a3;
- (void)setHasPayloadVersion:(BOOL)a3;
- (void)setNilProperties:(id)a3;
- (void)setPayloadCRC:(unsigned int)a3;
- (void)setPayloadID:(id)a3;
- (void)setPayloadLength:(unint64_t)a3;
- (void)setPayloadUUID:(id)a3;
- (void)setPayloadVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLJournalEntryHeader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUUID, 0);
  objc_storeStrong((id *)&self->_payloadID, 0);
  objc_storeStrong((id *)&self->_nilProperties, 0);
}

- (void)setNilProperties:(id)a3
{
}

- (NSMutableArray)nilProperties
{
  return self->_nilProperties;
}

- (unsigned)payloadCRC
{
  return self->_payloadCRC;
}

- (unint64_t)payloadLength
{
  return self->_payloadLength;
}

- (unsigned)payloadVersion
{
  return self->_payloadVersion;
}

- (void)setPayloadID:(id)a3
{
}

- (NSString)payloadID
{
  return self->_payloadID;
}

- (void)setPayloadUUID:(id)a3
{
}

- (NSData)payloadUUID
{
  return self->_payloadUUID;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = v4;
  if ((v4[15] & 2) != 0)
  {
    self->_entryType = v4[4];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 6)) {
    -[PLJournalEntryHeader setPayloadUUID:](self, "setPayloadUUID:");
  }
  if (*((void *)v5 + 5)) {
    -[PLJournalEntryHeader setPayloadID:](self, "setPayloadID:");
  }
  char v6 = *((unsigned char *)v5 + 60);
  if ((v6 & 8) != 0)
  {
    self->_payloadVersion = *((_DWORD *)v5 + 14);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v5 + 60);
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v5 + 60) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_payloadLength = *((void *)v5 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v5 + 60) & 4) != 0)
  {
LABEL_10:
    self->_payloadCRC = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_11:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v5 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        -[PLJournalEntryHeader addNilProperties:](self, "addNilProperties:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_entryType;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_payloadUUID hash];
  NSUInteger v5 = [(NSString *)self->_payloadID hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_9:
    unint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSMutableArray *)self->_nilProperties hash];
  }
  uint64_t v6 = 2654435761 * self->_payloadVersion;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  unint64_t v7 = 2654435761u * self->_payloadLength;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_payloadCRC;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSMutableArray *)self->_nilProperties hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_entryType != *((_DWORD *)v4 + 4)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_28:
    char v8 = 0;
    goto LABEL_29;
  }
  payloadUUID = self->_payloadUUID;
  if ((unint64_t)payloadUUID | *((void *)v4 + 6) && !-[NSData isEqual:](payloadUUID, "isEqual:")) {
    goto LABEL_28;
  }
  payloadID = self->_payloadID;
  if ((unint64_t)payloadID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](payloadID, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_payloadVersion != *((_DWORD *)v4 + 14)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_payloadLength != *((void *)v4 + 1)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_payloadCRC != *((_DWORD *)v4 + 8)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_28;
  }
  nilProperties = self->_nilProperties;
  if ((unint64_t)nilProperties | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](nilProperties, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_29:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_entryType;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  uint64_t v7 = [(NSData *)self->_payloadUUID copyWithZone:a3];
  char v8 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v7;

  uint64_t v9 = [(NSString *)self->_payloadID copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_payloadVersion;
    *(unsigned char *)(v6 + 60) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 8) = self->_payloadLength;
  *(unsigned char *)(v6 + 60) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 32) = self->_payloadCRC;
    *(unsigned char *)(v6 + 60) |= 4u;
  }
LABEL_7:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_nilProperties;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        [(id)v6 addNilProperties:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[4] = self->_entryType;
    *((unsigned char *)v4 + 60) |= 2u;
  }
  uint64_t v10 = v4;
  if (self->_payloadUUID)
  {
    objc_msgSend(v4, "setPayloadUUID:");
    id v4 = v10;
  }
  if (self->_payloadID)
  {
    objc_msgSend(v10, "setPayloadID:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_9;
    }
LABEL_19:
    *((void *)v4 + 1) = self->_payloadLength;
    *((unsigned char *)v4 + 60) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v4[14] = self->_payloadVersion;
  *((unsigned char *)v4 + 60) |= 8u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_19;
  }
LABEL_9:
  if ((has & 4) != 0)
  {
LABEL_10:
    v4[8] = self->_payloadCRC;
    *((unsigned char *)v4 + 60) |= 4u;
  }
LABEL_11:
  if ([(PLJournalEntryHeader *)self nilPropertiesCount])
  {
    [v10 clearNilProperties];
    unint64_t v6 = [(PLJournalEntryHeader *)self nilPropertiesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(PLJournalEntryHeader *)self nilPropertiesAtIndex:i];
        [v10 addNilProperties:v9];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_payloadUUID) {
    PBDataWriterWriteDataField();
  }
  if (self->_payloadID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_nilProperties;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLJournalEntryHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t entryType = self->_entryType;
    if (entryType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_entryType);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v5 = off_1E5876228[entryType];
    }
    [v3 setObject:v5 forKey:@"entryType"];
  }
  payloadUUID = self->_payloadUUID;
  if (payloadUUID) {
    [v3 setObject:payloadUUID forKey:@"payloadUUID"];
  }
  payloadID = self->_payloadID;
  if (payloadID) {
    [v3 setObject:payloadID forKey:@"payloadID"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    long long v12 = [NSNumber numberWithUnsignedInt:self->_payloadVersion];
    [v3 setObject:v12 forKey:@"payloadVersion"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_12:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_12;
  }
  long long v13 = [NSNumber numberWithUnsignedLongLong:self->_payloadLength];
  [v3 setObject:v13 forKey:@"payloadLength"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_13:
    uint64_t v9 = [NSNumber numberWithUnsignedInt:self->_payloadCRC];
    [v3 setObject:v9 forKey:@"payloadCRC"];
  }
LABEL_14:
  nilProperties = self->_nilProperties;
  if (nilProperties) {
    [v3 setObject:nilProperties forKey:@"nilProperties"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PLJournalEntryHeader;
  id v4 = [(PLJournalEntryHeader *)&v8 description];
  uint64_t v5 = [(PLJournalEntryHeader *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)nilPropertiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nilProperties objectAtIndex:a3];
}

- (unint64_t)nilPropertiesCount
{
  return [(NSMutableArray *)self->_nilProperties count];
}

- (void)addNilProperties:(id)a3
{
  id v4 = a3;
  nilProperties = self->_nilProperties;
  id v8 = v4;
  if (!nilProperties)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_nilProperties;
    self->_nilProperties = v6;

    id v4 = v8;
    nilProperties = self->_nilProperties;
  }
  [(NSMutableArray *)nilProperties addObject:v4];
}

- (void)clearNilProperties
{
}

- (BOOL)hasPayloadCRC
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasPayloadCRC:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setPayloadCRC:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_payloadCRC = a3;
}

- (BOOL)hasPayloadLength
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPayloadLength:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setPayloadLength:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_payloadLength = a3;
}

- (BOOL)hasPayloadVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasPayloadVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setPayloadVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_payloadVersion = a3;
}

- (BOOL)hasPayloadID
{
  return self->_payloadID != 0;
}

- (BOOL)hasPayloadUUID
{
  return self->_payloadUUID != 0;
}

- (int)StringAsEntryType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Insert"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Update"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Delete"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)entryTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5876228[a3];
  }
  return v3;
}

- (BOOL)hasEntryType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEntryType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEntryType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t entryType = a3;
}

- (int)entryType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_entryType;
  }
  else {
    return 0;
  }
}

+ (Class)nilPropertiesType
{
  return (Class)objc_opt_class();
}

@end