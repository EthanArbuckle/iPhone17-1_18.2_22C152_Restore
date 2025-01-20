@interface _LTAudioData
- (AudioStreamBasicDescription)asbd;
- (BOOL)_populateWithOpusData:(id)a3;
- (NSArray)wordTimingInfo;
- (NSData)packetDescriptions;
- (NSData)rawData;
- (_LTAudioData)initWithASBD:(AudioStreamBasicDescription *)a3 rawData:(id)a4 wordTimingInfo:(id)a5;
- (int64_t)packetCount;
- (void)writeToURL:(id)a3;
@end

@implementation _LTAudioData

- (_LTAudioData)initWithASBD:(AudioStreamBasicDescription *)a3 rawData:(id)a4 wordTimingInfo:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_LTAudioData;
  v11 = [(_LTAudioData *)&v19 init];
  v12 = (id *)v11;
  if (!v11) {
    goto LABEL_7;
  }
  long long v13 = *(_OWORD *)&a3->mSampleRate;
  long long v14 = *(_OWORD *)&a3->mBytesPerPacket;
  *((void *)v11 + 5) = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)(v11 + 24) = v14;
  *(_OWORD *)(v11 + 8) = v13;
  objc_storeStrong((id *)v11 + 6, a4);
  objc_storeStrong(v12 + 9, a5);
  AudioFormatID mFormatID = a3->mFormatID;
  if (mFormatID != 1869641075)
  {
    if (mFormatID == 1819304813)
    {
      id v16 = v12[8];
      v12[7] = 0;
      v12[8] = 0;
    }
    goto LABEL_6;
  }
  if (![v12 _populateWithOpusData:v9])
  {
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
LABEL_6:
  v17 = v12;
LABEL_8:

  return v17;
}

- (BOOL)_populateWithOpusData:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF990] data];
  v6 = [MEMORY[0x263EFF990] data];
  unint64_t v7 = [v4 length];
  id v21 = v4;
  uint64_t v8 = [v21 bytes];
  if (v7)
  {
    uint64_t v9 = v8;
    int64_t v10 = 0;
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = 0;
      LODWORD(v13) = 0;
      do
      {
        char v14 = *(unsigned char *)(v9 + v11 + v12);
        uint64_t v13 = v14 & 0x7Fu | (v13 << 7);
        ++v12;
      }
      while (v14 < 0);
      unint64_t v15 = v11 + v13 + v12;
      if (!v13 || v15 > v7) {
        break;
      }
      *(void *)buf = 0;
      uint64_t v23 = 0;
      *(void *)buf = [v5 length];
      LODWORD(v23) = 0;
      HIDWORD(v23) = v13;
      [v6 appendBytes:buf length:16];
      [v5 appendBytes:v9 + v11 + v12 length:v13];
      ++v10;
      v11 += v13 + v12;
      if (v15 >= v7) {
        goto LABEL_15;
      }
    }
    v17 = _LTOSLogSpeech();
    v18 = v21;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v13;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v11 + v12;
      HIWORD(v23) = 1024;
      int v24 = v7;
      _os_log_error_impl(&dword_2600DC000, v17, OS_LOG_TYPE_ERROR, "Invalid chunk size: %d at offset %d, bytes count = %d\n", buf, 0x14u);
    }
    BOOL v19 = 0;
  }
  else
  {
    int64_t v10 = 0;
LABEL_15:
    self->_packetCount = v10;
    objc_storeStrong((id *)&self->_packetDescriptions, v6);
    objc_storeStrong((id *)&self->_rawData, v5);
    BOOL v19 = 1;
    v18 = v21;
  }

  return v19;
}

- (void)writeToURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x263F08850] defaultManager];
    v6 = [v4 URLByDeletingLastPathComponent];
    unint64_t v7 = [v6 path];

    if ([v5 fileExistsAtPath:v7])
    {
      id v8 = 0;
    }
    else
    {
      id v15 = 0;
      [v5 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v15];
      id v8 = v15;
      if (v8)
      {
        int64_t v10 = _LTOSLogSpeech();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[_LTAudioData writeToURL:]();
        }
      }
    }
    rawData = self->_rawData;
    id v14 = 0;
    [(NSData *)rawData writeToURL:v4 options:0 error:&v14];
    id v12 = v14;
    if (v12)
    {
      uint64_t v13 = _LTOSLogSpeech();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[_LTAudioData writeToURL:]();
      }
    }
  }
  else
  {
    uint64_t v9 = _LTOSLogSpeech();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_LTAudioData writeToURL:](v9);
    }
  }
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self->mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[1].mSampleRate;
  return self;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (int64_t)packetCount
{
  return self->_packetCount;
}

- (NSData)packetDescriptions
{
  return self->_packetDescriptions;
}

- (NSArray)wordTimingInfo
{
  return self->_wordTimingInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTimingInfo, 0);
  objc_storeStrong((id *)&self->_packetDescriptions, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

- (void)writeToURL:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Can't write audio data to URL because URL is nil", v1, 2u);
}

- (void)writeToURL:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "error %@ writing to url %{private}@");
}

- (void)writeToURL:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "error %@ creating directory at path %{private}@");
}

@end