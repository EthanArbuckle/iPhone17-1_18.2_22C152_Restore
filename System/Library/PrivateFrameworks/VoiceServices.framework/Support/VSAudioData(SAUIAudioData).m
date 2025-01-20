@interface VSAudioData(SAUIAudioData)
+ (id)audioDataFromFile:()SAUIAudioData error:;
+ (id)audioDataFromPresynthesisRequest:()SAUIAudioData;
+ (id)audioDataFromSAUIAudioData:()SAUIAudioData;
+ (id)audioDataWithASBD:()SAUIAudioData rawData:;
+ (id)pcmAudioDataFromOpusAudio:()SAUIAudioData;
+ (void)asbdFromDescription:()SAUIAudioData;
- (uint64_t)populatePCMDataWithSiriOpusSData:()SAUIAudioData withOpusASBD:;
- (uint64_t)populateWithOpusData:()SAUIAudioData;
- (uint64_t)populateWithPCMData:()SAUIAudioData;
- (uint64_t)writeToFilePath:()SAUIAudioData;
@end

@implementation VSAudioData(SAUIAudioData)

- (uint64_t)writeToFilePath:()SAUIAudioData
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 audioData];
  memset(&inFormat, 0, sizeof(inFormat));
  [a1 asbd];
  [a1 asbd];
  if (v24 == 1869641075)
  {
    v6 = VSGetLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.mSampleRate) = 0;
      _os_log_impl(&dword_226CB1000, v6, OS_LOG_TYPE_INFO, "Decoding opus for dumping.", (uint8_t *)&buf, 2u);
    }

    v7 = [MEMORY[0x263F84E18] pcmAudioDataFromOpusAudio:a1];
    v8 = VSGetLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf.mSampleRate) = 0;
      _os_log_impl(&dword_226CB1000, v8, OS_LOG_TYPE_INFO, "Opus decoded for dumping.", (uint8_t *)&buf, 2u);
    }

    uint64_t v9 = [v7 audioData];

    if (v7) {
      [v7 asbd];
    }
    else {
      memset(&buf, 0, sizeof(buf));
    }
    AudioStreamBasicDescription inFormat = buf;

    v5 = (void *)v9;
  }
  AudioFileID outAudioFile = 0;
  CFURLRef v10 = [NSURL fileURLWithPath:v4];
  uint64_t v11 = AudioFileCreateWithURL(v10, 0x57415645u, &inFormat, 1u, &outAudioFile);
  if (v11)
  {
    uint64_t v12 = v11;
    v13 = VSGetLogDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_msgSend(NSString, "vs_stringFrom4CC:", v12);
      LODWORD(buf.mSampleRate) = 138412546;
      *(void *)((char *)&buf.mSampleRate + 4) = v4;
      LOWORD(buf.mFormatFlags) = 2112;
      *(void *)((char *)&buf.mFormatFlags + 2) = v14;
      v15 = "Error AudioFileCreateWithURL: '%@', code: %@";
LABEL_19:
      _os_log_error_impl(&dword_226CB1000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&buf, 0x16u);
    }
  }
  else
  {
    UInt32 ioNumBytes = [v5 length];
    uint64_t v16 = AudioFileWriteBytes(outAudioFile, 0, 0, &ioNumBytes, (const void *)[v5 bytes]);
    if (v16)
    {
      uint64_t v17 = v16;
      v13 = VSGetLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_msgSend(NSString, "vs_stringFrom4CC:", v17);
        LODWORD(buf.mSampleRate) = 138412546;
        *(void *)((char *)&buf.mSampleRate + 4) = v4;
        LOWORD(buf.mFormatFlags) = 2112;
        *(void *)((char *)&buf.mFormatFlags + 2) = v14;
        v15 = "Error AudioFileWriteBytes: '%@', code: %@";
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v18 = AudioFileClose(outAudioFile);
      if (!v18)
      {
        uint64_t v20 = 1;
        goto LABEL_21;
      }
      uint64_t v19 = v18;
      v13 = VSGetLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_msgSend(NSString, "vs_stringFrom4CC:", v19);
        LODWORD(buf.mSampleRate) = 138412546;
        *(void *)((char *)&buf.mSampleRate + 4) = v4;
        LOWORD(buf.mFormatFlags) = 2112;
        *(void *)((char *)&buf.mFormatFlags + 2) = v14;
        v15 = "Error AudioFileClose: '%@', code: %@";
        goto LABEL_19;
      }
    }
  }

  uint64_t v20 = 0;
