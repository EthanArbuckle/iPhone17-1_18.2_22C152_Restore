@interface _MRGameControllerButtonsProtobuf
- (BOOL)hasA;
- (BOOL)hasB;
- (BOOL)hasDPadX;
- (BOOL)hasDPadY;
- (BOOL)hasLeftShoulder;
- (BOOL)hasLeftThumbstickX;
- (BOOL)hasLeftThumbstickY;
- (BOOL)hasLeftTrigger;
- (BOOL)hasPause;
- (BOOL)hasRightShoulder;
- (BOOL)hasRightThumbstickX;
- (BOOL)hasRightThumbstickY;
- (BOOL)hasRightTrigger;
- (BOOL)hasX;
- (BOOL)hasY;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)a;
- (float)b;
- (float)dPadX;
- (float)dPadY;
- (float)leftShoulder;
- (float)leftThumbstickX;
- (float)leftThumbstickY;
- (float)leftTrigger;
- (float)pause;
- (float)rightShoulder;
- (float)rightThumbstickX;
- (float)rightThumbstickY;
- (float)rightTrigger;
- (float)x;
- (float)y;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setA:(float)a3;
- (void)setB:(float)a3;
- (void)setDPadX:(float)a3;
- (void)setDPadY:(float)a3;
- (void)setHasA:(BOOL)a3;
- (void)setHasB:(BOOL)a3;
- (void)setHasDPadX:(BOOL)a3;
- (void)setHasDPadY:(BOOL)a3;
- (void)setHasLeftShoulder:(BOOL)a3;
- (void)setHasLeftThumbstickX:(BOOL)a3;
- (void)setHasLeftThumbstickY:(BOOL)a3;
- (void)setHasLeftTrigger:(BOOL)a3;
- (void)setHasPause:(BOOL)a3;
- (void)setHasRightShoulder:(BOOL)a3;
- (void)setHasRightThumbstickX:(BOOL)a3;
- (void)setHasRightThumbstickY:(BOOL)a3;
- (void)setHasRightTrigger:(BOOL)a3;
- (void)setHasX:(BOOL)a3;
- (void)setHasY:(BOOL)a3;
- (void)setLeftShoulder:(float)a3;
- (void)setLeftThumbstickX:(float)a3;
- (void)setLeftThumbstickY:(float)a3;
- (void)setLeftTrigger:(float)a3;
- (void)setPause:(float)a3;
- (void)setRightShoulder:(float)a3;
- (void)setRightThumbstickX:(float)a3;
- (void)setRightThumbstickY:(float)a3;
- (void)setRightTrigger:(float)a3;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGameControllerButtonsProtobuf

- (void)setDPadX:(float)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_dPadX = a3;
}

- (void)setHasDPadX:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDPadX
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDPadY:(float)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_dPadY = a3;
}

- (void)setHasDPadY:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDPadY
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setA:(float)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_a = a3;
}

- (void)setHasA:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasA
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setB:(float)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_b = a3;
}

- (void)setHasB:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasB
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setX:(float)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasX
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setY:(float)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasY
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setLeftShoulder:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_leftShoulder = a3;
}

- (void)setHasLeftShoulder:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLeftShoulder
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setRightShoulder:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rightShoulder = a3;
}

- (void)setHasRightShoulder:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRightShoulder
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setLeftThumbstickX:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_leftThumbstickX = a3;
}

- (void)setHasLeftThumbstickX:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLeftThumbstickX
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setLeftThumbstickY:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_leftThumbstickY = a3;
}

- (void)setHasLeftThumbstickY:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLeftThumbstickY
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRightThumbstickX:(float)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_rightThumbstickX = a3;
}

- (void)setHasRightThumbstickX:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasRightThumbstickX
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setRightThumbstickY:(float)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_rightThumbstickY = a3;
}

- (void)setHasRightThumbstickY:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasRightThumbstickY
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setLeftTrigger:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_leftTrigger = a3;
}

