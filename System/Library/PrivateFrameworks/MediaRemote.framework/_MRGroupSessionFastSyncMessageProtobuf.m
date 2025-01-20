@interface _MRGroupSessionFastSyncMessageProtobuf
- (BOOL)hasMessageType;
- (BOOL)hasPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)payload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)messageTypeAsString:(int)a3;
- (int)StringAsMessageType:(id)a3;
- (int)messageType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMessageType:(BOOL)a3;
- (void)setMessageType:(int)a3;
- (void)setPayload:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionFastSyncMessageProtobuf

- (int)messageType
{
  if (*(unsigned char *)&self->_has) {
    return self->_messageType;
  }
  else {
    return 0;
  }
}

- (void)setMessageType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_messageType = a3;
}

- (void)setHasMessageType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMessageType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)messageTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57D3CE0[a3];
  }

  return v3;
}

- (int)StringAsMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LeaderDiscovery"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IdentityShare"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IdentityShareReply"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MemberSync"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SessionEnd"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RemoteControl"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TransportMigration"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TransportMigrationReply"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RemoteJoinResponse"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"RemoteRemoveRequest"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"RemoteRemoveAllRequest"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionFastSyncMessageProtobuf;
  int v4 = [(_MRGroupSessionFastSyncMessageProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionFastSyncMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t messageType = self->_messageType;
    if (messageType >= 0xB)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_messageType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E57D3CE0[messageType];
    }
    [v3 setObject:v5 forKey:@"messageType"];
  }
  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"payload"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionFastSyncMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_payload)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_messageType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_payload)
  {
    id v5 = v4;
    objc_msgSend(v4, "setPayload:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_messageType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSData *)self->_payload copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_messageType != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  payload = self->_payload;
  if ((unint64_t)payload | *((void *)v4 + 2)) {
    char v6 = -[NSData isEqual:](payload, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_messageType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_payload hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[6])
  {
    self->_uint64_t messageType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    uint64_t v5 = v4;
    -[_MRGroupSessionFastSyncMessageProtobuf setPayload:](self, "setPayload:");
    id v4 = v5;
  }
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end