LABEL_21:

  return v20;
}

- (uint64_t)populatePCMDataWithSiriOpusSData:()SAUIAudioData withOpusASBD:
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263F84E50] sharedInstance];
  long long v8 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)AudioStreamBasicDescription buf = *(_OWORD *)a4;
  long long v29 = v8;
  uint64_t v30 = *(void *)(a4 + 32);
  id v9 = (id)[v7 beginChunkDecoderForStreamDescription:buf];

  CFURLRef v10 = [MEMORY[0x263EFF990] data];
  unint64_t v11 = [v6 length];
  id v12 = v6;
  uint64_t v13 = [v12 bytes];
  if (v11)
  {
    uint64_t v14 = v13;
    id v26 = v12;
    unint64_t v15 = 0;
    LODWORD(v16) = 0;
    while (1)
    {
      do
      {
        char v17 = *(unsigned char *)(v14 + v15);
        uint64_t v16 = v17 & 0x7Fu | (v16 << 7);
        ++v15;
      }
      while (v17 < 0);
      if (!v16) {
        break;
      }
      unint64_t v18 = v15 + v16;
      if (v18 > v11) {
        break;
      }
      uint64_t v19 = [MEMORY[0x263EFF8F8] dataWithBytes:v14 + v15 length:v16];
      uint64_t v20 = [MEMORY[0x263F84E50] sharedInstance];
      id v27 = 0;
      uint64_t v16 = [v20 decodeChunk:v19 outError:&v27];
      id v21 = v27;

      if (v21)
      {
        v23 = VSGetLogDefault();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
          *(void *)&buf[4] = v21;
          _os_log_error_impl(&dword_226CB1000, v23, OS_LOG_TYPE_ERROR, "Unable to convert OPUS to PCM. %@", buf, 0xCu);
        }

        id v12 = v26;
        goto LABEL_16;
      }
      [v10 appendData:v16];

      LODWORD(v16) = 0;
      unint64_t v15 = v18;
      if (v18 >= v11)
      {
        uint64_t v22 = 1;
        id v12 = v26;
        goto LABEL_17;
      }
    }
    uint64_t v19 = VSGetLogDefault();
    id v12 = v26;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)AudioStreamBasicDescription buf = 67109632;
      *(_DWORD *)&buf[4] = v16;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v15;
      *(_WORD *)&buf[14] = 1024;
      LODWORD(v29) = v11;
      _os_log_error_impl(&dword_226CB1000, v19, OS_LOG_TYPE_ERROR, "Invalid chunk size: %d at offset %d, bytes count = %d\n", buf, 0x14u);
    }
LABEL_16:

    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = 1;
  }
LABEL_17:
  int v24 = [MEMORY[0x263F84E50] sharedInstance];
  [v24 endChunkDecoding];

  [a1 setAudioData:v10];
  return v22;
}

- (uint64_t)populateWithOpusData:()SAUIAudioData
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF990] data];
  id v6 = [MEMORY[0x263EFF990] data];
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
    uint64_t v16 = VSGetLogDefault();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v19) = 67109632;
      HIDWORD(v19) = v13;
      LOWORD(v20) = 1024;
      *(_DWORD *)((char *)&v20 + 2) = v11;
      HIWORD(v20) = 1024;
      int v21 = v7;
      _os_log_error_impl(&dword_226CB1000, v16, OS_LOG_TYPE_ERROR, "Invalid chunk size: %d at offset %d, bytes count = %d\n", (uint8_t *)&v19, 0x14u);
    }

    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v12 = 0;
LABEL_13:
    [a1 setPacketCount:v12];
    [a1 setPacketDescriptions:v6];
    [a1 setAudioData:v5];
    uint64_t v17 = 1;
  }

  return v17;
}

