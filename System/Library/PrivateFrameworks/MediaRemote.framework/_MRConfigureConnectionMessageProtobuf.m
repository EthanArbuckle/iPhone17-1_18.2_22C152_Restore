@interface _MRConfigureConnectionMessageProtobuf
- (BOOL)hasDestinationOutputDeviceUID;
- (BOOL)hasGroupID;
- (BOOL)hasServiceName;
- (BOOL)hasSourceOutputDeviceName;
- (BOOL)hasSourceOutputDeviceUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)destinationOutputDeviceUID;
- (NSString)groupID;
- (NSString)serviceName;
- (NSString)sourceOutputDeviceName;
- (NSString)sourceOutputDeviceUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestinationOutputDeviceUID:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSourceOutputDeviceName:(id)a3;
- (void)setSourceOutputDeviceUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRConfigureConnectionMessageProtobuf

- (BOOL)hasGroupID
{
  return self->_groupID != 0;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (BOOL)hasSourceOutputDeviceUID
{
  return self->_sourceOutputDeviceUID != 0;
}

- (BOOL)hasSourceOutputDeviceName
{
  return self->_sourceOutputDeviceName != 0;
}

- (BOOL)hasDestinationOutputDeviceUID
{
  return self->_destinationOutputDeviceUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRConfigureConnectionMessageProtobuf;
  v4 = [(_MRConfigureConnectionMessageProtobuf *)&v8 description];
  v5 = [(_MRConfigureConnectionMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  groupID = self->_groupID;
  if (groupID) {
    [v3 setObject:groupID forKey:@"groupID"];
  }
  serviceName = self->_serviceName;
  if (serviceName) {
    [v4 setObject:serviceName forKey:@"serviceName"];
  }
  sourceOutputDeviceUID = self->_sourceOutputDeviceUID;
  if (sourceOutputDeviceUID) {
    [v4 setObject:sourceOutputDeviceUID forKey:@"sourceOutputDeviceUID"];
  }
  sourceOutputDeviceName = self->_sourceOutputDeviceName;
  if (sourceOutputDeviceName) {
    [v4 setObject:sourceOutputDeviceName forKey:@"sourceOutputDeviceName"];
  }
  destinationOutputDeviceUID = self->_destinationOutputDeviceUID;
  if (destinationOutputDeviceUID) {
    [v4 setObject:destinationOutputDeviceUID forKey:@"destinationOutputDeviceUID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRConfigureConnectionMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_groupID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_serviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceOutputDeviceUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceOutputDeviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_destinationOutputDeviceUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_groupID)
  {
    objc_msgSend(v4, "setGroupID:");
    id v4 = v5;
  }
  if (self->_serviceName)
  {
    objc_msgSend(v5, "setServiceName:");
    id v4 = v5;
  }
  if (self->_sourceOutputDeviceUID)
  {
    objc_msgSend(v5, "setSourceOutputDeviceUID:");
    id v4 = v5;
  }
  if (self->_sourceOutputDeviceName)
  {
    objc_msgSend(v5, "setSourceOutputDeviceName:");
    id v4 = v5;
  }
  if (self->_destinationOutputDeviceUID)
  {
    objc_msgSend(v5, "setDestinationOutputDeviceUID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_groupID copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_serviceName copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_sourceOutputDeviceUID copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSString *)self->_sourceOutputDeviceName copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_destinationOutputDeviceUID copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((groupID = self->_groupID, !((unint64_t)groupID | v4[2]))
     || -[NSString isEqual:](groupID, "isEqual:"))
    && ((serviceName = self->_serviceName, !((unint64_t)serviceName | v4[3]))
     || -[NSString isEqual:](serviceName, "isEqual:"))
    && ((sourceOutputDeviceUID = self->_sourceOutputDeviceUID, !((unint64_t)sourceOutputDeviceUID | v4[5]))
     || -[NSString isEqual:](sourceOutputDeviceUID, "isEqual:"))
    && ((sourceOutputDeviceName = self->_sourceOutputDeviceName, !((unint64_t)sourceOutputDeviceName | v4[4]))
     || -[NSString isEqual:](sourceOutputDeviceName, "isEqual:")))
  {
    destinationOutputDeviceUID = self->_destinationOutputDeviceUID;
    if ((unint64_t)destinationOutputDeviceUID | v4[1]) {
      char v10 = -[NSString isEqual:](destinationOutputDeviceUID, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_groupID hash];
  NSUInteger v4 = [(NSString *)self->_serviceName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_sourceOutputDeviceUID hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_sourceOutputDeviceName hash];
  return v6 ^ [(NSString *)self->_destinationOutputDeviceUID hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[_MRConfigureConnectionMessageProtobuf setGroupID:](self, "setGroupID:");
  }
  if (v4[3]) {
    -[_MRConfigureConnectionMessageProtobuf setServiceName:](self, "setServiceName:");
  }
  if (v4[5]) {
    -[_MRConfigureConnectionMessageProtobuf setSourceOutputDeviceUID:](self, "setSourceOutputDeviceUID:");
  }
  if (v4[4]) {
    -[_MRConfigureConnectionMessageProtobuf setSourceOutputDeviceName:](self, "setSourceOutputDeviceName:");
  }
  if (v4[1]) {
    -[_MRConfigureConnectionMessageProtobuf setDestinationOutputDeviceUID:](self, "setDestinationOutputDeviceUID:");
  }
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)sourceOutputDeviceUID
{
  return self->_sourceOutputDeviceUID;
}

- (void)setSourceOutputDeviceUID:(id)a3
{
}

- (NSString)sourceOutputDeviceName
{
  return self->_sourceOutputDeviceName;
}

- (void)setSourceOutputDeviceName:(id)a3
{
}

- (NSString)destinationOutputDeviceUID
{
  return self->_destinationOutputDeviceUID;
}

- (void)setDestinationOutputDeviceUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceOutputDeviceUID, 0);
  objc_storeStrong((id *)&self->_sourceOutputDeviceName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_destinationOutputDeviceUID, 0);
}

@end