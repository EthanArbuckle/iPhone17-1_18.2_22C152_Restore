@interface WFPBSuggestAutomationEvent
- (BOOL)completed;
- (BOOL)hasCompleted;
- (BOOL)hasInteracted;
- (BOOL)hasKey;
- (BOOL)hasSource;
- (BOOL)hasSuggestedAutomationIdentifier;
- (BOOL)interacted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (NSString)source;
- (NSString)suggestedAutomationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setHasInteracted:(BOOL)a3;
- (void)setInteracted:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
- (void)setSuggestedAutomationIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBSuggestAutomationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAutomationIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (BOOL)completed
{
  return self->_completed;
}

- (BOOL)interacted
{
  return self->_interacted;
}

- (void)setSuggestedAutomationIdentifier:(id)a3
{
}

- (NSString)suggestedAutomationIdentifier
{
  return self->_suggestedAutomationIdentifier;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[WFPBSuggestAutomationEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBSuggestAutomationEvent setSuggestedAutomationIdentifier:](self, "setSuggestedAutomationIdentifier:");
    v4 = v6;
  }
  BOOL v5 = v4[36];
  if ((v5 & 2) != 0)
  {
    self->_interacted = v4[33];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v5 = v4[36];
  }
  if (v5)
  {
    self->_completed = v4[32];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBSuggestAutomationEvent setSource:](self, "setSource:");
    v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_suggestedAutomationIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_interacted;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_source hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_completed;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_source hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_18;
    }
  }
  suggestedAutomationIdentifier = self->_suggestedAutomationIdentifier;
  if ((unint64_t)suggestedAutomationIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](suggestedAutomationIdentifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_18;
    }
    if (self->_interacted)
    {
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)v4 + 33))
    {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0) {
      goto LABEL_24;
    }
LABEL_18:
    char v7 = 0;
    goto LABEL_19;
  }
  if ((*((unsigned char *)v4 + 36) & 1) == 0) {
    goto LABEL_18;
  }
  if (!self->_completed)
  {
    if (!*((unsigned char *)v4 + 32)) {
      goto LABEL_24;
    }
    goto LABEL_18;
  }
  if (!*((unsigned char *)v4 + 32)) {
    goto LABEL_18;
  }
LABEL_24:
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 2)) {
    char v7 = -[NSString isEqual:](source, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_19:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  char v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_suggestedAutomationIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 33) = self->_interacted;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(unsigned char *)(v5 + 32) = self->_completed;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_source copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

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
  if (self->_suggestedAutomationIdentifier)
  {
    objc_msgSend(v6, "setSuggestedAutomationIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[33] = self->_interacted;
    v4[36] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[32] = self->_completed;
    v4[36] |= 1u;
  }
  if (self->_source)
  {
    objc_msgSend(v6, "setSource:");
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
  if (self->_suggestedAutomationIdentifier)
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
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBSuggestAutomationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  suggestedAutomationIdentifier = self->_suggestedAutomationIdentifier;
  if (suggestedAutomationIdentifier) {
    [v4 setObject:suggestedAutomationIdentifier forKey:@"suggestedAutomationIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v8 = [NSNumber numberWithBool:self->_interacted];
    [v4 setObject:v8 forKey:@"interacted"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithBool:self->_completed];
    [v4 setObject:v9 forKey:@"completed"];
  }
  source = self->_source;
  if (source) {
    [v4 setObject:source forKey:@"source"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBSuggestAutomationEvent;
  id v4 = [(WFPBSuggestAutomationEvent *)&v8 description];
  uint64_t v5 = [(WFPBSuggestAutomationEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSource
{
  return self->_source != 0;
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

- (BOOL)hasSuggestedAutomationIdentifier
{
  return self->_suggestedAutomationIdentifier != 0;
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
    return (NSString *)@"SuggestAutomation";
  }
}

@end