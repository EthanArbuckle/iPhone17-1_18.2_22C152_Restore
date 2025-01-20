@interface CLCKVO2MaxSessionAttributes
- (BOOL)betaBlockerUse;
- (BOOL)hasAlgorithmVersion;
- (BOOL)hasBetaBlockerUse;
- (BOOL)hasHardwareType;
- (BOOL)hasMeanMaxMets;
- (BOOL)hasPrior;
- (BOOL)hasStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)meanMaxMets;
- (double)prior;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)algorithmVersion;
- (unint64_t)hash;
- (unsigned)hardwareType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgorithmVersion:(int)a3;
- (void)setBetaBlockerUse:(BOOL)a3;
- (void)setHardwareType:(unsigned int)a3;
- (void)setHasAlgorithmVersion:(BOOL)a3;
- (void)setHasBetaBlockerUse:(BOOL)a3;
- (void)setHasHardwareType:(BOOL)a3;
- (void)setHasMeanMaxMets:(BOOL)a3;
- (void)setHasPrior:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setMeanMaxMets:(double)a3;
- (void)setPrior:(double)a3;
- (void)setStartTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCKVO2MaxSessionAttributes

- (void)setStartTime:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStartTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMeanMaxMets:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_meanMaxMets = a3;
}

- (void)setHasMeanMaxMets:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMeanMaxMets
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPrior:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_prior = a3;
}

- (void)setHasPrior:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPrior
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHardwareType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_hardwareType = a3;
}

- (void)setHasHardwareType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasHardwareType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBetaBlockerUse:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_betaBlockerUse = a3;
}

- (void)setHasBetaBlockerUse:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasBetaBlockerUse
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAlgorithmVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_algorithmVersion = a3;
}

- (void)setHasAlgorithmVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAlgorithmVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSessionAttributes;
  return +[NSString stringWithFormat:@"%@ %@", [(CLCKVO2MaxSessionAttributes *)&v3 description], [(CLCKVO2MaxSessionAttributes *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_startTime)] forKey:@"startTime"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithDouble:self->_meanMaxMets] forKey:@"meanMaxMets"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_prior)] forKey:@"prior"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
LABEL_13:
    [v3 setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_betaBlockerUse)] forKey:@"betaBlockerUse"];
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return v3;
    }
    goto LABEL_7;
  }
LABEL_12:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_hardwareType)] forKey:@"hardwareType"];
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_13;
  }
LABEL_6:
  if ((has & 8) != 0) {
LABEL_7:
  }
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_algorithmVersion)] forKey:@"algorithmVersion"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_101140F2C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_11:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((has & 8) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = *(void *)&self->_startTime;
    *((unsigned char *)a3 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = *(void *)&self->_meanMaxMets;
  *((unsigned char *)a3 + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)a3 + 2) = *(void *)&self->_prior;
  *((unsigned char *)a3 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 9) = self->_hardwareType;
  *((unsigned char *)a3 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      return;
    }
LABEL_13:
    *((_DWORD *)a3 + 8) = self->_algorithmVersion;
    *((unsigned char *)a3 + 44) |= 8u;
    return;
  }
LABEL_12:
  *((unsigned char *)a3 + 40) = self->_betaBlockerUse;
  *((unsigned char *)a3 + 44) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    goto LABEL_13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_startTime;
    *((unsigned char *)result + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_meanMaxMets;
  *((unsigned char *)result + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((void *)result + 2) = *(void *)&self->_prior;
  *((unsigned char *)result + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 9) = self->_hardwareType;
  *((unsigned char *)result + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((unsigned char *)result + 40) = self->_betaBlockerUse;
  *((unsigned char *)result + 44) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 8) = self->_algorithmVersion;
  *((unsigned char *)result + 44) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_startTime != *((double *)a3 + 3)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 4) != 0)
  {
    goto LABEL_34;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_meanMaxMets != *((double *)a3 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)a3 + 44))
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_prior != *((double *)a3 + 2)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 0x10) == 0 || self->_hardwareType != *((_DWORD *)a3 + 9)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    if ((*((unsigned char *)a3 + 44) & 0x20) != 0) {
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  if ((*((unsigned char *)a3 + 44) & 0x20) == 0) {
    goto LABEL_34;
  }
  if (self->_betaBlockerUse)
  {
    if (!*((unsigned char *)a3 + 40)) {
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  if (*((unsigned char *)a3 + 40))
  {
LABEL_34:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_30:
  LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_algorithmVersion != *((_DWORD *)a3 + 8)) {
      goto LABEL_34;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double startTime = self->_startTime;
    double v6 = -startTime;
    if (startTime >= 0.0) {
      double v6 = self->_startTime;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (has)
  {
    double meanMaxMets = self->_meanMaxMets;
    double v11 = -meanMaxMets;
    if (meanMaxMets >= 0.0) {
      double v11 = self->_meanMaxMets;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 2) != 0)
  {
    double prior = self->_prior;
    double v16 = -prior;
    if (prior >= 0.0) {
      double v16 = self->_prior;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 0x10) == 0)
  {
    uint64_t v19 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_27;
    }
LABEL_30:
    uint64_t v20 = 0;
    if ((has & 8) != 0) {
      goto LABEL_28;
    }
LABEL_31:
    uint64_t v21 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21;
  }
  uint64_t v19 = 2654435761 * self->_hardwareType;
  if ((has & 0x20) == 0) {
    goto LABEL_30;
  }
LABEL_27:
  uint64_t v20 = 2654435761 * self->_betaBlockerUse;
  if ((has & 8) == 0) {
    goto LABEL_31;
  }
LABEL_28:
  uint64_t v21 = 2654435761 * self->_algorithmVersion;
  return v9 ^ v4 ^ v14 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 4) != 0)
  {
    self->_double startTime = *((double *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 44);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double meanMaxMets = *((double *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  self->_double prior = *((double *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_hardwareType = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 8) == 0) {
      return;
    }
LABEL_13:
    self->_algorithmVersion = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 8u;
    return;
  }
LABEL_12:
  self->_betaBlockerUse = *((unsigned char *)a3 + 40);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)a3 + 44) & 8) != 0) {
    goto LABEL_13;
  }
}

- (double)startTime
{
  return self->_startTime;
}

- (double)meanMaxMets
{
  return self->_meanMaxMets;
}

- (double)prior
{
  return self->_prior;
}

- (unsigned)hardwareType
{
  return self->_hardwareType;
}

- (BOOL)betaBlockerUse
{
  return self->_betaBlockerUse;
}

- (int)algorithmVersion
{
  return self->_algorithmVersion;
}

@end