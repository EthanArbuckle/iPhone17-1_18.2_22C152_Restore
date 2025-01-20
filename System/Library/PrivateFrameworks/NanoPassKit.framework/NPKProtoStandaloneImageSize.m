@interface NPKProtoStandaloneImageSize
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)height;
- (int)width;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeight:(int)a3;
- (void)setWidth:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandaloneImageSize

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandaloneImageSize;
  v4 = [(NPKProtoStandaloneImageSize *)&v8 description];
  v5 = [(NPKProtoStandaloneImageSize *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithInt:self->_width];
  [v3 setObject:v4 forKey:@"width"];

  v5 = [NSNumber numberWithInt:self->_height];
  [v3 setObject:v5 forKey:@"height"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneImageSizeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = self->_width;
  *((_DWORD *)a3 + 2) = self->_height;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = self->_width;
  *((_DWORD *)result + 2) = self->_height;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_width == v4[3]
    && self->_height == v4[2];

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_height) ^ (2654435761 * self->_width);
}

- (void)mergeFrom:(id)a3
{
  self->_width = *((_DWORD *)a3 + 3);
  self->_height = *((_DWORD *)a3 + 2);
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

@end