- (void)setHasLeftTrigger:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLeftTrigger
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setRightTrigger:(float)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_rightTrigger = a3;
}

- (void)setHasRightTrigger:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasRightTrigger
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setPause:(float)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_pause = a3;
}

- (void)setHasPause:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPause
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGameControllerButtonsProtobuf;
  v4 = [(_MRGameControllerButtonsProtobuf *)&v8 description];
  v5 = [(_MRGameControllerButtonsProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(float *)&double v4 = self->_dPadX;
    objc_super v8 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v8 forKey:@"dPadX"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_dPadY;
  v9 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v9 forKey:@"dPadY"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(float *)&double v4 = self->_a;
  v10 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v10 forKey:@"a"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(float *)&double v4 = self->_b;
  v11 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v11 forKey:@"b"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(float *)&double v4 = self->_x;
  v12 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v12 forKey:@"x"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(float *)&double v4 = self->_y;
  v13 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v13 forKey:@"y"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(float *)&double v4 = self->_leftShoulder;
  v14 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v14 forKey:@"leftShoulder"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(float *)&double v4 = self->_rightShoulder;
  v15 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v15 forKey:@"rightShoulder"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(float *)&double v4 = self->_leftThumbstickX;
  v16 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v16 forKey:@"leftThumbstickX"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(float *)&double v4 = self->_leftThumbstickY;
  v17 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v17 forKey:@"leftThumbstickY"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(float *)&double v4 = self->_rightThumbstickX;
  v18 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v18 forKey:@"rightThumbstickX"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(float *)&double v4 = self->_rightThumbstickY;
  v19 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v19 forKey:@"rightThumbstickY"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(float *)&double v4 = self->_leftTrigger;
  v20 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v20 forKey:@"leftTrigger"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  *(float *)&double v4 = self->_rightTrigger;
  v21 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v21 forKey:@"rightTrigger"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_16:
    *(float *)&double v4 = self->_pause;
    v6 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v6 forKey:@"pause"];
  }
LABEL_17:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerButtonsProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_16:
  }
    PBDataWriterWriteFloatField();
LABEL_17:
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = LODWORD(self->_dPadX);
    *((_WORD *)v4 + 34) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = LODWORD(self->_dPadY);
  *((_WORD *)v4 + 34) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  v4[2] = LODWORD(self->_a);
  *((_WORD *)v4 + 34) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  v4[3] = LODWORD(self->_b);
  *((_WORD *)v4 + 34) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  v4[15] = LODWORD(self->_x);
  *((_WORD *)v4 + 34) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[16] = LODWORD(self->_y);
  *((_WORD *)v4 + 34) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[6] = LODWORD(self->_leftShoulder);
  *((_WORD *)v4 + 34) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[11] = LODWORD(self->_rightShoulder);
  *((_WORD *)v4 + 34) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[7] = LODWORD(self->_leftThumbstickX);
  *((_WORD *)v4 + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[8] = LODWORD(self->_leftThumbstickY);
  *((_WORD *)v4 + 34) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[12] = LODWORD(self->_rightThumbstickX);
  *((_WORD *)v4 + 34) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[13] = LODWORD(self->_rightThumbstickY);
  *((_WORD *)v4 + 34) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[9] = LODWORD(self->_leftTrigger);
  *((_WORD *)v4 + 34) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  v4[14] = LODWORD(self->_rightTrigger);
  *((_WORD *)v4 + 34) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_16:
    v4[10] = LODWORD(self->_pause);
    *((_WORD *)v4 + 34) |= 0x100u;
  }
