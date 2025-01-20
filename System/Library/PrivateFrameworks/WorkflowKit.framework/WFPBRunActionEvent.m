@interface WFPBRunActionEvent
- (BOOL)completed;
- (BOOL)didRunRemotely;
- (BOOL)hasActionIdentifier;
- (BOOL)hasAutomationType;
- (BOOL)hasCompleted;
- (BOOL)hasDidRunRemotely;
- (BOOL)hasExternalActionIdentifier;
- (BOOL)hasExternalBundleIdentifier;
- (BOOL)hasGalleryIdentifier;
- (BOOL)hasIsInvalidatedSystemAction;
- (BOOL)hasKey;
- (BOOL)hasRunSource;
- (BOOL)hasShortcutSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInvalidatedSystemAction;
- (BOOL)readFrom:(id)a3;
- (NSString)actionIdentifier;
- (NSString)automationType;
- (NSString)externalActionIdentifier;
- (NSString)externalBundleIdentifier;
- (NSString)galleryIdentifier;
- (NSString)key;
- (NSString)runSource;
- (NSString)shortcutSource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setAutomationType:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setDidRunRemotely:(BOOL)a3;
- (void)setExternalActionIdentifier:(id)a3;
- (void)setExternalBundleIdentifier:(id)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setHasDidRunRemotely:(BOOL)a3;
- (void)setHasIsInvalidatedSystemAction:(BOOL)a3;
- (void)setIsInvalidatedSystemAction:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setRunSource:(id)a3;
- (void)setShortcutSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBRunActionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_externalBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_externalActionIdentifier, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (void)setExternalActionIdentifier:(id)a3
{
}

- (NSString)externalActionIdentifier
{
  return self->_externalActionIdentifier;
}

- (void)setExternalBundleIdentifier:(id)a3
{
}

- (NSString)externalBundleIdentifier
{
  return self->_externalBundleIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (BOOL)isInvalidatedSystemAction
{
  return self->_isInvalidatedSystemAction;
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
}

- (void)setAutomationType:(id)a3
{
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setShortcutSource:(id)a3
{
}

- (NSString)shortcutSource
{
  return self->_shortcutSource;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setRunSource:(id)a3
{
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[WFPBRunActionEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[WFPBRunActionEvent setRunSource:](self, "setRunSource:");
    v4 = v6;
  }
  if (v4[76])
  {
    self->_completed = v4[72];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBRunActionEvent setActionIdentifier:](self, "setActionIdentifier:");
    v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[WFPBRunActionEvent setShortcutSource:](self, "setShortcutSource:");
    v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBRunActionEvent setAutomationType:](self, "setAutomationType:");
    v4 = v6;
  }
  BOOL v5 = v4[76];
  if ((v5 & 2) != 0)
  {
    self->_didRunRemotely = v4[73];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v5 = v4[76];
  }
  if ((v5 & 4) != 0)
  {
    self->_isInvalidatedSystemAction = v4[74];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 5))
  {
    -[WFPBRunActionEvent setGalleryIdentifier:](self, "setGalleryIdentifier:");
    v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[WFPBRunActionEvent setExternalBundleIdentifier:](self, "setExternalBundleIdentifier:");
    v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBRunActionEvent setExternalActionIdentifier:](self, "setExternalActionIdentifier:");
    v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_runSource hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_completed;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_actionIdentifier hash];
  NSUInteger v7 = [(NSString *)self->_shortcutSource hash];
  NSUInteger v8 = [(NSString *)self->_automationType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v9 = 2654435761 * self->_didRunRemotely;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v10 = 2654435761 * self->_isInvalidatedSystemAction;
LABEL_9:
  NSUInteger v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  NSUInteger v12 = v10 ^ [(NSString *)self->_galleryIdentifier hash];
  NSUInteger v13 = v12 ^ [(NSString *)self->_externalBundleIdentifier hash];
  return v11 ^ v13 ^ [(NSString *)self->_externalActionIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_42;
    }
  }
  runSource = self->_runSource;
  if ((unint64_t)runSource | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](runSource, "isEqual:")) {
      goto LABEL_42;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0) {
      goto LABEL_42;
    }
    if (self->_completed)
    {
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)v4 + 72))
    {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_42;
  }
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((void *)v4 + 1)
    && !-[NSString isEqual:](actionIdentifier, "isEqual:"))
  {
    goto LABEL_42;
  }
  shortcutSource = self->_shortcutSource;
  if ((unint64_t)shortcutSource | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](shortcutSource, "isEqual:")) {
      goto LABEL_42;
    }
  }
  automationType = self->_automationType;
  if ((unint64_t)automationType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](automationType, "isEqual:")) {
      goto LABEL_42;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0) {
      goto LABEL_42;
    }
    if (self->_didRunRemotely)
    {
      if (!*((unsigned char *)v4 + 73)) {
        goto LABEL_42;
      }
    }
    else if (*((unsigned char *)v4 + 73))
    {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 4) != 0)
    {
      if (self->_isInvalidatedSystemAction)
      {
        if (!*((unsigned char *)v4 + 74)) {
          goto LABEL_42;
        }
        goto LABEL_36;
      }
      if (!*((unsigned char *)v4 + 74)) {
        goto LABEL_36;
      }
    }
LABEL_42:
    char v13 = 0;
    goto LABEL_43;
  }
  if ((*((unsigned char *)v4 + 76) & 4) != 0) {
    goto LABEL_42;
  }
