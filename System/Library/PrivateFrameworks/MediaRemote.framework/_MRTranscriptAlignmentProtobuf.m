@interface _MRTranscriptAlignmentProtobuf
- (BOOL)hasMatchedBeginning;
- (BOOL)hasMatchedEnd;
- (BOOL)hasPlayerEndTime;
- (BOOL)hasPlayerStartTime;
- (BOOL)hasReferenceEndTime;
- (BOOL)hasReferenceStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchedBeginning;
- (BOOL)matchedEnd;
- (BOOL)readFrom:(id)a3;
- (double)playerEndTime;
- (double)playerStartTime;
- (double)referenceEndTime;
- (double)referenceStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMatchedBeginning:(BOOL)a3;
- (void)setHasMatchedEnd:(BOOL)a3;
- (void)setHasPlayerEndTime:(BOOL)a3;
- (void)setHasPlayerStartTime:(BOOL)a3;
- (void)setHasReferenceEndTime:(BOOL)a3;
- (void)setHasReferenceStartTime:(BOOL)a3;
- (void)setMatchedBeginning:(BOOL)a3;
- (void)setMatchedEnd:(BOOL)a3;
- (void)setPlayerEndTime:(double)a3;
- (void)setPlayerStartTime:(double)a3;
- (void)setReferenceEndTime:(double)a3;
- (void)setReferenceStartTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRTranscriptAlignmentProtobuf

- (void)setPlayerStartTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_playerStartTime = a3;
}

- (void)setHasPlayerStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPlayerStartTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPlayerEndTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_playerEndTime = a3;
}

- (void)setHasPlayerEndTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlayerEndTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReferenceStartTime:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_referenceStartTime = a3;
}

- (void)setHasReferenceStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReferenceStartTime
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setReferenceEndTime:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_referenceEndTime = a3;
}

- (void)setHasReferenceEndTime:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasReferenceEndTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMatchedBeginning:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_matchedBeginning = a3;
}

- (void)setHasMatchedBeginning:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMatchedBeginning
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMatchedEnd:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_matchedEnd = a3;
}

- (void)setHasMatchedEnd:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMatchedEnd
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRTranscriptAlignmentProtobuf;
  v4 = [(_MRTranscriptAlignmentProtobuf *)&v8 description];
  v5 = [(_MRTranscriptAlignmentProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithDouble:self->_playerStartTime];
    [v3 setObject:v7 forKey:@"playerStartTime"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_playerEndTime];
  [v3 setObject:v8 forKey:@"playerEndTime"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = [NSNumber numberWithDouble:self->_referenceStartTime];
  [v3 setObject:v9 forKey:@"referenceStartTime"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = [NSNumber numberWithDouble:self->_referenceEndTime];
  [v3 setObject:v10 forKey:@"referenceEndTime"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v11 = [NSNumber numberWithBool:self->_matchedBeginning];
  [v3 setObject:v11 forKey:@"matchedBeginning"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v5 = [NSNumber numberWithBool:self->_matchedEnd];
    [v3 setObject:v5 forKey:@"matchedEnd"];
  }
LABEL_8:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRTranscriptAlignmentProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_playerStartTime;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(void *)&self->_playerEndTime;
  *((unsigned char *)v4 + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v4[4] = *(void *)&self->_referenceStartTime;
  *((unsigned char *)v4 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[3] = *(void *)&self->_referenceEndTime;
  *((unsigned char *)v4 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((unsigned char *)v4 + 40) = self->_matchedBeginning;
  *((unsigned char *)v4 + 44) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    *((unsigned char *)v4 + 41) = self->_matchedEnd;
    *((unsigned char *)v4 + 44) |= 0x20u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = *(void *)&self->_playerStartTime;
    *((unsigned char *)result + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_playerEndTime;
  *((unsigned char *)result + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((void *)result + 4) = *(void *)&self->_referenceStartTime;
  *((unsigned char *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 3) = *(void *)&self->_referenceEndTime;
  *((unsigned char *)result + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((unsigned char *)result + 40) = self->_matchedBeginning;
  *((unsigned char *)result + 44) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_7:
  *((unsigned char *)result + 41) = self->_matchedEnd;
  *((unsigned char *)result + 44) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_playerStartTime != *((double *)v4 + 2)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_32;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_playerEndTime != *((double *)v4 + 1)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_referenceStartTime != *((double *)v4 + 4)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_referenceEndTime != *((double *)v4 + 3)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0) {
      goto LABEL_32;
    }
    if (self->_matchedBeginning)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_32;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
    {
      if (self->_matchedEnd)
      {
        if (!*((unsigned char *)v4 + 41)) {
          goto LABEL_32;
        }
      }
      else if (*((unsigned char *)v4 + 41))
      {
        goto LABEL_32;
      }
      BOOL v5 = 1;
      goto LABEL_33;
    }
LABEL_32:
    BOOL v5 = 0;
  }
LABEL_33:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double playerStartTime = self->_playerStartTime;
    double v6 = -playerStartTime;
    if (playerStartTime >= 0.0) {
      double v6 = self->_playerStartTime;
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
    double playerEndTime = self->_playerEndTime;
    double v11 = -playerEndTime;
    if (playerEndTime >= 0.0) {
      double v11 = self->_playerEndTime;
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
  if ((has & 8) != 0)
  {
    double referenceStartTime = self->_referenceStartTime;
    double v16 = -referenceStartTime;
    if (referenceStartTime >= 0.0) {
      double v16 = self->_referenceStartTime;
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
  if ((has & 4) != 0)
  {
    double referenceEndTime = self->_referenceEndTime;
    double v21 = -referenceEndTime;
    if (referenceEndTime >= 0.0) {
      double v21 = self->_referenceEndTime;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((has & 0x10) != 0)
  {
    uint64_t v24 = 2654435761 * self->_matchedBeginning;
    if ((has & 0x20) != 0) {
      goto LABEL_35;
    }
LABEL_37:
    uint64_t v25 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v25;
  }
  uint64_t v24 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_37;
  }
LABEL_35:
  uint64_t v25 = 2654435761 * self->_matchedEnd;
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_double playerStartTime = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double playerEndTime = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_double referenceStartTime = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_double referenceEndTime = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_matchedBeginning = *((unsigned char *)v4 + 40);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
  {
LABEL_7:
    self->_matchedEnd = *((unsigned char *)v4 + 41);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_8:
}

- (double)playerStartTime
{
  return self->_playerStartTime;
}

- (double)playerEndTime
{
  return self->_playerEndTime;
}

- (double)referenceStartTime
{
  return self->_referenceStartTime;
}

- (double)referenceEndTime
{
  return self->_referenceEndTime;
}

- (BOOL)matchedBeginning
{
  return self->_matchedBeginning;
}

- (BOOL)matchedEnd
{
  return self->_matchedEnd;
}

@end