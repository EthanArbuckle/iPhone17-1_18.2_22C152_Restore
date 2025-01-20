@interface AVAudioPCMBuffer(RCAdditions)
+ (uint64_t)supportsSecureCoding;
- (double)rc_durationInSeconds;
- (id)extractChannels:()RCAdditions;
- (id)trimmedBuffer:()RCAdditions;
- (void)encodeWithCoder:()RCAdditions;
- (void)initWithCoder:()RCAdditions;
@end

@implementation AVAudioPCMBuffer(RCAdditions)

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (void)initWithCoder:()RCAdditions
{
  id v4 = a3;
  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"format"];
  v5 = objc_msgSend(a1, "initWithPCMFormat:frameCapacity:", v17, objc_msgSend(v4, "decodeInt32ForKey:", @"frameCapacity"));
  if (v5)
  {
    objc_msgSend(v5, "setFrameLength:", objc_msgSend(v4, "decodeInt32ForKey:", @"frameLength"));
    uint64_t v6 = [v5 audioBufferList];
    unsigned int v7 = [v4 decodeInt32ForKey:@"mNumberBuffers"];
    if (v7)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      v10 = (void **)(v6 + 16);
      do
      {
        v11 = objc_msgSend(NSString, "stringWithFormat:", @"mNumberChannels_%d", v8);
        int v12 = [v4 decodeInt32ForKey:v11];

        if (v12 == *((_DWORD *)v10 - 2))
        {
          size_t __n = 0;
          id v13 = v4;
          v14 = objc_msgSend(NSString, "stringWithFormat:", @"mData_%d", v8);
          v15 = (const void *)[v13 decodeBytesForKey:v14 returnedLength:&__n];

          if (v15)
          {
            if (__n == *((_DWORD *)v10 - 1)) {
              memcpy(*v10, v15, __n);
            }
          }
        }
        v10 += 2;
        ++v8;
      }
      while (v9 != v8);
    }
  }

  return v5;
}

- (void)encodeWithCoder:()RCAdditions
{
  id v14 = a3;
  id v4 = [a1 format];
  [v14 encodeObject:v4 forKey:@"format"];

  objc_msgSend(v14, "encodeInt32:forKey:", objc_msgSend(a1, "frameCapacity"), @"frameCapacity");
  objc_msgSend(v14, "encodeInt32:forKey:", objc_msgSend(a1, "frameLength"), @"frameLength");
  v5 = (unsigned int *)[a1 audioBufferList];
  [v14 encodeInt32:*v5 forKey:@"mNumberBuffers"];
  uint64_t v6 = *v5;
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = (uint64_t *)(v5 + 4);
    do
    {
      uint64_t v9 = *((unsigned int *)v8 - 2);
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"mNumberChannels_%d", v7);
      [v14 encodeInt32:v9 forKey:v10];

      uint64_t v11 = *v8;
      uint64_t v12 = *((unsigned int *)v8 - 1);
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"mData_%d", v7);
      [v14 encodeBytes:v11 length:v12 forKey:v13];

      ++v7;
      v8 += 2;
    }
    while (v6 != v7);
  }
}

- (id)extractChannels:()RCAdditions
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  uint64_t v6 = [a1 format];
  id v7 = objc_alloc(MEMORY[0x1E4F153A0]);
  uint64_t v8 = [v6 commonFormat];
  [v6 sampleRate];
  uint64_t v9 = objc_msgSend(v7, "initWithCommonFormat:sampleRate:channels:interleaved:", v8, v5, 0);
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F153B0]), "initWithPCMFormat:frameCapacity:", v9, objc_msgSend(a1, "frameCapacity"));
  objc_msgSend(v10, "setFrameLength:", objc_msgSend(a1, "frameLength"));
  uint64_t v11 = [a1 audioBufferList];
  uint64_t v12 = [v10 audioBufferList];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__AVAudioPCMBuffer_RCAdditions__extractChannels___block_invoke;
  v14[3] = &unk_1E64971D8;
  v14[5] = v11;
  v14[6] = v12;
  v14[4] = v15;
  [v4 enumerateIndexesUsingBlock:v14];
  _Block_object_dispose(v15, 8);

  return v10;
}

- (id)trimmedBuffer:()RCAdditions
{
  unsigned int v5 = [a1 frameLength];
  uint64_t v6 = v5 - a3;
  if (v5 >= a3)
  {
    uint64_t v8 = [a1 format];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F153B0]) initWithPCMFormat:v8 frameCapacity:v6];
    [v7 setFrameLength:v6];
    uint64_t v9 = (unsigned int *)[a1 audioBufferList];
    uint64_t v10 = [v7 audioBufferList];
    uint64_t v11 = [v8 streamDescription];
    uint64_t v12 = *v9;
    if (v12)
    {
      uint64_t v13 = *(_DWORD *)(v11 + 24) * a3;
      id v14 = (void **)(v10 + 16);
      v15 = v9 + 4;
      do
      {
        size_t v16 = *((unsigned int *)v14 - 1);
        if (*((unsigned int *)v15 - 1) - v13 != v16) {
          -[AVAudioPCMBuffer(RCAdditions) trimmedBuffer:]();
        }
        v17 = v14 + 2;
        v18 = v15 + 2;
        memcpy(*v14, (const void *)(*v15 + v13), v16);
        v15 = v18;
        id v14 = v17;
        --v12;
      }
      while (v12);
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (double)rc_durationInSeconds
{
  double v2 = (double)[a1 frameLength];
  v3 = [a1 format];
  [v3 sampleRate];
  double v5 = v2 / v4;

  return v5;
}

- (void)trimmedBuffer:()RCAdditions .cold.1()
{
  __assert_rtn("-[AVAudioPCMBuffer(RCAdditions) trimmedBuffer:]", "AVAudioPCMBuffer+RCAdditions.m", 90, "destBuffer->mDataByteSize == (sourceBuffer->mDataByteSize - frameCountByteOffset)");
}

@end