- (uint64_t)populateWithPCMData:()SAUIAudioData
{
  return 1;
}

+ (void)asbdFromDescription:()SAUIAudioData
{
  *(void *)(a2 + 32) = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  id v3 = a1;
  id v4 = [v3 formatID];
  *(_DWORD *)(a2 + 8) = [v4 unsignedIntegerValue];

  v5 = [v3 sampleRate];
  [v5 doubleValue];
  *(void *)a2 = v6;

  unint64_t v7 = [v3 formatFlags];
  *(_DWORD *)(a2 + 12) = [v7 unsignedIntValue];

  id v8 = [v3 bytesPerPacket];
  *(_DWORD *)(a2 + 16) = [v8 unsignedIntValue];

  uint64_t v9 = [v3 framesPerPacket];
  *(_DWORD *)(a2 + 20) = [v9 unsignedIntValue];

  uint64_t v10 = [v3 bytesPerFrame];
  *(_DWORD *)(a2 + 24) = [v10 unsignedIntValue];

  uint64_t v11 = [v3 channelsPerFrame];
  *(_DWORD *)(a2 + 28) = [v11 unsignedIntValue];

  uint64_t v12 = [v3 bitsPerChannel];
  *(_DWORD *)(a2 + 32) = [v12 unsignedIntValue];

  id v13 = [v3 reserved];

  *(_DWORD *)(a2 + 36) = [v13 unsignedIntValue];
}

+ (id)audioDataWithASBD:()SAUIAudioData rawData:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263F84E18]);
  long long v7 = *(_OWORD *)(a3 + 16);
  v19[0] = *(_OWORD *)a3;
  v19[1] = v7;
  uint64_t v20 = *(void *)(a3 + 32);
  [v6 setAsbd:v19];
  if (!v6) {
    goto LABEL_10;
  }
  [v6 asbd];
  if (v18 == 1819304813)
  {
    id v8 = [v6 audioData];
    [v6 populateWithPCMData:v8];

LABEL_4:
    id v9 = v6;
    goto LABEL_12;
  }
  [v6 asbd];
  if (v17 == 1869641075)
  {
    if ([v6 populateWithOpusData:v5]) {
      goto LABEL_4;
    }
    uint64_t v10 = VSGetLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)AudioStreamBasicDescription buf = 136315138;
      uint64_t v22 = "+[VSAudioData(SAUIAudioData) audioDataWithASBD:rawData:]";
      uint64_t v11 = "%s, invalid opus data";
      uint64_t v12 = v10;
      uint32_t v13 = 12;
LABEL_19:
      _os_log_error_impl(&dword_226CB1000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    }
  }
  else
  {
LABEL_10:
    uint64_t v10 = VSGetLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if (v6)
      {
        [v6 asbd];
        int v15 = v16;
      }
      else
      {
        int v15 = 0;
      }
      *(_DWORD *)AudioStreamBasicDescription buf = 136315394;
      uint64_t v22 = "+[VSAudioData(SAUIAudioData) audioDataWithASBD:rawData:]";
      __int16 v23 = 1024;
      int v24 = v15;
      uint64_t v11 = "%s, Unknown format: %d";
      uint64_t v12 = v10;
      uint32_t v13 = 18;
      goto LABEL_19;
    }
  }

  id v9 = 0;
LABEL_12:

  return v9;
}

+ (id)pcmAudioDataFromOpusAudio:()SAUIAudioData
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  if ([v3 packetCount] >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    do
    {
      long long v7 = [v3 packetDescriptions];
      objc_msgSend(v7, "getBytes:range:", &v22, v5, 16);

      id v8 = (void *)MEMORY[0x263EFF8F8];
      id v9 = [v3 audioData];
      uint64_t v10 = [v9 bytes];
      uint64_t v11 = [v8 dataWithBytes:v10 + v22 length:HIDWORD(v23)];

      [v4 addObject:v11];
      ++v6;
      v5 += 16;
    }
    while ([v3 packetCount] > v6);
  }
  id v12 = objc_alloc_init(MEMORY[0x263F84E50]);
  if (v3)
  {
    [v3 asbd];
  }
  else
  {
    uint64_t v21 = 0;
    memset(v20, 0, sizeof(v20));
  }
  uint64_t v19 = 0;
  uint32_t v13 = [v12 decodeChunks:v4 streamDescription:v20 outError:&v19];
  id v14 = 0;
  if (!v19)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F84E18]);
    [v14 setAudioData:v13];
    uint64_t v16 = 0x40E7700000000000;
    long long v17 = xmmword_226CFFCE0;
    long long v18 = xmmword_226CFFCF0;
    [v14 setAsbd:&v16];
  }

  return v14;
}

