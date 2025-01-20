@interface WFPBAutomatorWorkflowActionMigrationEvent
- (BOOL)completed;
- (BOOL)hasAutomatorActionIdentifier;
- (BOOL)hasCompleted;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)automatorActionIdentifier;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutomatorActionIdentifier:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBAutomatorWorkflowActionMigrationEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_automatorActionIdentifier, 0);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setAutomatorActionIdentifier:(id)a3
{
}

- (NSString)automatorActionIdentifier
{
  return self->_automatorActionIdentifier;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[WFPBAutomatorWorkflowActionMigrationEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBAutomatorWorkflowActionMigrationEvent setAutomatorActionIdentifier:](self, "setAutomatorActionIdentifier:");
    v4 = v5;
  }
  if (v4[28])
  {
    self->_completed = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_automatorActionIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_completed;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_8;
    }
  }
  automatorActionIdentifier = self->_automatorActionIdentifier;
  if ((unint64_t)automatorActionIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](automatorActionIdentifier, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_completed)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_automatorActionIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_completed;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
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
  if (self->_automatorActionIdentifier)
  {
    objc_msgSend(v5, "setAutomatorActionIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_completed;
    v4[28] |= 1u;
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
  if (self->_automatorActionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBAutomatorWorkflowActionMigrationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  automatorActionIdentifier = self->_automatorActionIdentifier;
  if (automatorActionIdentifier) {
    [v4 setObject:automatorActionIdentifier forKey:@"automatorActionIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    BOOL v7 = [NSNumber numberWithBool:self->_completed];
    [v4 setObject:v7 forKey:@"completed"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBAutomatorWorkflowActionMigrationEvent;
  id v4 = [(WFPBAutomatorWorkflowActionMigrationEvent *)&v8 description];
  id v5 = [(WFPBAutomatorWorkflowActionMigrationEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCompleted
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCompleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_completed = a3;
}

- (BOOL)hasAutomatorActionIdentifier
{
  return self->_automatorActionIdentifier != 0;
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
    return (NSString *)@"AutomatorWorkflowActionMigrationEvent";
  }
}

@end