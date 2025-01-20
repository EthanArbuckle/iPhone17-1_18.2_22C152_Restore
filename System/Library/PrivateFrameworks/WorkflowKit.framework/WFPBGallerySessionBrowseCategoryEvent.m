@interface WFPBGallerySessionBrowseCategoryEvent
- (BOOL)hasGalleryCategoryIdentifier;
- (BOOL)hasKey;
- (BOOL)hasSessionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)galleryCategoryIdentifier;
- (NSString)key;
- (NSString)sessionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGalleryCategoryIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBGallerySessionBrowseCategoryEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
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

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[2]) {
    -[WFPBGallerySessionBrowseCategoryEvent setKey:](self, "setKey:");
  }
  if (v4[3]) {
    -[WFPBGallerySessionBrowseCategoryEvent setSessionIdentifier:](self, "setSessionIdentifier:");
  }
  if (v4[1]) {
    -[WFPBGallerySessionBrowseCategoryEvent setGalleryCategoryIdentifier:](self, "setGalleryCategoryIdentifier:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_sessionIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_galleryCategoryIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[2])) || -[NSString isEqual:](key, "isEqual:"))
    && ((sessionIdentifier = self->_sessionIdentifier, !((unint64_t)sessionIdentifier | v4[3]))
     || -[NSString isEqual:](sessionIdentifier, "isEqual:")))
  {
    galleryCategoryIdentifier = self->_galleryCategoryIdentifier;
    if ((unint64_t)galleryCategoryIdentifier | v4[1]) {
      char v8 = -[NSString isEqual:](galleryCategoryIdentifier, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_galleryCategoryIdentifier copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

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
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v5, "setSessionIdentifier:");
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
  if (self->_sessionIdentifier)
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
  return WFPBGallerySessionBrowseCategoryEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v4 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
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
  v8.super_class = (Class)WFPBGallerySessionBrowseCategoryEvent;
  id v4 = [(WFPBGallerySessionBrowseCategoryEvent *)&v8 description];
  id v5 = [(WFPBGallerySessionBrowseCategoryEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasGalleryCategoryIdentifier
{
  return self->_galleryCategoryIdentifier != 0;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
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
    return (NSString *)@"GallerySessionBrowseCategory";
  }
}

@end