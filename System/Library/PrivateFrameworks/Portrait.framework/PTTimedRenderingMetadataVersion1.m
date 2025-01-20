@interface PTTimedRenderingMetadataVersion1
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (PTTimedRenderingMetadataVersion1)initWithData:(id)a3 minorVersion:(unsigned int)a4;
- (PTTimedRenderingMetadataVersion1)initWithMinorVersion:(unsigned int)a3;
- (float)alphaLowLight;
- (float)aperture;
- (float)focusDistance;
- (unsigned)agc;
- (unsigned)frameId;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
- (void)applyToRenderRequest:(id)a3;
- (void)setAgc:(unsigned int)a3;
- (void)setAlphaLowLight:(float)a3;
- (void)setAperture:(float)a3;
- (void)setFocusDistance:(float)a3;
- (void)setFrameId:(unsigned int)a3;
@end

@implementation PTTimedRenderingMetadataVersion1

- (PTTimedRenderingMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PTTimedRenderingMetadataVersion1;
  v3 = [(PTTimedRenderingMetadata *)&v8 initWithMajorVersion:1 minorVersion:*(void *)&a3];
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 1.0;
    [(PTTimedRenderingMetadataVersion1 *)v3 setAlphaLowLight:v4];
    v5->_frameId = arc4random();
    v6 = v5;
  }

  return v5;
}

- (PTTimedRenderingMetadataVersion1)initWithData:(id)a3 minorVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [(PTTimedRenderingMetadataVersion1 *)self initWithMinorVersion:v4];
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
    char v19 = 0;
    v7->_readSuccessAll = 1;
    +[PTParameterPairSerialization getFloatParameter:1 fromPairs:v12 numPairs:v13 didFindValue:&v19];
    v7->_focusDistance = v14;
    v7->_readSuccessAll &= v19;
    +[PTParameterPairSerialization getFloatParameter:2 fromPairs:v12 numPairs:v13 didFindValue:&v19];
    v7->_aperture = v15;
    v7->_readSuccessAll &= v19;
    v7->_agc = +[PTParameterPairSerialization getUIntParameter:3 fromPairs:v12 numPairs:v13 didFindValue:&v19];
    v7->_readSuccessAll &= v19;
    if (v4 >= 2)
    {
      +[PTParameterPairSerialization getFloatParameter:4 fromPairs:v12 numPairs:v13 didFindValue:&v19];
      v7->_alphaLowLight = v16;
      v7->_readSuccessAll &= v19;
      if (v4 >= 5)
      {
        v7->_frameId = +[PTParameterPairSerialization getUIntParameter:5 fromPairs:v12 numPairs:v13 withDefault:v7->_frameId didFindValue:&v19];
        v7->_readSuccessAll &= v19;
      }
    }
    v17 = v7;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 48;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PTTimedRenderingMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7];
  if ([v6 length] < (unint64_t)v8) {
    goto LABEL_5;
  }
  if ([(PTTimedRenderingMetadata *)self majorVersion] != 1) {
    goto LABEL_5;
  }
  id v9 = v6;
  uint64_t v10 = (_DWORD *)[v9 mutableBytes];
  *uint64_t v10 = bswap32([(PTTimedRenderingMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7]);
  v10[1] = 1684956530;
  v18 = v10 + 2;
  *(float *)&double v11 = self->_focusDistance;
  BOOL v12 = 1;
  +[PTParameterPairSerialization appendFloatParameter:1 value:&v18 toOutput:v11];
  *(float *)&double v13 = self->_aperture;
  +[PTParameterPairSerialization appendFloatParameter:2 value:&v18 toOutput:v13];
  +[PTParameterPairSerialization appendUIntParameter:3 value:self->_agc toOutput:&v18];
  *(float *)&double v14 = self->_alphaLowLight;
  +[PTParameterPairSerialization appendFloatParameter:4 value:&v18 toOutput:v14];
  +[PTParameterPairSerialization appendUIntParameter:5 value:self->_frameId toOutput:&v18];
  float v15 = v18;
  uint64_t v16 = (uint64_t)v15 - [v9 bytes];
  if (v16 != [(PTTimedRenderingMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7])LABEL_5:BOOL v12 = 0; {

  }
  return v12;
}

- (void)applyToRenderRequest:(id)a3
{
  float aperture = self->_aperture;
  id v5 = a3;
  *(float *)&double v6 = aperture;
  [v5 setFNumber:v6];
  *(float *)&double v7 = self->_focusDistance;
  [v5 setFocusDisparity:v7];
  [v5 setAGC:self->_agc];
  *(float *)&double v8 = self->_alphaLowLight;
  [v5 setAlphaLowLight:v8];
  [v5 setFrameId:self->_frameId];

  if (!self->_readSuccessAll)
  {
    id v9 = _PTLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PTTimedRenderingMetadataVersion1 applyToRenderRequest:](v9);
    }
  }
}

- (float)focusDistance
{
  return self->_focusDistance;
}

- (void)setFocusDistance:(float)a3
{
  self->_focusDistance = a3;
}

- (float)aperture
{
  return self->_aperture;
}

- (void)setAperture:(float)a3
{
  self->_float aperture = a3;
}

- (unsigned)agc
{
  return self->_agc;
}

- (void)setAgc:(unsigned int)a3
{
  self->_agc = a3;
}

- (float)alphaLowLight
{
  return self->_alphaLowLight;
}

- (void)setAlphaLowLight:(float)a3
{
  self->_alphaLowLight = a3;
}

- (unsigned)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unsigned int)a3
{
  self->_frameId = a3;
}

- (void)applyToRenderRequest:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Not all parameters found in metadata", v1, 2u);
}

@end