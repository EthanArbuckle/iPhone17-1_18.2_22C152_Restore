@interface NPKProtoStandalonePaymentSetupMoreInfoItem
- (BOOL)hasBody;
- (BOOL)hasImageData;
- (BOOL)hasImageURL;
- (BOOL)hasLinkText;
- (BOOL)hasLinkURL;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)imageData;
- (NSString)body;
- (NSString)imageURL;
- (NSString)linkText;
- (NSString)linkURL;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBody:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setLinkText:(id)a3;
- (void)setLinkURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentSetupMoreInfoItem

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (BOOL)hasLinkText
{
  return self->_linkText != 0;
}

- (BOOL)hasLinkURL
{
  return self->_linkURL != 0;
}

- (BOOL)hasImageURL
{
  return self->_imageURL != 0;
}

- (BOOL)hasImageData
{
  return self->_imageData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentSetupMoreInfoItem;
  v4 = [(NPKProtoStandalonePaymentSetupMoreInfoItem *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentSetupMoreInfoItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  body = self->_body;
  if (body) {
    [v4 setObject:body forKey:@"body"];
  }
  linkText = self->_linkText;
  if (linkText) {
    [v4 setObject:linkText forKey:@"linkText"];
  }
  linkURL = self->_linkURL;
  if (linkURL) {
    [v4 setObject:linkURL forKey:@"linkURL"];
  }
  imageURL = self->_imageURL;
  if (imageURL) {
    [v4 setObject:imageURL forKey:@"imageURL"];
  }
  imageData = self->_imageData;
  if (imageData) {
    [v4 setObject:imageData forKey:@"imageData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentSetupMoreInfoItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_body)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_linkText)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_linkURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_imageURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_imageData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    id v4 = v5;
  }
  if (self->_body)
  {
    objc_msgSend(v5, "setBody:");
    id v4 = v5;
  }
  if (self->_linkText)
  {
    objc_msgSend(v5, "setLinkText:");
    id v4 = v5;
  }
  if (self->_linkURL)
  {
    objc_msgSend(v5, "setLinkURL:");
    id v4 = v5;
  }
  if (self->_imageURL)
  {
    objc_msgSend(v5, "setImageURL:");
    id v4 = v5;
  }
  if (self->_imageData)
  {
    objc_msgSend(v5, "setImageData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  v7 = (void *)v5[6];
  v5[6] = v6;

  uint64_t v8 = [(NSString *)self->_body copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_linkText copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSString *)self->_linkURL copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  uint64_t v14 = [(NSString *)self->_imageURL copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  uint64_t v16 = [(NSData *)self->_imageData copyWithZone:a3];
  v17 = (void *)v5[2];
  v5[2] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((title = self->_title, !((unint64_t)title | v4[6]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((body = self->_body, !((unint64_t)body | v4[1])) || -[NSString isEqual:](body, "isEqual:"))
    && ((linkText = self->_linkText, !((unint64_t)linkText | v4[4]))
     || -[NSString isEqual:](linkText, "isEqual:"))
    && ((linkURL = self->_linkURL, !((unint64_t)linkURL | v4[5]))
     || -[NSString isEqual:](linkURL, "isEqual:"))
    && ((imageURL = self->_imageURL, !((unint64_t)imageURL | v4[3]))
     || -[NSString isEqual:](imageURL, "isEqual:")))
  {
    imageData = self->_imageData;
    if ((unint64_t)imageData | v4[2]) {
      char v11 = -[NSData isEqual:](imageData, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_body hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_linkText hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_linkURL hash];
  NSUInteger v7 = [(NSString *)self->_imageURL hash];
  return v6 ^ v7 ^ [(NSData *)self->_imageData hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[6]) {
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setTitle:](self, "setTitle:");
  }
  if (v4[1]) {
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setBody:](self, "setBody:");
  }
  if (v4[4]) {
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setLinkText:](self, "setLinkText:");
  }
  if (v4[5]) {
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setLinkURL:](self, "setLinkURL:");
  }
  if (v4[3]) {
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setImageURL:](self, "setImageURL:");
  }
  if (v4[2]) {
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setImageData:](self, "setImageData:");
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)linkText
{
  return self->_linkText;
}

- (void)setLinkText:(id)a3
{
}

- (NSString)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
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
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end