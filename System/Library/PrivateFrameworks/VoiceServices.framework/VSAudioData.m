@interface VSAudioData
+ (BOOL)supportsSecureCoding;
- (AudioStreamBasicDescription)asbd;
- (NSMutableData)mutableAudioData;
- (NSMutableData)mutableDescription;
- (VSAudioData)init;
- (VSAudioData)initWithCoder:(id)a3;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)packetCount;
- (unsigned)totalFrames;
- (void)concatenateWithAudio:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setAudioData:(id)a3;
- (void)setMutableAudioData:(id)a3;
- (void)setMutableDescription:(id)a3;
- (void)setPacketCount:(int64_t)a3;
- (void)setPacketDescriptions:(id)a3;
@end

@implementation VSAudioData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDescription, 0);
  objc_storeStrong((id *)&self->_mutableAudioData, 0);
}

- (void)setMutableDescription:(id)a3
{
}

- (NSMutableData)mutableDescription
{
  return self->_mutableDescription;
}

- (void)setMutableAudioData:(id)a3
{
}

- (NSMutableData)mutableAudioData
{
  return self->_mutableAudioData;
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

- (VSAudioData)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VSAudioData;
  v5 = [(VSAudioData *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioData"];
    uint64_t v7 = [v6 mutableCopy];
    mutableAudioData = v5->_mutableAudioData;
    v5->_mutableAudioData = (NSMutableData *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"packetDescription"];
    uint64_t v10 = [v9 mutableCopy];
    mutableDescription = v5->_mutableDescription;
    v5->_mutableDescription = (NSMutableData *)v10;

    v5->_packetCount = [v4 decodeIntegerForKey:@"packetCount"];
    uint64_t v12 = [v4 decodeBytesForKey:@"asbd" returnedLength:0];
    uint64_t v13 = *(void *)(v12 + 32);
    long long v14 = *(_OWORD *)(v12 + 16);
    *(_OWORD *)&v5->_asbd.mSampleRate = *(_OWORD *)v12;
    *(_OWORD *)&v5->_asbd.mBytesPerPacket = v14;
    *(void *)&v5->_asbd.mBitsPerChannel = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  mutableAudioData = self->_mutableAudioData;
  id v5 = a3;
  [v5 encodeObject:mutableAudioData forKey:@"audioData"];
  [v5 encodeObject:self->_mutableDescription forKey:@"packetDescription"];
  [v5 encodeInteger:self->_packetCount forKey:@"packetCount"];
  [v5 encodeBytes:&self->_asbd length:40 forKey:@"asbd"];
}

- (void)setPacketDescriptions:(id)a3
{
  id v4 = a3;
  id v5 = [(VSAudioData *)self mutableDescription];
  [v5 setData:v4];
}

- (void)setAudioData:(id)a3
{
  id v4 = a3;
  id v5 = [(VSAudioData *)self mutableAudioData];
  [v5 setData:v4];
}

- (void)concatenateWithAudio:(id)a3
{
  id v4 = a3;
  [(VSAudioData *)self asbd];
  if (!v22)
  {
    if (v4)
    {
      [v4 asbd];
    }
    else
    {
      uint64_t v21 = 0;
      long long v19 = 0u;
      long long v20 = 0u;
    }
    v17[0] = v19;
    v17[1] = v20;
    uint64_t v18 = v21;
    [(VSAudioData *)self setAsbd:v17];
  }
  id v5 = [(VSAudioData *)self audioData];
  uint64_t v6 = [v5 length];

  unint64_t v7 = [(VSAudioData *)self packetCount];
  v8 = [(VSAudioData *)self mutableAudioData];
  v9 = [v4 audioData];
  [v8 appendData:v9];

  -[VSAudioData setPacketCount:](self, "setPacketCount:", -[VSAudioData packetCount](self, "packetCount") + [v4 packetCount]);
  uint64_t v10 = [(VSAudioData *)self mutableDescription];
  v11 = [v4 packetDescriptions];
  [v10 appendData:v11];

  id v12 = [(VSAudioData *)self mutableDescription];
  uint64_t v13 = [v12 mutableBytes];

  if (v7 < [(VSAudioData *)self packetCount])
  {
    unint64_t v14 = 16 * v7;
    do
    {
      v15 = [(VSAudioData *)self mutableDescription];
      unint64_t v16 = [v15 length];

      if (v14 >= v16) {
        break;
      }
      *(void *)(v13 + v14) += v6;
      ++v7;
      v14 += 16;
    }
    while (v7 < [(VSAudioData *)self packetCount]);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[VSAudioData allocWithZone:a3] init];
  if (v4)
  {
    [(VSAudioData *)self asbd];
    v10[0] = v12;
    v10[1] = v13;
    uint64_t v11 = v14;
    [(VSAudioData *)v4 setAsbd:v10];
    id v5 = [(VSAudioData *)self audioData];
    uint64_t v6 = (void *)[v5 copy];
    [(VSAudioData *)v4 setAudioData:v6];

    [(VSAudioData *)v4 setPacketCount:[(VSAudioData *)self packetCount]];
    unint64_t v7 = [(VSAudioData *)self packetDescriptions];
    v8 = (void *)[v7 copy];
    [(VSAudioData *)v4 setPacketDescriptions:v8];
  }
  return v4;
}

- (unsigned)totalFrames
{
  [(VSAudioData *)self asbd];
  if (v11 == 1819304813)
  {
    long long v3 = [(VSAudioData *)self audioData];
    unsigned int v4 = [v3 length];
    [(VSAudioData *)self asbd];
    unsigned int v5 = v4 / v10;
  }
  else
  {
    [(VSAudioData *)self asbd];
    if (v9 == 1869641075)
    {
      int v6 = [(VSAudioData *)self packetCount];
      [(VSAudioData *)self asbd];
      return v8 * v6;
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (double)duration
{
  [(VSAudioData *)self asbd];
  if (v20 == 1819304813)
  {
    [(VSAudioData *)self asbd];
    [(VSAudioData *)self asbd];
    LODWORD(v3) = v18;
    double v4 = 0.0;
    if (v19 * (double)v3 != 0.0)
    {
      unsigned int v5 = [(VSAudioData *)self audioData];
      double v6 = (double)(unint64_t)[v5 length];
      [(VSAudioData *)self asbd];
      [(VSAudioData *)self asbd];
      LODWORD(v7) = v16;
      double v4 = v6 / (v17 * (double)v7);
    }
  }
  else
  {
    [(VSAudioData *)self asbd];
    double v4 = 0.0;
    if (v15 == 1869641075)
    {
      [(VSAudioData *)self asbd];
      if (v14 != 0.0)
      {
        double v8 = (double)[(VSAudioData *)self packetCount];
        [(VSAudioData *)self asbd];
        LODWORD(v9) = v13;
        double v10 = v8 * (double)v9;
        [(VSAudioData *)self asbd];
        return v10 / v12;
      }
    }
  }
  return v4;
}

- (VSAudioData)init
{
  v8.receiver = self;
  v8.super_class = (Class)VSAudioData;
  v2 = [(VSAudioData *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF990] data];
    mutableAudioData = v2->_mutableAudioData;
    v2->_mutableAudioData = (NSMutableData *)v3;

    uint64_t v5 = [MEMORY[0x263EFF990] data];
    mutableDescription = v2->_mutableDescription;
    v2->_mutableDescription = (NSMutableData *)v5;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end