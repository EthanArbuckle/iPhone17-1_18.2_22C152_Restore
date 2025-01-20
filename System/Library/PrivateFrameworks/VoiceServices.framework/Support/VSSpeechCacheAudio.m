@interface VSSpeechCacheAudio
- (AudioStreamBasicDescription)asbd;
- (NSArray)timingInfos;
- (NSData)audioData;
- (NSData)packetDescriptions;
- (NSString)key;
- (NSString)voiceKey;
- (NSString)voiceResourceKey;
- (VSAudioData)audio;
- (VSSpeechCacheAudio)initWithKey:(id)a3 audio:(id)a4 wordTimingInfo:(id)a5 voiceKey:(id)a6 voiceResourceKey:(id)a7;
- (VSSpeechCacheAudio)initWithKey:(id)a3 data:(id)a4;
- (id)serializedData;
- (int64_t)magicVersion;
- (int64_t)packetCount;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setAudioData:(id)a3;
- (void)setKey:(id)a3;
- (void)setPacketCount:(int64_t)a3;
- (void)setPacketDescriptions:(id)a3;
@end

@implementation VSSpeechCacheAudio

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetDescriptions, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_voiceResourceKey, 0);
  objc_storeStrong((id *)&self->_voiceKey, 0);
  objc_storeStrong((id *)&self->_timingInfos, 0);
  objc_storeStrong((id *)&self->_key, 0);
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
  long long v3 = *(_OWORD *)&self[2].mBytesPerPacket;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[2].mSampleRate;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[2].mBitsPerChannel;
  return self;
}

- (void)setAudioData:(id)a3
{
}

- (NSData)audioData
{
  return self->_audioData;
}

- (VSAudioData)audio
{
  return self->_audio;
}

- (NSString)voiceResourceKey
{
  return self->_voiceResourceKey;
}

- (NSString)voiceKey
{
  return self->_voiceKey;
}

- (NSArray)timingInfos
{
  return self->_timingInfos;
}

- (void)setKey:(id)a3
{
}

- (int64_t)magicVersion
{
  return self->_magicVersion;
}

- (VSSpeechCacheAudio)initWithKey:(id)a3 audio:(id)a4 wordTimingInfo:(id)a5 voiceKey:(id)a6 voiceResourceKey:(id)a7
{
  id v24 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)VSSpeechCacheAudio;
  v17 = [(VSSpeechCacheAudio *)&v28 init];
  v18 = v17;
  if (v17)
  {
    v17->_magicVersion = 1869641269;
    objc_storeStrong((id *)&v17->_key, a3);
    objc_storeStrong((id *)&v18->_audio, a4);
    if (v13)
    {
      [v13 asbd];
    }
    else
    {
      uint64_t v27 = 0;
      long long v25 = 0u;
      long long v26 = 0u;
    }
    *(_OWORD *)&v18->_asbd.mSampleRate = v25;
    *(_OWORD *)&v18->_asbd.mBytesPerPacket = v26;
    *(void *)&v18->_asbd.mBitsPerChannel = v27;
    uint64_t v19 = [v13 audioData];
    audioData = v18->_audioData;
    v18->_audioData = (NSData *)v19;

    v18->_packetCount = [v13 packetCount];
    uint64_t v21 = [v13 packetDescriptions];
    packetDescriptions = v18->_packetDescriptions;
    v18->_packetDescriptions = (NSData *)v21;

    objc_storeStrong((id *)&v18->_timingInfos, a5);
    objc_storeStrong((id *)&v18->_voiceKey, a6);
    objc_storeStrong((id *)&v18->_voiceResourceKey, a7);
  }

  return v18;
}

