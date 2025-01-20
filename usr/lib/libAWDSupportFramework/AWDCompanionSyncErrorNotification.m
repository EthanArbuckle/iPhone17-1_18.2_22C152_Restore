@interface AWDCompanionSyncErrorNotification
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasService;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)errorDomain;
- (NSString)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)errorCode;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCompanionSyncErrorNotification

- (void)dealloc
{
  [(AWDCompanionSyncErrorNotification *)self setService:0];
  [(AWDCompanionSyncErrorNotification *)self setErrorDomain:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncErrorNotification;
  [(AWDCompanionSyncErrorNotification *)&v3 dealloc];
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

- (BOOL)hasService
{
  return self->_service != 0;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncErrorNotification;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCompanionSyncErrorNotification description](&v3, sel_description), -[AWDCompanionSyncErrorNotification dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  service = self->_service;
  if (service) {
    [v3 setObject:service forKey:@"service"];
  }
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v3 setObject:errorDomain forKey:@"errorDomain"];
  }
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithLongLong:self->_errorCode] forKey:@"errorCode"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCompanionSyncErrorNotificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_service) {
    PBDataWriterWriteStringField();
  }
  if (self->_errorDomain) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 2u;
  }
  if (self->_service) {
    [a3 setService:];
  }
  if (self->_errorDomain) {
    [a3 setErrorDomain:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_errorCode;
    *((unsigned char *)a3 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 2u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_service copyWithZone:a3];
  *(void *)(v6 + 24) = [(NSString *)self->_errorDomain copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_errorCode;
    *(unsigned char *)(v6 + 40) |= 1u;
  }
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
        goto LABEL_15;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
LABEL_15:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if (!((unint64_t)service | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](service, "isEqual:")) != 0)
    {
      errorDomain = self->_errorDomain;
      if (!((unint64_t)errorDomain | *((void *)a3 + 3))
        || (int v5 = -[NSString isEqual:](errorDomain, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 1) == 0;
        if (*(unsigned char *)&self->_has)
        {
          if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_errorCode != *((void *)a3 + 1)) {
            goto LABEL_15;
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
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_service hash];
  NSUInteger v5 = [(NSString *)self->_errorDomain hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 40) & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDCompanionSyncErrorNotification setService:](self, "setService:");
  }
  if (*((void *)a3 + 3)) {
    -[AWDCompanionSyncErrorNotification setErrorDomain:](self, "setErrorDomain:");
  }
  if (*((unsigned char *)a3 + 40))
  {
    self->_errorCode = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

@end