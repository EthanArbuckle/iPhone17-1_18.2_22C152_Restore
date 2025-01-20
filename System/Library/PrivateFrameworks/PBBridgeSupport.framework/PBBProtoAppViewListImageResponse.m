@interface PBBProtoAppViewListImageResponse
- (BOOL)hasImageData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)imageData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setImageData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoAppViewListImageResponse

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoAppViewListImageResponse;
  v4 = [(PBBProtoAppViewListImageResponse *)&v8 description];
  v5 = [(PBBProtoAppViewListImageResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  imageData = self->_imageData;
  if (imageData) {
    [v3 setObject:imageData forKey:@"imageData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoAppViewListImageResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_imageData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  imageData = self->_imageData;
  if (imageData) {
    [a3 setImageData:imageData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_imageData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    imageData = self->_imageData;
    if ((unint64_t)imageData | v4[1]) {
      char v6 = -[NSData isEqual:](imageData, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSData *)self->_imageData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PBBProtoAppViewListImageResponse setImageData:](self, "setImageData:");
  }
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end