@interface PKProtobufPaymentContentItem
- (BOOL)centered;
- (BOOL)hasCentered;
- (BOOL)hasImage;
- (BOOL)hasImageRequest;
- (BOOL)hasLabel;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)image;
- (NSData)imageRequest;
- (NSData)label;
- (NSData)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCentered:(BOOL)a3;
- (void)setHasCentered:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageRequest:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentContentItem

- (BOOL)hasImageRequest
{
  return self->_imageRequest != 0;
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (void)setCentered:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_centered = a3;
}

- (void)setHasCentered:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCentered
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentContentItem;
  v4 = [(PKProtobufPaymentContentItem *)&v8 description];
  v5 = [(PKProtobufPaymentContentItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  imageRequest = self->_imageRequest;
  if (imageRequest) {
    [v3 setObject:imageRequest forKey:@"imageRequest"];
  }
  image = self->_image;
  if (image) {
    [v4 setObject:image forKey:@"image"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  label = self->_label;
  if (label) {
    [v4 setObject:label forKey:@"label"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithBool:self->_centered];
    [v4 setObject:v9 forKey:@"centered"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentContentItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_imageRequest)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_image)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_label)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_imageRequest)
  {
    objc_msgSend(v4, "setImageRequest:");
    id v4 = v5;
  }
  if (self->_image)
  {
    objc_msgSend(v5, "setImage:");
    id v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    id v4 = v5;
  }
  if (self->_label)
  {
    objc_msgSend(v5, "setLabel:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[40] = self->_centered;
    v4[44] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_imageRequest copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSData *)self->_image copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSData *)self->_title copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSData *)self->_label copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_centered;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  imageRequest = self->_imageRequest;
  if ((unint64_t)imageRequest | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](imageRequest, "isEqual:")) {
      goto LABEL_12;
    }
  }
  image = self->_image;
  if ((unint64_t)image | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](image, "isEqual:")) {
      goto LABEL_12;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](title, "isEqual:")) {
      goto LABEL_12;
    }
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](label, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 44) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0)
    {
LABEL_12:
      BOOL v9 = 0;
      goto LABEL_13;
    }
    if (self->_centered)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_12;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_12;
    }
    BOOL v9 = 1;
  }
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_imageRequest hash];
  uint64_t v4 = [(NSData *)self->_image hash];
  uint64_t v5 = [(NSData *)self->_title hash];
  uint64_t v6 = [(NSData *)self->_label hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_centered;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[PKProtobufPaymentContentItem setImageRequest:](self, "setImageRequest:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[PKProtobufPaymentContentItem setImage:](self, "setImage:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[PKProtobufPaymentContentItem setTitle:](self, "setTitle:");
    uint64_t v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[PKProtobufPaymentContentItem setLabel:](self, "setLabel:");
    uint64_t v4 = v5;
  }
  if (v4[44])
  {
    self->_centered = v4[40];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)imageRequest
{
  return self->_imageRequest;
}

- (void)setImageRequest:(id)a3
{
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSData)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSData)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)centered
{
  return self->_centered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageRequest, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end