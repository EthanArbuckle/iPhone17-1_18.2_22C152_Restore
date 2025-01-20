@interface AWDIMessageCloudKitSyncFailed
- (BOOL)hasLinkQuality;
- (BOOL)hasNestedErrorCode;
- (BOOL)hasNestedErrorDomain;
- (BOOL)hasSyncType;
- (BOOL)hasTimestamp;
- (BOOL)hasTopLevelErrorCode;
- (BOOL)hasTopLevelErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)nestedErrorDomain;
- (NSString)syncType;
- (NSString)topLevelErrorDomain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)linkQuality;
- (int)nestedErrorCode;
- (int)topLevelErrorCode;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasLinkQuality:(BOOL)a3;
- (void)setHasNestedErrorCode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTopLevelErrorCode:(BOOL)a3;
- (void)setLinkQuality:(int)a3;
- (void)setNestedErrorCode:(int)a3;
- (void)setNestedErrorDomain:(id)a3;
- (void)setSyncType:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTopLevelErrorCode:(int)a3;
- (void)setTopLevelErrorDomain:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIMessageCloudKitSyncFailed

- (void)dealloc
{
  [(AWDIMessageCloudKitSyncFailed *)self setSyncType:0];
  [(AWDIMessageCloudKitSyncFailed *)self setTopLevelErrorDomain:0];
  [(AWDIMessageCloudKitSyncFailed *)self setNestedErrorDomain:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageCloudKitSyncFailed;
  [(AWDIMessageCloudKitSyncFailed *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSyncType
{
  return self->_syncType != 0;
}

- (BOOL)hasTopLevelErrorDomain
{
  return self->_topLevelErrorDomain != 0;
}

- (void)setTopLevelErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_topLevelErrorCode = a3;
}

- (void)setHasTopLevelErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTopLevelErrorCode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasNestedErrorDomain
{
  return self->_nestedErrorDomain != 0;
}

- (void)setNestedErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_nestedErrorCode = a3;
}

- (void)setHasNestedErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNestedErrorCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageCloudKitSyncFailed;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIMessageCloudKitSyncFailed description](&v3, sel_description), -[AWDIMessageCloudKitSyncFailed dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  syncType = self->_syncType;
  if (syncType) {
    [v3 setObject:syncType forKey:@"syncType"];
  }
  topLevelErrorDomain = self->_topLevelErrorDomain;
  if (topLevelErrorDomain) {
    [v3 setObject:topLevelErrorDomain forKey:@"topLevelErrorDomain"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_topLevelErrorCode] forKey:@"topLevelErrorCode"];
  }
  nestedErrorDomain = self->_nestedErrorDomain;
  if (nestedErrorDomain) {
    [v3 setObject:nestedErrorDomain forKey:@"nestedErrorDomain"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_nestedErrorCode] forKey:@"nestedErrorCode"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_linkQuality] forKey:@"linkQuality"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageCloudKitSyncFailedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_syncType) {
    PBDataWriterWriteStringField();
  }
  if (self->_topLevelErrorDomain) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_nestedErrorDomain) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 56) |= 1u;
  }
  if (self->_syncType) {
    [a3 setSyncType:];
  }
  if (self->_topLevelErrorDomain) {
    [a3 setTopLevelErrorDomain:];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_topLevelErrorCode;
    *((unsigned char *)a3 + 56) |= 8u;
  }
  if (self->_nestedErrorDomain) {
    [a3 setNestedErrorDomain:];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_nestedErrorCode;
    *((unsigned char *)a3 + 56) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_linkQuality;
    *((unsigned char *)a3 + 56) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 1u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_syncType copyWithZone:a3];
  *(void *)(v6 + 48) = [(NSString *)self->_topLevelErrorDomain copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_topLevelErrorCode;
    *(unsigned char *)(v6 + 56) |= 8u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_nestedErrorDomain copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_nestedErrorCode;
    *(unsigned char *)(v6 + 56) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_linkQuality;
    *(unsigned char *)(v6 + 56) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)a3 + 56))
    {
LABEL_28:
      LOBYTE(v5) = 0;
      return v5;
    }
    syncType = self->_syncType;
    if (!((unint64_t)syncType | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](syncType, "isEqual:")) != 0)
    {
      topLevelErrorDomain = self->_topLevelErrorDomain;
      if (!((unint64_t)topLevelErrorDomain | *((void *)a3 + 6))
        || (int v5 = -[NSString isEqual:](topLevelErrorDomain, "isEqual:")) != 0)
      {
        char has = (char)self->_has;
        if ((has & 8) != 0)
        {
          if ((*((unsigned char *)a3 + 56) & 8) == 0 || self->_topLevelErrorCode != *((_DWORD *)a3 + 10)) {
            goto LABEL_28;
          }
        }
        else if ((*((unsigned char *)a3 + 56) & 8) != 0)
        {
          goto LABEL_28;
        }
        nestedErrorDomain = self->_nestedErrorDomain;
        if ((unint64_t)nestedErrorDomain | *((void *)a3 + 3))
        {
          int v5 = -[NSString isEqual:](nestedErrorDomain, "isEqual:");
          if (!v5) {
            return v5;
          }
          char has = (char)self->_has;
        }
        if ((has & 4) != 0)
        {
          if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_nestedErrorCode != *((_DWORD *)a3 + 5)) {
            goto LABEL_28;
          }
        }
        else if ((*((unsigned char *)a3 + 56) & 4) != 0)
        {
          goto LABEL_28;
        }
        LOBYTE(v5) = (*((unsigned char *)a3 + 56) & 2) == 0;
        if ((has & 2) != 0)
        {
          if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_linkQuality != *((_DWORD *)a3 + 4)) {
            goto LABEL_28;
          }
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_syncType hash];
  NSUInteger v5 = [(NSString *)self->_topLevelErrorDomain hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v6 = 2654435761 * self->_topLevelErrorCode;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_nestedErrorDomain hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v8 = 2654435761 * self->_nestedErrorCode;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_linkQuality;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 56))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDIMessageCloudKitSyncFailed setSyncType:](self, "setSyncType:");
  }
  if (*((void *)a3 + 6)) {
    -[AWDIMessageCloudKitSyncFailed setTopLevelErrorDomain:](self, "setTopLevelErrorDomain:");
  }
  if ((*((unsigned char *)a3 + 56) & 8) != 0)
  {
    self->_topLevelErrorCode = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDIMessageCloudKitSyncFailed setNestedErrorDomain:](self, "setNestedErrorDomain:");
  }
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 4) != 0)
  {
    self->_nestedErrorCode = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_linkQuality = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)syncType
{
  return self->_syncType;
}

- (void)setSyncType:(id)a3
{
}

- (NSString)topLevelErrorDomain
{
  return self->_topLevelErrorDomain;
}

- (void)setTopLevelErrorDomain:(id)a3
{
}

- (int)topLevelErrorCode
{
  return self->_topLevelErrorCode;
}

- (NSString)nestedErrorDomain
{
  return self->_nestedErrorDomain;
}

- (void)setNestedErrorDomain:(id)a3
{
}

- (int)nestedErrorCode
{
  return self->_nestedErrorCode;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

@end