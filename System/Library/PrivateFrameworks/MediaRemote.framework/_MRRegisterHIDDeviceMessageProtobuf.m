@interface _MRRegisterHIDDeviceMessageProtobuf
- (BOOL)hasDeviceDescriptor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRVirtualTouchDeviceDescriptorProtobuf)deviceDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceDescriptor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRRegisterHIDDeviceMessageProtobuf

- (BOOL)hasDeviceDescriptor
{
  return self->_deviceDescriptor != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRRegisterHIDDeviceMessageProtobuf;
  v4 = [(_MRRegisterHIDDeviceMessageProtobuf *)&v8 description];
  v5 = [(_MRRegisterHIDDeviceMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  deviceDescriptor = self->_deviceDescriptor;
  if (deviceDescriptor)
  {
    v5 = [(_MRVirtualTouchDeviceDescriptorProtobuf *)deviceDescriptor dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"deviceDescriptor"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRegisterHIDDeviceMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_deviceDescriptor) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  deviceDescriptor = self->_deviceDescriptor;
  if (deviceDescriptor) {
    [a3 setDeviceDescriptor:deviceDescriptor];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRVirtualTouchDeviceDescriptorProtobuf *)self->_deviceDescriptor copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    deviceDescriptor = self->_deviceDescriptor;
    if ((unint64_t)deviceDescriptor | v4[1]) {
      char v6 = -[_MRVirtualTouchDeviceDescriptorProtobuf isEqual:](deviceDescriptor, "isEqual:");
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
  return [(_MRVirtualTouchDeviceDescriptorProtobuf *)self->_deviceDescriptor hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  deviceDescriptor = self->_deviceDescriptor;
  uint64_t v6 = v4[1];
  if (deviceDescriptor)
  {
    if (v6) {
      -[_MRVirtualTouchDeviceDescriptorProtobuf mergeFrom:](deviceDescriptor, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRRegisterHIDDeviceMessageProtobuf setDeviceDescriptor:](self, "setDeviceDescriptor:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRVirtualTouchDeviceDescriptorProtobuf)deviceDescriptor
{
  return self->_deviceDescriptor;
}

- (void)setDeviceDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end