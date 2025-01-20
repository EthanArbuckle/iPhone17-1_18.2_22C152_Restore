@interface SFSSAudioData
- (AudioStreamBasicDescription)asbd;
- (BOOL)populateWithOpusData:(id)a3;
- (BOOL)populateWithPCMData:(id)a3;
- (NSData)audioData;
- (NSData)packetDescriptions;
- (SFSSAudioData)initWithASBD:(AudioStreamBasicDescription *)a3 rawData:(id)a4;
- (double)duration;
- (int64_t)packetCount;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setAudioData:(id)a3;
- (void)setPacketCount:(int64_t)a3;
- (void)setPacketDescriptions:(id)a3;
@end

@implementation SFSSAudioData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetDescriptions, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
}

- (void)setPacketDescriptions:(id)a3
{
}

- (NSData)packetDescriptions
{
  return self->_packetDescriptions;
}

- (void)setPacketCount:(int64_t)a3
{
  self->_packetCount = a3;
}

- (int64_t)packetCount
{
  return self->_packetCount;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_asbd.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[1].mBytesPerFrame;
  return self;
}

- (void)setAudioData:(id)a3
{
}

- (NSData)audioData
{
  return self->_audioData;
}

- (double)duration
{
  [(SFSSAudioData *)self asbd];
  if (v20 == 1819304813)
  {
    [(SFSSAudioData *)self asbd];
    [(SFSSAudioData *)self asbd];
    LODWORD(v3) = v18;
    double v4 = 0.0;
    if (v19 * (double)v3 != 0.0)
    {
      v5 = [(SFSSAudioData *)self audioData];
      double v6 = (double)(unint64_t)[v5 length];
      [(SFSSAudioData *)self asbd];
      [(SFSSAudioData *)self asbd];
      LODWORD(v7) = v16;
      double v4 = v6 / (v17 * (double)v7);
    }
  }
  else
  {
    [(SFSSAudioData *)self asbd];
    double v4 = 0.0;
    if (v15 == 1869641075)
    {
      [(SFSSAudioData *)self asbd];
      if (v14 != 0.0)
      {
        double v8 = (double)[(SFSSAudioData *)self packetCount];
        [(SFSSAudioData *)self asbd];
        LODWORD(v9) = v13;
        double v10 = v8 * (double)v9;
        [(SFSSAudioData *)self asbd];
        return v10 / v12;
      }
    }
  }
  return v4;
}

- (BOOL)populateWithOpusData:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF990] data];
  double v6 = [MEMORY[0x263EFF990] data];
  unint64_t v7 = [v4 length];
  id v8 = v4;
  uint64_t v9 = [v8 bytes];
  if (v7)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    while (1)
    {
      LODWORD(v13) = 0;
      do
      {
        char v14 = *(unsigned char *)(v10 + v11);
        uint64_t v13 = v14 & 0x7Fu | (v13 << 7);
        ++v11;
      }
      while (v14 < 0);
      if (!v13) {
        break;
      }
      unint64_t v15 = v11 + v13;
      if (v15 > v7) {
        break;
      }
      uint64_t v19 = objc_msgSend(v5, "length", 0, 0);
      LODWORD(v20) = 0;
      HIDWORD(v20) = v13;
      [v6 appendBytes:&v19 length:16];
      [v5 appendBytes:v10 + v11 length:v13];
      ++v12;
      v11 += v13;
      if (v15 >= v7) {
        goto LABEL_13;
      }
    }
    int v16 = SFSSGetLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v19) = 67109632;
      HIDWORD(v19) = v13;
      LOWORD(v20) = 1024;
      *(_DWORD *)((char *)&v20 + 2) = v11;
      HIWORD(v20) = 1024;
      int v21 = v7;
      _os_log_error_impl(&dword_22B575000, v16, OS_LOG_TYPE_ERROR, "Invalid chunk size: %d at offset %d, bytes count = %d\n", (uint8_t *)&v19, 0x14u);
    }

    BOOL v17 = 0;
  }
  else
  {
    uint64_t v12 = 0;
LABEL_13:
    [(SFSSAudioData *)self setPacketCount:v12];
    [(SFSSAudioData *)self setPacketDescriptions:v6];
    [(SFSSAudioData *)self setAudioData:v5];
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)populateWithPCMData:(id)a3
{
  return 1;
}

- (SFSSAudioData)initWithASBD:(AudioStreamBasicDescription *)a3 rawData:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SFSSAudioData;
  unint64_t v7 = [(SFSSAudioData *)&v19 init];
  id v8 = v7;
  if (!v7) {
    goto LABEL_6;
  }
  long long v10 = *(_OWORD *)&a3->mSampleRate;
  long long v9 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&v7->_asbd.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&v7->_asbd.mSampleRate = v10;
  *(_OWORD *)&v7->_asbd.mBytesPerPacket = v9;
  AudioFormatID mFormatID = v7->_asbd.mFormatID;
  if (mFormatID == 1869641075)
  {
    if ([(SFSSAudioData *)v7 populateWithOpusData:v6]) {
      goto LABEL_6;
    }
    uint64_t v13 = SFSSGetLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v21 = "-[SFSSAudioData initWithASBD:rawData:]";
      unint64_t v15 = "%s, invalid opus data";
      int v16 = v13;
      uint32_t v17 = 12;
      goto LABEL_13;
    }
LABEL_10:

    uint64_t v12 = 0;
    goto LABEL_11;
  }
  if (mFormatID != 1819304813)
  {
    uint64_t v13 = SFSSGetLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      AudioFormatID v14 = v8->_asbd.mFormatID;
      *(_DWORD *)buf = 136315394;
      int v21 = "-[SFSSAudioData initWithASBD:rawData:]";
      __int16 v22 = 1024;
      AudioFormatID v23 = v14;
      unint64_t v15 = "%s, Unknown format: %d";
      int v16 = v13;
      uint32_t v17 = 18;
LABEL_13:
      _os_log_error_impl(&dword_22B575000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  [(SFSSAudioData *)v7 populateWithPCMData:v6];
LABEL_6:
  uint64_t v12 = v8;
LABEL_11:

  return v12;
}

@end