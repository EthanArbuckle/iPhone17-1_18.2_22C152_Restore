@interface NRGPBAppViewListImageRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (float)height;
- (float)scale;
- (float)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeight:(float)a3;
- (void)setScale:(float)a3;
- (void)setWidth:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRGPBAppViewListImageRequest

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRGPBAppViewListImageRequest;
  v3 = [(NRGPBAppViewListImageRequest *)&v7 description];
  v4 = [(NRGPBAppViewListImageRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  *(float *)&double v4 = self->_scale;
  v5 = +[NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"scale"];

  *(float *)&double v6 = self->_width;
  objc_super v7 = +[NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKey:@"width"];

  *(float *)&double v8 = self->_height;
  v9 = +[NSNumber numberWithFloat:v8];
  [v3 setObject:v9 forKey:@"height"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000059D8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
}

- (unsigned)requestTypeCode
{
  return 3;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = LODWORD(self->_scale);
  *((_DWORD *)a3 + 4) = LODWORD(self->_width);
  *((_DWORD *)a3 + 2) = LODWORD(self->_height);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  *((_DWORD *)result + 3) = LODWORD(self->_scale);
  *((_DWORD *)result + 4) = LODWORD(self->_width);
  *((_DWORD *)result + 2) = LODWORD(self->_height);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (float *)a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_scale == v4[3]
    && self->_width == v4[4]
    && self->_height == v4[2];

  return v5;
}

- (unint64_t)hash
{
  float scale = self->_scale;
  float v4 = -scale;
  if (scale >= 0.0) {
    float v4 = self->_scale;
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
  float width = self->_width;
  float v13 = -width;
  if (width >= 0.0) {
    float v13 = self->_width;
  }
  float v14 = floorf(v13 + 0.5);
  float v15 = (float)(v13 - v14) * 1.8447e19;
  float v16 = fmodf(v14, 1.8447e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 < 0.0) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  float height = self->_height;
  float v22 = -height;
  if (height >= 0.0) {
    float v22 = self->_height;
  }
  float v23 = floorf(v22 + 0.5);
  float v24 = (float)(v22 - v23) * 1.8447e19;
  float v25 = fmodf(v23, 1.8447e19);
  unint64_t v26 = 2654435761u * (unint64_t)v25;
  unint64_t v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0) {
    unint64_t v27 = 2654435761u * (unint64_t)v25;
  }
  unint64_t v28 = v26 - (unint64_t)fabsf(v24);
  if (v24 >= 0.0) {
    unint64_t v28 = v27;
  }
  return v20 ^ v11 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  self->_float scale = *((float *)a3 + 3);
  self->_float width = *((float *)a3 + 4);
  self->_float height = *((float *)a3 + 2);
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_float scale = a3;
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