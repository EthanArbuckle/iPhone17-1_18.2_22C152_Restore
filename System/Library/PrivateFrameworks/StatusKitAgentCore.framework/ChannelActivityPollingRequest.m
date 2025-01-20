@interface ChannelActivityPollingRequest
- (AuthCredential)authCredential;
- (BOOL)hasAdopter;
- (BOOL)hasAuthCredential;
- (BOOL)hasChannelIdentity;
- (BOOL)hasRequestFlag;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ChannelIdentity)channelIdentity;
- (NSData)uuid;
- (NSString)adopter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requestFlagAsString:(int)a3;
- (int)StringAsRequestFlag:(id)a3;
- (int)requestFlag;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdopter:(id)a3;
- (void)setAuthCredential:(id)a3;
- (void)setChannelIdentity:(id)a3;
- (void)setHasRequestFlag:(BOOL)a3;
- (void)setRequestFlag:(int)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ChannelActivityPollingRequest

- (BOOL)hasAuthCredential
{
  return self->_authCredential != 0;
}

- (BOOL)hasChannelIdentity
{
  return self->_channelIdentity != 0;
}

- (int)requestFlag
{
  if (*(unsigned char *)&self->_has) {
    return self->_requestFlag;
  }
  else {
    return 0;
  }
}

- (void)setRequestFlag:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requestFlag = a3;
}

- (void)setHasRequestFlag:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRequestFlag
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)requestFlagAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2646E22A0[a3];
  }
  return v3;
}

- (int)StringAsRequestFlag:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NEW_REQUEST"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REFRESH_REQUEST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UPDATE_MISSED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasAdopter
{
  return self->_adopter != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ChannelActivityPollingRequest;
  int v4 = [(ChannelActivityPollingRequest *)&v8 description];
  v5 = [(ChannelActivityPollingRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  authCredential = self->_authCredential;
  if (authCredential)
  {
    v5 = [(AuthCredential *)authCredential dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"auth_credential"];
  }
  channelIdentity = self->_channelIdentity;
  if (channelIdentity)
  {
    v7 = [(ChannelIdentity *)channelIdentity dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"channel_identity"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t requestFlag = self->_requestFlag;
    if (requestFlag >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_requestFlag);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_2646E22A0[requestFlag];
    }
    [v3 setObject:v9 forKey:@"request_flag"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  adopter = self->_adopter;
  if (adopter) {
    [v3 setObject:adopter forKey:@"adopter"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelActivityPollingRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_authCredential)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_channelIdentity)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_adopter)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_authCredential)
  {
    objc_msgSend(v4, "setAuthCredential:");
    id v4 = v5;
  }
  if (self->_channelIdentity)
  {
    objc_msgSend(v5, "setChannelIdentity:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_requestFlag;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_uuid)
  {
    objc_msgSend(v5, "setUuid:");
    id v4 = v5;
  }
  if (self->_adopter)
  {
    objc_msgSend(v5, "setAdopter:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(AuthCredential *)self->_authCredential copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(ChannelIdentity *)self->_channelIdentity copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_requestFlag;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v10 = [(NSData *)self->_uuid copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_adopter copyWithZone:a3];
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  authCredential = self->_authCredential;
  if ((unint64_t)authCredential | *((void *)v4 + 2))
  {
    if (!-[AuthCredential isEqual:](authCredential, "isEqual:")) {
      goto LABEL_15;
    }
  }
  channelIdentity = self->_channelIdentity;
  if ((unint64_t)channelIdentity | *((void *)v4 + 3))
  {
    if (!-[ChannelIdentity isEqual:](channelIdentity, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_requestFlag != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 5) && !-[NSData isEqual:](uuid, "isEqual:")) {
    goto LABEL_15;
  }
  adopter = self->_adopter;
  if ((unint64_t)adopter | *((void *)v4 + 1)) {
    char v9 = -[NSString isEqual:](adopter, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(AuthCredential *)self->_authCredential hash];
  unint64_t v4 = [(ChannelIdentity *)self->_channelIdentity hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_requestFlag;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSData *)self->_uuid hash];
  return v6 ^ [(NSString *)self->_adopter hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  authCredential = self->_authCredential;
  uint64_t v6 = *((void *)v4 + 2);
  id v9 = v4;
  if (authCredential)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[AuthCredential mergeFrom:](authCredential, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ChannelActivityPollingRequest setAuthCredential:](self, "setAuthCredential:");
  }
  id v4 = v9;
LABEL_7:
  channelIdentity = self->_channelIdentity;
  uint64_t v8 = *((void *)v4 + 3);
  if (channelIdentity)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[ChannelIdentity mergeFrom:](channelIdentity, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[ChannelActivityPollingRequest setChannelIdentity:](self, "setChannelIdentity:");
  }
  id v4 = v9;
LABEL_13:
  if (*((unsigned char *)v4 + 48))
  {
    self->_uint64_t requestFlag = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5))
  {
    -[ChannelActivityPollingRequest setUuid:](self, "setUuid:");
    id v4 = v9;
  }
  if (*((void *)v4 + 1)) {
    -[ChannelActivityPollingRequest setAdopter:](self, "setAdopter:");
  }
  MEMORY[0x270F9A758]();
}

- (AuthCredential)authCredential
{
  return self->_authCredential;
}

- (void)setAuthCredential:(id)a3
{
}

- (ChannelIdentity)channelIdentity
{
  return self->_channelIdentity;
}

- (void)setChannelIdentity:(id)a3
{
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)adopter
{
  return self->_adopter;
}

- (void)setAdopter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_channelIdentity, 0);
  objc_storeStrong((id *)&self->_authCredential, 0);
  objc_storeStrong((id *)&self->_adopter, 0);
}

@end