LABEL_17:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = LODWORD(self->_dPadX);
    *((_WORD *)result + 34) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = LODWORD(self->_dPadY);
  *((_WORD *)result + 34) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 2) = LODWORD(self->_a);
  *((_WORD *)result + 34) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 3) = LODWORD(self->_b);
  *((_WORD *)result + 34) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_6:
    if ((has & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 15) = LODWORD(self->_x);
  *((_WORD *)result + 34) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 16) = LODWORD(self->_y);
  *((_WORD *)result + 34) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 6) = LODWORD(self->_leftShoulder);
  *((_WORD *)result + 34) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 11) = LODWORD(self->_rightShoulder);
  *((_WORD *)result + 34) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 7) = LODWORD(self->_leftThumbstickX);
  *((_WORD *)result + 34) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 8) = LODWORD(self->_leftThumbstickY);
  *((_WORD *)result + 34) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 12) = LODWORD(self->_rightThumbstickX);
  *((_WORD *)result + 34) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 13) = LODWORD(self->_rightThumbstickY);
  *((_WORD *)result + 34) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 9) = LODWORD(self->_leftTrigger);
  *((_WORD *)result + 34) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0) {
      return result;
    }
    goto LABEL_16;
  }
LABEL_31:
  *((_DWORD *)result + 14) = LODWORD(self->_rightTrigger);
  *((_WORD *)result + 34) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    return result;
  }
LABEL_16:
  *((_DWORD *)result + 10) = LODWORD(self->_pause);
  *((_WORD *)result + 34) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 34);
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_dPadX != *((float *)v4 + 4)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 4) != 0)
  {
LABEL_77:
    BOOL v7 = 0;
    goto LABEL_78;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dPadY != *((float *)v4 + 5)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_77;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_a != *((float *)v4 + 2)) {
      goto LABEL_77;
    }
  }
  else if (v6)
  {
    goto LABEL_77;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_b != *((float *)v4 + 3)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x2000) == 0 || self->_x != *((float *)v4 + 15)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x2000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x4000) == 0 || self->_y != *((float *)v4 + 16)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x4000) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_leftShoulder != *((float *)v4 + 6)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x200) == 0 || self->_rightShoulder != *((float *)v4 + 11)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x200) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_leftThumbstickX != *((float *)v4 + 7)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_leftThumbstickY != *((float *)v4 + 8)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x400) == 0 || self->_rightThumbstickX != *((float *)v4 + 12)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x400) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x800) == 0 || self->_rightThumbstickY != *((float *)v4 + 13)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x800) != 0)
  {
    goto LABEL_77;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_leftTrigger != *((float *)v4 + 9)) {
      goto LABEL_77;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x1000) == 0 || self->_rightTrigger != *((float *)v4 + 14)) {
      goto LABEL_77;
    }
  }
  else if ((*((_WORD *)v4 + 34) & 0x1000) != 0)
  {
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 34) & 0x100) == 0 || self->_pause != *((float *)v4 + 10)) {
      goto LABEL_77;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x100) == 0;
  }
