@interface AWDIDSNoteMessageReceived
- (BOOL)fromStorage;
- (BOOL)hasAccountType;
- (BOOL)hasFromStorage;
- (BOOL)hasLocaltimedelta;
- (BOOL)hasServertimestamp;
- (BOOL)hasServiceIdentifier;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)serviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)accountType;
- (unint64_t)hash;
- (unint64_t)localtimedelta;
- (unint64_t)servertimestamp;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccountType:(int)a3;
- (void)setFromStorage:(BOOL)a3;
- (void)setHasAccountType:(BOOL)a3;
- (void)setHasFromStorage:(BOOL)a3;
- (void)setHasLocaltimedelta:(BOOL)a3;
- (void)setHasServertimestamp:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLocaltimedelta:(unint64_t)a3;
- (void)setServertimestamp:(unint64_t)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSNoteMessageReceived

- (void)dealloc
{
  [(AWDIDSNoteMessageReceived *)self setServiceIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSNoteMessageReceived;
  [(AWDIDSNoteMessageReceived *)&v3 dealloc];
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

- (void)setAccountType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_accountType = a3;
}

- (void)setHasAccountType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAccountType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFromStorage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_fromStorage = a3;
}

- (void)setHasFromStorage:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFromStorage
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (void)setServertimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_servertimestamp = a3;
}

- (void)setHasServertimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServertimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLocaltimedelta:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_localtimedelta = a3;
}

- (void)setHasLocaltimedelta:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLocaltimedelta
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSNoteMessageReceived;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSNoteMessageReceived description](&v3, sel_description), -[AWDIDSNoteMessageReceived dictionaryRepresentation](self, "dictionaryRepresentation")];
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
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_accountType] forKey:@"accountType"];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_fromStorage] forKey:@"fromStorage"];
LABEL_5:
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    [v3 setObject:serviceIdentifier forKey:@"serviceIdentifier"];
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_servertimestamp] forKey:@"servertimestamp"];
    char v6 = (char)self->_has;
  }
  if (v6) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_localtimedelta] forKey:@"localtimedelta"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSNoteMessageReceivedReadFrom((uint64_t)self, (uint64_t)a3);
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
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_4:
  }
    PBDataWriterWriteBOOLField();
LABEL_5:
  if (self->_serviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char v5 = (char)self->_has;
  }
  if (v5)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 52) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_accountType;
  *((unsigned char *)a3 + 52) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *((unsigned char *)a3 + 48) = self->_fromStorage;
    *((unsigned char *)a3 + 52) |= 0x10u;
  }
LABEL_5:
  if (self->_serviceIdentifier) {
    [a3 setServiceIdentifier:];
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((void *)a3 + 2) = self->_servertimestamp;
    *((unsigned char *)a3 + 52) |= 2u;
    char v6 = (char)self->_has;
  }
  if (v6)
  {
    *((void *)a3 + 1) = self->_localtimedelta;
    *((unsigned char *)a3 + 52) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init]];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 52) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_accountType;
  *(unsigned char *)(v5 + 52) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 48) = self->_fromStorage;
    *(unsigned char *)(v5 + 52) |= 0x10u;
  }
LABEL_5:

  *(void *)(v6 + 40) = [(NSString *)self->_serviceIdentifier copyWithZone:a3];
  char v8 = (char)self->_has;
  if ((v8 & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_servertimestamp;
    *(unsigned char *)(v6 + 52) |= 2u;
    char v8 = (char)self->_has;
  }
  if (v8)
  {
    *(void *)(v6 + 8) = self->_localtimedelta;
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
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 8) == 0 || self->_accountType != *((_DWORD *)a3 + 8)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    if ((*((unsigned char *)a3 + 52) & 0x10) != 0) {
      goto LABEL_32;
    }
    goto LABEL_20;
  }
  if ((*((unsigned char *)a3 + 52) & 0x10) == 0) {
    goto LABEL_32;
  }
  if (self->_fromStorage)
  {
    if (!*((unsigned char *)a3 + 48)) {
      goto LABEL_32;
    }
    goto LABEL_20;
  }
  if (*((unsigned char *)a3 + 48))
  {
LABEL_32:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_20:
  serviceIdentifier = self->_serviceIdentifier;
  if ((unint64_t)serviceIdentifier | *((void *)a3 + 5))
  {
    int v5 = -[NSString isEqual:](serviceIdentifier, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 52) & 2) == 0 || self->_servertimestamp != *((void *)a3 + 2)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 2) != 0)
  {
    goto LABEL_32;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 52) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)a3 + 52) & 1) == 0 || self->_localtimedelta != *((void *)a3 + 1)) {
      goto LABEL_32;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  unint64_t v3 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_accountType;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_fromStorage;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_serviceIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v7 = 2654435761u * self->_servertimestamp;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_10;
    }
LABEL_12:
    unint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
  }
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  unint64_t v8 = 2654435761u * self->_localtimedelta;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 52);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 52);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 52) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_accountType = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 52) & 0x10) != 0)
  {
LABEL_4:
    self->_fromStorage = *((unsigned char *)a3 + 48);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_5:
  if (*((void *)a3 + 5)) {
    -[AWDIDSNoteMessageReceived setServiceIdentifier:](self, "setServiceIdentifier:");
  }
  char v6 = *((unsigned char *)a3 + 52);
  if ((v6 & 2) != 0)
  {
    self->_servertimestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)a3 + 52);
  }
  if (v6)
  {
    self->_localtimedelta = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)accountType
{
  return self->_accountType;
}

- (BOOL)fromStorage
{
  return self->_fromStorage;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (unint64_t)servertimestamp
{
  return self->_servertimestamp;
}

- (unint64_t)localtimedelta
{
  return self->_localtimedelta;
}

@end