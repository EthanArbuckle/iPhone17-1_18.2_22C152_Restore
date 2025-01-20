@interface MTPBSound
- (BOOL)hasMediaID;
- (BOOL)hasSoundVolume;
- (BOOL)hasToneID;
- (BOOL)hasVibeID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)toneID;
- (NSString)vibeID;
- (double)mediaID;
- (float)soundVolume;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)soundType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMediaID:(BOOL)a3;
- (void)setHasSoundVolume:(BOOL)a3;
- (void)setMediaID:(double)a3;
- (void)setSoundType:(unsigned int)a3;
- (void)setSoundVolume:(float)a3;
- (void)setToneID:(id)a3;
- (void)setVibeID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTPBSound

- (BOOL)hasToneID
{
  return self->_toneID != 0;
}

- (void)setMediaID:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mediaID = a3;
}

- (void)setHasMediaID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMediaID
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasVibeID
{
  return self->_vibeID != 0;
}

- (void)setSoundVolume:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_soundVolume = a3;
}

- (void)setHasSoundVolume:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSoundVolume
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTPBSound;
  v4 = [(MTPBSound *)&v8 description];
  v5 = [(MTPBSound *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_soundType];
  [v3 setObject:v4 forKey:@"soundType"];

  toneID = self->_toneID;
  if (toneID) {
    [v3 setObject:toneID forKey:@"toneID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_mediaID];
    [v3 setObject:v7 forKey:@"mediaID"];
  }
  vibeID = self->_vibeID;
  if (vibeID) {
    [v3 setObject:vibeID forKey:@"vibeID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(float *)&double v5 = self->_soundVolume;
    v9 = [MEMORY[0x1E4F28ED0] numberWithFloat:v5];
    [v3 setObject:v9 forKey:@"soundVolume"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTPBSoundReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_toneID) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  v4 = v5;
  if (self->_vibeID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[4] = self->_soundType;
  id v5 = v4;
  if (self->_toneID)
  {
    objc_msgSend(v4, "setToneID:");
    v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_mediaID;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_vibeID)
  {
    objc_msgSend(v5, "setVibeID:");
    v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[5] = LODWORD(self->_soundVolume);
    *((unsigned char *)v4 + 40) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_soundType;
  uint64_t v6 = [(NSString *)self->_toneID copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_mediaID;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_vibeID copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(float *)(v5 + 20) = self->_soundVolume;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (self->_soundType != *((_DWORD *)v4 + 4)) {
    goto LABEL_17;
  }
  toneID = self->_toneID;
  if ((unint64_t)toneID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](toneID, "isEqual:")) {
      goto LABEL_17;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_mediaID != *((double *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_17;
  }
  vibeID = self->_vibeID;
  if ((unint64_t)vibeID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](vibeID, "isEqual:"))
    {
LABEL_17:
      BOOL v8 = 0;
      goto LABEL_18;
    }
    char has = (char)self->_has;
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_soundVolume != *((float *)v4 + 5)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  unsigned int soundType = self->_soundType;
  NSUInteger v4 = [(NSString *)self->_toneID hash];
  if (*(unsigned char *)&self->_has)
  {
    double mediaID = self->_mediaID;
    double v7 = -mediaID;
    if (mediaID >= 0.0) {
      double v7 = self->_mediaID;
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
  NSUInteger v10 = [(NSString *)self->_vibeID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    float soundVolume = self->_soundVolume;
    float v13 = -soundVolume;
    if (soundVolume >= 0.0) {
      float v13 = self->_soundVolume;
    }
    float v14 = floorf(v13 + 0.5);
    float v15 = (float)(v13 - v14) * 1.8447e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmodf(v14, 1.8447e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabsf(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v4 ^ v5 ^ v10 ^ v11 ^ (2654435761 * soundType);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int soundType = *((_DWORD *)v4 + 4);
  id v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[MTPBSound setToneID:](self, "setToneID:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_double mediaID = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[MTPBSound setVibeID:](self, "setVibeID:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    self->_float soundVolume = *((float *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unsigned)soundType
{
  return self->_soundType;
}

- (void)setSoundType:(unsigned int)a3
{
  self->_unsigned int soundType = a3;
}

- (NSString)toneID
{
  return self->_toneID;
}

- (void)setToneID:(id)a3
{
}

- (double)mediaID
{
  return self->_mediaID;
}

- (NSString)vibeID
{
  return self->_vibeID;
}

- (void)setVibeID:(id)a3
{
}

- (float)soundVolume
{
  return self->_soundVolume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibeID, 0);
  objc_storeStrong((id *)&self->_toneID, 0);
}

@end