@interface AWDOSAnalyticsSubmissions
- (BOOL)hasConnection;
- (BOOL)hasLogs;
- (BOOL)hasResponse;
- (BOOL)hasRouting;
- (BOOL)hasSeconds;
- (BOOL)hasSizeBytes;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)connection;
- (NSString)routing;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)response;
- (unint64_t)hash;
- (unint64_t)logs;
- (unint64_t)seconds;
- (unint64_t)sizeBytes;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConnection:(id)a3;
- (void)setHasLogs:(BOOL)a3;
- (void)setHasResponse:(BOOL)a3;
- (void)setHasSeconds:(BOOL)a3;
- (void)setHasSizeBytes:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLogs:(unint64_t)a3;
- (void)setResponse:(int)a3;
- (void)setRouting:(id)a3;
- (void)setSeconds:(unint64_t)a3;
- (void)setSizeBytes:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDOSAnalyticsSubmissions

- (void)dealloc
{
  [(AWDOSAnalyticsSubmissions *)self setConnection:0];
  [(AWDOSAnalyticsSubmissions *)self setRouting:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDOSAnalyticsSubmissions;
  [(AWDOSAnalyticsSubmissions *)&v3 dealloc];
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

- (void)setResponse:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_response = a3;
}

- (void)setHasResponse:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasResponse
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasConnection
{
  return self->_connection != 0;
}

- (BOOL)hasRouting
{
  return self->_routing != 0;
}

- (void)setSizeBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sizeBytes = a3;
}

- (void)setHasSizeBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSizeBytes
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLogs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_logs = a3;
}

- (void)setHasLogs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLogs
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_seconds = a3;
}

- (void)setHasSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDOSAnalyticsSubmissions;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDOSAnalyticsSubmissions description](&v3, sel_description), -[AWDOSAnalyticsSubmissions dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_response] forKey:@"response"];
  }
  connection = self->_connection;
  if (connection) {
    [v3 setObject:connection forKey:@"connection"];
  }
  routing = self->_routing;
  if (routing) {
    [v3 setObject:routing forKey:@"routing"];
  }
  char v7 = (char)self->_has;
  if ((v7 & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_11;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_logs] forKey:@"logs"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_12;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sizeBytes] forKey:@"sizeBytes"];
  char v7 = (char)self->_has;
  if (v7) {
    goto LABEL_15;
  }
LABEL_11:
  if ((v7 & 2) != 0) {
LABEL_12:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_seconds] forKey:@"seconds"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDOSAnalyticsSubmissionsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_connection) {
    PBDataWriterWriteStringField();
  }
  if (self->_routing) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_11;
    }
LABEL_14:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_15;
  }
  PBDataWriterWriteUint64Field();
  char v5 = (char)self->_has;
  if (v5) {
    goto LABEL_14;
  }
LABEL_11:
  if ((v5 & 2) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 64) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_response;
    *((unsigned char *)a3 + 64) |= 0x10u;
  }
  if (self->_connection) {
    [a3 setConnection:];
  }
  if (self->_routing) {
    [a3 setRouting:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((void *)a3 + 3) = self->_sizeBytes;
    *((unsigned char *)a3 + 64) |= 4u;
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_11:
      if ((v6 & 2) == 0) {
        return;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((void *)a3 + 1) = self->_logs;
  *((unsigned char *)a3 + 64) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return;
  }
LABEL_12:
  *((void *)a3 + 2) = self->_seconds;
  *((unsigned char *)a3 + 64) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(unsigned char *)(v5 + 64) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_response;
    *(unsigned char *)(v5 + 64) |= 0x10u;
  }

  *(void *)(v6 + 40) = [(NSString *)self->_connection copyWithZone:a3];
  *(void *)(v6 + 56) = [(NSString *)self->_routing copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *(void *)(v6 + 8) = self->_logs;
    *(unsigned char *)(v6 + 64) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
  *(void *)(v6 + 24) = self->_sizeBytes;
  *(unsigned char *)(v6 + 64) |= 4u;
  char v8 = (char)self->_has;
  if (v8) {
    goto LABEL_11;
  }
LABEL_7:
  if ((v8 & 2) != 0)
  {
LABEL_8:
    *(void *)(v6 + 16) = self->_seconds;
    *(unsigned char *)(v6 + 64) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 8) == 0 || self->_timestamp != *((void *)a3 + 4)) {
        goto LABEL_30;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 8) != 0)
    {
LABEL_30:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x10) == 0 || self->_response != *((_DWORD *)a3 + 12)) {
        goto LABEL_30;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x10) != 0)
    {
      goto LABEL_30;
    }
    connection = self->_connection;
    if (!((unint64_t)connection | *((void *)a3 + 5))
      || (int v5 = -[NSString isEqual:](connection, "isEqual:")) != 0)
    {
      routing = self->_routing;
      if (!((unint64_t)routing | *((void *)a3 + 7)) || (int v5 = -[NSString isEqual:](routing, "isEqual:")) != 0)
      {
        if ((*(unsigned char *)&self->_has & 4) != 0)
        {
          if ((*((unsigned char *)a3 + 64) & 4) == 0 || self->_sizeBytes != *((void *)a3 + 3)) {
            goto LABEL_30;
          }
        }
        else if ((*((unsigned char *)a3 + 64) & 4) != 0)
        {
          goto LABEL_30;
        }
        if (*(unsigned char *)&self->_has)
        {
          if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_logs != *((void *)a3 + 1)) {
            goto LABEL_30;
          }
        }
        else if (*((unsigned char *)a3 + 64))
        {
          goto LABEL_30;
        }
        LOBYTE(v5) = (*((unsigned char *)a3 + 64) & 2) == 0;
        if ((*(unsigned char *)&self->_has & 2) != 0)
        {
          if ((*((unsigned char *)a3 + 64) & 2) == 0 || self->_seconds != *((void *)a3 + 2)) {
            goto LABEL_30;
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_response;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_connection hash];
  NSUInteger v6 = [(NSString *)self->_routing hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    unint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
LABEL_11:
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  unint64_t v7 = 2654435761u * self->_sizeBytes;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_logs;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  unint64_t v9 = 2654435761u * self->_seconds;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 64);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)a3 + 64);
  }
  if ((v5 & 0x10) != 0)
  {
    self->_response = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)a3 + 5)) {
    -[AWDOSAnalyticsSubmissions setConnection:](self, "setConnection:");
  }
  if (*((void *)a3 + 7)) {
    [(AWDOSAnalyticsSubmissions *)self setRouting:"setRouting:"];
  }
  char v6 = *((unsigned char *)a3 + 64);
  if ((v6 & 4) != 0)
  {
    self->_sizeBytes = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)a3 + 64);
    if ((v6 & 1) == 0)
    {
LABEL_11:
      if ((v6 & 2) == 0) {
        return;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 1) == 0)
  {
    goto LABEL_11;
  }
  self->_logs = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 64) & 2) == 0) {
    return;
  }
LABEL_12:
  self->_seconds = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)response
{
  return self->_response;
}

- (NSString)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)routing
{
  return self->_routing;
}

- (void)setRouting:(id)a3
{
}

- (unint64_t)sizeBytes
{
  return self->_sizeBytes;
}

- (unint64_t)logs
{
  return self->_logs;
}

- (unint64_t)seconds
{
  return self->_seconds;
}

@end