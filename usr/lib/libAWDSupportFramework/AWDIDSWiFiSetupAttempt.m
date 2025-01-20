@interface AWDIDSWiFiSetupAttempt
- (BOOL)hasClient;
- (BOOL)hasDuration;
- (BOOL)hasResult;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)client;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)result;
- (unint64_t)timestamp;
- (unint64_t)type;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClient:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setResult:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSWiFiSetupAttempt

- (void)dealloc
{
  [(AWDIDSWiFiSetupAttempt *)self setClient:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSWiFiSetupAttempt;
  [(AWDIDSWiFiSetupAttempt *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setType:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResult:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResult
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasClient
{
  return self->_client != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSWiFiSetupAttempt;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSWiFiSetupAttempt description](&v3, sel_description), -[AWDIDSWiFiSetupAttempt dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_type] forKey:@"type"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_duration] forKey:@"duration"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_result] forKey:@"result"];
LABEL_6:
  client = self->_client;
  if (client) {
    [v3 setObject:client forKey:@"client"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSWiFiSetupAttemptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint64Field();
LABEL_6:
  if (self->_client)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 4) = self->_type;
  *((unsigned char *)a3 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  *((void *)a3 + 1) = self->_duration;
  *((unsigned char *)a3 + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    *((void *)a3 + 2) = self->_result;
    *((unsigned char *)a3 + 48) |= 2u;
  }
LABEL_6:
  client = self->_client;
  if (client) {
    [a3 setClient:client];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 8) = self->_duration;
      *(unsigned char *)(v5 + 48) |= 1u;
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 32) = self->_type;
  *(unsigned char *)(v5 + 48) |= 8u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(void *)(v5 + 16) = self->_result;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
LABEL_6:

  v6[5] = [(NSString *)self->_client copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 4) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_type != *((void *)a3 + 4)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
      goto LABEL_24;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
      goto LABEL_24;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_result != *((void *)a3 + 2)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 2) != 0)
    {
      goto LABEL_24;
    }
    client = self->_client;
    if ((unint64_t)client | *((void *)a3 + 5))
    {
      LOBYTE(v5) = -[NSString isEqual:](client, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_type;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      unint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ [(NSString *)self->_client hash];
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_duration;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_result;
  return v3 ^ v2 ^ v4 ^ v5 ^ [(NSString *)self->_client hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 48);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_type = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 48);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  self->_duration = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 48) & 2) != 0)
  {
LABEL_5:
    self->_result = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
  if (*((void *)a3 + 5)) {
    -[AWDIDSWiFiSetupAttempt setClient:](self, "setClient:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unint64_t)result
{
  return self->_result;
}

- (NSString)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

@end