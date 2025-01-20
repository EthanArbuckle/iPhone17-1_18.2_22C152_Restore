@interface TRANSITPbLocationFingerprint
- (BOOL)hasLatitude;
- (BOOL)hasLocationId;
- (BOOL)hasLongitude;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)latitude;
- (double)longitude;
- (double)modes;
- (double)modesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)locationId;
- (unint64_t)macs;
- (unint64_t)macsAtIndex:(unint64_t)a3;
- (unint64_t)macsCount;
- (unint64_t)modesCount;
- (void)addMacs:(unint64_t)a3;
- (void)addModes:(double)a3;
- (void)clearMacs;
- (void)clearModes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLocationId:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLocationId:(unint64_t)a3;
- (void)setLongitude:(double)a3;
- (void)setMacs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setModes:(double *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation TRANSITPbLocationFingerprint

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbLocationFingerprint;
  [(TRANSITPbLocationFingerprint *)&v3 dealloc];
}

- (void)setLocationId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_locationId = a3;
}

- (void)setHasLocationId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocationId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLatitude:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatitude
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLongitude:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unint64_t)macsCount
{
  return self->_macs.count;
}

- (unint64_t)macs
{
  return self->_macs.list;
}

- (void)clearMacs
{
}

- (void)addMacs:(unint64_t)a3
{
}

- (unint64_t)macsAtIndex:(unint64_t)a3
{
  p_macs = &self->_macs;
  unint64_t count = self->_macs.count;
  if (count <= a3) {
    [+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count], 0) raise];
  }
  return p_macs->list[a3];
}

- (void)setMacs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)modesCount
{
  return self->_modes.count;
}

- (double)modes
{
  return self->_modes.list;
}

- (void)clearModes
{
}

- (void)addModes:(double)a3
{
}

- (double)modesAtIndex:(unint64_t)a3
{
  p_modes = &self->_modes;
  unint64_t count = self->_modes.count;
  if (count <= a3) {
    [+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:@"idx (%tu) is out of range (%tu)", a3, count], 0) raise];
  }
  return p_modes->list[a3];
}

- (void)setModes:(double *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbLocationFingerprint;
  return +[NSString stringWithFormat:@"%@ %@", [(TRANSITPbLocationFingerprint *)&v3 description], [(TRANSITPbLocationFingerprint *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_latitude)] forKey:@"latitude"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [v3 setObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_locationId)] forKey:@"locationId"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0) {
LABEL_4:
  }
    [v3 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_longitude)] forKey:@"longitude"];
LABEL_5:
  [v3 setObject:PBRepeatedUInt64NSArray() forKey:@"macs"];
  [v3 setObject:PBRepeatedDoubleNSArray() forKey:@"modes"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100BA21DC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteDoubleField();
LABEL_5:
  if (self->_macs.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v5;
    }
    while (v5 < self->_macs.count);
  }
  p_modes = &self->_modes;
  if (p_modes->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v7;
    }
    while (v7 < p_modes->count);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_15:
    *((void *)a3 + 7) = *(void *)&self->_latitude;
    *((unsigned char *)a3 + 80) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((void *)a3 + 8) = self->_locationId;
  *((unsigned char *)a3 + 80) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_15;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((void *)a3 + 9) = *(void *)&self->_longitude;
    *((unsigned char *)a3 + 80) |= 4u;
  }
LABEL_5:
  if ([(TRANSITPbLocationFingerprint *)self macsCount])
  {
    [a3 clearMacs];
    unint64_t v6 = [(TRANSITPbLocationFingerprint *)self macsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addMacs:-[TRANSITPbLocationFingerprint macsAtIndex:](self, "macsAtIndex:", i)];
    }
  }
  if ([(TRANSITPbLocationFingerprint *)self modesCount])
  {
    [a3 clearModes];
    unint64_t v9 = [(TRANSITPbLocationFingerprint *)self modesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        [(TRANSITPbLocationFingerprint *)self modesAtIndex:j];
        [a3 addModes:];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v5 = v4;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((void *)v4 + 7) = *(void *)&self->_latitude;
    *((unsigned char *)v4 + 80) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((void *)v4 + 8) = self->_locationId;
  *((unsigned char *)v4 + 80) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((void *)v4 + 9) = *(void *)&self->_longitude;
    *((unsigned char *)v4 + 80) |= 4u;
  }
LABEL_5:
  PBRepeatedUInt64Copy();
  PBRepeatedDoubleCopy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 80) & 2) == 0 || self->_locationId != *((void *)a3 + 8)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 2) != 0)
  {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 80) & 1) == 0 || self->_latitude != *((double *)a3 + 7)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 80))
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 80) & 4) == 0 || self->_longitude != *((double *)a3 + 9)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 4) != 0)
  {
    return 0;
  }
  if (!PBRepeatedUInt64IsEqual()) {
    return 0;
  }

  return _PBRepeatedDoubleIsEqual(&self->_modes, (char *)a3 + 32);
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unint64_t v4 = 2654435761u * self->_locationId;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double latitude = self->_latitude;
  double v6 = -latitude;
  if (latitude >= 0.0) {
    double v6 = self->_latitude;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0)
  {
    double longitude = self->_longitude;
    double v12 = -longitude;
    if (longitude >= 0.0) {
      double v12 = self->_longitude;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  uint64_t v15 = v9 ^ v4 ^ v10 ^ PBRepeatedUInt64Hash();
  return v15 ^ PBRepeatedDoubleHash();
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 80);
  if ((v5 & 2) != 0)
  {
    self->_locationId = *((void *)a3 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 80);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double latitude = *((double *)a3 + 7);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 80) & 4) != 0)
  {
LABEL_4:
    self->_double longitude = *((double *)a3 + 9);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  double v6 = (char *)[a3 macsCount];
  if (v6)
  {
    long double v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[TRANSITPbLocationFingerprint addMacs:](self, "addMacs:", [a3 macsAtIndex:i]);
  }
  unint64_t v9 = (char *)[a3 modesCount];
  if (v9)
  {
    unint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
    {
      [a3 modesAtIndex:j];
      -[TRANSITPbLocationFingerprint addModes:](self, "addModes:");
    }
  }
}

- (unint64_t)locationId
{
  return self->_locationId;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

@end