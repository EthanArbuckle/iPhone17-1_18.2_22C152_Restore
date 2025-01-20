@interface NRPBSize
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)height;
- (float)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeight:(float)a3;
- (void)setWidth:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRPBSize

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NRPBSize;
  v4 = [(NRPBSize *)&v8 description];
  v5 = [(NRPBSize *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_width;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"width"];

  *(float *)&double v6 = self->_height;
  v7 = [NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKey:@"height"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBSizeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = LODWORD(self->_width);
  *((_DWORD *)a3 + 2) = LODWORD(self->_height);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = LODWORD(self->_width);
  *((_DWORD *)result + 2) = LODWORD(self->_height);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (float *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_width == v4[3]
    && self->_height == v4[2];

  return v5;
}

- (unint64_t)hash
{
  float width = self->_width;
  float v4 = -width;
  if (width >= 0.0) {
    float v4 = self->_width;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  float v7 = fmodf(v5, 1.8447e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  float height = self->_height;
  float v13 = -height;
  if (height >= 0.0) {
    float v13 = self->_height;
  }
  float v14 = floorf(v13 + 0.5);
  float v15 = (float)(v13 - v14) * 1.8447e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmodf(v14, 1.8447e19);
  unint64_t v17 = v16 + (unint64_t)v15;
  float v18 = fabsf(v15);
  if (v15 <= 0.0) {
    unint64_t v17 = v16;
  }
  unint64_t v19 = v16 - (unint64_t)v18;
  if (v15 >= 0.0) {
    unint64_t v19 = v17;
  }
  return v19 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_float width = *((float *)a3 + 3);
  self->_float height = *((float *)a3 + 2);
}

- (float)width
{
  return self->_width;
}

- (void)setWidth:(float)a3
{
  self->_float width = a3;
}

- (float)height
{
  return self->_height;
}

- (void)setHeight:(float)a3
{
  self->_float height = a3;
}

@end