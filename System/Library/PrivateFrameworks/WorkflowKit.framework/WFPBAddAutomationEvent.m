@interface WFPBAddAutomationEvent
- (BOOL)hasActionCount;
- (BOOL)hasActivityType;
- (BOOL)hasAppBundleIdentifier;
- (BOOL)hasAutomationSuggestionsTrialIdentifier;
- (BOOL)hasIntentType;
- (BOOL)hasKey;
- (BOOL)hasRequiresRuntimeConfirmation;
- (BOOL)hasShortcutIdentifier;
- (BOOL)hasShowsNotification;
- (BOOL)hasSource;
- (BOOL)hasTriggerType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresRuntimeConfirmation;
- (BOOL)showsNotification;
- (NSString)activityType;
- (NSString)appBundleIdentifier;
- (NSString)automationSuggestionsTrialIdentifier;
- (NSString)intentType;
- (NSString)key;
- (NSString)shortcutIdentifier;
- (NSString)source;
- (NSString)triggerType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)actionCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionCount:(unsigned int)a3;
- (void)setActivityType:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAutomationSuggestionsTrialIdentifier:(id)a3;
- (void)setHasActionCount:(BOOL)a3;
- (void)setHasRequiresRuntimeConfirmation:(BOOL)a3;
- (void)setHasShowsNotification:(BOOL)a3;
- (void)setIntentType:(id)a3;
- (void)setKey:(id)a3;
- (void)setRequiresRuntimeConfirmation:(BOOL)a3;
- (void)setShortcutIdentifier:(id)a3;
- (void)setShowsNotification:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setTriggerType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBAddAutomationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

- (BOOL)requiresRuntimeConfirmation
{
  return self->_requiresRuntimeConfirmation;
}

- (BOOL)showsNotification
{
  return self->_showsNotification;
}

- (void)setAutomationSuggestionsTrialIdentifier:(id)a3
{
}

- (NSString)automationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setIntentType:(id)a3
{
}

- (NSString)intentType
{
  return self->_intentType;
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
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[WFPBAddAutomationEvent setKey:](self, "setKey:");
    id v4 = v6;
  }
  if (*((void *)v4 + 9))
  {
    -[WFPBAddAutomationEvent setTriggerType:](self, "setTriggerType:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[WFPBAddAutomationEvent setIntentType:](self, "setIntentType:");
    id v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[WFPBAddAutomationEvent setSource:](self, "setSource:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 84))
  {
    self->_actionCount = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 7))
  {
    -[WFPBAddAutomationEvent setShortcutIdentifier:](self, "setShortcutIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBAddAutomationEvent setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBAddAutomationEvent setActivityType:](self, "setActivityType:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[WFPBAddAutomationEvent setAutomationSuggestionsTrialIdentifier:](self, "setAutomationSuggestionsTrialIdentifier:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 84);
  if ((v5 & 4) != 0)
  {
    self->_showsNotification = *((unsigned char *)v4 + 81);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 84);
  }
  if ((v5 & 2) != 0)
  {
    self->_requiresRuntimeConfirmation = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v14 = [(NSString *)self->_key hash];
  NSUInteger v3 = [(NSString *)self->_triggerType hash];
  NSUInteger v4 = [(NSString *)self->_intentType hash];
  NSUInteger v5 = [(NSString *)self->_source hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_actionCount;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_shortcutIdentifier hash];
  NSUInteger v8 = [(NSString *)self->_appBundleIdentifier hash];
  NSUInteger v9 = [(NSString *)self->_activityType hash];
  NSUInteger v10 = [(NSString *)self->_automationSuggestionsTrialIdentifier hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_showsNotification;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v12 = 0;
    return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v12 = 2654435761 * self->_requiresRuntimeConfirmation;
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_33;
    }
  }
  triggerType = self->_triggerType;
  if ((unint64_t)triggerType | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](triggerType, "isEqual:")) {
      goto LABEL_33;
    }
  }
  intentType = self->_intentType;
  if ((unint64_t)intentType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](intentType, "isEqual:")) {
      goto LABEL_33;
    }
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](source, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_actionCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_33;
  }
  shortcutIdentifier = self->_shortcutIdentifier;
  if ((unint64_t)shortcutIdentifier | *((void *)v4 + 7)
    && !-[NSString isEqual:](shortcutIdentifier, "isEqual:"))
  {
    goto LABEL_33;
  }
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](appBundleIdentifier, "isEqual:")) {
      goto LABEL_33;
    }
  }
  activityType = self->_activityType;
  if ((unint64_t)activityType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](activityType, "isEqual:")) {
      goto LABEL_33;
    }
  }
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if ((unint64_t)automationSuggestionsTrialIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](automationSuggestionsTrialIdentifier, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) == 0) {
      goto LABEL_33;
    }
    if (self->_showsNotification)
    {
      if (!*((unsigned char *)v4 + 81)) {
        goto LABEL_33;
      }
    }
    else if (*((unsigned char *)v4 + 81))
    {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
    goto LABEL_33;
  }
  BOOL v13 = (*((unsigned char *)v4 + 84) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) != 0)
    {
      if (self->_requiresRuntimeConfirmation)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_33;
        }
      }
      else if (*((unsigned char *)v4 + 80))
      {
        goto LABEL_33;
      }
      BOOL v13 = 1;
      goto LABEL_34;
    }
