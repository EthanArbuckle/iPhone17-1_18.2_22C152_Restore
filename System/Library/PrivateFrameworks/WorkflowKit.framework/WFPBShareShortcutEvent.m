@interface WFPBShareShortcutEvent
- (BOOL)hasActionCount;
- (BOOL)hasAddToSiriBundleIdentifier;
- (BOOL)hasGalleryIdentifier;
- (BOOL)hasKey;
- (BOOL)hasSharingDestinationBundleIdentifier;
- (BOOL)hasSharingMode;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)addToSiriBundleIdentifier;
- (NSString)galleryIdentifier;
- (NSString)key;
- (NSString)sharingDestinationBundleIdentifier;
- (NSString)sharingMode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sourceAsString:(int)a3;
- (int)StringAsSource:(id)a3;
- (int)source;
- (unint64_t)hash;
- (unsigned)actionCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionCount:(unsigned int)a3;
- (void)setAddToSiriBundleIdentifier:(id)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setHasActionCount:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSharingDestinationBundleIdentifier:(id)a3;
- (void)setSharingMode:(id)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBShareShortcutEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingMode, 0);
  objc_storeStrong((id *)&self->_sharingDestinationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
}

- (void)setSharingMode:(id)a3
{
}

- (void)setSharingDestinationBundleIdentifier:(id)a3
{
}

- (NSString)sharingDestinationBundleIdentifier
{
  return self->_sharingDestinationBundleIdentifier;
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
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[WFPBShareShortcutEvent setKey:](self, "setKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 2) != 0)
  {
    self->_source = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 60);
  }
  if (v5)
  {
    self->_actionCount = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBShareShortcutEvent setAddToSiriBundleIdentifier:](self, "setAddToSiriBundleIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBShareShortcutEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[WFPBShareShortcutEvent setSharingDestinationBundleIdentifier:](self, "setSharingDestinationBundleIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[WFPBShareShortcutEvent setSharingMode:](self, "setSharingMode:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_source;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_actionCount;
LABEL_6:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_addToSiriBundleIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_galleryIdentifier hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_sharingDestinationBundleIdentifier hash];
  return v6 ^ v8 ^ [(NSString *)self->_sharingMode hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_source != *((_DWORD *)v4 + 14)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_22:
    char v10 = 0;
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_actionCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_22;
  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if ((unint64_t)addToSiriBundleIdentifier | *((void *)v4 + 2)
    && !-[NSString isEqual:](addToSiriBundleIdentifier, "isEqual:"))
  {
    goto LABEL_22;
  }
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](galleryIdentifier, "isEqual:")) {
      goto LABEL_22;
    }
  }
  sharingDestinationBundleIdentifier = self->_sharingDestinationBundleIdentifier;
  if ((unint64_t)sharingDestinationBundleIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](sharingDestinationBundleIdentifier, "isEqual:")) {
      goto LABEL_22;
    }
  }
  sharingMode = self->_sharingMode;
  if ((unint64_t)sharingMode | *((void *)v4 + 6)) {
    char v10 = -[NSString isEqual:](sharingMode, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_23:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_source;
    *(unsigned char *)(v5 + 60) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_actionCount;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_addToSiriBundleIdentifier copyWithZone:a3];
  char v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  uint64_t v11 = [(NSString *)self->_galleryIdentifier copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  uint64_t v13 = [(NSString *)self->_sharingDestinationBundleIdentifier copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  uint64_t v15 = [(NSString *)self->_sharingMode copyWithZone:a3];
  v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_source;
    *((unsigned char *)v4 + 60) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_actionCount;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  if (self->_addToSiriBundleIdentifier)
  {
    objc_msgSend(v6, "setAddToSiriBundleIdentifier:");
    id v4 = v6;
  }
  if (self->_galleryIdentifier)
  {
    objc_msgSend(v6, "setGalleryIdentifier:");
    id v4 = v6;
  }
  if (self->_sharingDestinationBundleIdentifier)
  {
    objc_msgSend(v6, "setSharingDestinationBundleIdentifier:");
    id v4 = v6;
  }
  if (self->_sharingMode)
  {
    objc_msgSend(v6, "setSharingMode:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_addToSiriBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_galleryIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_sharingDestinationBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_sharingMode)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBShareShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v7 = self->_source + 1;
    if (v7 >= 0xE)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_source);
      NSUInteger v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSUInteger v8 = off_1E6556FD0[v7];
    }
    [v4 setObject:v8 forKey:@"source"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInt:self->_actionCount];
    [v4 setObject:v9 forKey:@"actionCount"];
  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if (addToSiriBundleIdentifier) {
    [v4 setObject:addToSiriBundleIdentifier forKey:@"addToSiriBundleIdentifier"];
  }
  galleryIdentifier = self->_galleryIdentifier;
  if (galleryIdentifier) {
    [v4 setObject:galleryIdentifier forKey:@"galleryIdentifier"];
  }
  sharingDestinationBundleIdentifier = self->_sharingDestinationBundleIdentifier;
  if (sharingDestinationBundleIdentifier) {
    [v4 setObject:sharingDestinationBundleIdentifier forKey:@"sharingDestinationBundleIdentifier"];
  }
  sharingMode = self->_sharingMode;
  if (sharingMode) {
    [v4 setObject:sharingMode forKey:@"sharingMode"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBShareShortcutEvent;
  id v4 = [(WFPBShareShortcutEvent *)&v8 description];
  uint64_t v5 = [(WFPBShareShortcutEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSharingMode
{
  return self->_sharingMode != 0;
}

- (NSString)sharingMode
{
  if (self->_sharingMode) {
    return self->_sharingMode;
  }
  else {
    return (NSString *)@"ShortcutSharingModeUnknown";
  }
}

- (BOOL)hasSharingDestinationBundleIdentifier
{
  return self->_sharingDestinationBundleIdentifier != 0;
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
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setActionCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_actionCount = a3;
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ShortcutSourceUnknown"])
  {
    int v4 = -1;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceOnDevice"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceGallery"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceAddToSiri"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceCloudLink"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceDefaultShortcut"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceSiriTopLevelShortcut"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceAutomatorMigration"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceFilePublic"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceFileKnownContacts"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceFilePersonal"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceEditorDocumentMenu"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceAppShortcut"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ShortcutSourceActiveStarterShortcut"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = -1;
  }

  return v4;
}

- (id)sourceAsString:(int)a3
{
  if ((a3 + 1) >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6556FD0[a3 + 1];
  }
  return v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_source = a3;
}

- (int)source
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_source;
  }
  else {
    return -1;
  }
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
    return (NSString *)@"ShareShortcut";
  }
}

@end