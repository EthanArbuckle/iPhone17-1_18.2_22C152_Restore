@interface WFPBSetupSuggestedAutomationEvent
- (BOOL)completed;
- (BOOL)hasCompleted;
- (BOOL)hasCurrentStep;
- (BOOL)hasKey;
- (BOOL)hasSuggestedAutomationIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (NSString)suggestedAutomationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)currentStep;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setCurrentStep:(unsigned int)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setHasCurrentStep:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSuggestedAutomationIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBSetupSuggestedAutomationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAutomationIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (BOOL)completed
{
  return self->_completed;
}

- (unsigned)currentStep
{
  return self->_currentStep;
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
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[WFPBSetupSuggestedAutomationEvent setKey:](self, "setKey:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBSetupSuggestedAutomationEvent setSuggestedAutomationIdentifier:](self, "setSuggestedAutomationIdentifier:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_currentStep = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_completed = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_suggestedAutomationIdentifier hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_currentStep;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_completed;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_13;
    }
  }
  suggestedAutomationIdentifier = self->_suggestedAutomationIdentifier;
  if ((unint64_t)suggestedAutomationIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](suggestedAutomationIdentifier, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_currentStep != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_13;
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0)
    {
LABEL_13:
      BOOL v7 = 0;
      goto LABEL_14;
    }
    if (self->_completed)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_13;
    }
    BOOL v7 = 1;
  }
LABEL_14:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_suggestedAutomationIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_currentStep;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_completed;
    *(unsigned char *)(v5 + 36) |= 2u;
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
  if (self->_suggestedAutomationIdentifier)
  {
    objc_msgSend(v6, "setSuggestedAutomationIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_currentStep;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_completed;
    *((unsigned char *)v4 + 36) |= 2u;
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
  if (has)
  {
    PBDataWriterWriteUint32Field();
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
  return WFPBSetupSuggestedAutomationEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (has)
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_currentStep];
    [v4 setObject:v8 forKey:@"currentStep"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_completed];
    [v4 setObject:v9 forKey:@"completed"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBSetupSuggestedAutomationEvent;
  id v4 = [(WFPBSetupSuggestedAutomationEvent *)&v8 description];
  uint64_t v5 = [(WFPBSetupSuggestedAutomationEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCompleted
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCompleted:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_completed = a3;
}

- (BOOL)hasCurrentStep
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCurrentStep:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCurrentStep:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_currentStep = a3;
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
    return (NSString *)@"SetupSuggestedAutomation";
  }
}

@end