@interface PTGlobalStabilizationMetadataVersion1
- ($2825F4736939C4A6D3AD43837233062D)originalVideoDimensions;
- (BOOL)hasOriginalVideoDimensions;
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (PTGlobalStabilizationMetadataVersion1)initWithData:(id)a3;
- (PTGlobalStabilizationMetadataVersion1)initWithMinorVersion:(unsigned int)a3;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
- (void)setOriginalVideoDimensions:(id)a3;
@end

@implementation PTGlobalStabilizationMetadataVersion1

- ($2825F4736939C4A6D3AD43837233062D)originalVideoDimensions
{
  if (!self->_hasOriginalVideoDimensions)
  {
    id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"originalVideoDimensions is optional metadata and hasn't been found." userInfo:0];
    objc_exception_throw(v3);
  }
  return ($2825F4736939C4A6D3AD43837233062D)self->_originalVideoDimensions;
}

- (void)setOriginalVideoDimensions:(id)a3
{
  self->_originalVideoDimensions = ($470D365275581EF16070F5A11344F73E)a3;
  self->_hasOriginalVideoDimensions = 1;
}

- (PTGlobalStabilizationMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PTGlobalStabilizationMetadataVersion1;
  id v3 = [(PTGlobalStabilizationMetadata *)&v7 initWithMajorVersion:1 minorVersion:*(void *)&a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (PTGlobalStabilizationMetadataVersion1)initWithData:(id)a3
{
  id v4 = a3;
  v5 = (unsigned int *)[v4 bytes];
  uint64_t v6 = bswap32(v5[3]);
  v17.receiver = self;
  v17.super_class = (Class)PTGlobalStabilizationMetadataVersion1;
  objc_super v7 = [(PTGlobalStabilizationMetadata *)&v17 initWithMajorVersion:1 minorVersion:v6];
  if (v7
    && (uint64_t v8 = bswap32(*v5), [v4 length] == v8)
    && (v8 & 7) == 0
    && [(PTGlobalStabilizationMetadata *)v7 majorVersion] == 1
    && [(PTGlobalStabilizationMetadata *)v7 majorVersion] == bswap32(v5[2]))
  {
    unint64_t v9 = v8 + 0x7FFFFFFF0;
    v10 = v5 + 4;
    unint64_t v11 = v9 >> 3;
    __int16 v16 = 0;
    unsigned int v12 = +[PTParameterPairSerialization getUIntParameter:1 fromPairs:v5 + 4 numPairs:v9 >> 3 didFindValue:(char *)&v16 + 1];
    unsigned int v13 = +[PTParameterPairSerialization getUIntParameter:2 fromPairs:v10 numPairs:v11 didFindValue:&v16];
    if (HIBYTE(v16) && (_BYTE)v16)
    {
      v7->_hasOriginalVideoDimensions = 1;
      v7->_originalVideoDimensions.width = v12;
      v7->_originalVideoDimensions.height = v13;
    }
    v14 = v7;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  if (self->_hasOriginalVideoDimensions) {
    return 32;
  }
  else {
    return 16;
  }
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PTGlobalStabilizationMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7];
  if ([v6 length] >= (unint64_t)v8
    && [(PTGlobalStabilizationMetadata *)self majorVersion] == 1)
  {
    id v9 = v6;
    v10 = (_DWORD *)[v9 mutableBytes];
    _DWORD *v10 = bswap32([(PTGlobalStabilizationMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7]);
    v10[1] = 1650553971;
    v10[2] = bswap32([(PTGlobalStabilizationMetadata *)self majorVersion]);
    v10[3] = bswap32([(PTGlobalStabilizationMetadata *)self minorVersion]);
    unint64_t v11 = v10 + 4;
    v15 = v11;
    if (self->_hasOriginalVideoDimensions)
    {
      +[PTParameterPairSerialization appendUIntParameter:1 value:self->_originalVideoDimensions.width toOutput:&v15];
      +[PTParameterPairSerialization appendUIntParameter:2 value:self->_originalVideoDimensions.height toOutput:&v15];
      unint64_t v11 = v15;
    }
    unsigned int v12 = (char *)v11 - [v9 bytes];
    BOOL v13 = v12 == (char *)[(PTGlobalStabilizationMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)hasOriginalVideoDimensions
{
  return self->_hasOriginalVideoDimensions;
}

@end