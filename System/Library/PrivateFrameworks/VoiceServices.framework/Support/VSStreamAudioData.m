@interface VSStreamAudioData
- (AudioStreamBasicDescription)asbd;
- (BOOL)writeWaveToFilePath:(id)a3;
- (NSMutableArray)mappedAudioInfo;
- (VSMappedData)mappedData;
- (VSStreamAudioData)initWithASBD:(AudioStreamBasicDescription *)a3;
- (double)duration;
- (void)appendAudioData:(id)a3 packetCount:(unint64_t)a4 packetDescriptions:(id)a5;
- (void)enumerateAudioWithBlock:(id)a3;
- (void)setMappedAudioInfo:(id)a3;
- (void)setMappedData:(id)a3;
@end

@implementation VSStreamAudioData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappedAudioInfo, 0);
  objc_storeStrong((id *)&self->_mappedData, 0);
}

- (void)setMappedAudioInfo:(id)a3
{
}

- (NSMutableArray)mappedAudioInfo
{
  return self->_mappedAudioInfo;
}

- (void)setMappedData:(id)a3
{
}

- (VSMappedData)mappedData
{
  return self->_mappedData;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[1].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[1].mBytesPerPacket;
  return self;
}

- (BOOL)writeWaveToFilePath:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  inFormat.mSampleRate = self->_asbd.mSampleRate;
  *(_OWORD *)&inFormat.mFormatID = xmmword_226CFFCE0;
  *(_OWORD *)&inFormat.mBytesPerFrame = xmmword_226CFFCF0;
  AudioFileID outAudioFile = 0;
  CFURLRef v5 = [NSURL fileURLWithPath:v4];
  uint64_t v6 = AudioFileCreateWithURL(v5, 0x57415645u, &inFormat, 1u, &outAudioFile);
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "vs_stringFrom4CC:", v7);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_error_impl(&dword_226CB1000, v8, OS_LOG_TYPE_ERROR, "Error AudioFileCreateWithURL: '%@', code: %@", buf, 0x16u);
      goto LABEL_31;
    }
LABEL_36:
    BOOL v35 = 0;
    goto LABEL_37;
  }
  if (self->_asbd.mFormatID == 1869641075)
  {
    v8 = objc_alloc_init(MEMORY[0x263F84E50]);
    long long v10 = *(_OWORD *)&self->_asbd.mBytesPerPacket;
    *(_OWORD *)buf = *(_OWORD *)&self->_asbd.mSampleRate;
    *(_OWORD *)&buf[16] = v10;
    uint64_t v59 = *(void *)&self->_asbd.mBitsPerChannel;
    uint64_t v11 = [v8 beginChunkDecoderForStreamDescription:buf];
    if (v11)
    {
      v9 = v11;
      v12 = VSGetLogDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v9;
        v39 = "Unable to begin OPUS decoder, %@";
        v40 = v12;
        uint32_t v41 = 12;
        goto LABEL_44;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v8 = 0;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obj = self->_mappedAudioInfo;
  uint64_t v45 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (!v45) {
    goto LABEL_27;
  }
  SInt64 v13 = 0;
  uint64_t v47 = *(void *)v52;
  CFURLRef v43 = v5;
  id v44 = v4;
  while (2)
  {
    for (uint64_t i = 0; i != v45; ++i)
    {
      if (*(void *)v52 != v47) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      SInt64 inStartingByte = v13;
      if (v8)
      {
        v16 = [MEMORY[0x263EFF990] data];
        if ([v15 packetCount])
        {
          uint64_t v17 = 0;
          unint64_t v18 = 0;
          while (1)
          {
            uint64_t v19 = -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", objc_msgSend(v15, "packetDescriptionsRange", v43, v44));
            uint64_t v20 = *(unsigned int *)(v19 + v17 + 12);
            uint64_t v21 = -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", [v15 audioBytesRange] + *(void *)(v19 + v17));
            v22 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v21 length:v20 freeWhenDone:0];
            id v50 = 0;
            v23 = [v8 decodeChunk:v22 outError:&v50];
            id v24 = v50;
            if (v24) {
              break;
            }
            [v16 appendData:v23];

            ++v18;
            v17 += 16;
            if ([v15 packetCount] <= v18)
            {
              CFURLRef v5 = v43;
              id v4 = v44;
              goto LABEL_21;
            }
          }
          v33 = v24;
          v34 = VSGetLogDefault();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v33;
            _os_log_error_impl(&dword_226CB1000, v34, OS_LOG_TYPE_ERROR, "Error during decoding, %@", buf, 0xCu);
          }

          CFURLRef v5 = v43;
          id v4 = v44;
          goto LABEL_35;
        }
      }
      else
      {
        uint64_t v25 = -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", [v15 audioBytesRange]);
        v26 = (void *)MEMORY[0x263EFF8F8];
        [v15 audioBytesRange];
        v16 = [v26 dataWithBytesNoCopy:v25 length:v27 freeWhenDone:0];
      }
LABEL_21:
      if (objc_msgSend(v16, "length", v43, v44))
      {
        UInt32 ioNumBytes = 0;
        UInt32 ioNumBytes = [v16 length];
        v28 = outAudioFile;
        id v29 = v16;
        uint64_t v30 = AudioFileWriteBytes(v28, 0, inStartingByte, &ioNumBytes, (const void *)[v29 bytes]);
        if (v30)
        {
          uint64_t v37 = v30;
          v38 = VSGetLogDefault();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v42 = objc_msgSend(NSString, "vs_stringFrom4CC:", v37);
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v4;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v42;
            _os_log_error_impl(&dword_226CB1000, v38, OS_LOG_TYPE_ERROR, "Error AudioFileWriteBytes: '%@', code: %@", buf, 0x16u);
          }
          v16 = v29;
LABEL_35:

          goto LABEL_36;
        }
        SInt64 v13 = inStartingByte + ioNumBytes;
      }
      else
      {
        SInt64 v13 = inStartingByte;
      }
    }
    uint64_t v45 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v45) {
      continue;
    }
    break;
  }
