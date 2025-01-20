@interface WFPBAutomatorWorkflowMigrationErrorEvent
- (BOOL)hasAutomatorActionIdentifier;
- (BOOL)hasErrorDescription;
- (BOOL)hasKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)automatorActionIdentifier;
- (NSString)errorDescription;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutomatorActionIdentifier:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBAutomatorWorkflowMigrationErrorEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_automatorActionIdentifier, 0);
}

- (void)setErrorDescription:(id)a3
{
}

- (NSString)errorDescription
{
  return self->_errorDescription;
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
  v4 = a3;
  if (v4[3]) {
    -[WFPBAutomatorWorkflowMigrationErrorEvent setKey:](self, "setKey:");
  }
  if (v4[1]) {
    -[WFPBAutomatorWorkflowMigrationErrorEvent setAutomatorActionIdentifier:](self, "setAutomatorActionIdentifier:");
  }
  if (v4[2]) {
    -[WFPBAutomatorWorkflowMigrationErrorEvent setErrorDescription:](self, "setErrorDescription:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_automatorActionIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_errorDescription hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[3])) || -[NSString isEqual:](key, "isEqual:"))
    && ((automatorActionIdentifier = self->_automatorActionIdentifier,
         !((unint64_t)automatorActionIdentifier | v4[1]))
     || -[NSString isEqual:](automatorActionIdentifier, "isEqual:")))
  {
    errorDescription = self->_errorDescription;
    if ((unint64_t)errorDescription | v4[2]) {
      char v8 = -[NSString isEqual:](errorDescription, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_automatorActionIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
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
  if (self->_automatorActionIdentifier)
  {
    objc_msgSend(v5, "setAutomatorActionIdentifier:");
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v5, "setErrorDescription:");
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
  if (self->_automatorActionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBAutomatorWorkflowMigrationErrorEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v4 setObject:errorDescription forKey:@"errorDescription"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBAutomatorWorkflowMigrationErrorEvent;
  id v4 = [(WFPBAutomatorWorkflowMigrationErrorEvent *)&v8 description];
  id v5 = [(WFPBAutomatorWorkflowMigrationErrorEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
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
    return (NSString *)@"AutomatorWorkflowMigrationErrorEvent";
  }
}

@end