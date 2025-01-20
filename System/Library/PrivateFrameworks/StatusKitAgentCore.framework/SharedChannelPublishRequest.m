@interface SharedChannelPublishRequest
- (AuthCredential)authCredential;
- (BOOL)hasAuthCredential;
- (BOOL)hasChannelPublishPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ChannelPublishPayload)channelPublishPayload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthCredential:(id)a3;
- (void)setChannelPublishPayload:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SharedChannelPublishRequest

- (BOOL)hasAuthCredential
{
  return self->_authCredential != 0;
}

- (BOOL)hasChannelPublishPayload
{
  return self->_channelPublishPayload != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SharedChannelPublishRequest;
  v4 = [(SharedChannelPublishRequest *)&v8 description];
  v5 = [(SharedChannelPublishRequest *)self dictionaryRepresentation];
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
  channelPublishPayload = self->_channelPublishPayload;
  if (channelPublishPayload)
  {
    v7 = [(ChannelPublishPayload *)channelPublishPayload dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"channel_publish_payload"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SharedChannelPublishRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_channelPublishPayload)
  {
    PBDataWriterWriteSubmessage();
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
  if (self->_channelPublishPayload)
  {
    objc_msgSend(v5, "setChannelPublishPayload:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(AuthCredential *)self->_authCredential copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(ChannelPublishPayload *)self->_channelPublishPayload copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((authCredential = self->_authCredential, !((unint64_t)authCredential | v4[1]))
     || -[AuthCredential isEqual:](authCredential, "isEqual:")))
  {
    channelPublishPayload = self->_channelPublishPayload;
    if ((unint64_t)channelPublishPayload | v4[2]) {
      char v7 = -[ChannelPublishPayload isEqual:](channelPublishPayload, "isEqual:");
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

- (unint64_t)hash
{
  unint64_t v3 = [(AuthCredential *)self->_authCredential hash];
  return [(ChannelPublishPayload *)self->_channelPublishPayload hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  authCredential = self->_authCredential;
  uint64_t v6 = v4[1];
  v9 = v4;
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
    -[SharedChannelPublishRequest setAuthCredential:](self, "setAuthCredential:");
  }
  id v4 = v9;
LABEL_7:
  channelPublishPayload = self->_channelPublishPayload;
  uint64_t v8 = v4[2];
  if (channelPublishPayload)
  {
    if (v8) {
      -[ChannelPublishPayload mergeFrom:](channelPublishPayload, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SharedChannelPublishRequest setChannelPublishPayload:](self, "setChannelPublishPayload:");
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

- (ChannelPublishPayload)channelPublishPayload
{
  return self->_channelPublishPayload;
}

- (void)setChannelPublishPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelPublishPayload, 0);
  objc_storeStrong((id *)&self->_authCredential, 0);
}

@end