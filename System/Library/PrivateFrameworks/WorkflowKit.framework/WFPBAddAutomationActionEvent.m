@interface WFPBAddAutomationActionEvent
- (BOOL)hasActionIdentifier;
- (BOOL)hasActionIndex;
- (BOOL)hasKey;
- (BOOL)hasShortcutIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionIdentifier;
- (NSString)key;
- (NSString)shortcutIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)actionIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setActionIndex:(unsigned int)a3;
- (void)setHasActionIndex:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setShortcutIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBAddAutomationActionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (unsigned)actionIndex
{
  return self->_actionIndex;
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[WFPBAddAutomationActionEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[WFPBAddAutomationActionEvent setShortcutIdentifier:](self, "setShortcutIdentifier:");
    v4 = v5;
  }
  if (v4[10])
  {
    self->_actionIndex = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBAddAutomationActionEvent setActionIdentifier:](self, "setActionIdentifier:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_shortcutIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_actionIndex;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_actionIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_13;
    }
  }
  shortcutIdentifier = self->_shortcutIdentifier;
  if ((unint64_t)shortcutIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](shortcutIdentifier, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_actionIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](actionIdentifier, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_shortcutIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_actionIndex;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_actionIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

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
  if (self->_shortcutIdentifier)
  {
    objc_msgSend(v5, "setShortcutIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_actionIndex;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_actionIdentifier)
  {
    objc_msgSend(v5, "setActionIdentifier:");
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
  if (self->_shortcutIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_actionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBAddAutomationActionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  shortcutIdentifier = self->_shortcutIdentifier;
  if (shortcutIdentifier) {
    [v4 setObject:shortcutIdentifier forKey:@"shortcutIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_actionIndex];
    [v4 setObject:v7 forKey:@"actionIndex"];
  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier) {
    [v4 setObject:actionIdentifier forKey:@"actionIdentifier"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBAddAutomationActionEvent;
  id v4 = [(WFPBAddAutomationActionEvent *)&v8 description];
  id v5 = [(WFPBAddAutomationActionEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (BOOL)hasActionIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasActionIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setActionIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_actionIndex = a3;
}

- (BOOL)hasShortcutIdentifier
{
  return self->_shortcutIdentifier != 0;
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
    return (NSString *)@"InternalAddAutomationAction";
  }
}

@end