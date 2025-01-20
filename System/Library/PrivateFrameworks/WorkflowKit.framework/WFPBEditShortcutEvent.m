@interface WFPBEditShortcutEvent
- (BOOL)hasActionCount;
- (BOOL)hasAddToSiriBundleIdentifier;
- (BOOL)hasGalleryIdentifier;
- (BOOL)hasKey;
- (BOOL)hasNumberOfEngagedSuggestions;
- (BOOL)hasNumberOfManuallyAddedActions;
- (BOOL)hasNumberOfRejectedSuggestions;
- (BOOL)hasNumberOfShownSuggestions;
- (BOOL)hasShortcutSource;
- (BOOL)hasStartingActionCount;
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
- (unsigned)numberOfEngagedSuggestions;
- (unsigned)numberOfManuallyAddedActions;
- (unsigned)numberOfRejectedSuggestions;
- (unsigned)numberOfShownSuggestions;
- (unsigned)startingActionCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionCount:(unsigned int)a3;
- (void)setAddToSiriBundleIdentifier:(id)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setHasActionCount:(BOOL)a3;
- (void)setHasNumberOfEngagedSuggestions:(BOOL)a3;
- (void)setHasNumberOfManuallyAddedActions:(BOOL)a3;
- (void)setHasNumberOfRejectedSuggestions:(BOOL)a3;
- (void)setHasNumberOfShownSuggestions:(BOOL)a3;
- (void)setHasStartingActionCount:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setNumberOfEngagedSuggestions:(unsigned int)a3;
- (void)setNumberOfManuallyAddedActions:(unsigned int)a3;
- (void)setNumberOfRejectedSuggestions:(unsigned int)a3;
- (void)setNumberOfShownSuggestions:(unsigned int)a3;
- (void)setShortcutSource:(id)a3;
- (void)setStartingActionCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBEditShortcutEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
}

- (unsigned)startingActionCount
{
  return self->_startingActionCount;
}

- (unsigned)numberOfManuallyAddedActions
{
  return self->_numberOfManuallyAddedActions;
}

- (unsigned)numberOfRejectedSuggestions
{
  return self->_numberOfRejectedSuggestions;
}

- (unsigned)numberOfEngagedSuggestions
{
  return self->_numberOfEngagedSuggestions;
}

- (unsigned)numberOfShownSuggestions
{
  return self->_numberOfShownSuggestions;
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
  v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[WFPBEditShortcutEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (v4[17])
  {
    self->_actionCount = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBEditShortcutEvent setAddToSiriBundleIdentifier:](self, "setAddToSiriBundleIdentifier:");
    v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBEditShortcutEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[WFPBEditShortcutEvent setShortcutSource:](self, "setShortcutSource:");
    v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 0x10) != 0)
  {
    self->_numberOfShownSuggestions = v4[13];
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 68);
    if ((v5 & 2) == 0)
    {
LABEL_13:
      if ((v5 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_22;
    }
  }
  else if ((v4[17] & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_numberOfEngagedSuggestions = v4[10];
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_14:
    if ((v5 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_numberOfRejectedSuggestions = v4[12];
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 4) == 0)
  {
LABEL_15:
    if ((v5 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_23:
  self->_numberOfManuallyAddedActions = v4[11];
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[17] & 0x20) != 0)
  {
LABEL_16:
    self->_startingActionCount = v4[16];
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_17:
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
  NSUInteger v5 = [(NSString *)self->_addToSiriBundleIdentifier hash];
  NSUInteger v6 = [(NSString *)self->_galleryIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_shortcutSource hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v8 = 2654435761 * self->_numberOfShownSuggestions;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      uint64_t v9 = 2654435761 * self->_numberOfEngagedSuggestions;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_numberOfRejectedSuggestions;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_12:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v11 = 2654435761 * self->_numberOfManuallyAddedActions;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v12 = 2654435761 * self->_startingActionCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_39;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_39;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_actionCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
LABEL_39:
    BOOL v9 = 0;
    goto LABEL_40;
  }
  addToSiriBundleIdentifier = self->_addToSiriBundleIdentifier;
  if ((unint64_t)addToSiriBundleIdentifier | *((void *)v4 + 2)
    && !-[NSString isEqual:](addToSiriBundleIdentifier, "isEqual:"))
  {
    goto LABEL_39;
  }
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](galleryIdentifier, "isEqual:")) {
      goto LABEL_39;
    }
  }
  shortcutSource = self->_shortcutSource;
  if ((unint64_t)shortcutSource | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](shortcutSource, "isEqual:")) {
      goto LABEL_39;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x10) == 0 || self->_numberOfShownSuggestions != *((_DWORD *)v4 + 13)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_numberOfEngagedSuggestions != *((_DWORD *)v4 + 10)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0 || self->_numberOfRejectedSuggestions != *((_DWORD *)v4 + 12)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_numberOfManuallyAddedActions != *((_DWORD *)v4 + 11)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_39;
  }
  BOOL v9 = (*((unsigned char *)v4 + 68) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x20) == 0 || self->_startingActionCount != *((_DWORD *)v4 + 16)) {
      goto LABEL_39;
    }
    BOOL v9 = 1;
  }
