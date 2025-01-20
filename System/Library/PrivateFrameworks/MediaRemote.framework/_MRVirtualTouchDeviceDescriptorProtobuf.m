@interface _MRVirtualTouchDeviceDescriptorProtobuf
- (BOOL)absolute;
- (BOOL)hasAbsolute;
- (BOOL)hasIntegratedDisplay;
- (BOOL)hasScreenSizeHeight;
- (BOOL)hasScreenSizeWidth;
- (BOOL)integratedDisplay;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)screenSizeHeight;
- (float)screenSizeWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsolute:(BOOL)a3;
- (void)setHasAbsolute:(BOOL)a3;
- (void)setHasIntegratedDisplay:(BOOL)a3;
- (void)setHasScreenSizeHeight:(BOOL)a3;
- (void)setHasScreenSizeWidth:(BOOL)a3;
- (void)setIntegratedDisplay:(BOOL)a3;
- (void)setScreenSizeHeight:(float)a3;
- (void)setScreenSizeWidth:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRVirtualTouchDeviceDescriptorProtobuf

- (void)setAbsolute:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_absolute = a3;
}

- (void)setHasAbsolute:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAbsolute
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIntegratedDisplay:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_integratedDisplay = a3;
}

- (void)setHasIntegratedDisplay:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIntegratedDisplay
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setScreenSizeWidth:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_screenSizeWidth = a3;
}

- (void)setHasScreenSizeWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScreenSizeWidth
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setScreenSizeHeight:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_screenSizeHeight = a3;
}

- (void)setHasScreenSizeHeight:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScreenSizeHeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRVirtualTouchDeviceDescriptorProtobuf;
  v4 = [(_MRVirtualTouchDeviceDescriptorProtobuf *)&v8 description];
  v5 = [(_MRVirtualTouchDeviceDescriptorProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_absolute];
    [v3 setObject:v8 forKey:@"absolute"];

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
  v9 = [NSNumber numberWithBool:self->_integratedDisplay];
  [v3 setObject:v9 forKey:@"integratedDisplay"];

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
  *(float *)&double v4 = self->_screenSizeWidth;
  v10 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v10 forKey:@"screenSizeWidth"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    *(float *)&double v4 = self->_screenSizeHeight;
    v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"screenSizeHeight"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVirtualTouchDeviceDescriptorProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  PBDataWriterWriteBOOLField();
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
  if ((has & 4) != 0)
  {
    v4[16] = self->_absolute;
    v4[20] |= 4u;
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
  v4[17] = self->_integratedDisplay;
  v4[20] |= 8u;
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
  *((_DWORD *)v4 + 3) = LODWORD(self->_screenSizeWidth);
  v4[20] |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    *((_DWORD *)v4 + 2) = LODWORD(self->_screenSizeHeight);
    v4[20] |= 1u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)result + 16) = self->_absolute;
    *((unsigned char *)result + 20) |= 4u;
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
  *((unsigned char *)result + 17) = self->_integratedDisplay;
  *((unsigned char *)result + 20) |= 8u;
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
  *((_DWORD *)result + 3) = LODWORD(self->_screenSizeWidth);
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 2) = LODWORD(self->_screenSizeHeight);
  *((unsigned char *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) == 0) {
      goto LABEL_27;
    }
    if (self->_absolute)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 8) != 0)
    {
      if (self->_integratedDisplay)
      {
        if (!*((unsigned char *)v4 + 17)) {
          goto LABEL_27;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_18;
      }
    }
LABEL_27:
    BOOL v5 = 0;
    goto LABEL_28;
  }
  if ((*((unsigned char *)v4 + 20) & 8) != 0) {
    goto LABEL_27;
  }
LABEL_18:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_screenSizeWidth != *((float *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_27;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_screenSizeHeight != *((float *)v4 + 2)) {
      goto LABEL_27;
    }
    BOOL v5 = 1;
  }
LABEL_28:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v10 = 0;
    goto LABEL_13;
  }
  uint64_t v4 = 2654435761 * self->_absolute;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_integratedDisplay;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  float screenSizeWidth = self->_screenSizeWidth;
  float v7 = -screenSizeWidth;
  if (screenSizeWidth >= 0.0) {
    float v7 = self->_screenSizeWidth;
  }
  float v8 = floorf(v7 + 0.5);
  float v9 = (float)(v7 - v8) * 1.8447e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabsf(v9);
  }
LABEL_13:
  if (has)
  {
    float screenSizeHeight = self->_screenSizeHeight;
    float v13 = -screenSizeHeight;
    if (screenSizeHeight >= 0.0) {
      float v13 = self->_screenSizeHeight;
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
  return v5 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 4) != 0)
  {
    self->_absolute = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_integratedDisplay = *((unsigned char *)v4 + 17);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 20);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_float screenSizeWidth = *((float *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 20))
  {
LABEL_5:
    self->_float screenSizeHeight = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
}

- (BOOL)absolute
{
  return self->_absolute;
}

- (BOOL)integratedDisplay
{
  return self->_integratedDisplay;
}

- (float)screenSizeWidth
{
  return self->_screenSizeWidth;
}

- (float)screenSizeHeight
{
  return self->_screenSizeHeight;
}

@end