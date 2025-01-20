@interface PTGlobalRenderingMetadataVersion2
- (BOOL)applyToRenderState:(id)a3 error:(id *)a4;
- (BOOL)matchesRenderState:(id)a3;
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (PTGlobalRenderingMetadataVersion2)initWithData:(id)a3;
- (PTGlobalRenderingMetadataVersion2)initWithMinorVersion:(unsigned int)a3;
- (unsigned)hwModelID;
- (unsigned)renderingVersion;
- (unsigned)sensorID;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
- (unsigned)sourceColorBitDepth;
- (void)applyToRenderRequest:(id)a3;
- (void)applyToRenderState:(id)a3;
- (void)setHwModelID:(unsigned int)a3;
- (void)setRenderingVersion:(unsigned int)a3;
- (void)setSensorID:(unsigned int)a3;
- (void)setSourceColorBitDepth:(unsigned int)a3;
@end

@implementation PTGlobalRenderingMetadataVersion2

- (PTGlobalRenderingMetadataVersion2)initWithMinorVersion:(unsigned int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PTGlobalRenderingMetadataVersion2;
  v3 = [(PTGlobalRenderingMetadata *)&v6 initWithMajorVersion:2 minorVersion:*(void *)&a3];
  if (v3)
  {
    *(&v3->super._renderingVersion + 1) = +[PTRenderPipeline latestVersion];
    v4 = v3;
  }

  return v3;
}

- (PTGlobalRenderingMetadataVersion2)initWithData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (unsigned int *)[v4 bytes];
  objc_super v6 = [(PTGlobalRenderingMetadataVersion2 *)self initWithMinorVersion:bswap32(v5[3])];
  if (v6
    && (uint64_t v7 = bswap32(*v5), [v4 length] == v7)
    && (v7 & 7) == 0
    && [(PTGlobalRenderingMetadata *)v6 majorVersion] == 2
    && [(PTGlobalRenderingMetadata *)v6 majorVersion] == bswap32(v5[2]))
  {
    v8 = v5 + 4;
    unint64_t v9 = (unint64_t)(v7 + 0x7FFFFFFF0) >> 3;
    unsigned __int8 v17 = 0;
    LOBYTE(v6->_renderingVersion) = 1;
    *(&v6->super._renderingVersion + 1) = +[PTParameterPairSerialization getUIntParameter:1 fromPairs:v8 numPairs:v9 didFindValue:&v17];
    LOBYTE(v6->_renderingVersion) &= v17;
    *(_DWORD *)&v6->_readSuccessAll = +[PTParameterPairSerialization getUIntParameter:2 fromPairs:v8 numPairs:v9 didFindValue:&v17];
    LOBYTE(v6->_renderingVersion) &= v17;
    v6->_hwModelID = +[PTParameterPairSerialization getUIntParameter:3 fromPairs:v8 numPairs:v9 didFindValue:&v17];
    LOBYTE(v6->_renderingVersion) &= v17;
    v6->_sensorID = +[PTParameterPairSerialization getUIntParameter:4 fromPairs:v8 numPairs:v9 didFindValue:&v17];
    LOBYTE(v6->_renderingVersion) &= v17;
    if (!+[PTRenderPipeline isRenderVersionSupported:*(&v6->super._renderingVersion + 1)])
    {
      v10 = _PTLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = *(&v6->super._renderingVersion + 1);
        *(_DWORD *)buf = 67109120;
        LODWORD(v19) = v11;
        _os_log_impl(&dword_1D0778000, v10, OS_LOG_TYPE_INFO, "Render version not supported: %i", buf, 8u);
      }

      *(&v6->super._renderingVersion + 1) = +[PTParameterPairSerialization getUIntParameter:5 fromPairs:v8 numPairs:v9 withDefault:*(&v6->super._renderingVersion + 1) didFindValue:&v17];
      v12 = _PTLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = v17;
        if (v17)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"found: %i", *(&v6->super._renderingVersion + 1));
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = @"not found";
        }
        *(_DWORD *)buf = 138412290;
        v19 = v14;
        _os_log_impl(&dword_1D0778000, v12, OS_LOG_TYPE_INFO, "Fallback version %@", buf, 0xCu);
        if (v13) {
      }
        }
    }
    v15 = v6;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 56;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PTGlobalRenderingMetadataVersion2 *)self sizeOfSerializedObjectWithOptions:v7];
  if ([v6 length] < (unint64_t)v8) {
    goto LABEL_5;
  }
  if ([(PTGlobalRenderingMetadata *)self majorVersion] != 2) {
    goto LABEL_5;
  }
  id v9 = v6;
  v10 = (_DWORD *)[v9 mutableBytes];
  _DWORD *v10 = bswap32([(PTGlobalRenderingMetadataVersion2 *)self sizeOfSerializedObjectWithOptions:v7]);
  v10[1] = 1684956530;
  v10[2] = bswap32([(PTGlobalRenderingMetadata *)self majorVersion]);
  v10[3] = bswap32([(PTGlobalRenderingMetadata *)self minorVersion]);
  v15 = v10 + 4;
  BOOL v11 = 1;
  +[PTParameterPairSerialization appendUIntParameter:1 value:*(&self->super._renderingVersion + 1) toOutput:&v15];
  +[PTParameterPairSerialization appendUIntParameter:2 value:*(unsigned int *)&self->_readSuccessAll toOutput:&v15];
  +[PTParameterPairSerialization appendUIntParameter:3 value:self->_hwModelID toOutput:&v15];
  +[PTParameterPairSerialization appendUIntParameter:4 value:self->_sensorID toOutput:&v15];
  v12 = v15;
  uint64_t v13 = (uint64_t)v12 - [v9 bytes];
  if (v13 != [(PTGlobalRenderingMetadataVersion2 *)self sizeOfSerializedObjectWithOptions:v7])LABEL_5:BOOL v11 = 0; {

  }
  return v11;
}