+ (id)audioDataFromPresynthesisRequest:()SAUIAudioData
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F84E18]);
  uint64_t v12 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  if (v3)
  {
    [v3 playerStreamDescription];
    uint64_t v9 = 0;
    long long v7 = 0u;
    long long v8 = 0u;
    [v3 decoderStreamDescription];
  }
  id v5 = 0;

  return v5;
}

+ (id)audioDataFromSAUIAudioData:()SAUIAudioData
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F84E18]);
  v41 = v3;
  id v5 = [v3 decoderStreamDescription];
  uint64_t v6 = VSGetLogDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v37 = [v5 formatID];
    v38 = [v5 sampleRate];
    *(_DWORD *)AudioStreamBasicDescription buf = 138412546;
    v52 = v37;
    __int16 v53 = 2112;
    v54 = v38;
    _os_log_debug_impl(&dword_226CB1000, v6, OS_LOG_TYPE_DEBUG, "decoderStreamDescription formatID: %@, sample rate: %@", buf, 0x16u);
  }
  long long v7 = [v5 formatID];
  int v8 = [v7 unsignedIntegerValue];

  uint64_t v9 = [v5 sampleRate];
  [v9 doubleValue];
  uint64_t v11 = v10;

  uint64_t v12 = [v5 formatFlags];
  int v13 = [v12 unsignedIntValue];

  id v14 = [v5 bytesPerPacket];
  int v15 = [v14 unsignedIntValue];

  uint64_t v16 = [v5 framesPerPacket];
  int v17 = [v16 unsignedIntValue];

  long long v18 = [v5 bytesPerFrame];
  int v19 = [v18 unsignedIntValue];

  uint64_t v20 = [v5 channelsPerFrame];
  int v21 = [v20 unsignedIntValue];

  uint64_t v22 = [v5 bitsPerChannel];
  int v40 = [v22 unsignedIntValue];

  uint64_t v23 = [v5 reserved];
  int v24 = [v23 unsignedIntValue];

  if (v8 == 1869641075)
  {
    int v39 = v21;
    int v25 = v19;
    int v26 = v17;
    int v27 = v15;
    int v28 = v13;
    [v41 audioBuffer];
    v33 = uint64_t v30 = v4;
    int v34 = [v30 populateWithOpusData:v33];

    if (!v34) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }
  if (v8 == 1819304813)
  {
    int v39 = v21;
    int v25 = v19;
    int v26 = v17;
    int v27 = v15;
    int v28 = v13;
    long long v29 = [v41 audioBuffer];
    uint64_t v30 = v4;
    char v31 = [v4 populateWithPCMData:v29];

    if ((v31 & 1) == 0)
    {
LABEL_6:
      id v32 = 0;
LABEL_9:
      id v4 = v30;
      goto LABEL_13;
    }
LABEL_8:
    uint64_t v42 = v11;
    int v43 = v8;
    int v44 = v28;
    int v45 = v27;
    int v46 = v26;
    int v47 = v25;
    int v48 = v39;
    int v49 = v40;
    int v50 = v24;
    [v30 setAsbd:&v42];
    id v32 = v30;
    goto LABEL_9;
  }
  v35 = VSGetLogDefault();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)AudioStreamBasicDescription buf = 67109120;
    LODWORD(v52) = v8;
    _os_log_error_impl(&dword_226CB1000, v35, OS_LOG_TYPE_ERROR, "Unknown server audio format ID: %d", buf, 8u);
  }

  id v32 = 0;
LABEL_13:

  return v32;
}

