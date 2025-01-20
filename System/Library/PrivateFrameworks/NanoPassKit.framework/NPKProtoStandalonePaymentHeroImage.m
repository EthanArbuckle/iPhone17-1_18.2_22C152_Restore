@interface NPKProtoStandalonePaymentHeroImage
- (BOOL)hasImageData;
- (BOOL)hasImageHash;
- (BOOL)hasImageURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)imageData;
- (NSString)identifier;
- (NSString)imageHash;
- (NSString)imageURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageHash:(id)a3;
- (void)setImageURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentHeroImage

- (BOOL)hasImageHash
{
  return self->_imageHash != 0;
}

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (BOOL)hasImageURL
{
  return self->_imageURL != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentHeroImage;
  v4 = [(NPKProtoStandalonePaymentHeroImage *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentHeroImage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  imageHash = self->_imageHash;
  if (imageHash) {
    [v4 setObject:imageHash forKey:@"imageHash"];
  }
  imageData = self->_imageData;
  if (imageData) {
    [v4 setObject:imageData forKey:@"imageData"];
  }
  imageURL = self->_imageURL;
  if (imageURL) {
    [v4 setObject:imageURL forKey:@"imageURL"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentHeroImageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_identifier) {
    -[NPKProtoStandalonePaymentHeroImage writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteStringField();
  if (self->_imageHash) {
    PBDataWriterWriteStringField();
  }
  if (self->_imageData) {
    PBDataWriterWriteDataField();
  }
  v5 = v6;
  if (self->_imageURL)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setIdentifier:self->_identifier];
  if (self->_imageHash) {
    objc_msgSend(v5, "setImageHash:");
  }
  if (self->_imageData) {
    objc_msgSend(v5, "setImageData:");
  }
  id v4 = v5;
  if (self->_imageURL)
  {
    objc_msgSend(v5, "setImageURL:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_imageHash copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSData *)self->_imageData copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_imageURL copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((imageHash = self->_imageHash, !((unint64_t)imageHash | v4[3]))
     || -[NSString isEqual:](imageHash, "isEqual:"))
    && ((imageData = self->_imageData, !((unint64_t)imageData | v4[2]))
     || -[NSData isEqual:](imageData, "isEqual:")))
  {
    imageURL = self->_imageURL;
    if ((unint64_t)imageURL | v4[4]) {
      char v9 = -[NSString isEqual:](imageURL, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_imageHash hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_imageData hash];
  return v4 ^ v5 ^ [(NSString *)self->_imageURL hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[NPKProtoStandalonePaymentHeroImage setIdentifier:](self, "setIdentifier:");
  }
  if (v4[3]) {
    -[NPKProtoStandalonePaymentHeroImage setImageHash:](self, "setImageHash:");
  }
  if (v4[2]) {
    -[NPKProtoStandalonePaymentHeroImage setImageData:](self, "setImageData:");
  }
  if (v4[4]) {
    -[NPKProtoStandalonePaymentHeroImage setImageURL:](self, "setImageURL:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)imageHash
{
  return self->_imageHash;
}

- (void)setImageHash:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentHeroImage writeTo:]", "NPKProtoStandalonePaymentHeroImage.m", 117, "nil != self->_identifier");
}

@end