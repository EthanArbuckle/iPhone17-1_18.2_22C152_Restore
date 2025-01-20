@interface MRRegisterVoiceInputDeviceMessage
- (MRRegisterVoiceInputDeviceMessage)initWithDescriptor:(id)a3;
- (MRVirtualVoiceInputDeviceDescriptor)descriptor;
- (unint64_t)type;
@end

@implementation MRRegisterVoiceInputDeviceMessage

- (MRRegisterVoiceInputDeviceMessage)initWithDescriptor:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRRegisterVoiceInputDeviceMessage;
  v5 = [(MRProtocolMessage *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    descriptor = v5->_descriptor;
    v5->_descriptor = (MRVirtualVoiceInputDeviceDescriptor *)v6;

    v8 = [(MRVirtualVoiceInputDeviceDescriptor *)v5->_descriptor protobuf];
    v9 = objc_alloc_init(_MRRegisterVoiceInputDeviceMessageProtobuf);
    [(_MRRegisterVoiceInputDeviceMessageProtobuf *)v9 setDescriptor:v8];
    [(MRProtocolMessage *)v5 setUnderlyingCodableMessage:v9];
  }
  return v5;
}

- (unint64_t)type
{
  return 28;
}

- (MRVirtualVoiceInputDeviceDescriptor)descriptor
{
  descriptor = self->_descriptor;
  if (!descriptor)
  {
    id v4 = [MRVirtualVoiceInputDeviceDescriptor alloc];
    v5 = [(MRProtocolMessage *)self underlyingCodableMessage];
    uint64_t v6 = [v5 descriptor];
    v7 = [(MRVirtualVoiceInputDeviceDescriptor *)v4 initWithProtobuf:v6];
    v8 = self->_descriptor;
    self->_descriptor = v7;

    descriptor = self->_descriptor;
  }

  return descriptor;
}

- (void).cxx_destruct
{
}

@end