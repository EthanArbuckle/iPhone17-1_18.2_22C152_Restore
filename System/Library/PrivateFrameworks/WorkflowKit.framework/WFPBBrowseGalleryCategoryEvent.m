@interface WFPBBrowseGalleryCategoryEvent
- (BOOL)hasGalleryCategoryIdentifier;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)galleryCategoryIdentifier;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGalleryCategoryIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBBrowseGalleryCategoryEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryCategoryIdentifier, 0);
}

- (void)setGalleryCategoryIdentifier:(id)a3
{
}

- (NSString)galleryCategoryIdentifier
{
  return self->_galleryCategoryIdentifier;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[WFPBBrowseGalleryCategoryEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[WFPBBrowseGalleryCategoryEvent setGalleryCategoryIdentifier:](self, "setGalleryCategoryIdentifier:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  return [(NSString *)self->_galleryCategoryIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[2])) || -[NSString isEqual:](key, "isEqual:")))
  {
    galleryCategoryIdentifier = self->_galleryCategoryIdentifier;
    if ((unint64_t)galleryCategoryIdentifier | v4[1]) {
      char v7 = -[NSString isEqual:](galleryCategoryIdentifier, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_galleryCategoryIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (self->_galleryCategoryIdentifier)
  {
    objc_msgSend(v5, "setGalleryCategoryIdentifier:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_galleryCategoryIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBBrowseGalleryCategoryEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  galleryCategoryIdentifier = self->_galleryCategoryIdentifier;
  if (galleryCategoryIdentifier) {
    [v4 setObject:galleryCategoryIdentifier forKey:@"galleryCategoryIdentifier"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBBrowseGalleryCategoryEvent;
  id v4 = [(WFPBBrowseGalleryCategoryEvent *)&v8 description];
  id v5 = [(WFPBBrowseGalleryCategoryEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasGalleryCategoryIdentifier
{
  return self->_galleryCategoryIdentifier != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"BrowseGalleryCategory";
  }
}

@end