@interface ALSLocation
- (BOOL)hasAltitude;
- (BOOL)hasConfidence;
- (BOOL)hasInfoMask;
- (BOOL)hasLocationType;
- (BOOL)hasReach;
- (BOOL)hasScore;
- (BOOL)hasVerticalAccuracy;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)accuracy;
- (int)altitude;
- (int)confidence;
- (int)locationType;
- (int)reach;
- (int)verticalAccuracy;
- (int64_t)latitude;
- (int64_t)longitude;
- (unint64_t)hash;
- (unsigned)infoMask;
- (unsigned)score;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccuracy:(int)a3;
- (void)setAltitude:(int)a3;
- (void)setConfidence:(int)a3;
- (void)setHasAltitude:(BOOL)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasInfoMask:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasReach:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasVerticalAccuracy:(BOOL)a3;
- (void)setInfoMask:(unsigned int)a3;
- (void)setLatitude:(int64_t)a3;
- (void)setLocationType:(int)a3;
- (void)setLongitude:(int64_t)a3;
- (void)setReach:(int)a3;
- (void)setScore:(unsigned int)a3;
- (void)setVerticalAccuracy:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ALSLocation

- (void)setLocationType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLocationType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAltitude:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_altitude = a3;
}

- (void)setHasAltitude:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAltitude
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVerticalAccuracy:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_verticalAccuracy = a3;
}

- (void)setHasVerticalAccuracy:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVerticalAccuracy
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidence
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setScore:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasScore
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setReach:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_reach = a3;
}

- (void)setHasReach:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReach
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setInfoMask:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_infoMask = a3;
}

- (void)setHasInfoMask:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInfoMask
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)ALSLocation;
  return +[NSString stringWithFormat:@"%@ %@", [(ALSLocation *)&v3 description], [(ALSLocation *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_latitude)] forKey:@"Latitude"];
  [v3 setObject:[+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->_longitude)] forKey:@"Longitude"];
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_accuracy)] forKey:@"accuracy"];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_locationType)] forKey:@"locationType"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_altitude)] forKey:@"altitude"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_verticalAccuracy)] forKey:@"verticalAccuracy"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_confidence)] forKey:@"confidence"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithInt:self->_reach] forKey:@"reach"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
LABEL_14:
  [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_score)] forKey:@"score"];
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 4) != 0) {
LABEL_8:
  }
    [v3 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_infoMask)] forKey:@"infoMask"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100F95DD8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 4) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = self->_latitude;
  *((void *)a3 + 2) = self->_longitude;
  *((_DWORD *)a3 + 6) = self->_accuracy;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_locationType;
    *((unsigned char *)a3 + 56) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_altitude;
  *((unsigned char *)a3 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)a3 + 13) = self->_verticalAccuracy;
  *((unsigned char *)a3 + 56) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)a3 + 8) = self->_confidence;
  *((unsigned char *)a3 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 12) = self->_score;
  *((unsigned char *)a3 + 56) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      return;
    }
LABEL_15:
    *((_DWORD *)a3 + 9) = self->_infoMask;
    *((unsigned char *)a3 + 56) |= 4u;
    return;
  }
LABEL_14:
  *((_DWORD *)a3 + 11) = self->_reach;
  *((unsigned char *)a3 + 56) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    goto LABEL_15;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((void *)result + 1) = self->_latitude;
  *((void *)result + 2) = self->_longitude;
  *((_DWORD *)result + 6) = self->_accuracy;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 10) = self->_locationType;
    *((unsigned char *)result + 56) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_altitude;
  *((unsigned char *)result + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 13) = self->_verticalAccuracy;
  *((unsigned char *)result + 56) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 8) = self->_confidence;
  *((unsigned char *)result + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 12) = self->_score;
  *((unsigned char *)result + 56) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((_DWORD *)result + 11) = self->_reach;
  *((unsigned char *)result + 56) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_8:
  *((_DWORD *)result + 9) = self->_infoMask;
  *((unsigned char *)result + 56) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_latitude != *((void *)a3 + 1)
      || self->_longitude != *((void *)a3 + 2)
      || self->_accuracy != *((_DWORD *)a3 + 6))
    {
      goto LABEL_39;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 8) == 0 || self->_locationType != *((_DWORD *)a3 + 10)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 8) != 0)
    {
LABEL_39:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_altitude != *((_DWORD *)a3 + 7)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)a3 + 56))
    {
      goto LABEL_39;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x40) == 0 || self->_verticalAccuracy != *((_DWORD *)a3 + 13)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x40) != 0)
    {
      goto LABEL_39;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_confidence != *((_DWORD *)a3 + 8)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 2) != 0)
    {
      goto LABEL_39;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x20) == 0 || self->_score != *((_DWORD *)a3 + 12)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x20) != 0)
    {
      goto LABEL_39;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x10) == 0 || self->_reach != *((_DWORD *)a3 + 11)) {
        goto LABEL_39;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x10) != 0)
    {
      goto LABEL_39;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 56) & 4) == 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_infoMask != *((_DWORD *)a3 + 9)) {
        goto LABEL_39;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_locationType;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_altitude;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_verticalAccuracy;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_confidence;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v5 = 0;
LABEL_10:
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v6 = 2654435761 * self->_score;
  }
  else {
    uint64_t v6 = 0;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v7 = 2654435761 * self->_reach;
  }
  else {
    uint64_t v7 = 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_infoMask;
  }
  else {
    uint64_t v8 = 0;
  }
  return (2654435761 * self->_longitude) ^ (2654435761 * self->_latitude) ^ (2654435761 * self->_accuracy) ^ v2 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  self->_latitude = *((void *)a3 + 1);
  self->_longitude = *((void *)a3 + 2);
  self->_accuracy = *((_DWORD *)a3 + 6);
  char v3 = *((unsigned char *)a3 + 56);
  if ((v3 & 8) != 0)
  {
    self->_locationType = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 8u;
    char v3 = *((unsigned char *)a3 + 56);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_altitude = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 1u;
  char v3 = *((unsigned char *)a3 + 56);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_verticalAccuracy = *((_DWORD *)a3 + 13);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 56);
  if ((v3 & 2) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_confidence = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 56);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_score = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 56);
  if ((v3 & 0x10) == 0)
  {
LABEL_7:
    if ((v3 & 4) == 0) {
      return;
    }
LABEL_15:
    self->_infoMask = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 4u;
    return;
  }
LABEL_14:
  self->_reach = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)a3 + 56) & 4) != 0) {
    goto LABEL_15;
  }
}

- (int64_t)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(int64_t)a3
{
  self->_latitude = a3;
}

- (int64_t)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(int64_t)a3
{
  self->_longitude = a3;
}

- (int)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(int)a3
{
  self->_accuracy = a3;
}

- (int)locationType
{
  return self->_locationType;
}

- (int)altitude
{
  return self->_altitude;
}

- (int)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (int)confidence
{
  return self->_confidence;
}

- (unsigned)score
{
  return self->_score;
}

- (int)reach
{
  return self->_reach;
}

- (unsigned)infoMask
{
  return self->_infoMask;
}

@end