LABEL_78:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    float dPadX = self->_dPadX;
    float v6 = -dPadX;
    if (dPadX >= 0.0) {
      float v6 = self->_dPadX;
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
  if ((has & 8) != 0)
  {
    float dPadY = self->_dPadY;
    float v11 = -dPadY;
    if (dPadY >= 0.0) {
      float v11 = self->_dPadY;
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
  if (has)
  {
    float a = self->_a;
    float v16 = -a;
    if (a >= 0.0) {
      float v16 = self->_a;
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
  if ((has & 2) != 0)
  {
    float b = self->_b;
    float v21 = -b;
    if (b >= 0.0) {
      float v21 = self->_b;
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
  if ((has & 0x2000) != 0)
  {
    float x = self->_x;
    float v26 = -x;
    if (x >= 0.0) {
      float v26 = self->_x;
    }
    float v27 = floorf(v26 + 0.5);
    float v28 = (float)(v26 - v27) * 1.8447e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabsf(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((has & 0x4000) != 0)
  {
    float y = self->_y;
    float v31 = -y;
    if (y >= 0.0) {
      float v31 = self->_y;
    }
    float v32 = floorf(v31 + 0.5);
    float v33 = (float)(v31 - v32) * 1.8447e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmodf(v32, 1.8447e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabsf(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 0x10) != 0)
  {
    float leftShoulder = self->_leftShoulder;
    float v36 = -leftShoulder;
    if (leftShoulder >= 0.0) {
      float v36 = self->_leftShoulder;
    }
    float v37 = floorf(v36 + 0.5);
    float v38 = (float)(v36 - v37) * 1.8447e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmodf(v37, 1.8447e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabsf(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  unint64_t v89 = v4;
  if ((has & 0x200) != 0)
  {
    float rightShoulder = self->_rightShoulder;
    float v41 = -rightShoulder;
    if (rightShoulder >= 0.0) {
      float v41 = self->_rightShoulder;
    }
    float v42 = floorf(v41 + 0.5);
    float v43 = (float)(v41 - v42) * 1.8447e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmodf(v42, 1.8447e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabsf(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  unint64_t v88 = v9;
  if ((has & 0x20) != 0)
  {
    float leftThumbstickX = self->_leftThumbstickX;
    float v46 = -leftThumbstickX;
    if (leftThumbstickX >= 0.0) {
      float v46 = self->_leftThumbstickX;
    }
    float v47 = floorf(v46 + 0.5);
    float v48 = (float)(v46 - v47) * 1.8447e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmodf(v47, 1.8447e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabsf(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  unint64_t v87 = v14;
  if ((has & 0x40) != 0)
  {
    float leftThumbstickY = self->_leftThumbstickY;
    float v51 = -leftThumbstickY;
    if (leftThumbstickY >= 0.0) {
      float v51 = self->_leftThumbstickY;
    }
    float v52 = floorf(v51 + 0.5);
    float v53 = (float)(v51 - v52) * 1.8447e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmodf(v52, 1.8447e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
    }
    else
    {
      v49 -= (unint64_t)fabsf(v53);
    }
  }
  else
  {
    unint64_t v49 = 0;
  }
  unint64_t v86 = v19;
  if ((has & 0x400) != 0)
  {
    float rightThumbstickX = self->_rightThumbstickX;
    float v56 = -rightThumbstickX;
    if (rightThumbstickX >= 0.0) {
      float v56 = self->_rightThumbstickX;
    }
    float v57 = floorf(v56 + 0.5);
    float v58 = (float)(v56 - v57) * 1.8447e19;
    unint64_t v54 = 2654435761u * (unint64_t)fmodf(v57, 1.8447e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0) {
        v54 += (unint64_t)v58;
      }
    }
    else
    {
      v54 -= (unint64_t)fabsf(v58);
    }
  }
  else
  {
    unint64_t v54 = 0;
  }
  unint64_t v84 = v44;
  unint64_t v85 = v24;
  if ((has & 0x800) != 0)
  {
    float rightThumbstickY = self->_rightThumbstickY;
    float v61 = -rightThumbstickY;
    if (rightThumbstickY >= 0.0) {
      float v61 = self->_rightThumbstickY;
    }
    float v62 = floorf(v61 + 0.5);
    float v63 = (float)(v61 - v62) * 1.8447e19;
    unint64_t v59 = 2654435761u * (unint64_t)fmodf(v62, 1.8447e19);
    if (v63 >= 0.0)
    {
      if (v63 > 0.0) {
        v59 += (unint64_t)v63;
      }
    }
    else
    {
      v59 -= (unint64_t)fabsf(v63);
    }
  }
  else
  {
    unint64_t v59 = 0;
  }
  unint64_t v83 = v54;
  unint64_t v64 = v29;
  unint64_t v65 = v49;
  if ((has & 0x80) != 0)
  {
    float leftTrigger = self->_leftTrigger;
    float v69 = -leftTrigger;
    if (leftTrigger >= 0.0) {
      float v69 = self->_leftTrigger;
    }
    float v70 = floorf(v69 + 0.5);
    float v71 = (float)(v69 - v70) * 1.8447e19;
    unint64_t v67 = 2654435761u * (unint64_t)fmodf(v70, 1.8447e19);
    unint64_t v66 = v39;
    if (v71 >= 0.0)
    {
      if (v71 > 0.0) {
        v67 += (unint64_t)v71;
      }
    }
    else
    {
      v67 -= (unint64_t)fabsf(v71);
    }
  }
  else
  {
    unint64_t v66 = v39;
    unint64_t v67 = 0;
  }
  if ((has & 0x1000) != 0)
  {
    float rightTrigger = self->_rightTrigger;
    float v74 = -rightTrigger;
    if (rightTrigger >= 0.0) {
      float v74 = self->_rightTrigger;
    }
    float v75 = floorf(v74 + 0.5);
    float v76 = (float)(v74 - v75) * 1.8447e19;
    unint64_t v72 = 2654435761u * (unint64_t)fmodf(v75, 1.8447e19);
    if (v76 >= 0.0)
    {
      if (v76 > 0.0) {
        v72 += (unint64_t)v76;
      }
    }
    else
    {
      v72 -= (unint64_t)fabsf(v76);
    }
  }
  else
  {
    unint64_t v72 = 0;
  }
  if ((has & 0x100) != 0)
  {
    float pause = self->_pause;
    float v79 = -pause;
    if (pause >= 0.0) {
      float v79 = self->_pause;
    }
    float v80 = floorf(v79 + 0.5);
    float v81 = (float)(v79 - v80) * 1.8447e19;
    unint64_t v77 = 2654435761u * (unint64_t)fmodf(v80, 1.8447e19);
    if (v81 >= 0.0)
    {
      if (v81 > 0.0) {
        v77 += (unint64_t)v81;
      }
    }
    else
    {
      v77 -= (unint64_t)fabsf(v81);
    }
  }
  else
  {
    unint64_t v77 = 0;
  }
  return v88 ^ v89 ^ v87 ^ v86 ^ v85 ^ v64 ^ v34 ^ v66 ^ v84 ^ v65 ^ v83 ^ v59 ^ v67 ^ v72 ^ v77;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 4) != 0)
  {
    self->_float dPadX = *((float *)v4 + 4);
    *(_WORD *)&self->_has |= 4u;
    __int16 v5 = *((_WORD *)v4 + 34);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_float dPadY = *((float *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_float a = *((float *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_float b = *((float *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x2000) == 0)
  {
LABEL_6:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_float x = *((float *)v4 + 15);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x4000) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_float y = *((float *)v4 + 16);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_float leftShoulder = *((float *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_float rightShoulder = *((float *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_float leftThumbstickX = *((float *)v4 + 7);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_float leftThumbstickY = *((float *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x400) == 0)
  {
LABEL_12:
    if ((v5 & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_float rightThumbstickX = *((float *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x800) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_float rightThumbstickY = *((float *)v4 + 13);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_float leftTrigger = *((float *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 34);
  if ((v5 & 0x1000) == 0)
  {
LABEL_15:
    if ((v5 & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  self->_float rightTrigger = *((float *)v4 + 14);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v4 + 34) & 0x100) != 0)
  {
LABEL_16:
    self->_float pause = *((float *)v4 + 10);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_17:
}

- (float)dPadX
{
  return self->_dPadX;
}

- (float)dPadY
{
  return self->_dPadY;
}

- (float)a
{
  return self->_a;
}

- (float)b
{
  return self->_b;
}

- (float)x
{
  return self->_x;
}

- (float)y
{
  return self->_y;
}

- (float)leftShoulder
{
  return self->_leftShoulder;
}

- (float)rightShoulder
{
  return self->_rightShoulder;
}

- (float)leftThumbstickX
{
  return self->_leftThumbstickX;
}

- (float)leftThumbstickY
{
  return self->_leftThumbstickY;
}

- (float)rightThumbstickX
{
  return self->_rightThumbstickX;
}

- (float)rightThumbstickY
{
  return self->_rightThumbstickY;
}

- (float)leftTrigger
{
  return self->_leftTrigger;
}

- (float)rightTrigger
{
  return self->_rightTrigger;
}

- (float)pause
{
  return self->_pause;
}

@end