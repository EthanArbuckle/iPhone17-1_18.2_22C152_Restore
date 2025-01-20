@interface APPBAdFrequencyCapData
- (BOOL)hasAdFrequencyDuration;
- (BOOL)hasAdFrequencyValue;
- (BOOL)hasRelevantIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)relevantIdentifierAsString:(int)a3;
- (int)StringAsRelevantIdentifier:(id)a3;
- (int)adFrequencyValue;
- (int)relevantIdentifier;
- (unint64_t)adFrequencyDuration;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdFrequencyDuration:(unint64_t)a3;
- (void)setAdFrequencyValue:(int)a3;
- (void)setHasAdFrequencyDuration:(BOOL)a3;
- (void)setHasAdFrequencyValue:(BOOL)a3;
- (void)setHasRelevantIdentifier:(BOOL)a3;
- (void)setRelevantIdentifier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdFrequencyCapData

- (int)relevantIdentifier
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_relevantIdentifier;
  }
  else {
    return 15001;
  }
}

- (void)setRelevantIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_relevantIdentifier = a3;
}

- (void)setHasRelevantIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRelevantIdentifier
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)relevantIdentifierAsString:(int)a3
{
  if ((a3 - 15001) >= 5)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100235BF0 + a3 - 15001);
  }

  return v3;
}

- (int)StringAsRelevantIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UniqueAd"])
  {
    int v4 = 15001;
  }
  else if ([v3 isEqualToString:@"Line"])
  {
    int v4 = 15002;
  }
  else if ([v3 isEqualToString:@"Campaign"])
  {
    int v4 = 15003;
  }
  else if ([v3 isEqualToString:@"Creative"])
  {
    int v4 = 15004;
  }
  else if ([v3 isEqualToString:@"AdamId"])
  {
    int v4 = 15005;
  }
  else
  {
    int v4 = 15001;
  }

  return v4;
}

- (void)setAdFrequencyValue:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_adFrequencyValue = a3;
}

- (void)setHasAdFrequencyValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAdFrequencyValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAdFrequencyDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_adFrequencyDuration = a3;
}

- (void)setHasAdFrequencyDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdFrequencyDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdFrequencyCapData;
  char v3 = [(APPBAdFrequencyCapData *)&v7 description];
  int v4 = [(APPBAdFrequencyCapData *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    int v5 = self->_relevantIdentifier - 15001;
    if (v5 >= 5)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_relevantIdentifier];
    }
    else
    {
      v6 = *(&off_100235BF0 + v5);
    }
    [v3 setObject:v6 forKey:@"relevantIdentifier"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_adFrequencyValue];
    [v3 setObject:v7 forKey:@"adFrequencyValue"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v8 = +[NSNumber numberWithUnsignedLongLong:self->_adFrequencyDuration];
    [v3 setObject:v8 forKey:@"adFrequencyDuration"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdFrequencyCapDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[5] = self->_relevantIdentifier;
    *((unsigned char *)v4 + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_adFrequencyValue;
  *((unsigned char *)v4 + 24) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)v4 + 1) = self->_adFrequencyDuration;
    *((unsigned char *)v4 + 24) |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 5) = self->_relevantIdentifier;
    *((unsigned char *)result + 24) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_adFrequencyValue;
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 1) = self->_adFrequencyDuration;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_relevantIdentifier != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_adFrequencyValue != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_adFrequencyDuration != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_relevantIdentifier;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_adFrequencyValue;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_adFrequencyDuration;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 4) != 0)
  {
    self->_relevantIdentifier = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_adFrequencyValue = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 24))
  {
LABEL_4:
    self->_adFrequencyDuration = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
}

- (int)adFrequencyValue
{
  return self->_adFrequencyValue;
}

- (unint64_t)adFrequencyDuration
{
  return self->_adFrequencyDuration;
}

@end