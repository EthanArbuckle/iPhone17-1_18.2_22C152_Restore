@interface AWDIMessageNicknameRetrieved
- (BOOL)hasConnectionType;
- (BOOL)hasHasAvatar;
- (BOOL)hasLinkQuality;
- (BOOL)hasPublicOperationalErrorCode;
- (BOOL)hasPublicOperationalErrorDomain;
- (BOOL)hasPublicSuccess;
- (BOOL)hasTimeTaken;
- (BOOL)hasTimestamp;
- (BOOL)hasUpdated;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)publicOperationalErrorDomain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)linkQuality;
- (unint64_t)hash;
- (unint64_t)timeTaken;
- (unint64_t)timestamp;
- (unsigned)connectionType;
- (unsigned)hasAvatar;
- (unsigned)publicOperationalErrorCode;
- (unsigned)publicSuccess;
- (unsigned)updated;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectionType:(unsigned int)a3;
- (void)setHasAvatar:(unsigned int)a3;
- (void)setHasConnectionType:(BOOL)a3;
- (void)setHasHasAvatar:(BOOL)a3;
- (void)setHasLinkQuality:(BOOL)a3;
- (void)setHasPublicOperationalErrorCode:(BOOL)a3;
- (void)setHasPublicSuccess:(BOOL)a3;
- (void)setHasTimeTaken:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUpdated:(BOOL)a3;
- (void)setLinkQuality:(int)a3;
- (void)setPublicOperationalErrorCode:(unsigned int)a3;
- (void)setPublicOperationalErrorDomain:(id)a3;
- (void)setPublicSuccess:(unsigned int)a3;
- (void)setTimeTaken:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUpdated:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIMessageNicknameRetrieved

- (void)dealloc
{
  [(AWDIMessageNicknameRetrieved *)self setPublicOperationalErrorDomain:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageNicknameRetrieved;
  [(AWDIMessageNicknameRetrieved *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimeTaken:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeTaken = a3;
}

- (void)setHasTimeTaken:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeTaken
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUpdated:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_updated = a3;
}

- (void)setHasUpdated:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasUpdated
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasAvatar:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_hasAvatar = a3;
}

- (void)setHasHasAvatar:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHasAvatar
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPublicSuccess:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_publicSuccess = a3;
}

- (void)setHasPublicSuccess:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPublicSuccess
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasPublicOperationalErrorDomain
{
  return self->_publicOperationalErrorDomain != 0;
}

- (void)setPublicOperationalErrorCode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_publicOperationalErrorCode = a3;
}

- (void)setHasPublicOperationalErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPublicOperationalErrorCode
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setLinkQuality:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_linkQuality = a3;
}

- (void)setHasLinkQuality:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLinkQuality
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setConnectionType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasConnectionType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageNicknameRetrieved;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIMessageNicknameRetrieved description](&v3, sel_description), -[AWDIMessageNicknameRetrieved dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timeTaken] forKey:@"timeTaken"];
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_updated] forKey:@"updated"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_hasAvatar] forKey:@"hasAvatar"];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_publicSuccess] forKey:@"publicSuccess"];
LABEL_7:
  publicOperationalErrorDomain = self->_publicOperationalErrorDomain;
  if (publicOperationalErrorDomain) {
    [v3 setObject:publicOperationalErrorDomain forKey:@"publicOperationalErrorDomain"];
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_11;
    }
LABEL_20:
    [v3 setObject:[NSNumber numberWithInt:self->_linkQuality] forKey:@"linkQuality"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_12;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_publicOperationalErrorCode] forKey:@"publicOperationalErrorCode"];
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_11:
  if ((v6 & 4) != 0) {
LABEL_12:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_connectionType] forKey:@"connectionType"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageNicknameRetrievedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_publicOperationalErrorDomain) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x20) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_11;
    }
LABEL_19:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_20;
  }
  PBDataWriterWriteUint32Field();
  char v5 = (char)self->_has;
  if ((v5 & 0x10) != 0) {
    goto LABEL_19;
  }
LABEL_11:
  if ((v5 & 4) == 0) {
    return;
  }
LABEL_20:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = self->_timeTaken;
  *((unsigned char *)a3 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)a3 + 13) = self->_updated;
  *((unsigned char *)a3 + 56) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_17:
  *((_DWORD *)a3 + 7) = self->_hasAvatar;
  *((unsigned char *)a3 + 56) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 12) = self->_publicSuccess;
    *((unsigned char *)a3 + 56) |= 0x40u;
  }
