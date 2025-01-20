@interface WFPBSetupGalleryShortcutEvent
- (BOOL)completed;
- (BOOL)hasAddToSiriBundleIdentifier;
- (BOOL)hasCompleted;
- (BOOL)hasGalleryCategoryIdentifier;
- (BOOL)hasGalleryIdentifier;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)addToSiriBundleIdentifier;
- (NSString)galleryCategoryIdentifier;
- (NSString)galleryIdentifier;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddToSiriBundleIdentifier:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setGalleryCategoryIdentifier:(id)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBSetupGalleryShortcutEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_galleryCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setAddToSiriBundleIdentifier:(id)a3
{
}

- (NSString)addToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
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
  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[WFPBSetupGalleryShortcutEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBSetupGalleryShortcutEvent setGalleryCategoryIdentifier:](self, "setGalleryCategoryIdentifier:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBSetupGalleryShortcutEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBSetupGalleryShortcutEvent setAddToSiriBundleIdentifier:](self, "setAddToSiriBundleIdentifier:");
    v4 = v5;
  }
  if (v4[44])
  {
    self->_completed = v4[40];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_galleryCategoryIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_galleryIdentifier hash];
  NSUInteger v6 = [(NSString *)self->_addToSiriBundleIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_completed;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_12;
    }
  }
  galleryCategoryIdentifier = self->_galleryCategoryIdentifier;
  if ((unint64_t)galleryCategoryIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](galleryCategoryIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](galleryIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if ((unint64_t)addToSiriBundleIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](addToSiriBundleIdentifier, "isEqual:")) {
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
    if (self->_completed)
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_galleryCategoryIdentifier copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_galleryIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_addToSiriBundleIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_completed;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
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
  if (self->_galleryIdentifier)
  {
    objc_msgSend(v5, "setGalleryIdentifier:");
    id v4 = v5;
  }
  if (self->_addToSiriBundleIdentifier)
  {
    objc_msgSend(v5, "setAddToSiriBundleIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[40] = self->_completed;
    v4[44] |= 1u;
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
  if (self->_galleryIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_addToSiriBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBSetupGalleryShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  galleryIdentifier = self->_galleryIdentifier;
  if (galleryIdentifier) {
    [v4 setObject:galleryIdentifier forKey:@"galleryIdentifier"];
  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if (addToSiriBundleIdentifier) {
    [v4 setObject:addToSiriBundleIdentifier forKey:@"addToSiriBundleIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    BOOL v9 = [NSNumber numberWithBool:self->_completed];
    [v4 setObject:v9 forKey:@"completed"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBSetupGalleryShortcutEvent;
  id v4 = [(WFPBSetupGalleryShortcutEvent *)&v8 description];
  id v5 = [(WFPBSetupGalleryShortcutEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCompleted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_completed = a3;
}

- (BOOL)hasAddToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier != 0;
}

- (BOOL)hasGalleryIdentifier
{
  return self->_galleryIdentifier != 0;
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
    return (NSString *)@"SetupGalleryShortcut";
  }
}

@end