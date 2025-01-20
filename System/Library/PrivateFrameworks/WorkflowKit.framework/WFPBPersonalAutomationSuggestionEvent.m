@interface WFPBPersonalAutomationSuggestionEvent
- (BOOL)completed;
- (BOOL)hasActivityType;
- (BOOL)hasAppBundleIdentifier;
- (BOOL)hasCompleted;
- (BOOL)hasIntentType;
- (BOOL)hasInteracted;
- (BOOL)hasKey;
- (BOOL)hasSource;
- (BOOL)hasTriggerType;
- (BOOL)hasVisible;
- (BOOL)interacted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)visible;
- (NSString)activityType;
- (NSString)appBundleIdentifier;
- (NSString)intentType;
- (NSString)key;
- (NSString)source;
- (NSString)triggerType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityType:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setHasInteracted:(BOOL)a3;
- (void)setHasVisible:(BOOL)a3;
- (void)setIntentType:(id)a3;
- (void)setInteracted:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
- (void)setTriggerType:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBPersonalAutomationSuggestionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

- (void)setTriggerType:(id)a3
{
}

- (NSString)triggerType
{
  return self->_triggerType;
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

- (BOOL)completed
{
  return self->_completed;
}

- (BOOL)interacted
{
  return self->_interacted;
}

- (BOOL)visible
{
  return self->_visible;
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

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[WFPBPersonalAutomationSuggestionEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBPersonalAutomationSuggestionEvent setIntentType:](self, "setIntentType:");
    v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[WFPBPersonalAutomationSuggestionEvent setSource:](self, "setSource:");
    v4 = v6;
  }
  BOOL v5 = v4[60];
  if ((v5 & 4) != 0)
  {
    self->_visible = v4[58];
    *(unsigned char *)&self->_has |= 4u;
    BOOL v5 = v4[60];
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v4[60] & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_interacted = v4[57];
  *(unsigned char *)&self->_has |= 2u;
  if (v4[60])
  {
LABEL_10:
    self->_completed = v4[56];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_11:
  if (*((void *)v4 + 2))
  {
    -[WFPBPersonalAutomationSuggestionEvent setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBPersonalAutomationSuggestionEvent setActivityType:](self, "setActivityType:");
    v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[WFPBPersonalAutomationSuggestionEvent setTriggerType:](self, "setTriggerType:");
    v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_intentType hash];
  NSUInteger v5 = [(NSString *)self->_source hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = 2654435761 * self->_visible;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_interacted;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_completed;
LABEL_8:
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v10 = v7 ^ v8 ^ [(NSString *)self->_appBundleIdentifier hash];
  NSUInteger v11 = v9 ^ v10 ^ [(NSString *)self->_activityType hash];
  return v11 ^ [(NSString *)self->_triggerType hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_38;
    }
  }
  intentType = self->_intentType;
  if ((unint64_t)intentType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](intentType, "isEqual:")) {
      goto LABEL_38;
    }
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](source, "isEqual:")) {
      goto LABEL_38;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0) {
      goto LABEL_38;
    }
    if (self->_visible)
    {
      if (!*((unsigned char *)v4 + 58)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 58))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0) {
      goto LABEL_38;
    }
    if (self->_interacted)
    {
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 57))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_38;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 60))
    {
      if (self->_completed)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_38;
        }
        goto LABEL_32;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_32;
      }
    }
LABEL_38:
    char v11 = 0;
    goto LABEL_39;
  }
  if (*((unsigned char *)v4 + 60)) {
    goto LABEL_38;
  }
LABEL_32:
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((void *)v4 + 2)
    && !-[NSString isEqual:](appBundleIdentifier, "isEqual:"))
  {
    goto LABEL_38;
  }
  activityType = self->_activityType;
  if ((unint64_t)activityType | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](activityType, "isEqual:")) {
      goto LABEL_38;
    }
  }
  triggerType = self->_triggerType;
  if ((unint64_t)triggerType | *((void *)v4 + 6)) {
    char v11 = -[NSString isEqual:](triggerType, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_39:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_intentType copyWithZone:a3];
  NSUInteger v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_source copyWithZone:a3];
  char v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 57) = self->_interacted;
    *(unsigned char *)(v5 + 60) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v5 + 58) = self->_visible;
  *(unsigned char *)(v5 + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(unsigned char *)(v5 + 56) = self->_completed;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
LABEL_5:
  uint64_t v13 = [(NSString *)self->_appBundleIdentifier copyWithZone:a3];
  v14 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v13;

  uint64_t v15 = [(NSString *)self->_activityType copyWithZone:a3];
  v16 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v15;

  uint64_t v17 = [(NSString *)self->_triggerType copyWithZone:a3];
  v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[58] = self->_visible;
    v4[60] |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v4[57] = self->_interacted;
  v4[60] |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    v4[56] = self->_completed;
    v4[60] |= 1u;
  }
LABEL_11:
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
  if (self->_triggerType)
  {
    objc_msgSend(v6, "setTriggerType:");
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
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_11:
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
  if (self->_triggerType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBPersonalAutomationSuggestionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  intentType = self->_intentType;
  if (intentType) {
    [v4 setObject:intentType forKey:@"intentType"];
  }
  source = self->_source;
  if (source) {
    [v4 setObject:source forKey:@"source"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_visible];
    [v4 setObject:v14 forKey:@"visible"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  uint64_t v15 = [NSNumber numberWithBool:self->_interacted];
  [v4 setObject:v15 forKey:@"interacted"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    NSUInteger v9 = [NSNumber numberWithBool:self->_completed];
    [v4 setObject:v9 forKey:@"completed"];
  }
LABEL_11:
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier) {
    [v4 setObject:appBundleIdentifier forKey:@"appBundleIdentifier"];
  }
  activityType = self->_activityType;
  if (activityType) {
    [v4 setObject:activityType forKey:@"activityType"];
  }
  triggerType = self->_triggerType;
  if (triggerType) {
    [v4 setObject:triggerType forKey:@"triggerType"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBPersonalAutomationSuggestionEvent;
  id v4 = [(WFPBPersonalAutomationSuggestionEvent *)&v8 description];
  uint64_t v5 = [(WFPBPersonalAutomationSuggestionEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTriggerType
{
  return self->_triggerType != 0;
}

- (BOOL)hasActivityType
{
  return self->_activityType != 0;
}

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
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

- (BOOL)hasInteracted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasInteracted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setInteracted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_interacted = a3;
}

- (BOOL)hasVisible
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasVisible:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setVisible:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_visible = a3;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (BOOL)hasIntentType
{
  return self->_intentType != 0;
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
    return (NSString *)@"PersonalAutomationSuggestion";
  }
}

@end