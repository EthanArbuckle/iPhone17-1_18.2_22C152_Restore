@interface COSBBScannedResults
- (BOOL)hasDock;
- (BOOL)hasInvalid;
- (BOOL)hasLeftWristLeftCrown;
- (BOOL)hasLeftWristRightCrown;
- (BOOL)hasNone;
- (BOOL)hasPalm;
- (BOOL)hasRightWristLeftCrown;
- (BOOL)hasRightWristRightCrown;
- (BOOL)hasTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)dock;
- (double)invalid;
- (double)leftWristLeftCrown;
- (double)leftWristRightCrown;
- (double)none;
- (double)palm;
- (double)rightWristLeftCrown;
- (double)rightWristRightCrown;
- (double)time;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDock:(double)a3;
- (void)setHasDock:(BOOL)a3;
- (void)setHasInvalid:(BOOL)a3;
- (void)setHasLeftWristLeftCrown:(BOOL)a3;
- (void)setHasLeftWristRightCrown:(BOOL)a3;
- (void)setHasNone:(BOOL)a3;
- (void)setHasPalm:(BOOL)a3;
- (void)setHasRightWristLeftCrown:(BOOL)a3;
- (void)setHasRightWristRightCrown:(BOOL)a3;
- (void)setHasTime:(BOOL)a3;
- (void)setInvalid:(double)a3;
- (void)setLeftWristLeftCrown:(double)a3;
- (void)setLeftWristRightCrown:(double)a3;
- (void)setNone:(double)a3;
- (void)setPalm:(double)a3;
- (void)setRightWristLeftCrown:(double)a3;
- (void)setRightWristRightCrown:(double)a3;
- (void)setTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation COSBBScannedResults

- (void)setTime:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_time = a3;
}

- (void)setHasTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTime
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNone:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_none = a3;
}

- (void)setHasNone:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNone
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setInvalid:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_invalid = a3;
}

- (void)setHasInvalid:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasInvalid
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLeftWristRightCrown:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_leftWristRightCrown = a3;
}

- (void)setHasLeftWristRightCrown:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLeftWristRightCrown
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setLeftWristLeftCrown:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_leftWristLeftCrown = a3;
}

- (void)setHasLeftWristLeftCrown:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLeftWristLeftCrown
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRightWristRightCrown:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rightWristRightCrown = a3;
}

- (void)setHasRightWristRightCrown:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRightWristRightCrown
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRightWristLeftCrown:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_rightWristLeftCrown = a3;
}

- (void)setHasRightWristLeftCrown:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasRightWristLeftCrown
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPalm:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_palm = a3;
}

- (void)setHasPalm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPalm
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDock:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_dock = a3;
}

