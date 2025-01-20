@interface _LTSpeechCompressor
- (_LTSpeechCompressor)initWithDelegate:(id)a3;
- (void)addAudioSampleData:(id)a3;
- (void)dealloc;
- (void)reset;
- (void)startCompressionNarrowband:(BOOL)a3;
@end

@implementation _LTSpeechCompressor

- (_LTSpeechCompressor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LTSpeechCompressor;
  v5 = [(_LTSpeechCompressor *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (void)dealloc
{
  [(_LTSpeechCompressor *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)_LTSpeechCompressor;
  [(_LTSpeechCompressor *)&v3 dealloc];
}

- (void)startCompressionNarrowband:(BOOL)a3
{
  double v4 = 16000.0;
  if (a3) {
    double v4 = 8000.0;
  }
  inSourceFormat.mSampleRate = v4;
  *(_OWORD *)&inSourceFormat.mFormatID = xmmword_26027B7A0;
  *(_OWORD *)&inSourceFormat.mBytesPerFrame = xmmword_26027B7B0;
  inDestinationFormat.mSampleRate = v4;
  *(void *)&inDestinationFormat.mFormatID = 1869641075;
  if (a3) {
    UInt32 v5 = 160;
  }
  else {
    UInt32 v5 = 320;
  }
  inDestinationFormat.mBytesPerPacket = 0;
  inDestinationFormat.mFramesPerPacket = v5;
  *(_OWORD *)&inDestinationFormat.mBytesPerFrame = xmmword_26027B7C0;
  AudioConverterNew(&inSourceFormat, &inDestinationFormat, &self->_audioConverter);
  int inPropertyData = 32000;
  AudioConverterSetProperty(self->_audioConverter, 0x62726174u, 4u, &inPropertyData);
  v6 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
  bufferedAudio = self->_bufferedAudio;
  self->_bufferedAudio = v6;
}

- (void)reset
{
  audioConverter = self->_audioConverter;
  if (audioConverter)
  {
    AudioConverterDispose(audioConverter);
    self->_audioConverter = 0;
  }
  bufferedAudio = self->_bufferedAudio;
  self->_bufferedAudio = 0;

  self->_packetIndex = 0;
  self->_bytesConsumed = 0;
}

- (void)addAudioSampleData:(id)a3
{
  uint64_t v3 = MEMORY[0x270FA5388](self, a2, a3);
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v12 = v4;
  objc_msgSend(*(id *)(v3 + 24), "appendData:");
  objc_initWeak(&location, (id)v3);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = MEMORY[0x263EF8330];
  while (1)
  {
    *(&outOutputData.mNumberBuffers + 1) = 0;
    outOutputData.mBuffers[0].mData = &v19;
    *(void *)&outOutputData.mBuffers[0].mNumberChannels = 0x200000000001;
    UInt32 ioOutputDataPacketSize = 10;
    outOutputData.mNumberBuffers = 1;
    v7 = *(OpaqueAudioConverter **)(v3 + 16);
    inInputDataProcUserData[0] = v6;
    inInputDataProcUserData[1] = 3221225472;
    inInputDataProcUserData[2] = __42___LTSpeechCompressor_addAudioSampleData___block_invoke;
    inInputDataProcUserData[3] = &unk_265548028;
    objc_copyWeak(&v14, &location);
    if (AudioConverterFillComplexBuffer(v7, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke_0, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, &outPacketDescription))
    {
      break;
    }
    if (ioOutputDataPacketSize)
    {
      unint64_t v8 = 0;
      p_AudioStreamPacketDescription outPacketDescription = &outPacketDescription;
      do
      {
        v10 = [MEMORY[0x263EFF8F8] dataWithBytes:(char *)outOutputData.mBuffers[0].mData + p_outPacketDescription->mStartOffset length:p_outPacketDescription->mDataByteSize];
        [v5 addObject:v10];
        ++*(void *)(v3 + 32);

        ++p_outPacketDescription;
        ++v8;
      }
      while (v8 < ioOutputDataPacketSize);
    }
    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&v14);
  objc_msgSend(*(id *)(v3 + 24), "replaceBytesInRange:withBytes:length:", 0, *(void *)(v3 + 40), 0, 0);
  *(void *)(v3 + 40) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(v3 + 8));
  [WeakRetained didCompressPackets:v5 totalPacketCount:*(void *)(v3 + 32)];

  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferedAudio, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end