@interface _MRApplicationConnectionRequestInfoProtobuf
- (BOOL)hasClient;
- (BOOL)hasDeviceInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRDeviceInfoMessageProtobuf)deviceInfo;
- (_MRNowPlayingClientProtobuf)client;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClient:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRApplicationConnectionRequestInfoProtobuf

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
}

- (BOOL)hasClient
{
  return self->_client != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRApplicationConnectionRequestInfoProtobuf;
  v4 = [(_MRApplicationConnectionRequestInfoProtobuf *)&v8 description];
  v5 = [(_MRApplicationConnectionRequestInfoProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    v5 = [(_MRDeviceInfoMessageProtobuf *)deviceInfo dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"deviceInfo"];
  }
  client = self->_client;
  if (client)
  {
    v7 = [(_MRNowPlayingClientProtobuf *)client dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"client"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRApplicationConnectionRequestInfoProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_deviceInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_client)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_deviceInfo)
  {
    objc_msgSend(v4, "setDeviceInfo:");
    id v4 = v5;
  }
  if (self->_client)
  {
    objc_msgSend(v5, "setClient:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRDeviceInfoMessageProtobuf *)self->_deviceInfo copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(_MRNowPlayingClientProtobuf *)self->_client copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((deviceInfo = self->_deviceInfo, !((unint64_t)deviceInfo | v4[2]))
     || -[_MRDeviceInfoMessageProtobuf isEqual:](deviceInfo, "isEqual:")))
  {
    client = self->_client;
    if ((unint64_t)client | v4[1]) {
      char v7 = -[_MRNowPlayingClientProtobuf isEqual:](client, "isEqual:");
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
  unint64_t v3 = [(_MRDeviceInfoMessageProtobuf *)self->_deviceInfo hash];
  return [(_MRNowPlayingClientProtobuf *)self->_client hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  deviceInfo = self->_deviceInfo;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (deviceInfo)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRDeviceInfoMessageProtobuf mergeFrom:](deviceInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRApplicationConnectionRequestInfoProtobuf setDeviceInfo:](self, "setDeviceInfo:");
  }
  id v4 = v9;
LABEL_7:
  client = self->_client;
  uint64_t v8 = v4[1];
  if (client)
  {
    if (v8) {
      -[_MRNowPlayingClientProtobuf mergeFrom:](client, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[_MRApplicationConnectionRequestInfoProtobuf setClient:](self, "setClient:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRDeviceInfoMessageProtobuf)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
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
  objc_storeStrong((id *)&self->_deviceInfo, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end