@interface MRSendVoiceInputMessage
- ($F24F406B2B787EFB06265DBA3D28CBD5)time;
- (MRAudioBuffer)buffer;
- (MRSendVoiceInputMessage)initWithBuffer:(id)a3 time:(id)a4 gain:(float)a5;
- (float)gain;
- (unint64_t)type;
- (void)_initializeDataIfNecessary;
@end

@implementation MRSendVoiceInputMessage

- (MRSendVoiceInputMessage)initWithBuffer:(id)a3 time:(id)a4 gain:(float)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRSendVoiceInputMessage;
  v10 = [(MRProtocolMessage *)&v18 init];
  if (v10)
  {
    v11 = objc_alloc_init(MRMutableAudioDataBlock);
    [(MRMutableAudioDataBlock *)v11 setBuffer:v9];
    -[MRMutableAudioDataBlock setTime:](v11, "setTime:", var0, var1);
    *(float *)&double v12 = a5;
    [(MRMutableAudioDataBlock *)v11 setGain:v12];
    dataBlock = v10->_dataBlock;
    v10->_dataBlock = &v11->super;
    v14 = v11;

    v15 = objc_alloc_init(_MRSendVoiceInputMessageProtobuf);
    v16 = [(MRAudioDataBlock *)v10->_dataBlock protobuf];

    [(_MRSendVoiceInputMessageProtobuf *)v15 setDataBlock:v16];
    [(MRProtocolMessage *)v10 setUnderlyingCodableMessage:v15];
  }
  return v10;
}

- (unint64_t)type
{
  return 31;
}

- (MRAudioBuffer)buffer
{
  [(MRSendVoiceInputMessage *)self _initializeDataIfNecessary];
  dataBlock = self->_dataBlock;

  return [(MRAudioDataBlock *)dataBlock buffer];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)time
{
  [(MRSendVoiceInputMessage *)self _initializeDataIfNecessary];
  dataBlock = self->_dataBlock;

  [(MRAudioDataBlock *)dataBlock time];
  result.double var1 = v5;
  result.double var0 = v4;
  return result;
}

- (float)gain
{
  [(MRSendVoiceInputMessage *)self _initializeDataIfNecessary];
  dataBlock = self->_dataBlock;

  [(MRAudioDataBlock *)dataBlock gain];
  return result;
}

- (void)_initializeDataIfNecessary
{
  if (!self->_dataBlock)
  {
    v3 = [MRAudioDataBlock alloc];
    id v7 = [(MRProtocolMessage *)self underlyingCodableMessage];
    double v4 = [v7 dataBlock];
    double v5 = [(MRAudioDataBlock *)v3 initWithProtobuf:v4];
    dataBlock = self->_dataBlock;
    self->_dataBlock = v5;
  }
}

- (void).cxx_destruct
{
}

@end