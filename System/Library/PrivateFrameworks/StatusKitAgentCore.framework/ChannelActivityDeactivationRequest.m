@interface ChannelActivityDeactivationRequest
- (AuthCredential)authCredential;
- (BOOL)hasAdopter;
- (BOOL)hasAuthCredential;
- (BOOL)hasChannelIdentity;
- (BOOL)hasClientTimestampSeconds;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ChannelIdentity)channelIdentity;
- (NSData)uuid;
- (NSString)adopter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)clientTimestampSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdopter:(id)a3;
- (void)setAuthCredential:(id)a3;
- (void)setChannelIdentity:(id)a3;
- (void)setClientTimestampSeconds:(unint64_t)a3;
- (void)setHasClientTimestampSeconds:(BOOL)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ChannelActivityDeactivationRequest

- (BOOL)hasAuthCredential
{
  return self->_authCredential != 0;
}

- (BOOL)hasChannelIdentity
{
  return self->_channelIdentity != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setClientTimestampSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clientTimestampSeconds = a3;
}

- (void)setHasClientTimestampSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientTimestampSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAdopter
{
  return self->_adopter != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ChannelActivityDeactivationRequest;
  v4 = [(ChannelActivityDeactivationRequest *)&v8 description];
  v5 = [(ChannelActivityDeactivationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
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
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_clientTimestampSeconds];
    [v3 setObject:v9 forKey:@"client_timestamp_seconds"];
  }
  adopter = self->_adopter;
  if (adopter) {
    [v3 setObject:adopter forKey:@"adopter"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ChannelActivityDeactivationRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
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
  if (self->_uuid)
  {
    objc_msgSend(v5, "setUuid:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_clientTimestampSeconds;
    *((unsigned char *)v4 + 48) |= 1u;
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
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(ChannelIdentity *)self->_channelIdentity copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSData *)self->_uuid copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_clientTimestampSeconds;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_adopter copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  authCredential = self->_authCredential;
  if ((unint64_t)authCredential | *((void *)v4 + 3))
  {
    if (!-[AuthCredential isEqual:](authCredential, "isEqual:")) {
      goto LABEL_15;
    }
  }
  channelIdentity = self->_channelIdentity;
  if ((unint64_t)channelIdentity | *((void *)v4 + 4))
  {
    if (!-[ChannelIdentity isEqual:](channelIdentity, "isEqual:")) {
      goto LABEL_15;
    }
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_clientTimestampSeconds != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  adopter = self->_adopter;
  if ((unint64_t)adopter | *((void *)v4 + 2)) {
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
  uint64_t v5 = [(NSData *)self->_uuid hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_clientTimestampSeconds;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_adopter hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  authCredential = self->_authCredential;
  uint64_t v6 = v4[3];
  char v9 = v4;
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
    -[ChannelActivityDeactivationRequest setAuthCredential:](self, "setAuthCredential:");
  }
  unint64_t v4 = v9;
LABEL_7:
  channelIdentity = self->_channelIdentity;
  uint64_t v8 = v4[4];
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
    -[ChannelActivityDeactivationRequest setChannelIdentity:](self, "setChannelIdentity:");
  }
  unint64_t v4 = v9;
LABEL_13:
  if (v4[5])
  {
    -[ChannelActivityDeactivationRequest setUuid:](self, "setUuid:");
    unint64_t v4 = v9;
  }
  if (v4[6])
  {
    self->_clientTimestampSeconds = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[2]) {
    -[ChannelActivityDeactivationRequest setAdopter:](self, "setAdopter:");
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

- (unint64_t)clientTimestampSeconds
{
  return self->_clientTimestampSeconds;
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