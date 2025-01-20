@interface MRSetConversationDetectionEnabledMessage
- (BOOL)enabled;
- (MRSetConversationDetectionEnabledMessage)initWithOutputDeviceUID:(id)a3 enabled:(BOOL)a4;
- (MRSetConversationDetectionEnabledMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4;
- (NSString)outputDeviceUID;
- (unint64_t)type;
@end

@implementation MRSetConversationDetectionEnabledMessage

- (MRSetConversationDetectionEnabledMessage)initWithOutputDeviceUID:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(_MRSetConversationDetectionEnabledMessageProtobuf);
  [(_MRSetConversationDetectionEnabledMessageProtobuf *)v7 setOutputDeviceUID:v6];

  [(_MRSetConversationDetectionEnabledMessageProtobuf *)v7 setEnabled:v4];
  v8 = [(MRSetConversationDetectionEnabledMessage *)self initWithUnderlyingCodableMessage:v7 error:0];

  return v8;
}

- (MRSetConversationDetectionEnabledMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRSetConversationDetectionEnabledMessage;
  v7 = [(MRProtocolMessage *)&v11 initWithUnderlyingCodableMessage:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = [v6 outputDeviceUID];
    outputDeviceUID = v7->_outputDeviceUID;
    v7->_outputDeviceUID = (NSString *)v8;

    v7->_enabled = [v6 enabled];
  }

  return v7;
}

- (unint64_t)type
{
  return 130;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
}

@end