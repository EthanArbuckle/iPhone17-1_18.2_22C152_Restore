@interface WFPBRemoteExecutionEvent
- (BOOL)completed;
- (BOOL)hasActionIdentifier;
- (BOOL)hasCompleted;
- (BOOL)hasConnectionType;
- (BOOL)hasDestinationType;
- (BOOL)hasKey;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionIdentifier;
- (NSString)connectionType;
- (NSString)destinationType;
- (NSString)key;
- (NSString)source;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setConnectionType:(id)a3;
- (void)setDestinationType:(id)a3;
- (void)setHasCompleted:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBRemoteExecutionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_destinationType, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setConnectionType:(id)a3
{
}

- (NSString)connectionType
{
  return self->_connectionType;
}

- (void)setDestinationType:(id)a3
{
}

- (NSString)destinationType
{
  return self->_destinationType;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[WFPBRemoteExecutionEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[WFPBRemoteExecutionEvent setSource:](self, "setSource:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBRemoteExecutionEvent setActionIdentifier:](self, "setActionIdentifier:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBRemoteExecutionEvent setDestinationType:](self, "setDestinationType:");
    v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[WFPBRemoteExecutionEvent setConnectionType:](self, "setConnectionType:");
    v4 = v5;
  }
  if (v4[52])
  {
    self->_completed = v4[48];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_source hash];
  NSUInteger v5 = [(NSString *)self->_actionIdentifier hash];
  NSUInteger v6 = [(NSString *)self->_destinationType hash];
  NSUInteger v7 = [(NSString *)self->_connectionType hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v8 = 2654435761 * self->_completed;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_14;
    }
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](source, "isEqual:")) {
      goto LABEL_14;
    }
  }
  actionIdentifier = self->_actionIdentifier;
  if ((unint64_t)actionIdentifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](actionIdentifier, "isEqual:")) {
      goto LABEL_14;
    }
  }
  destinationType = self->_destinationType;
  if ((unint64_t)destinationType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](destinationType, "isEqual:")) {
      goto LABEL_14;
    }
  }
  connectionType = self->_connectionType;
  if ((unint64_t)connectionType | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](connectionType, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0)
    {
LABEL_14:
      BOOL v10 = 0;
      goto LABEL_15;
    }
    if (self->_completed)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_14;
    }
    BOOL v10 = 1;
  }
LABEL_15:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  NSUInteger v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_source copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_actionIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  uint64_t v12 = [(NSString *)self->_destinationType copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_connectionType copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 48) = self->_completed;
    *(unsigned char *)(v5 + 52) |= 1u;
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
  if (self->_source)
  {
    objc_msgSend(v5, "setSource:");
    id v4 = v5;
  }
  if (self->_actionIdentifier)
  {
    objc_msgSend(v5, "setActionIdentifier:");
    id v4 = v5;
  }
  if (self->_destinationType)
  {
    objc_msgSend(v5, "setDestinationType:");
    id v4 = v5;
  }
  if (self->_connectionType)
  {
    objc_msgSend(v5, "setConnectionType:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[48] = self->_completed;
    v4[52] |= 1u;
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
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_actionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_destinationType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_connectionType)
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
  return WFPBRemoteExecutionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  source = self->_source;
  if (source) {
    [v4 setObject:source forKey:@"source"];
  }
  actionIdentifier = self->_actionIdentifier;
  if (actionIdentifier) {
    [v4 setObject:actionIdentifier forKey:@"actionIdentifier"];
  }
  destinationType = self->_destinationType;
  if (destinationType) {
    [v4 setObject:destinationType forKey:@"destinationType"];
  }
  connectionType = self->_connectionType;
  if (connectionType) {
    [v4 setObject:connectionType forKey:@"connectionType"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v10 = [NSNumber numberWithBool:self->_completed];
    [v4 setObject:v10 forKey:@"completed"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBRemoteExecutionEvent;
  id v4 = [(WFPBRemoteExecutionEvent *)&v8 description];
  id v5 = [(WFPBRemoteExecutionEvent *)self dictionaryRepresentation];
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

- (BOOL)hasConnectionType
{
  return self->_connectionType != 0;
}

- (BOOL)hasDestinationType
{
  return self->_destinationType != 0;
}

- (BOOL)hasActionIdentifier
{
  return self->_actionIdentifier != 0;
}

- (BOOL)hasSource
{
  return self->_source != 0;
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
    return (NSString *)@"RemoteExecution";
  }
}

@end