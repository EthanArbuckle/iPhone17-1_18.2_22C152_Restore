@interface VCPBIntentDefinitionChange
- (BOOL)hasIntentDefinition;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)associatedBundleID;
- (VCPBIntentDefinition)intentDefinition;
- (id)changeTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsChangeType:(id)a3;
- (int)changeType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssociatedBundleID:(id)a3;
- (void)setChangeType:(int)a3;
- (void)setIntentDefinition:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPBIntentDefinitionChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentDefinition, 0);
  objc_storeStrong((id *)&self->_associatedBundleID, 0);
}

- (void)setIntentDefinition:(id)a3
{
}

- (VCPBIntentDefinition)intentDefinition
{
  return self->_intentDefinition;
}

- (void)setAssociatedBundleID:(id)a3
{
}

- (NSString)associatedBundleID
{
  return self->_associatedBundleID;
}

- (void)setChangeType:(int)a3
{
  self->_changeType = a3;
}

- (int)changeType
{
  return self->_changeType;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  self->_changeType = v4[4];
  v7 = v4;
  if (*((void *)v4 + 1))
  {
    -[VCPBIntentDefinitionChange setAssociatedBundleID:](self, "setAssociatedBundleID:");
    v4 = v7;
  }
  intentDefinition = self->_intentDefinition;
  uint64_t v6 = *((void *)v4 + 3);
  if (intentDefinition)
  {
    if (v6) {
      -[VCPBIntentDefinition mergeFrom:](intentDefinition, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[VCPBIntentDefinitionChange setIntentDefinition:](self, "setIntentDefinition:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_changeType;
  NSUInteger v4 = [(NSString *)self->_associatedBundleID hash];
  return v4 ^ [(VCPBIntentDefinition *)self->_intentDefinition hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_changeType == *((_DWORD *)v4 + 4)
    && ((associatedBundleID = self->_associatedBundleID, !((unint64_t)associatedBundleID | v4[1]))
     || -[NSString isEqual:](associatedBundleID, "isEqual:")))
  {
    intentDefinition = self->_intentDefinition;
    if ((unint64_t)intentDefinition | v4[3]) {
      char v7 = -[VCPBIntentDefinition isEqual:](intentDefinition, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_changeType;
  uint64_t v6 = [(NSString *)self->_associatedBundleID copyWithZone:a3];
  char v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  id v8 = [(VCPBIntentDefinition *)self->_intentDefinition copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  NSUInteger v4 = a3;
  v4[4] = self->_changeType;
  id v5 = v4;
  [v4 setAssociatedBundleID:self->_associatedBundleID];
  if (self->_intentDefinition) {
    objc_msgSend(v5, "setIntentDefinition:");
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_associatedBundleID) {
    __assert_rtn("-[VCPBIntentDefinitionChange writeTo:]", "VCPBIntentDefinitionChange.m", 120, "nil != self->_associatedBundleID");
  }
  PBDataWriterWriteStringField();
  if (self->_intentDefinition) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return VCPBIntentDefinitionChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned int v4 = self->_changeType - 1;
  if (v4 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_changeType);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_1E6540908[v4];
  }
  [v3 setObject:v5 forKey:@"changeType"];

  associatedBundleID = self->_associatedBundleID;
  if (associatedBundleID) {
    [v3 setObject:associatedBundleID forKey:@"associatedBundleID"];
  }
  intentDefinition = self->_intentDefinition;
  if (intentDefinition)
  {
    id v8 = [(VCPBIntentDefinition *)intentDefinition dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"intentDefinition"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPBIntentDefinitionChange;
  unsigned int v4 = [(VCPBIntentDefinitionChange *)&v8 description];
  id v5 = [(VCPBIntentDefinitionChange *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIntentDefinition
{
  return self->_intentDefinition != 0;
}

- (int)StringAsChangeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ADDED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UPDATED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DELETED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)changeTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6540908[a3 - 1];
  }
  return v3;
}

@end