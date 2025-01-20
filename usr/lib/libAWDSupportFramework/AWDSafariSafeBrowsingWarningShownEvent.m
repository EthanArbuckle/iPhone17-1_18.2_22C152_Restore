@interface AWDSafariSafeBrowsingWarningShownEvent
- (BOOL)hasProvider;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)providerAsString:(int)a3;
- (int)StringAsProvider:(id)a3;
- (int)provider;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasProvider:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setProvider:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSafariSafeBrowsingWarningShownEvent

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

- (int)provider
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_provider;
  }
  else {
    return 0;
  }
}

- (void)setProvider:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_provider = a3;
}

- (void)setHasProvider:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProvider
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)providerAsString:(int)a3
{
  if (a3 >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9E10[a3];
  }
}

- (int)StringAsProvider:(id)a3
{
  if ([a3 isEqualToString:@"GOOGLE"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"OTHER"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"SAFARI"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"MULTIPLE"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"SAFARI_EXTENSION"]) {
    return 4;
  }
  return 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSafariSafeBrowsingWarningShownEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSafariSafeBrowsingWarningShownEvent description](&v3, sel_description), -[AWDSafariSafeBrowsingWarningShownEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  if ((has & 2) != 0)
  {
    uint64_t provider = self->_provider;
    if (provider >= 5) {
      v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_provider];
    }
    else {
      v6 = off_2641B9E10[provider];
    }
    [v3 setObject:v6 forKey:@"provider"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSafariSafeBrowsingWarningShownEventReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteInt32Field();
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
    *((_DWORD *)a3 + 4) = self->_provider;
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
    *((_DWORD *)result + 4) = self->_provider;
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
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 20))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 20) & 2) == 0 || self->_provider != *((_DWORD *)a3 + 4)) {
        goto LABEL_11;
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
  uint64_t v3 = 2654435761 * self->_provider;
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
    self->_uint64_t provider = *((_DWORD *)a3 + 4);
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

@end