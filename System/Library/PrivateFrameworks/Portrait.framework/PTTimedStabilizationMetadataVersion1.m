@interface PTTimedStabilizationMetadataVersion1
- (BOOL)hasEstimatedMotionBlur;
- (BOOL)hasStabilizationHomography;
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (PTTimedStabilizationMetadataVersion1)initWithData:(id)a3 minorVersion:(unsigned int)a4;
- (PTTimedStabilizationMetadataVersion1)initWithMinorVersion:(unsigned int)a3;
- (__n128)setStabilizationHomography:(__n128)a3;
- (__n128)stabilizationHomography;
- (double)estimatedMotionBlur;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
- (void)setEstimatedMotionBlur:(PTTimedStabilizationMetadataVersion1 *)self;
@end

@implementation PTTimedStabilizationMetadataVersion1

- (__n128)stabilizationHomography
{
  if (!a1[4].n128_u8[0])
  {
    id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"stabilizationHomography is optional metadata and hasn't been found." userInfo:0];
    objc_exception_throw(v2);
  }
  return a1[1];
}

- (__n128)setStabilizationHomography:(__n128)a3
{
  result[4].n128_u8[0] = 1;
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  return result;
}

- (double)estimatedMotionBlur
{
  if (!*(unsigned char *)(a1 + 80))
  {
    id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"estimatedMotionBlur is optional metadata and hasn't been found." userInfo:0];
    objc_exception_throw(v2);
  }
  return *(double *)(a1 + 72);
}

- (void)setEstimatedMotionBlur:(PTTimedStabilizationMetadataVersion1 *)self
{
  LOBYTE(self[1].super.super.isa) = 1;
  *(void *)&self->_estimatedMotionBlur[7] = v2;
}

- (PTTimedStabilizationMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PTTimedStabilizationMetadataVersion1;
  v3 = [(PTTimedStabilizationMetadata *)&v7 initWithMajorVersion:1 minorVersion:*(void *)&a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (PTTimedStabilizationMetadataVersion1)initWithData:(id)a3 minorVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  objc_super v7 = [(PTTimedStabilizationMetadataVersion1 *)self initWithMinorVersion:v4];
  if (v7
    && ((id v8 = v6,
         v9 = (unsigned int *)[v8 bytes],
         uint64_t v10 = bswap32(*v9),
         [v8 length] == v10)
      ? (BOOL v11 = (v10 & 7) == 0)
      : (BOOL v11 = 0),
        v11))
  {
    v12 = v9 + 2;
    unint64_t v13 = (unint64_t)(v10 + 0x7FFFFFFF8) >> 3;
    long long v28 = 0u;
    long long v29 = 0u;
    int v14 = 1;
    long long v27 = 0u;
    char v15 = 1;
    do
    {
      char v26 = 0;
      +[PTParameterPairSerialization getFloatParameter:(unsigned __int16)v14 fromPairs:v12 numPairs:v13 didFindValue:&v26];
      *((_DWORD *)&v27 + 4 * ((v14 - 1) / 3u) + (v14 - 1) % 3u) = v16;
      v15 &= v26 != 0;
      ++v14;
    }
    while (v14 != 10);
    if (v15)
    {
      v7->_hasStabilizationHomography = 1;
      long long v17 = v29;
      long long v18 = v27;
      *(_OWORD *)&v7->_anon_10[16] = v28;
      *(_OWORD *)&v7->_anon_10[32] = v17;
      *(_OWORD *)v7->_anon_10 = v18;
    }
    char v25 = 0;
    char v24 = 0;
    +[PTParameterPairSerialization getFloatParameter:10 fromPairs:v12 numPairs:v13 didFindValue:&v25];
    unsigned int v23 = v19;
    +[PTParameterPairSerialization getFloatParameter:11 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    if (v25 && v24)
    {
      LOBYTE(v7[1].super.super.isa) = 1;
      *(void *)&v7->_estimatedMotionBlur[7] = __PAIR64__(v20, v23);
    }
    v21 = v7;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  if (self->_hasStabilizationHomography) {
    unsigned int v3 = 80;
  }
  else {
    unsigned int v3 = 8;
  }
  if (LOBYTE(self[1].super.super.isa)) {
    return v3 + 16;
  }
  else {
    return v3;
  }
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PTTimedStabilizationMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7];
  if ([v6 length] >= (unint64_t)v8
    && [(PTTimedStabilizationMetadata *)self majorVersion] == 1)
  {
    id v9 = v6;
    uint64_t v10 = (_DWORD *)[v9 mutableBytes];
    *uint64_t v10 = bswap32([(PTTimedStabilizationMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7]);
    v10[1] = 1650553971;
    long long v18 = v10 + 2;
    if (self->_hasStabilizationHomography)
    {
      for (int i = 1; i != 10; ++i)
      {
        LODWORD(v11) = *(_DWORD *)&self->_anon_10[16 * ((i - 1) / 3u)
                                                + 4 * (((_BYTE)i - 1 + (i - 1) / 3u) & 3)];
        +[PTParameterPairSerialization appendFloatParameter:(unsigned __int16)i value:&v18 toOutput:v11];
      }
    }
    if (LOBYTE(self[1].super.super.isa))
    {
      +[PTParameterPairSerialization appendFloatParameter:10 value:&v18 toOutput:*(double *)&self->_estimatedMotionBlur[7]];
      LODWORD(v13) = *(_DWORD *)(&self->_hasEstimatedMotionBlur + 3);
      +[PTParameterPairSerialization appendFloatParameter:11 value:&v18 toOutput:v13];
    }
    int v14 = v18;
    uint64_t v15 = (uint64_t)v14 - [v9 bytes];
    BOOL v16 = v15 == [(PTTimedStabilizationMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)hasStabilizationHomography
{
  return self->_hasStabilizationHomography;
}

- (BOOL)hasEstimatedMotionBlur
{
  return (uint64_t)self[1].super.super.isa & 1;
}

@end