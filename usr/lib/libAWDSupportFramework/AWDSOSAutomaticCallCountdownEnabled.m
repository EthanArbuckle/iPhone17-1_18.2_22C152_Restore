@interface AWDSOSAutomaticCallCountdownEnabled
- (BOOL)automaticCallCountdownEnabled;
- (BOOL)hasAutomaticCallCountdownEnabled;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutomaticCallCountdownEnabled:(BOOL)a3;
- (void)setHasAutomaticCallCountdownEnabled:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSOSAutomaticCallCountdownEnabled

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

- (void)setAutomaticCallCountdownEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_automaticCallCountdownEnabled = a3;
}

- (void)setHasAutomaticCallCountdownEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAutomaticCallCountdownEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSOSAutomaticCallCountdownEnabled;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSOSAutomaticCallCountdownEnabled description](&v3, sel_description), -[AWDSOSAutomaticCallCountdownEnabled dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_automaticCallCountdownEnabled] forKey:@"automaticCallCountdownEnabled"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSOSAutomaticCallCountdownEnabledReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
LABEL_5:
    *((unsigned char *)a3 + 16) = self->_automaticCallCountdownEnabled;
    *((unsigned char *)a3 + 20) |= 2u;
    return;
  }
  *((void *)a3 + 1) = self->_timestamp;
  *((unsigned char *)a3 + 20) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 16) = self->_automaticCallCountdownEnabled;
    *((unsigned char *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)a3 + 20))
    {
      goto LABEL_9;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 20) & 2) == 0)
      {
LABEL_9:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_automaticCallCountdownEnabled)
      {
        if (!*((unsigned char *)a3 + 16)) {
          goto LABEL_9;
        }
      }
      else if (*((unsigned char *)a3 + 16))
      {
        goto LABEL_9;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_automaticCallCountdownEnabled;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 20) & 1) == 0)
  {
    if ((*((unsigned char *)a3 + 20) & 2) == 0) {
      return;
    }
LABEL_5:
    self->_automaticCallCountdownEnabled = *((unsigned char *)a3 + 16);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
  self->_timestamp = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 20) & 2) != 0) {
    goto LABEL_5;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)automaticCallCountdownEnabled
{
  return self->_automaticCallCountdownEnabled;
}

@end