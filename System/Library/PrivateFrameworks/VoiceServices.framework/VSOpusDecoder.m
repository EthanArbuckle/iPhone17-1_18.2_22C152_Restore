@interface VSOpusDecoder
+ (id)sharedInstance;
- (OpaqueAudioConverter)_opusDecoder:(AudioStreamBasicDescription *)a3;
- (id)beginChunkDecoderForStreamDescription:(AudioStreamBasicDescription *)a3;
- (id)decodeChunk:(id)a3 outError:(id *)a4;
- (id)decodeChunks:(id)a3 streamDescription:(AudioStreamBasicDescription *)a4 outError:(id *)a5;
- (void)dealloc;
- (void)endChunkDecoding;
@end

@implementation VSOpusDecoder

- (void)dealloc
{
  decoder = self->_decoder;
  if (decoder)
  {
    AudioConverterDispose(decoder);
    self->_decoder = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VSOpusDecoder;
  [(VSOpusDecoder *)&v4 dealloc];
}

- (id)decodeChunk:(id)a3 outError:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:2 * self->_asbd.mFramesPerPacket];
  *(void *)&outOutputData.mNumberBuffers = 1;
  id v8 = v7;
  outOutputData.mBuffers[0].mData = (void *)[v8 mutableBytes];
  outOutputData.mBuffers[0].mNumberChannels = 1;
  outOutputData.mBuffers[0].mDataByteSize = [v8 length];
  UInt32 ioOutputDataPacketSize = self->_asbd.mFramesPerPacket;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 1;
  decoder = self->_decoder;
  inInputDataProcUserData[0] = MEMORY[0x263EF8330];
  inInputDataProcUserData[1] = 3221225472;
  inInputDataProcUserData[2] = __38__VSOpusDecoder_decodeChunk_outError___block_invoke;
  inInputDataProcUserData[3] = &unk_2640E8428;
  v25 = v28;
  v27 = &v37;
  id v10 = v6;
  id v24 = v10;
  v26 = v29;
  uint64_t v11 = AudioConverterFillComplexBuffer(decoder, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
  if (v11 != 1836086393 && v11)
  {
    v19 = NSString;
    v20 = objc_msgSend(NSString, "vs_stringFrom4CC:", v11);
    v15 = [v19 stringWithFormat:@"Could not finish decoding, res %@", v20];

    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08338];
    v34 = v15;
    v17 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    uint64_t v18 = [v21 errorWithDomain:@"VSSpeechServiceDecoderErrorDomain" code:0 userInfo:v17];
  }
  else
  {
    id v12 = 0;
    if (!ioOutputDataPacketSize)
    {
      v13 = 0;
      goto LABEL_13;
    }
    v13 = 0;
    if (!outOutputData.mNumberBuffers) {
      goto LABEL_13;
    }
    unint64_t v14 = 2 * ioOutputDataPacketSize;
    if (v14 <= outOutputData.mBuffers[0].mDataByteSize)
    {
      v13 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", outOutputData.mBuffers[0].mData);
      id v12 = 0;
      goto LABEL_13;
    }
    v15 = objc_msgSend(NSString, "stringWithFormat:", @"decoder gave us %d bytes bytes but we really only expected %d", v14, outOutputData.mBuffers[0].mDataByteSize);
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08338];
    v36 = v15;
    v17 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    uint64_t v18 = [v16 errorWithDomain:@"VSSpeechServiceDecoderErrorDomain" code:0 userInfo:v17];
  }
  id v12 = (id)v18;

  v13 = 0;
  if (a4 && v12)
  {
    id v12 = v12;
    v13 = 0;
    *a4 = v12;
  }
LABEL_13:

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);

  return v13;
}

uint64_t __38__VSOpusDecoder_decodeChunk_outError___block_invoke(uint64_t a1, _DWORD *a2, uint64_t a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v8 = *a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= v8)
  {
    if (v8 == 1)
    {
      int v11 = [*(id *)(a1 + 32) length];
      id v12 = *(id *)(a1 + 32);
      *(void *)(a3 + 16) = [v12 bytes];
      *(_DWORD *)(a3 + 12) = v11;
      if (a4)
      {
        uint64_t v13 = *(void *)(a1 + 56);
        *(void *)uint64_t v13 = 0;
        *(_DWORD *)(v13 + 8) = 0;
        *(_DWORD *)(v13 + 12) = v11;
        *a4 = v13;
      }
      --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

      return 0;
    }
    else
    {
      unint64_t v14 = VSGetLogDefault();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *a2;
        int v16 = 134217984;
        uint64_t v17 = v15;
        _os_log_error_impl(&dword_20CABC000, v14, OS_LOG_TYPE_ERROR, "Only expecting to get 1 packet at a time, not %lu", (uint8_t *)&v16, 0xCu);
      }

      return 1752524863;
    }
  }
  else
  {
    uint64_t result = 1836086393;
    *a2 = 0;
    *(void *)(a3 + 16) = 0;
    *(_DWORD *)(a3 + 12) = 0;
    if (a4)
    {
      id v10 = *(void **)(a1 + 56);
      *id v10 = 0;
      v10[1] = 0;
      *a4 = v10;
    }
  }
  return result;
}

