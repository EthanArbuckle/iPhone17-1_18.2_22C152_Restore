@interface CSLUIPBSize
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

@implementation CSLUIPBSize

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CSLUIPBSize;
  v4 = [(CSLUIPBSize *)&v8 description];
  v5 = [(CSLUIPBSize *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
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
  return CSLUIPBSizeReadFrom((uint64_t)self, (uint64_t)a3);
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
  double v4 = width;
  if (width < 0.0) {
    double v4 = -width;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  unint64_t v8 = v7 + (unint64_t)v6;
  double v9 = fabs(v6);
  if (v6 <= 0.0) {
    unint64_t v8 = v7;
  }
  unint64_t v10 = v7 - (unint64_t)v9;
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v8;
  }
  float height = self->_height;
  double v13 = height;
  if (height < 0.0) {
    double v13 = -height;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  unint64_t v17 = v16 + (unint64_t)v15;
  double v18 = fabs(v15);
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