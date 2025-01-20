@interface NTPBPoint
- (BOOL)hasColor;
- (BOOL)hasX;
- (BOOL)hasY;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)color;
- (double)x;
- (double)y;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setColor:(id)a3;
- (void)setHasX:(BOOL)a3;
- (void)setHasY:(BOOL)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPoint

- (void)dealloc
{
  [(NTPBPoint *)self setColor:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPoint;
  [(NTPBPoint *)&v3 dealloc];
}

- (void)setX:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasX
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setY:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasY
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasColor
{
  return self->_color != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPoint;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPoint description](&v3, sel_description), -[NTPBPoint dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_x), @"x");
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_y), @"y");
  }
  color = self->_color;
  if (color) {
    [v3 setObject:color forKey:@"color"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_color)
  {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_x;
    *(unsigned char *)(v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_y;
    *(unsigned char *)(v5 + 32) |= 2u;
  }

  v6[3] = [(NSString *)self->_color copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_x != *((double *)a3 + 1)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_14:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_y != *((double *)a3 + 2)) {
        goto LABEL_14;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 2) != 0)
    {
      goto LABEL_14;
    }
    color = self->_color;
    if ((unint64_t)color | *((void *)a3 + 3))
    {
      LOBYTE(v5) = -[NSString isEqual:](color, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double x = self->_x;
    double v6 = -x;
    if (x >= 0.0) {
      double v6 = self->_x;
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
  if ((has & 2) != 0)
  {
    double y = self->_y;
    double v11 = -y;
    if (y >= 0.0) {
      double v11 = self->_y;
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
  return v9 ^ v4 ^ [(NSString *)self->_color hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 32);
  if (v3)
  {
    self->_double x = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 32);
  }
  if ((v3 & 2) != 0)
  {
    self->_double y = *((double *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 3)) {
    -[NTPBPoint setColor:](self, "setColor:");
  }
}

- (double)x
{
  return self->_x;
}

- (double)y
{
  return self->_y;
}

- (NSString)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

@end