LABEL_36:
  galleryIdentifier = self->_galleryIdentifier;
  if ((unint64_t)galleryIdentifier | *((void *)v4 + 5)
    && !-[NSString isEqual:](galleryIdentifier, "isEqual:"))
  {
    goto LABEL_42;
  }
  externalBundleIdentifier = self->_externalBundleIdentifier;
  if ((unint64_t)externalBundleIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](externalBundleIdentifier, "isEqual:")) {
      goto LABEL_42;
    }
  }
  externalActionIdentifier = self->_externalActionIdentifier;
  if ((unint64_t)externalActionIdentifier | *((void *)v4 + 3)) {
    char v13 = -[NSString isEqual:](externalActionIdentifier, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_43:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_runSource copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 72) = self->_completed;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_actionIdentifier copyWithZone:a3];
  NSUInteger v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  uint64_t v12 = [(NSString *)self->_shortcutSource copyWithZone:a3];
  char v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  uint64_t v14 = [(NSString *)self->_automationType copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 73) = self->_didRunRemotely;
    *(unsigned char *)(v5 + 76) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 74) = self->_isInvalidatedSystemAction;
    *(unsigned char *)(v5 + 76) |= 4u;
  }
  uint64_t v17 = [(NSString *)self->_galleryIdentifier copyWithZone:a3];
  v18 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v17;

  uint64_t v19 = [(NSString *)self->_externalBundleIdentifier copyWithZone:a3];
  v20 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v19;

  uint64_t v21 = [(NSString *)self->_externalActionIdentifier copyWithZone:a3];
  v22 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v21;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v6;
  }
  if (self->_runSource)
  {
    objc_msgSend(v6, "setRunSource:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[72] = self->_completed;
    v4[76] |= 1u;
  }
  if (self->_actionIdentifier)
  {
    objc_msgSend(v6, "setActionIdentifier:");
    id v4 = v6;
  }
  if (self->_shortcutSource)
  {
    objc_msgSend(v6, "setShortcutSource:");
    id v4 = v6;
  }
  if (self->_automationType)
  {
    objc_msgSend(v6, "setAutomationType:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[73] = self->_didRunRemotely;
    v4[76] |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[74] = self->_isInvalidatedSystemAction;
    v4[76] |= 4u;
  }
  if (self->_galleryIdentifier)
  {
    objc_msgSend(v6, "setGalleryIdentifier:");
    id v4 = v6;
  }
  if (self->_externalBundleIdentifier)
  {
    objc_msgSend(v6, "setExternalBundleIdentifier:");
    id v4 = v6;
  }
  if (self->_externalActionIdentifier)
  {
    objc_msgSend(v6, "setExternalActionIdentifier:");
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
  if (self->_runSource)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_actionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_shortcutSource)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_automationType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_galleryIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_externalBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_externalActionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBRunActionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  runSource = self->_runSource;
  if (runSource) {
    [v4 setObject:runSource forKey:@"runSource"];
  }
  if (*(unsigned char *)&self->_has)
  {
    NSUInteger v7 = [NSNumber numberWithBool:self->_completed];
    [v4 setObject:v7 forKey:@"completed"];
  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier) {
    [v4 setObject:actionIdentifier forKey:@"actionIdentifier"];
  }
  shortcutSource = self->_shortcutSource;
  if (shortcutSource) {
    [v4 setObject:shortcutSource forKey:@"shortcutSource"];
  }
  automationType = self->_automationType;
  if (automationType) {
    [v4 setObject:automationType forKey:@"automationType"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v12 = [NSNumber numberWithBool:self->_didRunRemotely];
    [v4 setObject:v12 forKey:@"didRunRemotely"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    char v13 = [NSNumber numberWithBool:self->_isInvalidatedSystemAction];
    [v4 setObject:v13 forKey:@"isInvalidatedSystemAction"];
  }
  galleryIdentifier = self->_galleryIdentifier;
  if (galleryIdentifier) {
    [v4 setObject:galleryIdentifier forKey:@"galleryIdentifier"];
  }
  externalBundleIdentifier = self->_externalBundleIdentifier;
  if (externalBundleIdentifier) {
    [v4 setObject:externalBundleIdentifier forKey:@"externalBundleIdentifier"];
  }
  externalActionIdentifier = self->_externalActionIdentifier;
  if (externalActionIdentifier) {
    [v4 setObject:externalActionIdentifier forKey:@"externalActionIdentifier"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBRunActionEvent;
  id v4 = [(WFPBRunActionEvent *)&v8 description];
  uint64_t v5 = [(WFPBRunActionEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasExternalActionIdentifier
{
  return self->_externalActionIdentifier != 0;
}

- (BOOL)hasExternalBundleIdentifier
{
  return self->_externalBundleIdentifier != 0;
}

- (BOOL)hasGalleryIdentifier
{
  return self->_galleryIdentifier != 0;
}

- (BOOL)hasIsInvalidatedSystemAction
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasIsInvalidatedSystemAction:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setIsInvalidatedSystemAction:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isInvalidatedSystemAction = a3;
}

- (BOOL)hasDidRunRemotely
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDidRunRemotely:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDidRunRemotely:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_didRunRemotely = a3;
}

- (BOOL)hasAutomationType
{
  return self->_automationType != 0;
}

- (BOOL)hasShortcutSource
{
  return self->_shortcutSource != 0;
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (BOOL)hasCompleted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_completed = a3;
}

- (BOOL)hasRunSource
{
  return self->_runSource != 0;
}

- (NSString)runSource
{
  if (self->_runSource) {
    return self->_runSource;
  }
  else {
    return (NSString *)@"unknown";
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
    return (NSString *)@"RunAction";
  }
}

@end