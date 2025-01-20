@interface WFPBRunShortcutErrorEvent
- (BOOL)didRunRemotely;
- (BOOL)hasActionIdentifier;
- (BOOL)hasAutomationType;
- (BOOL)hasDidRunRemotely;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDomain;
- (BOOL)hasKey;
- (BOOL)hasRunSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionIdentifier;
- (NSString)automationType;
- (NSString)errorCode;
- (NSString)errorDomain;
- (NSString)key;
- (NSString)runSource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setAutomationType:(id)a3;
- (void)setDidRunRemotely:(BOOL)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHasDidRunRemotely:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setRunSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBRunShortcutErrorEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (void)setAutomationType:(id)a3
{
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setRunSource:(id)a3
{
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((void *)v4 + 5))
  {
    -[WFPBRunShortcutErrorEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[WFPBRunShortcutErrorEvent setErrorDomain:](self, "setErrorDomain:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBRunShortcutErrorEvent setErrorCode:](self, "setErrorCode:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBRunShortcutErrorEvent setActionIdentifier:](self, "setActionIdentifier:");
    v4 = v5;
  }
  if (v4[60])
  {
    self->_didRunRemotely = v4[56];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6))
  {
    -[WFPBRunShortcutErrorEvent setRunSource:](self, "setRunSource:");
    v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBRunShortcutErrorEvent setAutomationType:](self, "setAutomationType:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_errorDomain hash];
  NSUInteger v5 = [(NSString *)self->_errorCode hash];
  NSUInteger v6 = [(NSString *)self->_actionIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_didRunRemotely;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v9 = v7 ^ [(NSString *)self->_runSource hash];
  return v8 ^ v9 ^ [(NSString *)self->_automationType hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_22;
    }
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:")) {
      goto LABEL_22;
    }
  }
  errorCode = self->_errorCode;
  if ((unint64_t)errorCode | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](errorCode, "isEqual:")) {
      goto LABEL_22;
    }
  }
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](actionIdentifier, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 60))
    {
      if (self->_didRunRemotely)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_22;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_18;
      }
    }
LABEL_22:
    char v11 = 0;
    goto LABEL_23;
  }
  if (*((unsigned char *)v4 + 60)) {
    goto LABEL_22;
  }
LABEL_18:
  runSource = self->_runSource;
  if ((unint64_t)runSource | *((void *)v4 + 6) && !-[NSString isEqual:](runSource, "isEqual:")) {
    goto LABEL_22;
  }
  automationType = self->_automationType;
  if ((unint64_t)automationType | *((void *)v4 + 2)) {
    char v11 = -[NSString isEqual:](automationType, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_23:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_errorDomain copyWithZone:a3];
  NSUInteger v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_errorCode copyWithZone:a3];
  char v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_actionIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 56) = self->_didRunRemotely;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v14 = [(NSString *)self->_runSource copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_automationType copyWithZone:a3];
  v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

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
  if (self->_errorDomain)
  {
    objc_msgSend(v5, "setErrorDomain:");
    id v4 = v5;
  }
  if (self->_errorCode)
  {
    objc_msgSend(v5, "setErrorCode:");
    id v4 = v5;
  }
  if (self->_actionIdentifier)
  {
    objc_msgSend(v5, "setActionIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[56] = self->_didRunRemotely;
    v4[60] |= 1u;
  }
  if (self->_runSource)
  {
    objc_msgSend(v5, "setRunSource:");
    id v4 = v5;
  }
  if (self->_automationType)
  {
    objc_msgSend(v5, "setAutomationType:");
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
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_actionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_runSource)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_automationType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBRunShortcutErrorEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v4 setObject:errorDomain forKey:@"errorDomain"];
  }
  errorCode = self->_errorCode;
  if (errorCode) {
    [v4 setObject:errorCode forKey:@"errorCode"];
  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier) {
    [v4 setObject:actionIdentifier forKey:@"actionIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    NSUInteger v9 = [NSNumber numberWithBool:self->_didRunRemotely];
    [v4 setObject:v9 forKey:@"didRunRemotely"];
  }
  runSource = self->_runSource;
  if (runSource) {
    [v4 setObject:runSource forKey:@"runSource"];
  }
  automationType = self->_automationType;
  if (automationType) {
    [v4 setObject:automationType forKey:@"automationType"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBRunShortcutErrorEvent;
  id v4 = [(WFPBRunShortcutErrorEvent *)&v8 description];
  id v5 = [(WFPBRunShortcutErrorEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAutomationType
{
  return self->_automationType != 0;
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

- (BOOL)hasDidRunRemotely
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDidRunRemotely:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDidRunRemotely:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_didRunRemotely = a3;
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
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
    return (NSString *)@"RunShortcutError";
  }
}

@end