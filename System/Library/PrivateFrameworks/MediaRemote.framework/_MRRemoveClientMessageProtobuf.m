@interface _MRRemoveClientMessageProtobuf
- (BOOL)hasClient;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRNowPlayingClientProtobuf)client;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClient:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRRemoveClientMessageProtobuf

- (BOOL)hasClient
{
  return self->_client != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRRemoveClientMessageProtobuf;
  v4 = [(_MRRemoveClientMessageProtobuf *)&v8 description];
  v5 = [(_MRRemoveClientMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  client = self->_client;
  if (client)
  {
    v5 = [(_MRNowPlayingClientProtobuf *)client dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"client"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRemoveClientMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_client) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  client = self->_client;
  if (client) {
    [a3 setClient:client];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRNowPlayingClientProtobuf *)self->_client copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    client = self->_client;
    if ((unint64_t)client | v4[1]) {
      char v6 = -[_MRNowPlayingClientProtobuf isEqual:](client, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(_MRNowPlayingClientProtobuf *)self->_client hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  client = self->_client;
  uint64_t v6 = v4[1];
  if (client)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    client = (_MRNowPlayingClientProtobuf *)-[_MRNowPlayingClientProtobuf mergeFrom:](client, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    client = (_MRNowPlayingClientProtobuf *)-[_MRRemoveClientMessageProtobuf setClient:](self, "setClient:");
  }
  v4 = v7;
LABEL_7:

  MEMORY[0x1F41817F8](client, v4);
}

- (_MRNowPlayingClientProtobuf)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end