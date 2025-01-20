@interface SFSSAudioConverter
+ (BOOL)isAsbdSameAs:(AudioStreamBasicDescription *)a3 dstAsbd:(AudioStreamBasicDescription *)a4;
+ (id)sharedInstance;
- (id)convertChunks:(id)a3 srcAsbd:(AudioStreamBasicDescription *)a4 dstAsbd:(AudioStreamBasicDescription *)a5 outError:(id *)a6;
- (id)createAudioConverter:(AudioStreamBasicDescription *)a3 dstAsbd:(AudioStreamBasicDescription *)a4;
- (void)dealloc;
- (void)reset;
@end

@implementation SFSSAudioConverter

- (id)convertChunks:(id)a3 srcAsbd:(AudioStreamBasicDescription *)a4 dstAsbd:(AudioStreamBasicDescription *)a5 outError:(id *)a6
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = objc_alloc_init(MEMORY[0x263EFF990]);
  long long v12 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)outOutputData = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&outOutputData[16] = v12;
  uint64_t v54 = *(void *)&a4->mBitsPerChannel;
  long long v13 = *(_OWORD *)&a5->mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a5->mSampleRate;
  long long v60 = v13;
  uint64_t v61 = *(void *)&a5->mBitsPerChannel;
  if (+[SFSSAudioConverter isAsbdSameAs:outOutputData dstAsbd:buf])
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v49 + 1) + 8 * i) audioData];
          [v11 appendData:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v16);
    }
  }
  else
  {
    [(SFSSAudioConverter *)self reset];
    long long v20 = *(_OWORD *)&a4->mBytesPerPacket;
    *(_OWORD *)outOutputData = *(_OWORD *)&a4->mSampleRate;
    *(_OWORD *)&outOutputData[16] = v20;
    uint64_t v54 = *(void *)&a4->mBitsPerChannel;
    long long v21 = *(_OWORD *)&a5->mBytesPerPacket;
    *(_OWORD *)buf = *(_OWORD *)&a5->mSampleRate;
    long long v60 = v21;
    uint64_t v61 = *(void *)&a5->mBitsPerChannel;
    v22 = [(SFSSAudioConverter *)self createAudioConverter:outOutputData dstAsbd:buf];
    if (v22)
    {
      id v23 = v22;
      *a6 = v23;

      id v24 = 0;
      goto LABEL_27;
    }
    UInt32 ioOutputDataPacketSize = 0;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v25 = v10;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v57 count:16];
    v43 = a6;
    if (v26)
    {
      uint64_t v27 = v26;
      UInt32 v28 = 0;
      uint64_t v29 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v45 != v29) {
            objc_enumerationMutation(v25);
          }
          UInt32 mFramesPerPacket = self->_srcAsbd.mFramesPerPacket;
          v28 += mFramesPerPacket * [*(id *)(*((void *)&v44 + 1) + 8 * j) packetCount];
          UInt32 ioOutputDataPacketSize = v28;
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v57 count:16];
      }
      while (v27);
    }
    else
    {
      UInt32 v28 = 0;
    }

    v32 = [[SFSSAudioDataWrapper alloc] initWithAudioChunks:v25];
    v33 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:self->_dstAsbd.mBytesPerFrame * v28];
    *(void *)outOutputData = 1;
    id v34 = v33;
    *(void *)&outOutputData[16] = [v34 mutableBytes];
    int v35 = [v34 length];
    *(_DWORD *)&outOutputData[8] = 1;
    *(_DWORD *)&outOutputData[12] = v35;
    OSStatus v36 = AudioConverterFillComplexBuffer(self->_decoder, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_Callback, v32, &ioOutputDataPacketSize, (AudioBufferList *)outOutputData, 0);
    if (v36)
    {
      OSStatus v37 = v36;
      v38 = SFSSGetLogObject();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v37;
        _os_log_error_impl(&dword_22B575000, v38, OS_LOG_TYPE_ERROR, "Audio converting error: %d", buf, 8u);
      }

      v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v55 = *MEMORY[0x263F08338];
      v56 = @"Audio converting error.";
      v40 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      id *v43 = [v39 errorWithDomain:@"SFSpeechSynthesisAudioErrorDomain" code:v37 userInfo:v40];
    }
    v41 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)&outOutputData[16] length:*(unsigned int *)&outOutputData[12]];
    [v11 appendData:v41];

    [(SFSSAudioConverter *)self reset];
  }
  id v24 = v11;
LABEL_27:

  return v24;
}

- (void)dealloc
{
  decoder = self->_decoder;
  if (decoder)
  {
    AudioConverterDispose(decoder);
    self->_decoder = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SFSSAudioConverter;
  [(SFSSAudioConverter *)&v4 dealloc];
}

- (void)reset
{
  v3 = SFSSGetLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22B575000, v3, OS_LOG_TYPE_INFO, "Reset audio decoder.", v5, 2u);
  }

  decoder = self->_decoder;
  if (decoder) {
    AudioConverterReset(decoder);
  }
}

- (id)createAudioConverter:(AudioStreamBasicDescription *)a3 dstAsbd:(AudioStreamBasicDescription *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  OSStatus v7 = AudioConverterNew(a3, a4, &self->_decoder);
  uint64_t v8 = *(void *)&a3->mBitsPerChannel;
  long long v9 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_OWORD *)&self->_srcAsbd.mSampleRate = *(_OWORD *)&a3->mSampleRate;
  *(_OWORD *)&self->_srcAsbd.mBytesPerPacket = v9;
  *(void *)&self->_srcAsbd.mBitsPerChannel = v8;
  long long v11 = *(_OWORD *)&a4->mSampleRate;
  long long v10 = *(_OWORD *)&a4->mBytesPerPacket;
  *(void *)&self->_dstAsbd.mBitsPerChannel = *(void *)&a4->mBitsPerChannel;
  *(_OWORD *)&self->_dstAsbd.mSampleRate = v11;
  *(_OWORD *)&self->_dstAsbd.mBytesPerPacket = v10;
  if (v7)
  {
    OSStatus v12 = v7;
    long long v13 = SFSSGetLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v21 = v12;
      _os_log_error_impl(&dword_22B575000, v13, OS_LOG_TYPE_ERROR, "Could not create Opus decoder: %d", buf, 8u);
    }

    id v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08338];
    v19 = @"Failed to create opus decoder";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v16 = [v14 errorWithDomain:@"SFSpeechSynthesisAudioErrorDomain" code:v12 userInfo:v15];
  }
  else
  {
    uint64_t v16 = 0;
  }
  return v16;
}

+ (BOOL)isAsbdSameAs:(AudioStreamBasicDescription *)a3 dstAsbd:(AudioStreamBasicDescription *)a4
{
  return a3->mBitsPerChannel == a4->mBitsPerChannel
      && a3->mFormatID == a4->mFormatID
      && a3->mFormatFlags == a4->mFormatFlags
      && a3->mBytesPerPacket == a4->mBytesPerPacket
      && a3->mFramesPerPacket == a4->mFramesPerPacket
      && a3->mBytesPerFrame == a4->mBytesPerFrame
      && a3->mChannelsPerFrame == a4->mChannelsPerFrame
      && a3->mReserved == a4->mReserved;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1706 != -1) {
    dispatch_once(&sharedInstance_onceToken_1706, &__block_literal_global_1707);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

uint64_t __36__SFSSAudioConverter_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance = objc_alloc_init(SFSSAudioConverter);
  return MEMORY[0x270F9A758]();
}

@end