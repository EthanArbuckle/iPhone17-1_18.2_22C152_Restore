@interface SIRINLUEXTERNALRRBoundingBox
- (BOOL)hasHeight;
- (BOOL)hasWidth;
- (BOOL)hasXCoordinate;
- (BOOL)hasYCoordinate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)height;
- (double)width;
- (double)xCoordinate;
- (double)yCoordinate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHasXCoordinate:(BOOL)a3;
- (void)setHasYCoordinate:(BOOL)a3;
- (void)setHeight:(double)a3;
- (void)setWidth:(double)a3;
- (void)setXCoordinate:(double)a3;
- (void)setYCoordinate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALRRBoundingBox

- (double)height
{
  return self->_height;
}

- (double)width
{
  return self->_width;
}

- (double)yCoordinate
{
  return self->_yCoordinate;
}

- (double)xCoordinate
{
  return self->_xCoordinate;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_xCoordinate = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_yCoordinate = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_width = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 40))
  {
LABEL_5:
    self->_height = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double xCoordinate = self->_xCoordinate;
    double v6 = -xCoordinate;
    if (xCoordinate >= 0.0) {
      double v6 = self->_xCoordinate;
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
  if ((has & 8) != 0)
  {
    double yCoordinate = self->_yCoordinate;
    double v11 = -yCoordinate;
    if (yCoordinate >= 0.0) {
      double v11 = self->_yCoordinate;
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
    double width = self->_width;
    double v16 = -width;
    if (width >= 0.0) {
      double v16 = self->_width;
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
  if (has)
  {
    double height = self->_height;
    double v21 = -height;
    if (height >= 0.0) {
      double v21 = self->_height;
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
  return v9 ^ v4 ^ v14 ^ v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_xCoordinate != *((double *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_yCoordinate != *((double *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_width != *((double *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_height != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)result + 3) = *(void *)&self->_xCoordinate;
    *((unsigned char *)result + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = *(void *)&self->_yCoordinate;
  *((unsigned char *)result + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((void *)result + 2) = *(void *)&self->_width;
  *((unsigned char *)result + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((void *)result + 1) = *(void *)&self->_height;
  *((unsigned char *)result + 40) |= 1u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = *(void *)&self->_xCoordinate;
    *((unsigned char *)v4 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = *(void *)&self->_yCoordinate;
  *((unsigned char *)v4 + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[2] = *(void *)&self->_width;
  *((unsigned char *)v4 + 40) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v4[1] = *(void *)&self->_height;
    *((unsigned char *)v4 + 40) |= 1u;
  }
LABEL_6:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALRRBoundingBoxReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    long double v7 = [NSNumber numberWithDouble:self->_xCoordinate];
    [v3 setObject:v7 forKey:@"x_coordinate"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  double v8 = [NSNumber numberWithDouble:self->_yCoordinate];
  [v3 setObject:v8 forKey:@"y_coordinate"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  unint64_t v9 = [NSNumber numberWithDouble:self->_width];
  [v3 setObject:v9 forKey:@"width"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    id v5 = [NSNumber numberWithDouble:self->_height];
    [v3 setObject:v5 forKey:@"height"];
  }
LABEL_6:
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALRRBoundingBox;
  id v4 = [(SIRINLUEXTERNALRRBoundingBox *)&v8 description];
  id v5 = [(SIRINLUEXTERNALRRBoundingBox *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasHeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasHeight:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setHeight:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double height = a3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setWidth:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double width = a3;
}

- (BOOL)hasYCoordinate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasYCoordinate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setYCoordinate:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_double yCoordinate = a3;
}

- (BOOL)hasXCoordinate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasXCoordinate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setXCoordinate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_double xCoordinate = a3;
}

@end