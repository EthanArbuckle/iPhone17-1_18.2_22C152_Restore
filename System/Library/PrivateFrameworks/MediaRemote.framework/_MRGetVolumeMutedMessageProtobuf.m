@interface _MRGetVolumeMutedMessageProtobuf
- (BOOL)hasOutputDeviceUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)outputDeviceUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGetVolumeMutedMessageProtobuf

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGetVolumeMutedMessageProtobuf;
  v4 = [(_MRGetVolumeMutedMessageProtobuf *)&v8 description];
  v5 = [(_MRGetVolumeMutedMessageProtobuf *)self dictionaryRepresentation];
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

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGetVolumeMutedMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_outputDeviceUID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID) {
    [a3 setOutputDeviceUID:outputDeviceUID];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_outputDeviceUID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    outputDeviceUID = self->_outputDeviceUID;
    if ((unint64_t)outputDeviceUID | v4[1]) {
      char v6 = -[NSString isEqual:](outputDeviceUID, "isEqual:");
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
  return [(NSString *)self->_outputDeviceUID hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_MRGetVolumeMutedMessageProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
  }
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
}

@end