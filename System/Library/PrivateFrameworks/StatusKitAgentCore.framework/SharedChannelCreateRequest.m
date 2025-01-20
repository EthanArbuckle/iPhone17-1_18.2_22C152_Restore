@interface SharedChannelCreateRequest
- (AuthCredential)authCredential;
- (BOOL)hasAdopter;
- (BOOL)hasAuthCredential;
- (BOOL)hasChannelOwnershipType;
- (BOOL)hasChannelTopic;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)adopter;
- (NSString)channelTopic;
- (id)channelOwnershipTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsChannelOwnershipType:(id)a3;
- (int)channelOwnershipType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdopter:(id)a3;
- (void)setAuthCredential:(id)a3;
- (void)setChannelOwnershipType:(int)a3;
- (void)setChannelTopic:(id)a3;
- (void)setHasChannelOwnershipType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedChannelCreateRequest

- (BOOL)hasChannelTopic
{
  return self->_channelTopic != 0;
}

- (BOOL)hasAuthCredential
{
  return self->_authCredential != 0;
}

- (int)channelOwnershipType
{
  if (*(unsigned char *)&self->_has) {
    return self->_channelOwnershipType;
  }
  else {
    return 0;
  }
}

- (void)setChannelOwnershipType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_channelOwnershipType = a3;
}

- (void)setHasChannelOwnershipType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelOwnershipType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)channelOwnershipTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"SHARED_OWNERSHIP";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"SELF_USER_OWNERSHIP";
  }
  return v4;
}

- (int)StringAsChannelOwnershipType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SELF_USER_OWNERSHIP"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"SHARED_OWNERSHIP"];
  }

  return v4;
}

- (BOOL)hasAdopter
{
  return self->_adopter != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelCreateRequest;
  int v4 = [(SharedChannelCreateRequest *)&v8 description];
  v5 = [(SharedChannelCreateRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  channelTopic = self->_channelTopic;
  if (channelTopic) {
    [v3 setObject:channelTopic forKey:@"channel_topic"];
  }
  authCredential = self->_authCredential;
  if (authCredential)
  {
    v7 = [(AuthCredential *)authCredential dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"auth_credential"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int channelOwnershipType = self->_channelOwnershipType;
    if (channelOwnershipType)
    {
      if (channelOwnershipType == 1)
      {
        v9 = @"SHARED_OWNERSHIP";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_channelOwnershipType);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = @"SELF_USER_OWNERSHIP";
    }
    [v4 setObject:v9 forKey:@"channel_ownership_type"];
  }
  adopter = self->_adopter;
  if (adopter) {
    [v4 setObject:adopter forKey:@"adopter"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelCreateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_channelTopic)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_authCredential)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
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
  if (self->_channelTopic)
  {
    objc_msgSend(v4, "setChannelTopic:");
    id v4 = v5;
  }
  if (self->_authCredential)
  {
    objc_msgSend(v5, "setAuthCredential:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_channelOwnershipType;
    *((unsigned char *)v4 + 40) |= 1u;
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
  uint64_t v6 = [(NSString *)self->_channelTopic copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(AuthCredential *)self->_authCredential copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_channelOwnershipType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_adopter copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  channelTopic = self->_channelTopic;
  if ((unint64_t)channelTopic | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](channelTopic, "isEqual:")) {
      goto LABEL_13;
    }
  }
  authCredential = self->_authCredential;
  if ((unint64_t)authCredential | *((void *)v4 + 2))
  {
    if (!-[AuthCredential isEqual:](authCredential, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_channelOwnershipType != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  adopter = self->_adopter;
  if ((unint64_t)adopter | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](adopter, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_channelTopic hash];
  unint64_t v4 = [(AuthCredential *)self->_authCredential hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_channelOwnershipType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_adopter hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (int *)a3;
  v7 = v4;
  if (*((void *)v4 + 4))
  {
    -[SharedChannelCreateRequest setChannelTopic:](self, "setChannelTopic:");
    unint64_t v4 = v7;
  }
  authCredential = self->_authCredential;
  uint64_t v6 = *((void *)v4 + 2);
  if (authCredential)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[AuthCredential mergeFrom:](authCredential, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[SharedChannelCreateRequest setAuthCredential:](self, "setAuthCredential:");
  }
  unint64_t v4 = v7;
LABEL_9:
  if (v4[10])
  {
    self->_int channelOwnershipType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1)) {
    -[SharedChannelCreateRequest setAdopter:](self, "setAdopter:");
  }
  MEMORY[0x270F9A758]();
}

- (NSString)channelTopic
{
  return self->_channelTopic;
}

- (void)setChannelTopic:(id)a3
{
}

- (AuthCredential)authCredential
{
  return self->_authCredential;
}

- (void)setAuthCredential:(id)a3
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
  objc_storeStrong((id *)&self->_channelTopic, 0);
  objc_storeStrong((id *)&self->_authCredential, 0);
  objc_storeStrong((id *)&self->_adopter, 0);
}

@end