LABEL_27:

  if (v8) {
    [v8 endChunkDecoding];
  }
  uint64_t v31 = AudioFileClose(outAudioFile);
  if (v31)
  {
    uint64_t v32 = v31;
    v9 = VSGetLogDefault();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_31:

      goto LABEL_36;
    }
    v12 = objc_msgSend(NSString, "vs_stringFrom4CC:", v32);
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    v39 = "Error AudioFileClose: '%@', code: %@";
    v40 = v9;
    uint32_t v41 = 22;
LABEL_44:
    _os_log_error_impl(&dword_226CB1000, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);
LABEL_7:

    goto LABEL_31;
  }
  BOOL v35 = 1;
LABEL_37:

  return v35;
}

- (double)duration
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v3 = self->_mappedAudioInfo;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v4)
  {
    uint64_t v8 = v4;
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v3);
        }
        SInt64 v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "audioBytesRange", (void)v20);
        v10 += v14;
        v9 += [v13 packetCount];
      }
      uint64_t v8 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
    double v6 = (double)v9;
    double v7 = (double)v10;
  }

  AudioFormatID mFormatID = self->_asbd.mFormatID;
  if (mFormatID == 1869641075)
  {
    double mSampleRate = self->_asbd.mSampleRate;
    if (mSampleRate != 0.0)
    {
      LODWORD(v15) = self->_asbd.mFramesPerPacket;
      return v6 * (double)v15 / mSampleRate;
    }
  }
  else if (mFormatID == 1819304813)
  {
    LODWORD(v15) = self->_asbd.mBytesPerFrame;
    double v17 = self->_asbd.mSampleRate * (double)v15;
    if (v17 != 0.0) {
      return v7 / v17;
    }
  }
  return v5;
}

- (void)enumerateAudioWithBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void *, uint64_t, void *, unsigned char *))a3;
  unsigned __int8 v23 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = self->_mappedAudioInfo;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v18 = *(void *)v20;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v20 != v18) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
      uint64_t v9 = -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", [v8 audioBytesRange]);
      unint64_t v10 = (void *)MEMORY[0x263EFF8F8];
      [v8 audioBytesRange];
      v12 = [v10 dataWithBytesNoCopy:v9 length:v11 freeWhenDone:0];
      uint64_t v13 = -[VSMappedData bytesAtOffset:](self->_mappedData, "bytesAtOffset:", [v8 packetDescriptionsRange]);
      uint64_t v14 = (void *)MEMORY[0x263EFF8F8];
      [v8 packetDescriptionsRange];
      v16 = [v14 dataWithBytesNoCopy:v13 length:v15 freeWhenDone:0];
      v4[2](v4, v12, [v8 packetCount], v16, &v23);
      LODWORD(v8) = v23;

      if (v8) {
        break;
      }
      if (v6 == ++v7)
      {
        uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)appendAudioData:(id)a3 packetCount:(unint64_t)a4 packetDescriptions:(id)a5
{
  mappedData = self->_mappedData;
  id v9 = a5;
  id v10 = a3;
  [(VSMappedData *)mappedData appendData:v10];
  [(VSMappedData *)self->_mappedData appendData:v9];
  double v17 = objc_alloc_init(VSStreamAudioMappedInfo);
  uint64_t v11 = [(VSMappedData *)self->_mappedData appendData:v10];
  uint64_t v13 = v12;

  -[VSStreamAudioMappedInfo setAudioBytesRange:](v17, "setAudioBytesRange:", v11, v13);
  [(VSStreamAudioMappedInfo *)v17 setPacketCount:a4];
  uint64_t v14 = [(VSMappedData *)self->_mappedData appendData:v9];
  uint64_t v16 = v15;

  -[VSStreamAudioMappedInfo setPacketDescriptionsRange:](v17, "setPacketDescriptionsRange:", v14, v16);
  [(NSMutableArray *)self->_mappedAudioInfo addObject:v17];
}

- (VSStreamAudioData)initWithASBD:(AudioStreamBasicDescription *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VSStreamAudioData;
  uint64_t v4 = [(VSStreamAudioData *)&v13 init];
  uint64_t v5 = (VSStreamAudioData *)v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->mSampleRate;
    long long v7 = *(_OWORD *)&a3->mBytesPerPacket;
    *((void *)v4 + 7) = *(void *)&a3->mBitsPerChannel;
    *(_OWORD *)(v4 + 40) = v7;
    *(_OWORD *)(v4 + 24) = v6;
    uint64_t v8 = (VSMappedData *)objc_alloc_init(MEMORY[0x263F84E38]);
    mappedData = v5->_mappedData;
    v5->_mappedData = v8;

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    mappedAudioInfo = v5->_mappedAudioInfo;
    v5->_mappedAudioInfo = (NSMutableArray *)v10;
  }
  return v5;
}

@end