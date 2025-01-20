@interface MXAcousticFeature
- (BOOL)hasFrameDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)acousticFeaturePerFrameAtIndex:(unint64_t)a3;
- (float)acousticFeaturePerFrames;
- (float)frameDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)acousticFeaturePerFramesCount;
- (unint64_t)hash;
- (void)addAcousticFeaturePerFrame:(float)a3;
- (void)clearAcousticFeaturePerFrames;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAcousticFeaturePerFrames:(float *)a3 count:(unint64_t)a4;
- (void)setFrameDuration:(float)a3;
- (void)setHasFrameDuration:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXAcousticFeature

- (void)dealloc
{
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)MXAcousticFeature;
  [(MXAcousticFeature *)&v3 dealloc];
}

- (unint64_t)acousticFeaturePerFramesCount
{
  return self->_acousticFeaturePerFrames.count;
}

- (float)acousticFeaturePerFrames
{
  return self->_acousticFeaturePerFrames.list;
}

- (void)clearAcousticFeaturePerFrames
{
}

- (void)addAcousticFeaturePerFrame:(float)a3
{
}

- (float)acousticFeaturePerFrameAtIndex:(unint64_t)a3
{
  p_acousticFeaturePerFrames = &self->_acousticFeaturePerFrames;
  unint64_t count = self->_acousticFeaturePerFrames.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_acousticFeaturePerFrames->list[a3];
}

- (void)setAcousticFeaturePerFrames:(float *)a3 count:(unint64_t)a4
{
}

- (void)setFrameDuration:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_frameDuration = a3;
}

- (void)setHasFrameDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFrameDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXAcousticFeature;
  v4 = [(MXAcousticFeature *)&v8 description];
  v5 = [(MXAcousticFeature *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = PBRepeatedFloatNSArray();
  [v3 setObject:v4 forKey:@"acoustic_feature_per_frame"];

  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v5 = self->_frameDuration;
    v6 = [NSNumber numberWithFloat:v5];
    [v3 setObject:v6 forKey:@"frame_duration"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXAcousticFeatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_acousticFeaturePerFrames.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_acousticFeaturePerFrames.count);
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(MXAcousticFeature *)self acousticFeaturePerFramesCount])
  {
    [v7 clearAcousticFeaturePerFrames];
    unint64_t v4 = [(MXAcousticFeature *)self acousticFeaturePerFramesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        [(MXAcousticFeature *)self acousticFeaturePerFrameAtIndex:i];
        objc_msgSend(v7, "addAcousticFeaturePerFrame:");
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v7 + 8) = LODWORD(self->_frameDuration);
    *((unsigned char *)v7 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedFloatCopy();
  if (*(unsigned char *)&self->_has)
  {
    *(float *)(v4 + 32) = self->_frameDuration;
    *(unsigned char *)(v4 + 36) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || !PBRepeatedFloatIsEqual()) {
    goto LABEL_7;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) != 0 && self->_frameDuration == *((float *)v4 + 8))
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedFloatHash();
  if (*(unsigned char *)&self->_has)
  {
    float frameDuration = self->_frameDuration;
    float v6 = -frameDuration;
    if (frameDuration >= 0.0) {
      float v6 = self->_frameDuration;
    }
    float v7 = floorf(v6 + 0.5);
    float v8 = (float)(v6 - v7) * 1.8447e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  float v7 = (float *)a3;
  uint64_t v4 = [v7 acousticFeaturePerFramesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      [v7 acousticFeaturePerFrameAtIndex:i];
      -[MXAcousticFeature addAcousticFeaturePerFrame:](self, "addAcousticFeaturePerFrame:");
    }
  }
  if ((_BYTE)v7[9])
  {
    self->_float frameDuration = v7[8];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (float)frameDuration
{
  return self->_frameDuration;
}

@end