LABEL_7:
  if (self->_publicOperationalErrorDomain) {
    [a3 setPublicOperationalErrorDomain:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_publicOperationalErrorCode;
    *((unsigned char *)a3 + 56) |= 0x20u;
    char v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0) {
        return;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)a3 + 8) = self->_linkQuality;
  *((unsigned char *)a3 + 56) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_12:
  *((_DWORD *)a3 + 6) = self->_connectionType;
  *((unsigned char *)a3 + 56) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_timeTaken;
  *(unsigned char *)(v5 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 52) = self->_updated;
  *(unsigned char *)(v5 + 56) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  *(_DWORD *)(v5 + 28) = self->_hasAvatar;
  *(unsigned char *)(v5 + 56) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 48) = self->_publicSuccess;
    *(unsigned char *)(v5 + 56) |= 0x40u;
  }
LABEL_7:

  *(void *)(v6 + 40) = [(NSString *)self->_publicOperationalErrorDomain copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 0x20) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    *(_DWORD *)(v6 + 32) = self->_linkQuality;
    *(unsigned char *)(v6 + 56) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v6;
    }
    goto LABEL_10;
  }
  *(_DWORD *)(v6 + 36) = self->_publicOperationalErrorCode;
  *(unsigned char *)(v6 + 56) |= 0x20u;
  char v8 = (char)self->_has;
  if ((v8 & 0x10) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if ((v8 & 4) != 0)
  {
LABEL_10:
    *(_DWORD *)(v6 + 24) = self->_connectionType;
    *(unsigned char *)(v6 + 56) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 2) != 0)
    {
      goto LABEL_44;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_timeTaken != *((void *)a3 + 1)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)a3 + 56))
    {
      goto LABEL_44;
    }
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x80) == 0 || self->_updated != *((_DWORD *)a3 + 13)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x80) != 0)
    {
LABEL_44:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 8) == 0 || self->_hasAvatar != *((_DWORD *)a3 + 7)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 8) != 0)
    {
      goto LABEL_44;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x40) == 0 || self->_publicSuccess != *((_DWORD *)a3 + 12)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x40) != 0)
    {
      goto LABEL_44;
    }
    publicOperationalErrorDomain = self->_publicOperationalErrorDomain;
    if ((unint64_t)publicOperationalErrorDomain | *((void *)a3 + 5))
    {
      int v5 = -[NSString isEqual:](publicOperationalErrorDomain, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x20) == 0 || self->_publicOperationalErrorCode != *((_DWORD *)a3 + 9)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x20) != 0)
    {
      goto LABEL_44;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x10) == 0 || self->_linkQuality != *((_DWORD *)a3 + 8)) {
        goto LABEL_44;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x10) != 0)
    {
      goto LABEL_44;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 56) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_connectionType != *((_DWORD *)a3 + 6)) {
        goto LABEL_44;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_timeTaken;
      if ((*(unsigned char *)&self->_has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_updated;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_hasAvatar;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_publicSuccess;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v7 = 0;
LABEL_12:
  NSUInteger v8 = [(NSString *)self->_publicOperationalErrorDomain hash];
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_15;
    }
LABEL_18:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v8;
  }
  uint64_t v9 = 2654435761 * self->_publicOperationalErrorCode;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v10 = 2654435761 * self->_linkQuality;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v11 = 2654435761 * self->_connectionType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v10 ^ v11 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 56);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_timeTaken = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_updated = *((_DWORD *)a3 + 13);
  *(unsigned char *)&self->_has |= 0x80u;
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_17:
  self->_hasAvatar = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 56) & 0x40) != 0)
  {
LABEL_6:
    self->_publicSuccess = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 0x40u;
  }
LABEL_7:
  if (*((void *)a3 + 5)) {
    -[AWDIMessageNicknameRetrieved setPublicOperationalErrorDomain:](self, "setPublicOperationalErrorDomain:");
  }
  char v6 = *((unsigned char *)a3 + 56);
  if ((v6 & 0x20) != 0)
  {
    self->_publicOperationalErrorCode = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 0x20u;
    char v6 = *((unsigned char *)a3 + 56);
    if ((v6 & 0x10) == 0)
    {
LABEL_11:
      if ((v6 & 4) == 0) {
        return;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 0x10) == 0)
  {
    goto LABEL_11;
  }
  self->_linkQuality = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 56) & 4) == 0) {
    return;
  }
LABEL_12:
  self->_connectionType = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)timeTaken
{
  return self->_timeTaken;
}

- (unsigned)updated
{
  return self->_updated;
}

- (unsigned)hasAvatar
{
  return self->_hasAvatar;
}

- (unsigned)publicSuccess
{
  return self->_publicSuccess;
}

- (NSString)publicOperationalErrorDomain
{
  return self->_publicOperationalErrorDomain;
}

- (void)setPublicOperationalErrorDomain:(id)a3
{
}

- (unsigned)publicOperationalErrorCode
{
  return self->_publicOperationalErrorCode;
}

- (int)linkQuality
{
  return self->_linkQuality;
}

- (unsigned)connectionType
{
  return self->_connectionType;
}

@end