LABEL_33:
    BOOL v13 = 0;
  }
LABEL_34:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_triggerType copyWithZone:a3];
  NSUInteger v9 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v8;

  uint64_t v10 = [(NSString *)self->_intentType copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_source copyWithZone:a3];
  BOOL v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_actionCount;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  uint64_t v14 = [(NSString *)self->_shortcutIdentifier copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  uint64_t v16 = [(NSString *)self->_appBundleIdentifier copyWithZone:a3];
  v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  uint64_t v18 = [(NSString *)self->_activityType copyWithZone:a3];
  v19 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v18;

  uint64_t v20 = [(NSString *)self->_automationSuggestionsTrialIdentifier copyWithZone:a3];
  v21 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v20;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 81) = self->_showsNotification;
    *(unsigned char *)(v5 + 84) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 80) = self->_requiresRuntimeConfirmation;
    *(unsigned char *)(v5 + 84) |= 2u;
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
  if (self->_triggerType)
  {
    objc_msgSend(v6, "setTriggerType:");
    id v4 = v6;
  }
  if (self->_intentType)
  {
    objc_msgSend(v6, "setIntentType:");
    id v4 = v6;
  }
  if (self->_source)
  {
    objc_msgSend(v6, "setSource:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_actionCount;
    *((unsigned char *)v4 + 84) |= 1u;
  }
  if (self->_shortcutIdentifier)
  {
    objc_msgSend(v6, "setShortcutIdentifier:");
    id v4 = v6;
  }
  if (self->_appBundleIdentifier)
  {
    objc_msgSend(v6, "setAppBundleIdentifier:");
    id v4 = v6;
  }
  if (self->_activityType)
  {
    objc_msgSend(v6, "setActivityType:");
    id v4 = v6;
  }
  if (self->_automationSuggestionsTrialIdentifier)
  {
    objc_msgSend(v6, "setAutomationSuggestionsTrialIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 81) = self->_showsNotification;
    *((unsigned char *)v4 + 84) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 80) = self->_requiresRuntimeConfirmation;
    *((unsigned char *)v4 + 84) |= 2u;
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
  if (self->_intentType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_shortcutIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_appBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_activityType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_automationSuggestionsTrialIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
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
}

- (BOOL)readFrom:(id)a3
{
  return WFPBAddAutomationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  intentType = self->_intentType;
  if (intentType) {
    [v4 setObject:intentType forKey:@"intentType"];
  }
  source = self->_source;
  if (source) {
    [v4 setObject:source forKey:@"source"];
  }
  if (*(unsigned char *)&self->_has)
  {
    NSUInteger v9 = [NSNumber numberWithUnsignedInt:self->_actionCount];
    [v4 setObject:v9 forKey:@"actionCount"];
  }
  shortcutIdentifier = self->_shortcutIdentifier;
  if (shortcutIdentifier) {
    [v4 setObject:shortcutIdentifier forKey:@"shortcutIdentifier"];
  }
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier) {
    [v4 setObject:appBundleIdentifier forKey:@"appBundleIdentifier"];
  }
  activityType = self->_activityType;
  if (activityType) {
    [v4 setObject:activityType forKey:@"activityType"];
  }
  automationSuggestionsTrialIdentifier = self->_automationSuggestionsTrialIdentifier;
  if (automationSuggestionsTrialIdentifier) {
    [v4 setObject:automationSuggestionsTrialIdentifier forKey:@"automationSuggestionsTrialIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_showsNotification];
    [v4 setObject:v15 forKey:@"showsNotification"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t v16 = [NSNumber numberWithBool:self->_requiresRuntimeConfirmation];
    [v4 setObject:v16 forKey:@"requiresRuntimeConfirmation"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBAddAutomationEvent;
  id v4 = [(WFPBAddAutomationEvent *)&v8 description];
  uint64_t v5 = [(WFPBAddAutomationEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRequiresRuntimeConfirmation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasRequiresRuntimeConfirmation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setRequiresRuntimeConfirmation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requiresRuntimeConfirmation = a3;
}

- (BOOL)hasShowsNotification
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasShowsNotification:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setShowsNotification:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_showsNotification = a3;
}

- (BOOL)hasAutomationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier != 0;
}

- (BOOL)hasActivityType
{
  return self->_activityType != 0;
}

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasShortcutIdentifier
{
  return self->_shortcutIdentifier != 0;
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

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (BOOL)hasIntentType
{
  return self->_intentType != 0;
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
    return (NSString *)@"AddAutomation";
  }
}

@end