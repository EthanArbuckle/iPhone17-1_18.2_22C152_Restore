@interface _LTAudioDecoder
+ (id)sharedInstance;
- (AudioStreamBasicDescription)get48khzPCMDescription;
- (OpaqueAudioConverter)_audioDecoderFrom:(AudioStreamBasicDescription *)a3 to:(AudioStreamBasicDescription *)a4;
- (id)beginChunkDecoderForStreamDescription:(AudioStreamBasicDescription *)a3;
- (id)decodeChunk:(id)a3 outError:(id *)a4;
- (id)decodeChunks:(id)a3 from:(AudioStreamBasicDescription *)a4 to:(AudioStreamBasicDescription *)a5 outError:(id *)a6;
- (id)decodeTo48KHzPCMFromChunks:(id)a3 from:(AudioStreamBasicDescription *)a4 outError:(id *)a5;
- (id)extractAudioChunksFromOpusWithData:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5;
- (void)dealloc;
- (void)endChunkDecoding;
@end

@implementation _LTAudioDecoder

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

- (OpaqueAudioConverter)_audioDecoderFrom:(AudioStreamBasicDescription *)a3 to:(AudioStreamBasicDescription *)a4
{
  p_decoder = &self->_decoder;
  result = self->_decoder;
  if (!result)
  {
    uint64_t v9 = AudioConverterNew(a3, a4, p_decoder);
    if (v9)
    {
      uint64_t v10 = v9;
      v11 = _LTOSLogTTS();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_LTAudioDecoder _audioDecoderFrom:to:](v11, v10);
      }
      return 0;
    }
    else
    {
      long long v12 = *(_OWORD *)&a3->mSampleRate;
      long long v13 = *(_OWORD *)&a3->mBytesPerPacket;
      *(void *)&self->_fromASBD.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
      *(_OWORD *)&self->_fromASBD.mSampleRate = v12;
      *(_OWORD *)&self->_fromASBD.mBytesPerPacket = v13;
      long long v14 = *(_OWORD *)&a4->mSampleRate;
      long long v15 = *(_OWORD *)&a4->mBytesPerPacket;
      *(void *)&self->_toASBD.mBitsPerChannel = *(void *)&a4->mBitsPerChannel;
      *(_OWORD *)&self->_toASBD.mBytesPerPacket = v15;
      *(_OWORD *)&self->_toASBD.mSampleRate = v14;
      return self->_decoder;
    }
  }
  return result;
}

- (id)decodeChunks:(id)a3 from:(AudioStreamBasicDescription *)a4 to:(AudioStreamBasicDescription *)a5 outError:(id *)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = *(void *)&a5->mBitsPerChannel;
  long long v12 = *(_OWORD *)&a5->mBytesPerPacket;
  *(_OWORD *)&self->_toASBD.mSampleRate = *(_OWORD *)&a5->mSampleRate;
  *(_OWORD *)&self->_toASBD.mBytesPerPacket = v12;
  *(void *)&self->_toASBD.mBitsPerChannel = v11;
  long long v13 = *(_OWORD *)&a4->mBytesPerPacket;
  v35[0] = *(_OWORD *)&a4->mSampleRate;
  v35[1] = v13;
  uint64_t v36 = *(void *)&a4->mBitsPerChannel;
  long long v14 = [(_LTAudioDecoder *)self beginChunkDecoderForStreamDescription:v35];
  long long v15 = v14;
  if (a6 && v14)
  {
    v16 = 0;
    *a6 = v14;
  }
  else
  {
    UInt32 mFramesPerPacket = a4->mFramesPerPacket;
    uint64_t v18 = 2 * mFramesPerPacket * [v10 count];
    v16 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:v18];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      id v29 = v10;
      uint64_t v22 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v30 = 0;
          v25 = -[_LTAudioDecoder decodeChunk:outError:](self, "decodeChunk:outError:", v24, &v30, v29);
          id v26 = v30;
          if (v26)
          {
            v27 = v26;

            goto LABEL_14;
          }
          [v16 appendData:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v21) {
          continue;
        }
        break;
      }
      v27 = 0;
LABEL_14:
      id v10 = v29;
    }
    else
    {
      v27 = 0;
    }

    [(_LTAudioDecoder *)self endChunkDecoding];
    if (v27)
    {
      if (a6) {
        *a6 = v27;
      }

      v16 = 0;
    }
  }
  return v16;
}

- (id)decodeTo48KHzPCMFromChunks:(id)a3 from:(AudioStreamBasicDescription *)a4 outError:(id *)a5
{
  id v8 = a3;
  [(_LTAudioDecoder *)self get48khzPCMDescription];
  long long v9 = *(_OWORD *)&a4->mBytesPerPacket;
  v12[0] = *(_OWORD *)&a4->mSampleRate;
  v12[1] = v9;
  uint64_t v13 = *(void *)&a4->mBitsPerChannel;
  id v10 = [(_LTAudioDecoder *)self decodeChunks:v8 from:v12 to:v14 outError:a5];

  return v10;
}

