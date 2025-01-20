@interface APPBShadowStyle
- (APPBColor)color;
- (BOOL)hasColor;
- (BOOL)hasOpacity;
- (BOOL)hasRadius;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)opacity;
- (float)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)offsetAtIndex:(unint64_t)a3;
- (int)offsets;
- (unint64_t)hash;
- (unint64_t)offsetsCount;
- (void)addOffset:(int)a3;
- (void)clearOffsets;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setColor:(id)a3;
- (void)setHasOpacity:(BOOL)a3;
- (void)setHasRadius:(BOOL)a3;
- (void)setOffsets:(int *)a3 count:(unint64_t)a4;
- (void)setOpacity:(float)a3;
- (void)setRadius:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBShadowStyle

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)APPBShadowStyle;
  [(APPBShadowStyle *)&v3 dealloc];
}

- (BOOL)hasColor
{
  return self->_color != 0;
}

- (void)setOpacity:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_opacity = a3;
}

- (void)setHasOpacity:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOpacity
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRadius:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRadius
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)offsetsCount
{
  return self->_offsets.count;
}

- (int)offsets
{
  return self->_offsets.list;
}

- (void)clearOffsets
{
}

- (void)addOffset:(int)a3
{
}

- (int)offsetAtIndex:(unint64_t)a3
{
  p_offsets = &self->_offsets;
  unint64_t count = self->_offsets.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_offsets->list[a3];
}

- (void)setOffsets:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBShadowStyle;
  char v3 = [(APPBShadowStyle *)&v7 description];
  v4 = [(APPBShadowStyle *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  color = self->_color;
  if (color)
  {
    v6 = [(APPBColor *)color dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"color"];
  }
  char has = (char)self->_has;
  if (has)
  {
    *(float *)&double v4 = self->_opacity;
    v8 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"opacity"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_radius;
    v9 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v9 forKey:@"radius"];
  }
  v10 = PBRepeatedInt32NSArray();
  [v3 setObject:v10 forKey:@"offset"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBShadowStyleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_color)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v8;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v8;
  }
  p_offsets = &self->_offsets;
  if (p_offsets->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v8;
      ++v7;
    }
    while (v7 < p_offsets->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_color)
  {
    [v4 setColor:];
    id v4 = v9;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 10) = LODWORD(self->_opacity);
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 11) = LODWORD(self->_radius);
    *((unsigned char *)v4 + 48) |= 2u;
  }
  if ([(APPBShadowStyle *)self offsetsCount])
  {
    [v9 clearOffsets];
    unint64_t v6 = [(APPBShadowStyle *)self offsetsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [v9 addOffset:-[APPBShadowStyle offsetAtIndex:](self, "offsetAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(APPBColor *)self->_color copyWithZone:a3];
  unint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 10) = LODWORD(self->_opacity);
    *((unsigned char *)v5 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 11) = LODWORD(self->_radius);
    *((unsigned char *)v5 + 48) |= 2u;
  }
  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  color = self->_color;
  if ((unint64_t)color | *((void *)v4 + 4))
  {
    if (!-[APPBColor isEqual:](color, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_opacity != *((float *)v4 + 10)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char IsEqual = 0;
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_radius != *((float *)v4 + 11)) {
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_15;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_16:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3 = [(APPBColor *)self->_color hash];
  char has = (char)self->_has;
  if (has)
  {
    float opacity = self->_opacity;
    float v7 = -opacity;
    if (opacity >= 0.0) {
      float v7 = self->_opacity;
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
  if ((has & 2) != 0)
  {
    float radius = self->_radius;
    float v12 = -radius;
    if (radius >= 0.0) {
      float v12 = self->_radius;
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
  return v5 ^ v3 ^ v10 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  color = self->_color;
  uint64_t v6 = *((void *)v4 + 4);
  id v11 = v4;
  if (color)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[APPBColor mergeFrom:](color, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[APPBShadowStyle setColor:](self, "setColor:");
  }
  id v4 = v11;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 48);
  if (v7)
  {
    self->_float opacity = *((float *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 48);
  }
  if ((v7 & 2) != 0)
  {
    self->_float radius = *((float *)v4 + 11);
    *(unsigned char *)&self->_has |= 2u;
  }
  float v8 = (char *)[v4 offsetsCount];
  if (v8)
  {
    float v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
      -[APPBShadowStyle addOffset:](self, "addOffset:", [v11 offsetAtIndex:i]);
  }
}

- (APPBColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (float)opacity
{
  return self->_opacity;
}

- (float)radius
{
  return self->_radius;
}

- (void).cxx_destruct
{
}

@end