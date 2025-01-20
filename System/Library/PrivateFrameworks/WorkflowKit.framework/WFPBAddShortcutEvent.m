@interface WFPBAddShortcutEvent
- (BOOL)hasActionCount;
- (BOOL)hasAddToSiriBundleIdentifier;
- (BOOL)hasGalleryIdentifier;
- (BOOL)hasKey;
- (BOOL)hasShortcutSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)addToSiriBundleIdentifier;
- (NSString)galleryIdentifier;
- (NSString)key;
- (NSString)shortcutSource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)actionCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionCount:(unsigned int)a3;
- (void)setAddToSiriBundleIdentifier:(id)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setHasActionCount:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setShortcutSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBAddShortcutEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
}

- (void)setShortcutSource:(id)a3
{
}

- (NSString)shortcutSource
{
  return self->_shortcutSource;
}

- (void)setGalleryIdentifier:(id)a3
{
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setAddToSiriBundleIdentifier:(id)a3
{
}

- (NSString)addToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier;
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[WFPBAddShortcutEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (v4[12])
  {
    self->_actionCount = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBAddShortcutEvent setAddToSiriBundleIdentifier:](self, "setAddToSiriBundleIdentifier:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBAddShortcutEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[WFPBAddShortcutEvent setShortcutSource:](self, "setShortcutSource:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_actionCount;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_addToSiriBundleIdentifier hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_galleryIdentifier hash];
  return v7 ^ [(NSString *)self->_shortcutSource hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_actionCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if ((unint64_t)addToSiriBundleIdentifier | *((void *)v4 + 2)
    && !-[NSString isEqual:](addToSiriBundleIdentifier, "isEqual:"))
  {
    goto LABEL_15;
  }
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](galleryIdentifier, "isEqual:")) {
      goto LABEL_15;
    }
  }
  shortcutSource = self->_shortcutSource;
  if ((unint64_t)shortcutSource | *((void *)v4 + 5)) {
    char v9 = -[NSString isEqual:](shortcutSource, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_actionCount;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_addToSiriBundleIdentifier copyWithZone:a3];
  char v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_galleryIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_shortcutSource copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  return (id)v5;
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
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_actionCount;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_addToSiriBundleIdentifier)
  {
    objc_msgSend(v5, "setAddToSiriBundleIdentifier:");
    id v4 = v5;
  }
  if (self->_galleryIdentifier)
  {
    objc_msgSend(v5, "setGalleryIdentifier:");
    id v4 = v5;
  }
  if (self->_shortcutSource)
  {
    objc_msgSend(v5, "setShortcutSource:");
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_addToSiriBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_galleryIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_shortcutSource)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBAddShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithUnsignedInt:self->_actionCount];
    [v4 setObject:v6 forKey:@"actionCount"];
  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if (addToSiriBundleIdentifier) {
    [v4 setObject:addToSiriBundleIdentifier forKey:@"addToSiriBundleIdentifier"];
  }
  galleryIdentifier = self->_galleryIdentifier;
  if (galleryIdentifier) {
    [v4 setObject:galleryIdentifier forKey:@"galleryIdentifier"];
  }
  shortcutSource = self->_shortcutSource;
  if (shortcutSource) {
    [v4 setObject:shortcutSource forKey:@"shortcutSource"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBAddShortcutEvent;
  id v4 = [(WFPBAddShortcutEvent *)&v8 description];
  id v5 = [(WFPBAddShortcutEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasShortcutSource
{
  return self->_shortcutSource != 0;
}

- (BOOL)hasGalleryIdentifier
{
  return self->_galleryIdentifier != 0;
}

- (BOOL)hasAddToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier != 0;
}

- (BOOL)hasActionCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasActionCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setActionCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_actionCount = a3;
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
    return (NSString *)@"AddShortcut";
  }
}

@end