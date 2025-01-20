@interface _MRRegisterVoiceInputDeviceMessageProtobuf
- (BOOL)hasDescriptor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRVoiceInputDeviceDescriptorProtobuf)descriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRRegisterVoiceInputDeviceMessageProtobuf

- (BOOL)hasDescriptor
{
  return self->_descriptor != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRRegisterVoiceInputDeviceMessageProtobuf;
  v4 = [(_MRRegisterVoiceInputDeviceMessageProtobuf *)&v8 description];
  v5 = [(_MRRegisterVoiceInputDeviceMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  descriptor = self->_descriptor;
  if (descriptor)
  {
    v5 = [(_MRVoiceInputDeviceDescriptorProtobuf *)descriptor dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"descriptor"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRegisterVoiceInputDeviceMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_descriptor) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  descriptor = self->_descriptor;
  if (descriptor) {
    [a3 setDescriptor:descriptor];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRVoiceInputDeviceDescriptorProtobuf *)self->_descriptor copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    descriptor = self->_descriptor;
    if ((unint64_t)descriptor | v4[1]) {
      char v6 = -[_MRVoiceInputDeviceDescriptorProtobuf isEqual:](descriptor, "isEqual:");
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
  return [(_MRVoiceInputDeviceDescriptorProtobuf *)self->_descriptor hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  descriptor = self->_descriptor;
  uint64_t v6 = v4[1];
  if (descriptor)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    descriptor = (_MRVoiceInputDeviceDescriptorProtobuf *)-[_MRVoiceInputDeviceDescriptorProtobuf mergeFrom:](descriptor, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    descriptor = (_MRVoiceInputDeviceDescriptorProtobuf *)-[_MRRegisterVoiceInputDeviceMessageProtobuf setDescriptor:](self, "setDescriptor:");
  }
  v4 = v7;
LABEL_7:

  MEMORY[0x1F41817F8](descriptor, v4);
}

- (_MRVoiceInputDeviceDescriptorProtobuf)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end