+ (id)audioDataFromFile:()SAUIAudioData error:
{
  v46[1] = *MEMORY[0x263EF8340];
  objc_msgSend(NSURL, "fileURLWithPath:");
  CFURLRef v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  AudioFileID outAudioFile = 0;
  OSStatus v6 = AudioFileOpenURL(v5, kAudioFileReadPermission, 0, &outAudioFile);
  if (v6)
  {
    if (a4)
    {
      long long v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = v6;
      uint64_t v45 = *MEMORY[0x263F08338];
      v46[0] = @"AudioFileOpenURL";
      uint64_t v9 = NSDictionary;
      uint64_t v10 = (__CFString **)v46;
      uint64_t v11 = &v45;
LABEL_10:
      id v14 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
      *a4 = [v7 errorWithDomain:@"audioDataFromFile:error:" code:v8 userInfo:v14];

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  uint64_t v35 = 0;
  long long outPropertyData = 0u;
  long long v34 = 0u;
  UInt32 ioDataSize = 40;
  OSStatus Property = AudioFileGetProperty(outAudioFile, 0x64666D74u, &ioDataSize, &outPropertyData);
  if (Property)
  {
    if (a4)
    {
      long long v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = Property;
      uint64_t v43 = *MEMORY[0x263F08338];
      int v44 = @"AudioFileGetProperty kAudioFilePropertyDataFormat";
      uint64_t v9 = NSDictionary;
      uint64_t v10 = &v44;
      uint64_t v11 = &v43;
      goto LABEL_10;
    }
LABEL_11:
    id v15 = 0;
    goto LABEL_12;
  }
  *(void *)UInt32 ioNumBytes = 0;
  UInt32 ioDataSize = 8;
  OSStatus v13 = AudioFileGetProperty(outAudioFile, 0x62636E74u, &ioDataSize, ioNumBytes);
  if (v13)
  {
    if (a4)
    {
      long long v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v8 = v13;
      uint64_t v41 = *MEMORY[0x263F08338];
      uint64_t v42 = @"AudioFileGetProperty kAudioFilePropertyAudioDataByteCount";
      uint64_t v9 = NSDictionary;
      uint64_t v10 = &v42;
      uint64_t v11 = &v41;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  *(void *)ioNumPackets = 0;
  UInt32 ioDataSize = 8;
  OSStatus v17 = AudioFileGetProperty(outAudioFile, 0x70636E74u, &ioDataSize, ioNumPackets);
  if (v17)
  {
    if (!a4) {
      goto LABEL_11;
    }
    long long v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = v17;
    uint64_t v39 = *MEMORY[0x263F08338];
    int v40 = @"AudioFileGetProperty kAudioFilePropertyAudioDataPacketCount";
    id v20 = [NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    [v18 errorWithDomain:@"audioDataFromFile:error:" code:v19 userInfo:v20];
    id v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v20 = [MEMORY[0x263EFF990] dataWithLength:16 * *(void *)ioNumPackets];
    int v21 = (AudioStreamPacketDescription *)[v20 mutableBytes];
    id v22 = [MEMORY[0x263EFF990] dataWithLength:*(void *)ioNumBytes];
    uint64_t v23 = (void *)[v22 mutableBytes];
    OSStatus PacketData = AudioFileReadPacketData(outAudioFile, 0, ioNumBytes, v21, 0, ioNumPackets, v23);
    if (PacketData)
    {
      if (a4)
      {
        int v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = PacketData;
        uint64_t v37 = *MEMORY[0x263F08338];
        v38 = @"AudioFileGetProperty kAudioFilePropertyAudioDataPacketCount";
        int v27 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        *a4 = [v25 errorWithDomain:@"audioDataFromFile:error:" code:v26 userInfo:v27];
      }
      id v15 = 0;
    }
    else
    {
      id v15 = objc_alloc_init(MEMORY[0x263F84E18]);
      v28[0] = outPropertyData;
      v28[1] = v34;
      uint64_t v29 = v35;
      [v15 setAsbd:v28];
      [v15 setAudioData:v22];
      [v15 setPacketCount:*(void *)ioNumPackets];
      [v15 setPacketDescriptions:v20];
    }
  }
LABEL_12:

  return v15;
}

@end