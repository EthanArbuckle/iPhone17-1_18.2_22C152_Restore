@interface NRGPBAppViewListImageResponse
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

@implementation NRGPBAppViewListImageResponse

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRGPBAppViewListImageResponse;
  v3 = [(NRGPBAppViewListImageResponse *)&v7 description];
  v4 = [(NRGPBAppViewListImageResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  imageData = self->_imageData;
  if (imageData) {
    [v3 setObject:imageData forKey:@"imageData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100010104((uint64_t)self, (uint64_t)a3);
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
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(NSData *)self->_imageData copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
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
      unsigned __int8 v6 = -[NSData isEqual:](imageData, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_imageData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NRGPBAppViewListImageResponse setImageData:](self, "setImageData:");
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