LABEL_40:

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
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_addToSiriBundleIdentifier copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_galleryIdentifier copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_shortcutSource copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_numberOfShownSuggestions;
    *(unsigned char *)(v5 + 68) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 40) = self->_numberOfEngagedSuggestions;
  *(unsigned char *)(v5 + 68) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(_DWORD *)(v5 + 44) = self->_numberOfManuallyAddedActions;
    *(unsigned char *)(v5 + 68) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return (id)v5;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v5 + 48) = self->_numberOfRejectedSuggestions;
  *(unsigned char *)(v5 + 68) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 64) = self->_startingActionCount;
    *(unsigned char *)(v5 + 68) |= 0x20u;
  }
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
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_actionCount;
    *((unsigned char *)v4 + 68) |= 1u;
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
  if (self->_shortcutSource)
  {
    objc_msgSend(v6, "setShortcutSource:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_numberOfShownSuggestions;
    *((unsigned char *)v4 + 68) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 10) = self->_numberOfEngagedSuggestions;
  *((unsigned char *)v4 + 68) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 12) = self->_numberOfRejectedSuggestions;
  *((unsigned char *)v4 + 68) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_23:
  *((_DWORD *)v4 + 11) = self->_numberOfManuallyAddedActions;
  *((unsigned char *)v4 + 68) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 16) = self->_startingActionCount;
    *((unsigned char *)v4 + 68) |= 0x20u;
  }
LABEL_17:
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
  if (*(unsigned char *)&self->_has)
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
  if (self->_shortcutSource)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_16:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_17:
}

- (BOOL)readFrom:(id)a3
{
  return WFPBEditShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
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
    id v6 = [NSNumber numberWithUnsignedInt:self->_actionCount];
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
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v13 = [NSNumber numberWithUnsignedInt:self->_numberOfShownSuggestions];
    [v4 setObject:v13 forKey:@"numberOfShownSuggestions"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  v14 = [NSNumber numberWithUnsignedInt:self->_numberOfEngagedSuggestions];
  [v4 setObject:v14 forKey:@"numberOfEngagedSuggestions"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  v15 = [NSNumber numberWithUnsignedInt:self->_numberOfRejectedSuggestions];
  [v4 setObject:v15 forKey:@"numberOfRejectedSuggestions"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_23:
  v16 = [NSNumber numberWithUnsignedInt:self->_numberOfManuallyAddedActions];
  [v4 setObject:v16 forKey:@"numberOfManuallyAddedActions"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_16:
    uint64_t v11 = [NSNumber numberWithUnsignedInt:self->_startingActionCount];
    [v4 setObject:v11 forKey:@"startingActionCount"];
  }
LABEL_17:
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBEditShortcutEvent;
  id v4 = [(WFPBEditShortcutEvent *)&v8 description];
  uint64_t v5 = [(WFPBEditShortcutEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasStartingActionCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasStartingActionCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setStartingActionCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_startingActionCount = a3;
}

- (BOOL)hasNumberOfManuallyAddedActions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNumberOfManuallyAddedActions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNumberOfManuallyAddedActions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numberOfManuallyAddedActions = a3;
}

- (BOOL)hasNumberOfRejectedSuggestions
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasNumberOfRejectedSuggestions:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setNumberOfRejectedSuggestions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numberOfRejectedSuggestions = a3;
}

- (BOOL)hasNumberOfEngagedSuggestions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNumberOfEngagedSuggestions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNumberOfEngagedSuggestions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numberOfEngagedSuggestions = a3;
}

- (BOOL)hasNumberOfShownSuggestions
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasNumberOfShownSuggestions:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setNumberOfShownSuggestions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_numberOfShownSuggestions = a3;
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
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
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
    return (NSString *)@"EditShortcut";
  }
}

@end