- (id)beginChunkDecoderForStreamDescription:(AudioStreamBasicDescription *)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  long long v3 = *(_OWORD *)&a3->mBytesPerPacket;
  v11[0] = *(_OWORD *)&a3->mSampleRate;
  v11[1] = v3;
  uint64_t v12 = *(void *)&a3->mBitsPerChannel;
  long long v4 = *(_OWORD *)&self->_toASBD.mBytesPerPacket;
  v9[0] = *(_OWORD *)&self->_toASBD.mSampleRate;
  v9[1] = v4;
  uint64_t v10 = *(void *)&self->_toASBD.mBitsPerChannel;
  if ([(_LTAudioDecoder *)self _audioDecoderFrom:v11 to:v9])
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08338];
    v14[0] = @"Failed to create opus decoder";
    v7 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v5 = [v6 errorWithDomain:@"TranslationInternalErrorDomain" code:10 userInfo:v7];
  }
  return v5;
}

- (void)endChunkDecoding
{
}

- (id)decodeChunk:(id)a3 outError:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:2 * self->_fromASBD.mFramesPerPacket];
  *(void *)&outOutputData.mNumberBuffers = 1;
  id v8 = v7;
  outOutputData.mBuffers[0].mData = (void *)[v8 mutableBytes];
  outOutputData.mBuffers[0].mNumberChannels = 1;
  outOutputData.mBuffers[0].mDataByteSize = [v8 length];
  UInt32 ioOutputDataPacketSize = self->_fromASBD.mFramesPerPacket;
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
  inInputDataProcUserData[2] = __40___LTAudioDecoder_decodeChunk_outError___block_invoke;
  inInputDataProcUserData[3] = &unk_265545DF8;
  v25 = v28;
  v27 = &v37;
  id v10 = v6;
  id v24 = v10;
  id v26 = v29;
  uint64_t v11 = AudioConverterFillComplexBuffer(decoder, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
  if (v11 != 1836086393 && v11)
  {
    id v19 = NSString;
    uint64_t v20 = objc_msgSend(NSString, "vs_stringFrom4CC:", v11);
    long long v15 = [v19 stringWithFormat:@"Could not finish decoding, res %@", v20];

    uint64_t v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v33 = *MEMORY[0x263F08338];
    long long v34 = v15;
    v17 = [NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    uint64_t v18 = [v21 errorWithDomain:@"TranslationInternalErrorDomain" code:10 userInfo:v17];
  }
  else
  {
    id v12 = 0;
    if (!ioOutputDataPacketSize)
    {
      uint64_t v13 = 0;
      goto LABEL_13;
    }
    uint64_t v13 = 0;
    if (!outOutputData.mNumberBuffers) {
      goto LABEL_13;
    }
    unint64_t v14 = 2 * ioOutputDataPacketSize;
    if (v14 <= outOutputData.mBuffers[0].mDataByteSize)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", outOutputData.mBuffers[0].mData);
      id v12 = 0;
      goto LABEL_13;
    }
    long long v15 = objc_msgSend(NSString, "stringWithFormat:", @"decoder gave us %d bytes bytes but we really only expected %d", v14, outOutputData.mBuffers[0].mDataByteSize);
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F08338];
    uint64_t v36 = v15;
    v17 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    uint64_t v18 = [v16 errorWithDomain:@"TranslationInternalErrorDomain" code:10 userInfo:v17];
  }
  id v12 = (id)v18;

  uint64_t v13 = 0;
  if (a4 && v12)
  {
    id v12 = v12;
    uint64_t v13 = 0;
    *a4 = v12;
  }
LABEL_13:

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);

  return v13;
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
  v4.super_class = (Class)_LTAudioDecoder;
  [(_LTAudioDecoder *)&v4 dealloc];
}

- (AudioStreamBasicDescription)get48khzPCMDescription
{
  *(_OWORD *)&retstr->mSampleRate = xmmword_26027B578;
  *(_OWORD *)&retstr->mBytesPerPacket = unk_26027B588;
  *(void *)&retstr->mBitsPerChannel = 16;
  return self;
}

- (id)extractAudioChunksFromOpusWithData:(id)a3 packetCount:(int64_t)a4 packetDescriptions:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v8 length];
  if (a4 && v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    if (a4 >= 1)
    {
      uint64_t v11 = 0;
      do
      {
        objc_msgSend(v8, "getBytes:range:", &v17, v11, 16);
        id v12 = (void *)MEMORY[0x263EFF8F8];
        uint64_t v13 = [v7 bytes];
        unint64_t v14 = [v12 dataWithBytes:v13 + v17 length:HIDWORD(v18)];
        [v10 addObject:v14];

        v11 += 16;
        --a4;
      }
      while (a4);
    }
  }
  else
  {
    long long v15 = _LTOSLogTTS();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_LTAudioDecoder extractAudioChunksFromOpusWithData:packetCount:packetDescriptions:](v15);
    }
    id v10 = (id)MEMORY[0x263EFFA68];
  }

  return v10;
}

- (void)_audioDecoderFrom:(void *)a1 to:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  long long v3 = NSString;
  objc_super v4 = a1;
  v5 = objc_msgSend(v3, "vs_stringFrom4CC:", a2);
  int v6 = 138543362;
  id v7 = v5;
  _os_log_error_impl(&dword_2600DC000, v4, OS_LOG_TYPE_ERROR, "Could not create Opus decoder: %{public}@", (uint8_t *)&v6, 0xCu);
}

- (void)extractAudioChunksFromOpusWithData:(os_log_t)log packetCount:packetDescriptions:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Empty packet descriptions, cannot extract data chunks", v1, 2u);
}

@end