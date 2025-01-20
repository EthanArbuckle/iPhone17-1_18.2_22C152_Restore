@interface AWDWifiAwdlServiceRecord
- (BOOL)hasDuration;
- (BOOL)hasOpcode;
- (BOOL)hasServiceId;
- (BOOL)hasServiceKey;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)serviceKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)duration;
- (unint64_t)hash;
- (unsigned)opcode;
- (unsigned)serviceId;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasOpcode:(BOOL)a3;
- (void)setHasServiceId:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setOpcode:(unsigned int)a3;
- (void)setServiceId:(unsigned int)a3;
- (void)setServiceKey:(id)a3;
- (void)setType:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWifiAwdlServiceRecord

- (void)dealloc
{
  [(AWDWifiAwdlServiceRecord *)self setServiceKey:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiAwdlServiceRecord;
  [(AWDWifiAwdlServiceRecord *)&v3 dealloc];
}

- (void)setOpcode:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_opcode = a3;
}

- (void)setHasOpcode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOpcode
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setType:(unsigned int)a3
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

- (void)setServiceId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_serviceId = a3;
}

- (void)setHasServiceId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasServiceId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (BOOL)hasServiceKey
{
  return self->_serviceKey != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiAwdlServiceRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWifiAwdlServiceRecord description](&v3, sel_description), -[AWDWifiAwdlServiceRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_opcode] forKey:@"opcode"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_type] forKey:@"type"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_serviceId] forKey:@"serviceId"];
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_duration] forKey:@"duration"];
LABEL_6:
  serviceKey = self->_serviceKey;
  if (serviceKey) {
    [v3 setObject:serviceKey forKey:@"serviceKey"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiAwdlServiceRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteUint64Field();
LABEL_6:
  if (self->_serviceKey)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_opcode;
    *((unsigned char *)a3 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_type;
  *((unsigned char *)a3 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  *((_DWORD *)a3 + 5) = self->_serviceId;
  *((unsigned char *)a3 + 36) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    *((void *)a3 + 1) = self->_duration;
    *((unsigned char *)a3 + 36) |= 1u;
  }
LABEL_6:
  serviceKey = self->_serviceKey;
  if (serviceKey) {
    [a3 setServiceKey:serviceKey];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_opcode;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 20) = self->_serviceId;
      *(unsigned char *)(v5 + 36) |= 4u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_type;
  *(unsigned char *)(v5 + 36) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (has)
  {
LABEL_5:
    *(void *)(v5 + 8) = self->_duration;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
LABEL_6:

  v6[3] = [(NSData *)self->_serviceKey copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_opcode != *((_DWORD *)a3 + 4)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 2) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 8) == 0 || self->_type != *((_DWORD *)a3 + 8)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 8) != 0)
    {
      goto LABEL_24;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 36) & 4) == 0 || self->_serviceId != *((_DWORD *)a3 + 5)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 36) & 4) != 0)
    {
      goto LABEL_24;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)a3 + 36))
    {
      goto LABEL_24;
    }
    serviceKey = self->_serviceKey;
    if ((unint64_t)serviceKey | *((void *)a3 + 3))
    {
      LOBYTE(v5) = -[NSData isEqual:](serviceKey, "isEqual:");
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_opcode;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_type;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      unint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ [(NSData *)self->_serviceKey hash];
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_serviceId;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_duration;
  return v3 ^ v2 ^ v4 ^ v5 ^ [(NSData *)self->_serviceKey hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 2) != 0)
  {
    self->_opcode = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 36);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_type = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 36);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  self->_serviceId = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)a3 + 36))
  {
LABEL_5:
    self->_duration = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
  if (*((void *)a3 + 3)) {
    -[AWDWifiAwdlServiceRecord setServiceKey:](self, "setServiceKey:");
  }
}

- (unsigned)opcode
{
  return self->_opcode;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)serviceId
{
  return self->_serviceId;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NSData)serviceKey
{
  return self->_serviceKey;
}

- (void)setServiceKey:(id)a3
{
}

@end