- (VSSpeechCacheAudio)initWithKey:(id)a3 data:(id)a4
{
  v53[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)VSSpeechCacheAudio;
  v9 = [(VSSpeechCacheAudio *)&v50 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_msgSend(v8, "getBytes:range:", &v10->_magicVersion, 0, 8);
    if (v10->_magicVersion != 1869641269)
    {
      v38 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v8, "getBytes:range:", &v10->_asbd, 8, 40);
    objc_msgSend(v8, "getBytes:range:", &v10->_packetCount, 48, 8);
    *(void *)buf = 0;
    objc_msgSend(v8, "getBytes:range:", buf, 56, 8);
    uint64_t v11 = objc_msgSend(v8, "subdataWithRange:", 64, *(void *)buf);
    packetDescriptions = v10->_packetDescriptions;
    v10->_packetDescriptions = (NSData *)v11;

    uint64_t v13 = *(void *)buf;
    uint64_t v49 = 0;
    objc_msgSend(v8, "getBytes:range:", &v49, *(void *)buf + 64, 8);
    uint64_t v14 = v13 + 72;
    uint64_t v15 = objc_msgSend(v8, "subdataWithRange:", v14, v49);
    audioData = v10->_audioData;
    v10->_audioData = (NSData *)v15;

    uint64_t v17 = v49;
    v18 = (VSAudioData *)objc_alloc_init(MEMORY[0x263F84E18]);
    audio = v10->_audio;
    v10->_audio = v18;

    long long v20 = *(_OWORD *)&v10->_asbd.mBytesPerPacket;
    v47[0] = *(_OWORD *)&v10->_asbd.mSampleRate;
    v47[1] = v20;
    uint64_t v48 = *(void *)&v10->_asbd.mBitsPerChannel;
    [(VSAudioData *)v10->_audio setAsbd:v47];
    [(VSAudioData *)v10->_audio setAudioData:v10->_audioData];
    [(VSAudioData *)v10->_audio setPacketCount:v10->_packetCount];
    [(VSAudioData *)v10->_audio setPacketDescriptions:v10->_packetDescriptions];
    [(VSAudioData *)v10->_audio duration];
    if (v21 < 0.5)
    {
      v39 = (void *)MEMORY[0x263EFF940];
      uint64_t v52 = *MEMORY[0x263F08338];
      v40 = [NSString stringWithFormat:@"duration %.2f second", *(void *)&v21];
      v53[0] = v40;
      v41 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
      id v42 = [v39 exceptionWithName:@"InvalidCache" reason:@"Audio duration too short" userInfo:v41];

      objc_exception_throw(v42);
    }
    uint64_t v46 = 0;
    objc_msgSend(v8, "getBytes:range:", &v46, v17 + v14, 8);
    uint64_t v22 = v17 + v14 + 8;
    if (v46 >= 1)
    {
      v23 = [v8 subdataWithRange:v17 + v14 + 8];
      id v24 = (void *)MEMORY[0x263EFFA08];
      uint64_t v25 = objc_opt_class();
      long long v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
      uint64_t v27 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v26 fromData:v23 error:0];
      timingInfos = v10->_timingInfos;
      v10->_timingInfos = (NSArray *)v27;

      uint64_t v29 = v46;
      v22 += v29;
    }
    uint64_t v45 = 0;
    objc_msgSend(v8, "getBytes:range:", &v45, v22, 8);
    uint64_t v30 = v22 + 8;
    if (v45 >= 1)
    {
      v31 = [v8 subdataWithRange:v30];
      uint64_t v32 = [[NSString alloc] initWithData:v31 encoding:4];
      voiceKey = v10->_voiceKey;
      v10->_voiceKey = (NSString *)v32;

      uint64_t v34 = v45;
      v30 += v34;
    }
    uint64_t v44 = 0;
    objc_msgSend(v8, "getBytes:range:", &v44, v30, 8);
    if (v44 >= 1)
    {
      v35 = [v8 subdataWithRange:v30 + 8];
      uint64_t v36 = [[NSString alloc] initWithData:v35 encoding:4];
      voiceResourceKey = v10->_voiceResourceKey;
      v10->_voiceResourceKey = (NSString *)v36;
    }
  }
  v38 = v10;
LABEL_13:

  return v38;
}

- (id)serializedData
{
  long long v3 = [MEMORY[0x263EFF990] data];
  [v3 appendBytes:&self->_magicVersion length:8];
  [v3 appendBytes:&self->_asbd length:40];
  [v3 appendBytes:&self->_packetCount length:8];
  NSUInteger v13 = [(NSData *)self->_packetDescriptions length];
  [v3 appendBytes:&v13 length:8];
  [v3 appendData:self->_packetDescriptions];
  NSUInteger v12 = [(NSData *)self->_audioData length];
  [v3 appendBytes:&v12 length:8];
  [v3 appendData:self->_audioData];
  uint64_t v11 = 0;
  timingInfos = self->_timingInfos;
  if (timingInfos)
  {
    v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:timingInfos requiringSecureCoding:1 error:0];
    uint64_t v11 = [v5 length];
    [v3 appendBytes:&v11 length:8];
    [v3 appendData:v5];
  }
  else
  {
    [v3 appendBytes:&v11 length:8];
  }
  v6 = [(NSString *)self->_voiceKey dataUsingEncoding:4];
  uint64_t v10 = [v6 length];
  [v3 appendBytes:&v10 length:8];
  if (v10) {
    [v3 appendData:v6];
  }
  id v7 = [(NSString *)self->_voiceResourceKey dataUsingEncoding:4];
  uint64_t v9 = [v7 length];
  [v3 appendBytes:&v9 length:8];
  if (v9) {
    [v3 appendData:v7];
  }

  return v3;
}

- (NSString)key
{
  return self->_key;
}

@end