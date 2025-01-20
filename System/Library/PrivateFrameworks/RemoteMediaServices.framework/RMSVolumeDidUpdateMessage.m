@interface RMSVolumeDidUpdateMessage
- (BOOL)hasSessionIdentifier;
- (BOOL)hasVolume;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)volume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sessionIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSessionIdentifier:(BOOL)a3;
- (void)setHasVolume:(BOOL)a3;
- (void)setSessionIdentifier:(int)a3;
- (void)setVolume:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation RMSVolumeDidUpdateMessage

- (void)setSessionIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionIdentifier = a3;
}

- (void)setHasSessionIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVolume:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_volume = a3;
}

- (void)setHasVolume:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVolume
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RMSVolumeDidUpdateMessage;
  v4 = [(RMSVolumeDidUpdateMessage *)&v8 description];
  v5 = [(RMSVolumeDidUpdateMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v6 = [NSNumber numberWithInt:self->_sessionIdentifier];
    [v3 setObject:v6 forKey:@"sessionIdentifier"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_volume;
    v7 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v7 forKey:@"volume"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return RMSVolumeDidUpdateMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_sessionIdentifier;
    *((unsigned char *)v4 + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[3] = LODWORD(self->_volume);
    *((unsigned char *)v4 + 16) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_sessionIdentifier;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = LODWORD(self->_volume);
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_volume != *((float *)v4 + 3)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_sessionIdentifier;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v7 = 0;
    return v7 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float volume = self->_volume;
  double v4 = volume;
  if (volume < 0.0) {
    double v4 = -volume;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      v7 += (unint64_t)v6;
    }
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
  return v7 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_sessionIdentifier = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if ((v5 & 2) != 0)
  {
    self->_float volume = *((float *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (float)volume
{
  return self->_volume;
}

@end