- (void)setHasDock:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDock
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)COSBBScannedResults;
  __int16 v3 = [(COSBBScannedResults *)&v7 description];
  v4 = [(COSBBScannedResults *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    objc_super v7 = +[NSNumber numberWithDouble:self->_time];
    [v3 setObject:v7 forKey:@"time"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithDouble:self->_none];
  [v3 setObject:v8 forKey:@"none"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v9 = +[NSNumber numberWithDouble:self->_invalid];
  [v3 setObject:v9 forKey:@"invalid"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v10 = +[NSNumber numberWithDouble:self->_leftWristRightCrown];
  [v3 setObject:v10 forKey:@"leftWristRightCrown"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = +[NSNumber numberWithDouble:self->_leftWristLeftCrown];
  [v3 setObject:v11 forKey:@"leftWristLeftCrown"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = +[NSNumber numberWithDouble:self->_rightWristRightCrown];
  [v3 setObject:v12 forKey:@"rightWristRightCrown"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = +[NSNumber numberWithDouble:self->_rightWristLeftCrown];
  [v3 setObject:v13 forKey:@"rightWristLeftCrown"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v14 = +[NSNumber numberWithDouble:self->_palm];
  [v3 setObject:v14 forKey:@"palm"];

  if (*(_WORD *)&self->_has)
  {
LABEL_10:
    v5 = +[NSNumber numberWithDouble:self->_dock];
    [v3 setObject:v5 forKey:@"dock"];
  }
LABEL_11:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COSBBScannedResultsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  if (*(_WORD *)&self->_has) {
LABEL_10:
  }
    PBDataWriterWriteDoubleField();
LABEL_11:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v4[9] = *(void *)&self->_time;
    *((_WORD *)v4 + 40) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = *(void *)&self->_none;
  *((_WORD *)v4 + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[2] = *(void *)&self->_invalid;
  *((_WORD *)v4 + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[4] = *(void *)&self->_leftWristRightCrown;
  *((_WORD *)v4 + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[3] = *(void *)&self->_leftWristLeftCrown;
  *((_WORD *)v4 + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[8] = *(void *)&self->_rightWristRightCrown;
  *((_WORD *)v4 + 40) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[7] = *(void *)&self->_rightWristLeftCrown;
  *((_WORD *)v4 + 40) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  v4[6] = *(void *)&self->_palm;
  *((_WORD *)v4 + 40) |= 0x20u;
  if (*(_WORD *)&self->_has)
  {
LABEL_10:
    v4[1] = *(void *)&self->_dock;
    *((_WORD *)v4 + 40) |= 1u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((void *)result + 9) = *(void *)&self->_time;
    *((_WORD *)result + 40) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 5) = *(void *)&self->_none;
  *((_WORD *)result + 40) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 2) = *(void *)&self->_invalid;
  *((_WORD *)result + 40) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 4) = *(void *)&self->_leftWristRightCrown;
  *((_WORD *)result + 40) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 3) = *(void *)&self->_leftWristLeftCrown;
  *((_WORD *)result + 40) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 8) = *(void *)&self->_rightWristRightCrown;
  *((_WORD *)result + 40) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 7) = *(void *)&self->_rightWristLeftCrown;
  *((_WORD *)result + 40) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_10;
  }
LABEL_19:
  *((void *)result + 6) = *(void *)&self->_palm;
  *((_WORD *)result + 40) |= 0x20u;
  if ((*(_WORD *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_10:
  *((void *)result + 1) = *(void *)&self->_dock;
  *((_WORD *)result + 40) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 40);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_time != *((double *)v4 + 9)) {
      goto LABEL_46;
    }
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
LABEL_46:
    BOOL v7 = 0;
    goto LABEL_47;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_none != *((double *)v4 + 5)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_invalid != *((double *)v4 + 2)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_leftWristRightCrown != *((double *)v4 + 4)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_leftWristLeftCrown != *((double *)v4 + 3)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_rightWristRightCrown != *((double *)v4 + 8)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_rightWristLeftCrown != *((double *)v4 + 7)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_palm != *((double *)v4 + 6)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_46;
  }
  BOOL v7 = (v6 & 1) == 0;
  if (has)
  {
    if ((v6 & 1) == 0 || self->_dock != *((double *)v4 + 1)) {
      goto LABEL_46;
    }
    BOOL v7 = 1;
  }
LABEL_47:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    double time = self->_time;
    double v6 = -time;
    if (time >= 0.0) {
      double v6 = self->_time;
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
  if ((has & 0x10) != 0)
  {
    double none = self->_none;
    double v11 = -none;
    if (none >= 0.0) {
      double v11 = self->_none;
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
    double invalid = self->_invalid;
    double v16 = -invalid;
    if (invalid >= 0.0) {
      double v16 = self->_invalid;
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
  if ((has & 8) != 0)
  {
    double leftWristRightCrown = self->_leftWristRightCrown;
    double v21 = -leftWristRightCrown;
    if (leftWristRightCrown >= 0.0) {
      double v21 = self->_leftWristRightCrown;
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
  if ((has & 4) != 0)
  {
    double leftWristLeftCrown = self->_leftWristLeftCrown;
    double v26 = -leftWristLeftCrown;
    if (leftWristLeftCrown >= 0.0) {
      double v26 = self->_leftWristLeftCrown;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((has & 0x80) != 0)
  {
    double rightWristRightCrown = self->_rightWristRightCrown;
    double v31 = -rightWristRightCrown;
    if (rightWristRightCrown >= 0.0) {
      double v31 = self->_rightWristRightCrown;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  unint64_t v52 = v24;
  unint64_t v34 = v14;
  if ((has & 0x40) != 0)
  {
    double rightWristLeftCrown = self->_rightWristLeftCrown;
    double v38 = -rightWristLeftCrown;
    if (rightWristLeftCrown >= 0.0) {
      double v38 = self->_rightWristLeftCrown;
    }
    long double v39 = floor(v38 + 0.5);
    double v40 = (v38 - v39) * 1.84467441e19;
    unint64_t v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
    unint64_t v35 = v9;
    if (v40 >= 0.0)
    {
      if (v40 > 0.0) {
        v36 += (unint64_t)v40;
      }
    }
    else
    {
      v36 -= (unint64_t)fabs(v40);
    }
  }
  else
  {
    unint64_t v35 = v9;
    unint64_t v36 = 0;
  }
  if ((has & 0x20) != 0)
  {
    double palm = self->_palm;
    double v43 = -palm;
    if (palm >= 0.0) {
      double v43 = self->_palm;
    }
    long double v44 = floor(v43 + 0.5);
    double v45 = (v43 - v44) * 1.84467441e19;
    unint64_t v41 = 2654435761u * (unint64_t)fmod(v44, 1.84467441e19);
    if (v45 >= 0.0)
    {
      if (v45 > 0.0) {
        v41 += (unint64_t)v45;
      }
    }
    else
    {
      v41 -= (unint64_t)fabs(v45);
    }
  }
  else
  {
    unint64_t v41 = 0;
  }
  if (has)
  {
    double dock = self->_dock;
    double v48 = -dock;
    if (dock >= 0.0) {
      double v48 = self->_dock;
    }
    long double v49 = floor(v48 + 0.5);
    double v50 = (v48 - v49) * 1.84467441e19;
    unint64_t v46 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0) {
        v46 += (unint64_t)v50;
      }
    }
    else
    {
      v46 -= (unint64_t)fabs(v50);
    }
  }
  else
  {
    unint64_t v46 = 0;
  }
  return v35 ^ v4 ^ v34 ^ v19 ^ v52 ^ v29 ^ v36 ^ v41 ^ v46;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x100) != 0)
  {
    self->_double time = *((double *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v5 = *((_WORD *)v4 + 40);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_double none = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_double invalid = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_double leftWristRightCrown = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_double leftWristLeftCrown = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_double rightWristRightCrown = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_double rightWristLeftCrown = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  self->_double palm = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  if (*((_WORD *)v4 + 40))
  {
LABEL_10:
    self->_double dock = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_11:
}

- (double)time
{
  return self->_time;
}

- (double)none
{
  return self->_none;
}

- (double)invalid
{
  return self->_invalid;
}

- (double)leftWristRightCrown
{
  return self->_leftWristRightCrown;
}

- (double)leftWristLeftCrown
{
  return self->_leftWristLeftCrown;
}

- (double)rightWristRightCrown
{
  return self->_rightWristRightCrown;
}

- (double)rightWristLeftCrown
{
  return self->_rightWristLeftCrown;
}

- (double)palm
{
  return self->_palm;
}

- (double)dock
{
  return self->_dock;
}

@end