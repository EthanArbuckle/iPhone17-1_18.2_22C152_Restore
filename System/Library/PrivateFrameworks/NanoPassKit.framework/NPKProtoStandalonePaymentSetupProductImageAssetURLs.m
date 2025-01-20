@interface NPKProtoStandalonePaymentSetupProductImageAssetURLs
- (BOOL)hasDigitalCardImageUrl;
- (BOOL)hasLogoImageUrl;
- (BOOL)hasThumbnailImageUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)digitalCardImageUrl;
- (NSString)logoImageUrl;
- (NSString)thumbnailImageUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDigitalCardImageUrl:(id)a3;
- (void)setLogoImageUrl:(id)a3;
- (void)setThumbnailImageUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentSetupProductImageAssetURLs

- (BOOL)hasDigitalCardImageUrl
{
  return self->_digitalCardImageUrl != 0;
}

- (BOOL)hasThumbnailImageUrl
{
  return self->_thumbnailImageUrl != 0;
}

- (BOOL)hasLogoImageUrl
{
  return self->_logoImageUrl != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentSetupProductImageAssetURLs;
  v4 = [(NPKProtoStandalonePaymentSetupProductImageAssetURLs *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentSetupProductImageAssetURLs *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  digitalCardImageUrl = self->_digitalCardImageUrl;
  if (digitalCardImageUrl) {
    [v3 setObject:digitalCardImageUrl forKey:@"digitalCardImageUrl"];
  }
  thumbnailImageUrl = self->_thumbnailImageUrl;
  if (thumbnailImageUrl) {
    [v4 setObject:thumbnailImageUrl forKey:@"thumbnailImageUrl"];
  }
  logoImageUrl = self->_logoImageUrl;
  if (logoImageUrl) {
    [v4 setObject:logoImageUrl forKey:@"logoImageUrl"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentSetupProductImageAssetURLsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_digitalCardImageUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_thumbnailImageUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_logoImageUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_digitalCardImageUrl)
  {
    objc_msgSend(v4, "setDigitalCardImageUrl:");
    id v4 = v5;
  }
  if (self->_thumbnailImageUrl)
  {
    objc_msgSend(v5, "setThumbnailImageUrl:");
    id v4 = v5;
  }
  if (self->_logoImageUrl)
  {
    objc_msgSend(v5, "setLogoImageUrl:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_digitalCardImageUrl copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_thumbnailImageUrl copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_logoImageUrl copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((digitalCardImageUrl = self->_digitalCardImageUrl, !((unint64_t)digitalCardImageUrl | v4[1]))
     || -[NSString isEqual:](digitalCardImageUrl, "isEqual:"))
    && ((thumbnailImageUrl = self->_thumbnailImageUrl, !((unint64_t)thumbnailImageUrl | v4[3]))
     || -[NSString isEqual:](thumbnailImageUrl, "isEqual:")))
  {
    logoImageUrl = self->_logoImageUrl;
    if ((unint64_t)logoImageUrl | v4[2]) {
      char v8 = -[NSString isEqual:](logoImageUrl, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_digitalCardImageUrl hash];
  NSUInteger v4 = [(NSString *)self->_thumbnailImageUrl hash] ^ v3;
  return v4 ^ [(NSString *)self->_logoImageUrl hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[NPKProtoStandalonePaymentSetupProductImageAssetURLs setDigitalCardImageUrl:](self, "setDigitalCardImageUrl:");
  }
  if (v4[3]) {
    -[NPKProtoStandalonePaymentSetupProductImageAssetURLs setThumbnailImageUrl:](self, "setThumbnailImageUrl:");
  }
  if (v4[2]) {
    -[NPKProtoStandalonePaymentSetupProductImageAssetURLs setLogoImageUrl:](self, "setLogoImageUrl:");
  }
}

- (NSString)digitalCardImageUrl
{
  return self->_digitalCardImageUrl;
}

- (void)setDigitalCardImageUrl:(id)a3
{
}

- (NSString)thumbnailImageUrl
{
  return self->_thumbnailImageUrl;
}

- (void)setThumbnailImageUrl:(id)a3
{
}

- (NSString)logoImageUrl
{
  return self->_logoImageUrl;
}

- (void)setLogoImageUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImageUrl, 0);
  objc_storeStrong((id *)&self->_logoImageUrl, 0);
  objc_storeStrong((id *)&self->_digitalCardImageUrl, 0);
}

@end