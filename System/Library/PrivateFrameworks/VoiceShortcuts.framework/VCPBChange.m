@interface VCPBChange
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)message;
- (NSString)uniqueID;
- (id)changeTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)messageTypeAsString:(int)a3;
- (int)StringAsChangeType:(id)a3;
- (int)StringAsMessageType:(id)a3;
- (int)changeType;
- (int)messageType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChangeType:(int)a3;
- (void)setMessage:(id)a3;
- (void)setMessageType:(int)a3;
- (void)setUniqueID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPBChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)setMessage:(id)a3
{
}

- (NSData)message
{
  return self->_message;
}

- (void)setUniqueID:(id)a3
{
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setChangeType:(int)a3
{
  self->_changeType = a3;
}

- (int)changeType
{
  return self->_changeType;
}

- (void)setMessageType:(int)a3
{
  self->_messageType = a3;
}

- (int)messageType
{
  return self->_messageType;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  self->_messageType = v4[6];
  self->_changeType = v4[2];
  v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[VCPBChange setUniqueID:](self, "setUniqueID:");
    v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[VCPBChange setMessage:](self, "setMessage:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  uint64_t v3 = (2654435761 * self->_changeType) ^ (2654435761 * self->_messageType);
  NSUInteger v4 = [(NSString *)self->_uniqueID hash];
  return v3 ^ v4 ^ [(NSData *)self->_message hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_messageType == *((_DWORD *)v4 + 6)
    && self->_changeType == *((_DWORD *)v4 + 2)
    && ((uniqueID = self->_uniqueID, !((unint64_t)uniqueID | v4[4]))
     || -[NSString isEqual:](uniqueID, "isEqual:")))
  {
    message = self->_message;
    if ((unint64_t)message | v4[2]) {
      char v7 = -[NSData isEqual:](message, "isEqual:");
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
  *(_DWORD *)(v5 + 24) = self->_messageType;
  *(_DWORD *)(v5 + 8) = self->_changeType;
  uint64_t v6 = [(NSString *)self->_uniqueID copyWithZone:a3];
  char v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSData *)self->_message copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 6) = self->_messageType;
  *((_DWORD *)a3 + 2) = self->_changeType;
  uniqueID = self->_uniqueID;
  id v5 = a3;
  [v5 setUniqueID:uniqueID];
  [v5 setMessage:self->_message];
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (!self->_uniqueID) {
    __assert_rtn("-[VCPBChange writeTo:]", "VCPBChange.m", 121, "nil != self->_uniqueID");
  }
  PBDataWriterWriteStringField();
  if (!self->_message) {
    __assert_rtn("-[VCPBChange writeTo:]", "VCPBChange.m", 126, "nil != self->_message");
  }
  PBDataWriterWriteDataField();
}

- (BOOL)readFrom:(id)a3
{
  return VCPBChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unsigned int v4 = self->_messageType - 1;
  if (v4 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_messageType);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_1E6540920[v4];
  }
  [v3 setObject:v5 forKey:@"messageType"];

  unsigned int v6 = self->_changeType - 1;
  if (v6 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_changeType);
    char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v7 = off_1E6540938[v6];
  }
  [v3 setObject:v7 forKey:@"changeType"];

  uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v3 setObject:uniqueID forKey:@"uniqueID"];
  }
  message = self->_message;
  if (message) {
    [v3 setObject:message forKey:@"message"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPBChange;
  unsigned int v4 = [(VCPBChange *)&v8 description];
  id v5 = [(VCPBChange *)self dictionaryRepresentation];
  unsigned int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
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
    id v3 = off_1E6540938[a3 - 1];
  }
  return v3;
}

- (int)StringAsMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"IntentDefinitionChange"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VoiceShortcutChange"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WorkflowChange"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)messageTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6540920[a3 - 1];
  }
  return v3;
}

@end