@interface _MRVideoThumbnailRequestProtobuf
- (BOOL)hasThumbnailsHeight;
- (BOOL)hasThumbnailsWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)timeIntervals;
- (double)timeIntervalsAtIndex:(unint64_t)a3;
- (float)thumbnailsHeight;
- (float)thumbnailsWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timeIntervalsCount;
- (void)addTimeIntervals:(double)a3;
- (void)clearTimeIntervals;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasThumbnailsHeight:(BOOL)a3;
- (void)setHasThumbnailsWidth:(BOOL)a3;
- (void)setThumbnailsHeight:(float)a3;
- (void)setThumbnailsWidth:(float)a3;
- (void)setTimeIntervals:(double *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation _MRVideoThumbnailRequestProtobuf

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(_MRVideoThumbnailRequestProtobuf *)self timeIntervalsCount])
  {
    [v8 clearTimeIntervals];
    unint64_t v4 = [(_MRVideoThumbnailRequestProtobuf *)self timeIntervalsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(_MRVideoThumbnailRequestProtobuf *)self timeIntervalsAtIndex:i];
        objc_msgSend(v8, "addTimeIntervals:");
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v8 + 9) = LODWORD(self->_thumbnailsWidth);
    *((unsigned char *)v8 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v8 + 8) = LODWORD(self->_thumbnailsHeight);
    *((unsigned char *)v8 + 40) |= 1u;
  }
}

- (void)dealloc
{
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)_MRVideoThumbnailRequestProtobuf;
  [(_MRVideoThumbnailRequestProtobuf *)&v3 dealloc];
}

- (unint64_t)timeIntervalsCount
{
  return self->_timeIntervals.count;
}

- (double)timeIntervals
{
  return self->_timeIntervals.list;
}

- (void)clearTimeIntervals
{
}

- (void)addTimeIntervals:(double)a3
{
}

- (double)timeIntervalsAtIndex:(unint64_t)a3
{
  p_timeIntervals = &self->_timeIntervals;
  unint64_t count = self->_timeIntervals.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_timeIntervals->list[a3];
}

- (void)setTimeIntervals:(double *)a3 count:(unint64_t)a4
{
}

- (void)setThumbnailsWidth:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_thumbnailsWidth = a3;
}

- (void)setHasThumbnailsWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasThumbnailsWidth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setThumbnailsHeight:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_thumbnailsHeight = a3;
}

- (void)setHasThumbnailsHeight:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasThumbnailsHeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRVideoThumbnailRequestProtobuf;
  unint64_t v4 = [(_MRVideoThumbnailRequestProtobuf *)&v8 description];
  unint64_t v5 = [(_MRVideoThumbnailRequestProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v4 = PBRepeatedDoubleNSArray();
  [v3 setObject:v4 forKey:@"timeIntervals"];

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&double v5 = self->_thumbnailsWidth;
    uint64_t v7 = [NSNumber numberWithFloat:v5];
    [v3 setObject:v7 forKey:@"thumbnailsWidth"];

    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)&double v5 = self->_thumbnailsHeight;
    objc_super v8 = [NSNumber numberWithFloat:v5];
    [v3 setObject:v8 forKey:@"thumbnailsHeight"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVideoThumbnailRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_timeIntervals.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      id v4 = v7;
      ++v5;
    }
    while (v5 < self->_timeIntervals.count);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedDoubleCopy();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v4 + 36) = self->_thumbnailsWidth;
    *(unsigned char *)(v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)(v4 + 32) = self->_thumbnailsHeight;
    *(unsigned char *)(v4 + 40) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedDoubleIsEqual()) {
    goto LABEL_12;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_thumbnailsWidth != *((float *)v4 + 9)) {
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_12:
    BOOL v5 = 0;
    goto LABEL_13;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_thumbnailsHeight != *((float *)v4 + 8)) {
      goto LABEL_12;
    }
    BOOL v5 = 1;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedDoubleHash();
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float thumbnailsWidth = self->_thumbnailsWidth;
    float v7 = -thumbnailsWidth;
    if (thumbnailsWidth >= 0.0) {
      float v7 = self->_thumbnailsWidth;
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
  if (has)
  {
    float thumbnailsHeight = self->_thumbnailsHeight;
    float v12 = -thumbnailsHeight;
    if (thumbnailsHeight >= 0.0) {
      float v12 = self->_thumbnailsHeight;
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
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  float v8 = (float *)a3;
  uint64_t v4 = [v8 timeIntervalsCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [v8 timeIntervalsAtIndex:i];
      -[_MRVideoThumbnailRequestProtobuf addTimeIntervals:](self, "addTimeIntervals:");
    }
  }
  char v7 = *((unsigned char *)v8 + 40);
  if ((v7 & 2) != 0)
  {
    self->_float thumbnailsWidth = v8[9];
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v8 + 40);
  }
  if (v7)
  {
    self->_float thumbnailsHeight = v8[8];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (float)thumbnailsWidth
{
  return self->_thumbnailsWidth;
}

- (float)thumbnailsHeight
{
  return self->_thumbnailsHeight;
}

@end