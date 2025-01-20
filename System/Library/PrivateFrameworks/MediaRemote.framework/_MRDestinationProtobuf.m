@interface _MRDestinationProtobuf
- (BOOL)hasEndpoint;
- (BOOL)hasOutputContextUID;
- (BOOL)hasOutputDeviceUID;
- (BOOL)hasPlayerPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)outputContextUID;
- (NSString)outputDeviceUID;
- (_MRAVEndpointDescriptorProtobuf)endpoint;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setOutputContextUID:(id)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRDestinationProtobuf

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (BOOL)hasEndpoint
{
  return self->_endpoint != 0;
}

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (BOOL)hasOutputContextUID
{
  return self->_outputContextUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRDestinationProtobuf;
  v4 = [(_MRDestinationProtobuf *)&v8 description];
  v5 = [(_MRDestinationProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID) {
    [v3 setObject:outputDeviceUID forKey:@"outputDeviceUID"];
  }
  endpoint = self->_endpoint;
  if (endpoint)
  {
    v7 = [(_MRAVEndpointDescriptorProtobuf *)endpoint dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"endpoint"];
  }
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v9 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"playerPath"];
  }
  outputContextUID = self->_outputContextUID;
  if (outputContextUID) {
    [v4 setObject:outputContextUID forKey:@"outputContextUID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRDestinationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_outputDeviceUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_endpoint)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_outputContextUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v4, "setOutputDeviceUID:");
    id v4 = v5;
  }
  if (self->_endpoint)
  {
    objc_msgSend(v5, "setEndpoint:");
    id v4 = v5;
  }
  if (self->_playerPath)
  {
    objc_msgSend(v5, "setPlayerPath:");
    id v4 = v5;
  }
  if (self->_outputContextUID)
  {
    objc_msgSend(v5, "setOutputContextUID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_outputDeviceUID copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(_MRAVEndpointDescriptorProtobuf *)self->_endpoint copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSString *)self->_outputContextUID copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((outputDeviceUID = self->_outputDeviceUID, !((unint64_t)outputDeviceUID | v4[3]))
     || -[NSString isEqual:](outputDeviceUID, "isEqual:"))
    && ((endpoint = self->_endpoint, !((unint64_t)endpoint | v4[1]))
     || -[_MRAVEndpointDescriptorProtobuf isEqual:](endpoint, "isEqual:"))
    && ((playerPath = self->_playerPath, !((unint64_t)playerPath | v4[4]))
     || -[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:")))
  {
    outputContextUID = self->_outputContextUID;
    if ((unint64_t)outputContextUID | v4[2]) {
      char v9 = -[NSString isEqual:](outputContextUID, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_outputDeviceUID hash];
  unint64_t v4 = [(_MRAVEndpointDescriptorProtobuf *)self->_endpoint hash] ^ v3;
  unint64_t v5 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
  return v4 ^ v5 ^ [(NSString *)self->_outputContextUID hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  char v9 = v4;
  if (v4[3])
  {
    -[_MRDestinationProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    unint64_t v4 = v9;
  }
  endpoint = self->_endpoint;
  uint64_t v6 = v4[1];
  if (endpoint)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[_MRAVEndpointDescriptorProtobuf mergeFrom:](endpoint, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[_MRDestinationProtobuf setEndpoint:](self, "setEndpoint:");
  }
  unint64_t v4 = v9;
LABEL_9:
  playerPath = self->_playerPath;
  uint64_t v8 = v4[4];
  if (playerPath)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[_MRDestinationProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  unint64_t v4 = v9;
LABEL_15:
  if (v4[2]) {
    -[_MRDestinationProtobuf setOutputContextUID:](self, "setOutputContextUID:");
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (_MRAVEndpointDescriptorProtobuf)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (NSString)outputContextUID
{
  return self->_outputContextUID;
}

- (void)setOutputContextUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_storeStrong((id *)&self->_outputContextUID, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end