- (void)endChunkDecoding
{
}

- (id)beginChunkDecoderForStreamDescription:(AudioStreamBasicDescription *)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  long long v3 = *(_OWORD *)&a3->mBytesPerPacket;
  v8[0] = *(_OWORD *)&a3->mSampleRate;
  v8[1] = v3;
  uint64_t v9 = *(void *)&a3->mBitsPerChannel;
  if ([(VSOpusDecoder *)self _opusDecoder:v8])
  {
    objc_super v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08338];
    v11[0] = @"Failed to create opus decoder";
    id v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_super v4 = [v5 errorWithDomain:@"VSSpeechServiceDecoderErrorDomain" code:0 userInfo:v6];
  }
  return v4;
}

- (id)decodeChunks:(id)a3 streamDescription:(AudioStreamBasicDescription *)a4 outError:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  long long v9 = *(_OWORD *)&a4->mBytesPerPacket;
  v31[0] = *(_OWORD *)&a4->mSampleRate;
  v31[1] = v9;
  uint64_t v32 = *(void *)&a4->mBitsPerChannel;
  uint64_t v10 = [(VSOpusDecoder *)self beginChunkDecoderForStreamDescription:v31];
  int v11 = v10;
  if (a5 && v10)
  {
    id v12 = 0;
    *a5 = v10;
  }
  else
  {
    UInt32 mFramesPerPacket = a4->mFramesPerPacket;
    uint64_t v14 = 2 * mFramesPerPacket * [v8 count];
    id v12 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:v14];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v25 = v8;
      uint64_t v18 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          id v26 = 0;
          v21 = -[VSOpusDecoder decodeChunk:outError:](self, "decodeChunk:outError:", v20, &v26, v25);
          id v22 = v26;
          if (v22)
          {
            v23 = v22;

            goto LABEL_14;
          }
          [v12 appendData:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v17) {
          continue;
        }
        break;
      }
      v23 = 0;
LABEL_14:
      id v8 = v25;
    }
    else
    {
      v23 = 0;
    }

    [(VSOpusDecoder *)self endChunkDecoding];
    if (v23)
    {
      if (a5) {
        *a5 = v23;
      }

      id v12 = 0;
    }
  }
  return v12;
}

- (OpaqueAudioConverter)_opusDecoder:(AudioStreamBasicDescription *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  p_decoder = &self->_decoder;
  uint64_t result = self->_decoder;
  if (!result)
  {
    if (a3->mSampleRate == 16000.0)
    {
      v7 = &VSAudioFormat16khzPCM;
    }
    else
    {
      if (a3->mSampleRate != 48000.0)
      {
        int v11 = VSGetLogDefault();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = a3;
          _os_log_error_impl(&dword_20CABC000, v11, OS_LOG_TYPE_ERROR, "Invalid target asbd: %@", buf, 0xCu);
        }
LABEL_12:

        return 0;
      }
      v7 = &VSAudioFormat48khzPCM;
    }
    long long v8 = v7[1];
    *(_OWORD *)&v15.mSampleRate = *v7;
    *(_OWORD *)&v15.mBytesPerPacket = v8;
    *(void *)&v15.mBitsPerChannel = 16;
    uint64_t v9 = AudioConverterNew(a3, &v15, p_decoder);
    if (!v9)
    {
      long long v13 = *(_OWORD *)&a3->mSampleRate;
      long long v14 = *(_OWORD *)&a3->mBytesPerPacket;
      *(void *)&self->_asbd.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
      *(_OWORD *)&self->_asbd.mSampleRate = v13;
      *(_OWORD *)&self->_asbd.mBytesPerPacket = v14;
      return self->_decoder;
    }
    uint64_t v10 = v9;
    int v11 = VSGetLogDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(NSString, "vs_stringFrom4CC:", v10);
      id v12 = (AudioStreamBasicDescription *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v17 = v12;
      _os_log_error_impl(&dword_20CABC000, v11, OS_LOG_TYPE_ERROR, "Could not create Opus decoder: %{public}@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1358);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

void __31__VSOpusDecoder_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VSOpusDecoder);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;
}

@end