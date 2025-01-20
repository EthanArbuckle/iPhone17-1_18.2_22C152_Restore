@interface APPBCachedAd
+ (id)options;
- (BOOL)hasExpirationDate;
- (BOOL)hasPriority;
- (BOOL)hasRemainingImpressionCount;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uniqueIdentifier;
- (double)expirationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)priority;
- (unsigned)remainingImpressionCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpirationDate:(double)a3;
- (void)setHasExpirationDate:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasRemainingImpressionCount:(BOOL)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setRemainingImpressionCount:(unsigned int)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBCachedAd

+ (id)options
{
  if (qword_100289758 != -1) {
    dispatch_once(&qword_100289758, &stru_100234CE0);
  }
  v2 = (void *)qword_100289750;

  return v2;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (void)setExpirationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpirationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPriority:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPriority
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRemainingImpressionCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_remainingImpressionCount = a3;
}

- (void)setHasRemainingImpressionCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRemainingImpressionCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBCachedAd;
  char v3 = [(APPBCachedAd *)&v7 description];
  v4 = [(APPBCachedAd *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v3 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = +[NSNumber numberWithDouble:self->_expirationDate];
    [v4 setObject:v9 forKey:@"expirationDate"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v10 = +[NSNumber numberWithUnsignedLongLong:self->_priority];
  [v4 setObject:v10 forKey:@"priority"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_remainingImpressionCount];
    [v4 setObject:v7 forKey:@"remainingImpressionCount"];
  }
LABEL_7:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBCachedAdReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteFixed32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteFixed64Field();
    id v4 = v6;
  }
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_uniqueIdentifier)
  {
    id v6 = v4;
    [v4 setUniqueIdentifier:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_expirationDate;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 6) = self->_remainingImpressionCount;
  *((unsigned char *)v4 + 40) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((void *)v4 + 2) = self->_priority;
    *((unsigned char *)v4 + 40) |= 2u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v5 + 6) = self->_remainingImpressionCount;
    *((unsigned char *)v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v5;
    }
    goto LABEL_4;
  }
  v5[1] = *(void *)&self->_expirationDate;
  *((unsigned char *)v5 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5[2] = self->_priority;
    *((unsigned char *)v5 + 40) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_remainingImpressionCount != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_priority != *((void *)v4 + 2)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueIdentifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double expirationDate = self->_expirationDate;
    double v7 = -expirationDate;
    if (expirationDate >= 0.0) {
      double v7 = self->_expirationDate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_remainingImpressionCount;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    unint64_t v11 = 0;
    return v5 ^ v3 ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  unint64_t v11 = 2654435761u * self->_priority;
  return v5 ^ v3 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[APPBCachedAd setUniqueIdentifier:](self, "setUniqueIdentifier:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if (v5)
  {
    self->_double expirationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_remainingImpressionCount = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_6:
    self->_priority = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (unsigned)remainingImpressionCount
{
  return self->_remainingImpressionCount;
}

- (void).cxx_destruct
{
}

@end