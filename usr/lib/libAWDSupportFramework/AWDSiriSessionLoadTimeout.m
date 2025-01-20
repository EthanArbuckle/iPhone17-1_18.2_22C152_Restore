@interface AWDSiriSessionLoadTimeout
- (BOOL)hasConnectionTechnology;
- (BOOL)hasConnectionURL;
- (BOOL)hasInterfaceIndex;
- (BOOL)hasSendBufferSize;
- (BOOL)hasTimestamp;
- (BOOL)hasWwanPreferred;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wwanPreferred;
- (NSString)connectionURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)connectionTechnology;
- (unint64_t)hash;
- (unint64_t)interfaceIndex;
- (unint64_t)sendBufferSize;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnectionTechnology:(unint64_t)a3;
- (void)setConnectionURL:(id)a3;
- (void)setHasConnectionTechnology:(BOOL)a3;
- (void)setHasInterfaceIndex:(BOOL)a3;
- (void)setHasSendBufferSize:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWwanPreferred:(BOOL)a3;
- (void)setInterfaceIndex:(unint64_t)a3;
- (void)setSendBufferSize:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWwanPreferred:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSiriSessionLoadTimeout

- (void)dealloc
{
  [(AWDSiriSessionLoadTimeout *)self setConnectionURL:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSiriSessionLoadTimeout;
  [(AWDSiriSessionLoadTimeout *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasConnectionURL
{
  return self->_connectionURL != 0;
}

- (void)setInterfaceIndex:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_interfaceIndex = a3;
}

- (void)setHasInterfaceIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInterfaceIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSendBufferSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sendBufferSize = a3;
}

- (void)setHasSendBufferSize:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSendBufferSize
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWwanPreferred:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_wwanPreferred = a3;
}

- (void)setHasWwanPreferred:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWwanPreferred
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setConnectionTechnology:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_connectionTechnology = a3;
}

- (void)setHasConnectionTechnology:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConnectionTechnology
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSiriSessionLoadTimeout;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSiriSessionLoadTimeout description](&v3, sel_description), -[AWDSiriSessionLoadTimeout dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  connectionURL = self->_connectionURL;
  if (connectionURL) {
    [v3 setObject:connectionURL forKey:@"connectionURL"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_interfaceIndex] forKey:@"interfaceIndex"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      [v3 setObject:[NSNumber numberWithBool:self->_wwanPreferred] forKey:@"wwanPreferred"];
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return v3;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sendBufferSize] forKey:@"sendBufferSize"];
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if (has) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectionTechnology] forKey:@"connectionTechnology"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSiriSessionLoadTimeoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_connectionURL) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
LABEL_12:
      PBDataWriterWriteBOOLField();
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_12;
  }
LABEL_8:
  if ((has & 1) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 52) |= 8u;
  }
  if (self->_connectionURL) {
    [a3 setConnectionURL:];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_interfaceIndex;
    *((unsigned char *)a3 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((void *)a3 + 3) = self->_sendBufferSize;
  *((unsigned char *)a3 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      return;
    }
    goto LABEL_9;
  }
LABEL_13:
  *((unsigned char *)a3 + 48) = self->_wwanPreferred;
  *((unsigned char *)a3 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return;
  }
LABEL_9:
  *((void *)a3 + 1) = self->_connectionTechnology;
  *((unsigned char *)a3 + 52) |= 1u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(unsigned char *)(v5 + 52) |= 8u;
  }

  *(void *)(v6 + 40) = [(NSString *)self->_connectionURL copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_interfaceIndex;
    *(unsigned char *)(v6 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(unsigned char *)(v6 + 48) = self->_wwanPreferred;
      *(unsigned char *)(v6 + 52) |= 0x10u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return (id)v6;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 24) = self->_sendBufferSize;
  *(unsigned char *)(v6 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if (has)
  {
LABEL_7:
    *(void *)(v6 + 8) = self->_connectionTechnology;
    *(unsigned char *)(v6 + 52) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 8) == 0 || self->_timestamp != *((void *)a3 + 4)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 8) != 0)
  {
    goto LABEL_32;
  }
  connectionURL = self->_connectionURL;
  if ((unint64_t)connectionURL | *((void *)a3 + 5))
  {
    int v5 = -[NSString isEqual:](connectionURL, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_interfaceIndex != *((void *)a3 + 2)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_sendBufferSize != *((void *)a3 + 3)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 0x10) == 0)
  {
    if ((*((unsigned char *)a3 + 52) & 0x10) != 0) {
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  if ((*((unsigned char *)a3 + 52) & 0x10) == 0) {
    goto LABEL_32;
  }
  if (self->_wwanPreferred)
  {
    if (!*((unsigned char *)a3 + 48)) {
      goto LABEL_32;
    }
    goto LABEL_28;
  }
  if (*((unsigned char *)a3 + 48))
  {
LABEL_32:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_28:
  LOBYTE(v5) = (*((unsigned char *)a3 + 52) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_connectionTechnology != *((void *)a3 + 1)) {
      goto LABEL_32;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_connectionURL hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_interfaceIndex;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_6:
      unint64_t v6 = 2654435761u * self->_sendBufferSize;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_8;
      }
LABEL_12:
      unint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_wwanPreferred;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_connectionTechnology;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 52) & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)a3 + 5)) {
    -[AWDSiriSessionLoadTimeout setConnectionURL:](self, "setConnectionURL:");
  }
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 2) != 0)
  {
    self->_interfaceIndex = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_sendBufferSize = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0) {
      return;
    }
    goto LABEL_9;
  }
LABEL_13:
  self->_wwanPreferred = *((unsigned char *)a3 + 48);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 52) & 1) == 0) {
    return;
  }
LABEL_9:
  self->_connectionTechnology = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)connectionURL
{
  return self->_connectionURL;
}

- (void)setConnectionURL:(id)a3
{
}

- (unint64_t)interfaceIndex
{
  return self->_interfaceIndex;
}

- (unint64_t)sendBufferSize
{
  return self->_sendBufferSize;
}

- (BOOL)wwanPreferred
{
  return self->_wwanPreferred;
}

- (unint64_t)connectionTechnology
{
  return self->_connectionTechnology;
}

@end