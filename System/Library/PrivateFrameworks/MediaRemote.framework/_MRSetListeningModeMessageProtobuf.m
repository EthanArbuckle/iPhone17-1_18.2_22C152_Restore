@interface _MRSetListeningModeMessageProtobuf
- (BOOL)hasListeningMode;
- (BOOL)hasOutputDeviceUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)listeningMode;
- (NSString)outputDeviceUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setListeningMode:(id)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSetListeningModeMessageProtobuf

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);

  objc_storeStrong((id *)&self->_listeningMode, 0);
}

- (BOOL)hasListeningMode
{
  return self->_listeningMode != 0;
}

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSetListeningModeMessageProtobuf;
  v4 = [(_MRSetListeningModeMessageProtobuf *)&v8 description];
  v5 = [(_MRSetListeningModeMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  listeningMode = self->_listeningMode;
  if (listeningMode) {
    [v3 setObject:listeningMode forKey:@"listeningMode"];
  }
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID) {
    [v4 setObject:outputDeviceUID forKey:@"outputDeviceUID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSetListeningModeMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_listeningMode)
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
  if (self->_listeningMode)
  {
    objc_msgSend(v4, "setListeningMode:");
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
  uint64_t v6 = [(NSString *)self->_listeningMode copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_outputDeviceUID copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((listeningMode = self->_listeningMode, !((unint64_t)listeningMode | v4[1]))
     || -[NSString isEqual:](listeningMode, "isEqual:")))
  {
    outputDeviceUID = self->_outputDeviceUID;
    if ((unint64_t)outputDeviceUID | v4[2]) {
      char v7 = -[NSString isEqual:](outputDeviceUID, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_listeningMode hash];
  return [(NSString *)self->_outputDeviceUID hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[_MRSetListeningModeMessageProtobuf setListeningMode:](self, "setListeningMode:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[_MRSetListeningModeMessageProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    id v4 = v5;
  }
}

- (NSString)listeningMode
{
  return self->_listeningMode;
}

- (void)setListeningMode:(id)a3
{
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

@end