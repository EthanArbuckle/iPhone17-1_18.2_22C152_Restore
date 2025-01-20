@interface _MRGameControllerAccelerationProtobuf
- (BOOL)hasData;
- (BOOL)hasW;
- (BOOL)hasX;
- (BOOL)hasY;
- (BOOL)hasZ;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (float)w;
- (float)x;
- (float)y;
- (float)z;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setData:(id)a3;
- (void)setHasW:(BOOL)a3;
- (void)setHasX:(BOOL)a3;
- (void)setHasY:(BOOL)a3;
- (void)setHasZ:(BOOL)a3;
- (void)setW:(float)a3;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
- (void)setZ:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGameControllerAccelerationProtobuf

- (BOOL)hasData
{
  return self->_data != 0;
}

- (void)setX:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasX
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setY:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasY
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setZ:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_z = a3;
}

- (void)setHasZ:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasZ
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setW:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_w = a3;
}

- (void)setHasW:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasW
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGameControllerAccelerationProtobuf;
  v4 = [(_MRGameControllerAccelerationProtobuf *)&v8 description];
  v5 = [(_MRGameControllerAccelerationProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  data = self->_data;
  if (data) {
    [v3 setObject:data forKey:@"data"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&double v4 = self->_x;
    v10 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v10 forKey:@"x"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(float *)&double v4 = self->_y;
  v11 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v11 forKey:@"y"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *(float *)&double v4 = self->_z;
  v12 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v12 forKey:@"z"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    *(float *)&double v4 = self->_w;
    objc_super v8 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v8 forKey:@"w"];
  }
LABEL_8:

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerAccelerationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_data)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteFloatField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteFloatField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_8:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_data)
  {
    id v6 = v4;
    objc_msgSend(v4, "setData:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = LODWORD(self->_x);
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 6) = LODWORD(self->_y);
  *((unsigned char *)v4 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)v4 + 7) = LODWORD(self->_z);
  *((unsigned char *)v4 + 32) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    *((_DWORD *)v4 + 4) = LODWORD(self->_w);
    *((unsigned char *)v4 + 32) |= 1u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_data copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v5 + 20) = self->_x;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(float *)(v5 + 28) = self->_z;
      *(unsigned char *)(v5 + 32) |= 8u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 24) = self->_y;
  *(unsigned char *)(v5 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (has)
  {
LABEL_5:
    *(float *)(v5 + 16) = self->_w;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  data = self->_data;
  if ((unint64_t)data | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](data, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_x != *((float *)v4 + 5)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_y != *((float *)v4 + 6)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_z != *((float *)v4 + 7)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_w != *((float *)v4 + 4)) {
      goto LABEL_23;
    }
    BOOL v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_data hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float x = self->_x;
    float v7 = -x;
    if (x >= 0.0) {
      float v7 = self->_x;
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
  if ((has & 4) != 0)
  {
    float y = self->_y;
    float v12 = -y;
    if (y >= 0.0) {
      float v12 = self->_y;
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
  if ((has & 8) != 0)
  {
    float z = self->_z;
    float v17 = -z;
    if (z >= 0.0) {
      float v17 = self->_z;
    }
    float v18 = floorf(v17 + 0.5);
    float v19 = (float)(v17 - v18) * 1.8447e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmodf(v18, 1.8447e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabsf(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if (has)
  {
    float w = self->_w;
    float v22 = -w;
    if (w >= 0.0) {
      float v22 = self->_w;
    }
    float v23 = floorf(v22 + 0.5);
    float v24 = (float)(v22 - v23) * 1.8447e19;
    unint64_t v20 = 2654435761u * (unint64_t)fmodf(v23, 1.8447e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0) {
        v20 += (unint64_t)v24;
      }
    }
    else
    {
      v20 -= (unint64_t)fabsf(v24);
    }
  }
  else
  {
    unint64_t v20 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (float *)a3;
  if (*((void *)v4 + 1))
  {
    BOOL v6 = v4;
    -[_MRGameControllerAccelerationProtobuf setData:](self, "setData:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_float x = v4[5];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if (((_BYTE)v4[8] & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_float y = v4[6];
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  self->_float z = v4[7];
  *(unsigned char *)&self->_has |= 8u;
  if ((_BYTE)v4[8])
  {
LABEL_7:
    self->_float w = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_8:
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (float)x
{
  return self->_x;
}

- (float)y
{
  return self->_y;
}

- (float)z
{
  return self->_z;
}

- (float)w
{
  return self->_w;
}

- (void).cxx_destruct
{
}

@end