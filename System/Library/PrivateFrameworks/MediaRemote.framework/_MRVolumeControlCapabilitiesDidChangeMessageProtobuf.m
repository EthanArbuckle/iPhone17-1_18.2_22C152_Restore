@interface _MRVolumeControlCapabilitiesDidChangeMessageProtobuf
- (BOOL)hasCapabilities;
- (BOOL)hasEndpointUID;
- (BOOL)hasOutputDeviceUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)endpointUID;
- (NSString)outputDeviceUID;
- (_MRVolumeControlAvailabilityProtobuf)capabilities;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setEndpointUID:(id)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRVolumeControlCapabilitiesDidChangeMessageProtobuf

- (BOOL)hasCapabilities
{
  return self->_capabilities != 0;
}

- (BOOL)hasEndpointUID
{
  return self->_endpointUID != 0;
}

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRVolumeControlCapabilitiesDidChangeMessageProtobuf;
  v4 = [(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf *)&v8 description];
  v5 = [(_MRVolumeControlCapabilitiesDidChangeMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  capabilities = self->_capabilities;
  if (capabilities)
  {
    v5 = [(_MRVolumeControlAvailabilityProtobuf *)capabilities dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"capabilities"];
  }
  endpointUID = self->_endpointUID;
  if (endpointUID) {
    [v3 setObject:endpointUID forKey:@"endpointUID"];
  }
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID) {
    [v3 setObject:outputDeviceUID forKey:@"outputDeviceUID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVolumeControlCapabilitiesDidChangeMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_capabilities)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_endpointUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_outputDeviceUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_capabilities)
  {
    objc_msgSend(v4, "setCapabilities:");
    id v4 = v5;
  }
  if (self->_endpointUID)
  {
    objc_msgSend(v5, "setEndpointUID:");
    id v4 = v5;
  }
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v5, "setOutputDeviceUID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRVolumeControlAvailabilityProtobuf *)self->_capabilities copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_endpointUID copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_outputDeviceUID copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((capabilities = self->_capabilities, !((unint64_t)capabilities | v4[1]))
     || -[_MRVolumeControlAvailabilityProtobuf isEqual:](capabilities, "isEqual:"))
    && ((endpointUID = self->_endpointUID, !((unint64_t)endpointUID | v4[2]))
     || -[NSString isEqual:](endpointUID, "isEqual:")))
  {
    outputDeviceUID = self->_outputDeviceUID;
    if ((unint64_t)outputDeviceUID | v4[3]) {
      char v8 = -[NSString isEqual:](outputDeviceUID, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MRVolumeControlAvailabilityProtobuf *)self->_capabilities hash];
  NSUInteger v4 = [(NSString *)self->_endpointUID hash] ^ v3;
  return v4 ^ [(NSString *)self->_outputDeviceUID hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  capabilities = self->_capabilities;
  uint64_t v6 = v4[1];
  v7 = v4;
  if (capabilities)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRVolumeControlAvailabilityProtobuf mergeFrom:](capabilities, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setCapabilities:](self, "setCapabilities:");
  }
  NSUInteger v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setEndpointUID:](self, "setEndpointUID:");
    NSUInteger v4 = v7;
  }
  if (v4[3]) {
    -[_MRVolumeControlCapabilitiesDidChangeMessageProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRVolumeControlAvailabilityProtobuf)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (NSString)endpointUID
{
  return self->_endpointUID;
}

- (void)setEndpointUID:(id)a3
{
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_storeStrong((id *)&self->_endpointUID, 0);

  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end