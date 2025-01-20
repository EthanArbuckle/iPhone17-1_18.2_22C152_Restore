@interface _MRColorProtobuf
- (BOOL)hasAlpha;
- (BOOL)hasBlue;
- (BOOL)hasGreen;
- (BOOL)hasRed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)alpha;
- (float)blue;
- (float)green;
- (float)red;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlpha:(float)a3;
- (void)setBlue:(float)a3;
- (void)setGreen:(float)a3;
- (void)setHasAlpha:(BOOL)a3;
- (void)setHasBlue:(BOOL)a3;
- (void)setHasGreen:(BOOL)a3;
- (void)setHasRed:(BOOL)a3;
- (void)setRed:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRColorProtobuf

- (void)setRed:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_red = a3;
}

- (void)setHasRed:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRed
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setGreen:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_green = a3;
}

- (void)setHasGreen:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGreen
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setBlue:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_blue = a3;
}

- (void)setHasBlue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBlue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAlpha:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_alpha = a3;
}

- (void)setHasAlpha:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlpha
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRColorProtobuf;
  v4 = [(_MRColorProtobuf *)&v8 description];
  v5 = [(_MRColorProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)&double v4 = self->_red;
    objc_super v8 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"red"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_green;
  v9 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v9 forKey:@"green"];

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
  *(float *)&double v4 = self->_blue;
  v10 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v10 forKey:@"blue"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    *(float *)&double v4 = self->_alpha;
    v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"alpha"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRColorProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
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
  PBDataWriterWriteFloatField();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteFloatField();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[5] = LODWORD(self->_red);
    *((unsigned char *)v4 + 24) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = LODWORD(self->_green);
  *((unsigned char *)v4 + 24) |= 4u;
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
  v4[3] = LODWORD(self->_blue);
  *((unsigned char *)v4 + 24) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    v4[2] = LODWORD(self->_alpha);
    *((unsigned char *)v4 + 24) |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = LODWORD(self->_red);
    *((unsigned char *)result + 24) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = LODWORD(self->_green);
  *((unsigned char *)result + 24) |= 4u;
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
  *((_DWORD *)result + 3) = LODWORD(self->_blue);
  *((unsigned char *)result + 24) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 2) = LODWORD(self->_alpha);
  *((unsigned char *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_red != *((float *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_green != *((float *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_blue != *((float *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_alpha != *((float *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    float red = self->_red;
    float v6 = -red;
    if (red >= 0.0) {
      float v6 = self->_red;
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
  if ((has & 4) != 0)
  {
    float green = self->_green;
    float v11 = -green;
    if (green >= 0.0) {
      float v11 = self->_green;
    }
    float v12 = floorf(v11 + 0.5);
    float v13 = (float)(v11 - v12) * 1.8447e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 2) != 0)
  {
    float blue = self->_blue;
    float v16 = -blue;
    if (blue >= 0.0) {
      float v16 = self->_blue;
    }
    float v17 = floorf(v16 + 0.5);
    float v18 = (float)(v16 - v17) * 1.8447e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (has)
  {
    float alpha = self->_alpha;
    float v21 = -alpha;
    if (alpha >= 0.0) {
      float v21 = self->_alpha;
    }
    float v22 = floorf(v21 + 0.5);
    float v23 = (float)(v21 - v22) * 1.8447e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabsf(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 8) != 0)
  {
    self->_float red = *((float *)v4 + 5);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_float green = *((float *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_float blue = *((float *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 24))
  {
LABEL_5:
    self->_float alpha = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
}

- (float)red
{
  return self->_red;
}

- (float)green
{
  return self->_green;
}

- (float)blue
{
  return self->_blue;
}

- (float)alpha
{
  return self->_alpha;
}

@end