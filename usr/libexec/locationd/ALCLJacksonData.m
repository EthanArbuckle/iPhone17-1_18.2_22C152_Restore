@interface ALCLJacksonData
- (BOOL)hasFPal;
- (BOOL)hasLsest;
- (BOOL)hasSumest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)lsest;
- (float)sumest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)fPal;
- (unsigned)nPairs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFPal:(unsigned int)a3;
- (void)setHasFPal:(BOOL)a3;
- (void)setHasLsest:(BOOL)a3;
- (void)setHasSumest:(BOOL)a3;
- (void)setLsest:(float)a3;
- (void)setNPairs:(unsigned int)a3;
- (void)setSumest:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALCLJacksonData

- (void)setLsest:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lsest = a3;
}

- (void)setHasLsest:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLsest
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSumest:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sumest = a3;
}

- (void)setHasSumest:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSumest
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFPal:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fPal = a3;
}

- (void)setHasFPal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFPal
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALCLJacksonData;
  return +[NSString stringWithFormat:@"%@ %@", [(ALCLJacksonData *)&v3 description], [(ALCLJacksonData *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_nPairs)] forKey:@"nPairs"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(float *)&double v4 = self->_sumest;
    [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"sumest"];
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_4;
  }
  *(float *)&double v4 = self->_lsest;
  [v3 setObject:[+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4)] forKey:@"lsest"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has) {
LABEL_4:
  }
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_fPal)] forKey:@"fPal"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1004FBC74((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteFloatField();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 1) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_nPairs;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = LODWORD(self->_lsest);
    *((unsigned char *)a3 + 24) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return;
      }
LABEL_7:
      *((_DWORD *)a3 + 2) = self->_fPal;
      *((unsigned char *)a3 + 24) |= 1u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = LODWORD(self->_sumest);
  *((unsigned char *)a3 + 24) |= 4u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)result + 4) = self->_nPairs;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = LODWORD(self->_lsest);
    *((unsigned char *)result + 24) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = LODWORD(self->_sumest);
  *((unsigned char *)result + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_fPal;
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_nPairs != *((_DWORD *)a3 + 4))
    {
LABEL_17:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_lsest != *((float *)a3 + 3)) {
        goto LABEL_17;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 2) != 0)
    {
      goto LABEL_17;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 24) & 4) == 0 || self->_sumest != *((float *)a3 + 5)) {
        goto LABEL_17;
      }
    }
    else if ((*((unsigned char *)a3 + 24) & 4) != 0)
    {
      goto LABEL_17;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_fPal != *((_DWORD *)a3 + 2)) {
        goto LABEL_17;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unsigned int nPairs = self->_nPairs;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float lsest = self->_lsest;
    float v7 = -lsest;
    if (lsest >= 0.0) {
      float v7 = self->_lsest;
    }
    float v8 = floorf(v7 + 0.5);
    float v9 = (float)(v7 - v8) * 1.8447e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 4) != 0)
  {
    float sumest = self->_sumest;
    float v12 = -sumest;
    if (sumest >= 0.0) {
      float v12 = self->_sumest;
    }
    float v13 = floorf(v12 + 0.5);
    float v14 = (float)(v12 - v13) * 1.8447e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if (has) {
    uint64_t v15 = 2654435761 * self->_fPal;
  }
  else {
    uint64_t v15 = 0;
  }
  return v5 ^ v10 ^ v15 ^ (2654435761 * nPairs);
}

- (void)mergeFrom:(id)a3
{
  self->_unsigned int nPairs = *((_DWORD *)a3 + 4);
  char v3 = *((unsigned char *)a3 + 24);
  if ((v3 & 2) != 0)
  {
    self->_float lsest = *((float *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v3 = *((unsigned char *)a3 + 24);
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        return;
      }
LABEL_7:
      self->_fPal = *((_DWORD *)a3 + 2);
      *(unsigned char *)&self->_has |= 1u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_float sumest = *((float *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)a3 + 24)) {
    goto LABEL_7;
  }
}

- (unsigned)nPairs
{
  return self->_nPairs;
}

- (void)setNPairs:(unsigned int)a3
{
  self->_unsigned int nPairs = a3;
}

- (float)lsest
{
  return self->_lsest;
}

- (float)sumest
{
  return self->_sumest;
}

- (unsigned)fPal
{
  return self->_fPal;
}

@end