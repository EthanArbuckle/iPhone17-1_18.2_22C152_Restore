@interface MRSetListeningModeMessage
- (MRSetListeningModeMessage)initWithListeningMode:(id)a3 outputDeviceUID:(id)a4;
- (MRSetListeningModeMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4;
- (NSString)listeningMode;
- (NSString)outputDeviceUID;
- (unint64_t)type;
@end

@implementation MRSetListeningModeMessage

- (MRSetListeningModeMessage)initWithListeningMode:(id)a3 outputDeviceUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(_MRSetListeningModeMessageProtobuf);
  [(_MRSetListeningModeMessageProtobuf *)v8 setListeningMode:v7];

  [(_MRSetListeningModeMessageProtobuf *)v8 setOutputDeviceUID:v6];
  v9 = [(MRSetListeningModeMessage *)self initWithUnderlyingCodableMessage:v8 error:0];

  return v9;
}

- (MRSetListeningModeMessage)initWithUnderlyingCodableMessage:(id)a3 error:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRSetListeningModeMessage;
  id v7 = [(MRProtocolMessage *)&v13 initWithUnderlyingCodableMessage:v6 error:a4];
  if (v7)
  {
    uint64_t v8 = [v6 listeningMode];
    listeningMode = v7->_listeningMode;
    v7->_listeningMode = (NSString *)v8;

    uint64_t v10 = [v6 outputDeviceUID];
    outputDeviceUID = v7->_outputDeviceUID;
    v7->_outputDeviceUID = (NSString *)v10;
  }
  return v7;
}

- (unint64_t)type
{
  return 110;
}

- (NSString)listeningMode
{
  return self->_listeningMode;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);

  objc_storeStrong((id *)&self->_listeningMode, 0);
}

@end