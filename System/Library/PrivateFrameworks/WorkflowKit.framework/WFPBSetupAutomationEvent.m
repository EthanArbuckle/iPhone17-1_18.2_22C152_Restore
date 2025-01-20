@interface WFPBSetupAutomationEvent
- (BOOL)hasActionIdentifier;
- (BOOL)hasBundleIdentifier;
- (BOOL)hasKey;
- (BOOL)hasRequiredRuntimeConfirmation;
- (BOOL)hasShowsNotification;
- (BOOL)hasTriggerType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiredRuntimeConfirmation;
- (BOOL)showsNotification;
- (NSString)actionIdentifier;
- (NSString)bundleIdentifier;
- (NSString)key;
- (NSString)triggerType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setHasRequiredRuntimeConfirmation:(BOOL)a3;
- (void)setHasShowsNotification:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setRequiredRuntimeConfirmation:(BOOL)a3;
- (void)setShowsNotification:(BOOL)a3;
- (void)setTriggerType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBSetupAutomationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (BOOL)showsNotification
{
  return self->_showsNotification;
}

- (BOOL)requiredRuntimeConfirmation
{
  return self->_requiredRuntimeConfirmation;
}

- (void)setTriggerType:(id)a3
{
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[WFPBSetupAutomationEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[WFPBSetupAutomationEvent setTriggerType:](self, "setTriggerType:");
    v4 = v6;
  }
  BOOL v5 = v4[44];
  if (v5)
  {
    self->_requiredRuntimeConfirmation = v4[40];
    *(unsigned char *)&self->_has |= 1u;
    BOOL v5 = v4[44];
  }
  if ((v5 & 2) != 0)
  {
    self->_showsNotification = v4[41];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBSetupAutomationEvent setActionIdentifier:](self, "setActionIdentifier:");
    v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBSetupAutomationEvent setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_triggerType hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_requiredRuntimeConfirmation;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_showsNotification;
LABEL_6:
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_actionIdentifier hash];
  return v7 ^ [(NSString *)self->_bundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_26;
    }
  }
  triggerType = self->_triggerType;
  if ((unint64_t)triggerType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](triggerType, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0) {
      goto LABEL_26;
    }
    if (self->_requiredRuntimeConfirmation)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_showsNotification)
      {
        if (!*((unsigned char *)v4 + 41)) {
          goto LABEL_26;
        }
        goto LABEL_22;
      }
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_22;
      }
    }
LABEL_26:
    char v9 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_26;
  }
LABEL_22:
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((void *)v4 + 1)
    && !-[NSString isEqual:](actionIdentifier, "isEqual:"))
  {
    goto LABEL_26;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 2)) {
    char v9 = -[NSString isEqual:](bundleIdentifier, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_27:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_triggerType copyWithZone:a3];
  char v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(unsigned char *)(v5 + 40) = self->_requiredRuntimeConfirmation;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 41) = self->_showsNotification;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  uint64_t v11 = [(NSString *)self->_actionIdentifier copyWithZone:a3];
  v12 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v11;

  uint64_t v13 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v14 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v13;

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
  if (self->_triggerType)
  {
    objc_msgSend(v6, "setTriggerType:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    v4[40] = self->_requiredRuntimeConfirmation;
    v4[44] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[41] = self->_showsNotification;
    v4[44] |= 2u;
  }
  if (self->_actionIdentifier)
  {
    objc_msgSend(v6, "setActionIdentifier:");
    id v4 = v6;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v6, "setBundleIdentifier:");
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
  if (self->_triggerType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_actionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBSetupAutomationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  triggerType = self->_triggerType;
  if (triggerType) {
    [v4 setObject:triggerType forKey:@"triggerType"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v8 = [NSNumber numberWithBool:self->_requiredRuntimeConfirmation];
    [v4 setObject:v8 forKey:@"requiredRuntimeConfirmation"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    char v9 = [NSNumber numberWithBool:self->_showsNotification];
    [v4 setObject:v9 forKey:@"showsNotification"];
  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier) {
    [v4 setObject:actionIdentifier forKey:@"actionIdentifier"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBSetupAutomationEvent;
  id v4 = [(WFPBSetupAutomationEvent *)&v8 description];
  uint64_t v5 = [(WFPBSetupAutomationEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (BOOL)hasShowsNotification
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasShowsNotification:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setShowsNotification:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_showsNotification = a3;
}

- (BOOL)hasRequiredRuntimeConfirmation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRequiredRuntimeConfirmation:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRequiredRuntimeConfirmation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requiredRuntimeConfirmation = a3;
}

- (BOOL)hasTriggerType
{
  return self->_triggerType != 0;
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
    return (NSString *)@"SetupAutomationEvent";
  }
}

@end