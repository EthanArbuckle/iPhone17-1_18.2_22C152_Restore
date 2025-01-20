@interface AWDSafariCKBookmarksSyncEvent
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasResult;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorCode;
- (NSString)errorDomain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)result;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setResult:(int64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariCKBookmarksSyncEvent

- (void)dealloc
{
  [(AWDSafariCKBookmarksSyncEvent *)self setErrorDomain:0];
  [(AWDSafariCKBookmarksSyncEvent *)self setErrorCode:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariCKBookmarksSyncEvent;
  [(AWDSafariCKBookmarksSyncEvent *)&v3 dealloc];
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

- (void)setResult:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResult
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariCKBookmarksSyncEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariCKBookmarksSyncEvent description](&v3, sel_description), -[AWDSafariCKBookmarksSyncEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithLongLong:self->_result] forKey:@"result"];
  }
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"errorDomain"];
  }
  errorCode = self->_errorCode;
  if (errorCode) {
    [v3 setObject:errorCode forKey:@"errorCode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariCKBookmarksSyncEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_errorDomain) {
    PBDataWriterWriteStringField();
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_result;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if (self->_errorDomain) {
    [a3 setErrorDomain:];
  }
  if (self->_errorCode)
  {
    [a3 setErrorCode:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_result;
    *(unsigned char *)(v5 + 40) |= 1u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_errorDomain copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSString *)self->_errorCode copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_result != *((void *)a3 + 1)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
      goto LABEL_16;
    }
    errorDomain = self->_errorDomain;
    if (!((unint64_t)errorDomain | *((void *)a3 + 4))
      || (int v5 = -[NSString isEqual:](errorDomain, "isEqual:")) != 0)
    {
      errorCode = self->_errorCode;
      if ((unint64_t)errorCode | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NSString isEqual:](errorCode, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_result;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_errorDomain hash];
  return v5 ^ [(NSString *)self->_errorCode hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 40);
  }
  if (v5)
  {
    self->_result = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDSafariCKBookmarksSyncEvent setErrorDomain:](self, "setErrorDomain:");
  }
  if (*((void *)a3 + 3))
  {
    -[AWDSafariCKBookmarksSyncEvent setErrorCode:](self, "setErrorCode:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)result
{
  return self->_result;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

@end