@interface APPBBorderStyle
- (APPBColor)color;
- (BOOL)hasColor;
- (BOOL)hasCornerRadius;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)cornerRadius;
- (float)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setColor:(id)a3;
- (void)setCornerRadius:(float)a3;
- (void)setHasCornerRadius:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setWidth:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBBorderStyle

- (BOOL)hasColor
{
  return self->_color != 0;
}

- (void)setWidth:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCornerRadius:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cornerRadius = a3;
}

- (void)setHasCornerRadius:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCornerRadius
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBBorderStyle;
  char v3 = [(APPBBorderStyle *)&v7 description];
  v4 = [(APPBBorderStyle *)self dictionaryRepresentation];
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
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_width;
    v8 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"width"];

    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)&double v4 = self->_cornerRadius;
    v9 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v9 forKey:@"cornerRadius"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBBorderStyleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_color)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_color)
  {
    id v6 = v4;
    [v4 setColor:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = LODWORD(self->_width);
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 4) = LODWORD(self->_cornerRadius);
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(APPBColor *)self->_color copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = LODWORD(self->_width);
    *((unsigned char *)v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 4) = LODWORD(self->_cornerRadius);
    *((unsigned char *)v5 + 24) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  color = self->_color;
  if ((unint64_t)color | *((void *)v4 + 1))
  {
    if (!-[APPBColor isEqual:](color, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_width != *((float *)v4 + 5)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_cornerRadius != *((float *)v4 + 4)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(APPBColor *)self->_color hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float width = self->_width;
    float v7 = -width;
    if (width >= 0.0) {
      float v7 = self->_width;
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
    float cornerRadius = self->_cornerRadius;
    float v12 = -cornerRadius;
    if (cornerRadius >= 0.0) {
      float v12 = self->_cornerRadius;
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
  id v4 = a3;
  color = self->_color;
  uint64_t v6 = *((void *)v4 + 1);
  if (color)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[APPBColor mergeFrom:](color, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[APPBBorderStyle setColor:](self, "setColor:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 24);
  if ((v7 & 2) != 0)
  {
    self->_float width = *((float *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 24);
  }
  if (v7)
  {
    self->_float cornerRadius = *((float *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }

  _objc_release_x1();
}

- (APPBColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (float)width
{
  return self->_width;
}

- (float)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
}

@end