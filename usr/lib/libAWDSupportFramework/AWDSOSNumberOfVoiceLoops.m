@interface AWDSOSNumberOfVoiceLoops
- (BOOL)hasNumberOfVoiceLoops;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)numberOfVoiceLoops;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasNumberOfVoiceLoops:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumberOfVoiceLoops:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSOSNumberOfVoiceLoops

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

- (void)setNumberOfVoiceLoops:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numberOfVoiceLoops = a3;
}

- (void)setHasNumberOfVoiceLoops:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumberOfVoiceLoops
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSOSNumberOfVoiceLoops;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSOSNumberOfVoiceLoops description](&v3, sel_description), -[AWDSOSNumberOfVoiceLoops dictionaryRepresentation](self, "dictionaryRepresentation")];
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
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_numberOfVoiceLoops] forKey:@"numberOfVoiceLoops"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSOSNumberOfVoiceLoopsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
LABEL_5:
    *((void *)a3 + 1) = self->_numberOfVoiceLoops;
    *((unsigned char *)a3 + 24) |= 1u;
    return;
  }
  *((void *)a3 + 2) = self->_timestamp;
  *((unsigned char *)a3 + 24) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_timestamp;
    *((unsigned char *)result + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)result + 1) = self->_numberOfVoiceLoops;
    *((unsigned char *)result + 24) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_11;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 2) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_numberOfVoiceLoops != *((void *)a3 + 1)) {
        goto LABEL_11;
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
    unint64_t v2 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_numberOfVoiceLoops;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 24) & 2) == 0)
  {
    if ((*((unsigned char *)a3 + 24) & 1) == 0) {
      return;
    }
LABEL_5:
    self->_numberOfVoiceLoops = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
  self->_timestamp = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 24)) {
    goto LABEL_5;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)numberOfVoiceLoops
{
  return self->_numberOfVoiceLoops;
}

@end