- (void)applyToRenderState:(id)a3
{
}

- (BOOL)matchesRenderState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *(&self->super._renderingVersion + 1);
  if ([v4 renderingVersion] == v5
    && (int v6 = *(_DWORD *)&self->_readSuccessAll, v6 == [v4 hwModelID]))
  {
    unsigned int sensorID = self->_sensorID;
    BOOL v8 = sensorID == [v4 sourceColorBitDepth];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)applyToRenderState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4
    && !+[PTRenderPipeline isRenderVersionSupported:*(&self->super._renderingVersion + 1)])
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Portrait.RenderingMetadata" code:2 userInfo:0];
  }
  uint64_t v7 = [(PTGlobalRenderingMetadataVersion2 *)self matchesRenderState:v6] ^ 1;
  [v6 setSourceColorBitDepth:self->_sensorID];
  [v6 setRenderingVersion:*(&self->super._renderingVersion + 1)];
  [v6 setHwModelID:*(unsigned int *)&self->_readSuccessAll];
  [v6 prepareForRendering:v7];
  int renderingVersion_low = LOBYTE(self->_renderingVersion);
  if (!LOBYTE(self->_renderingVersion))
  {
    id v9 = _PTLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PTTimedRenderingMetadataVersion1 applyToRenderRequest:](v9);
    }
  }
  return renderingVersion_low != 0;
}

- (void)applyToRenderRequest:(id)a3
{
  uint64_t hwModelID = self->_hwModelID;
  id v5 = a3;
  [v5 setSensorID:hwModelID];
  [v5 setNetworkBias:0.0];

  if (!LOBYTE(self->_renderingVersion))
  {
    id v6 = _PTLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PTTimedRenderingMetadataVersion1 applyToRenderRequest:](v6);
    }
  }
}

- (unsigned)renderingVersion
{
  return *(&self->super._renderingVersion + 1);
}

- (void)setRenderingVersion:(unsigned int)a3
{
  *(&self->super._renderingVersion + 1) = a3;
}

- (unsigned)hwModelID
{
  return *(_DWORD *)&self->_readSuccessAll;
}

- (void)setHwModelID:(unsigned int)a3
{
  *(_DWORD *)&self->_readSuccessAll = a3;
}

- (unsigned)sensorID
{
  return self->_hwModelID;
}

- (void)setSensorID:(unsigned int)a3
{
  self->_uint64_t hwModelID = a3;
}

- (unsigned)sourceColorBitDepth
{
  return self->_sensorID;
}

- (void)setSourceColorBitDepth:(unsigned int)a3
{
  self->_unsigned int sensorID = a3;
}

@end