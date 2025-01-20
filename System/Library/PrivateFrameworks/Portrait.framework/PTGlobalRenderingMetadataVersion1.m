@interface PTGlobalRenderingMetadataVersion1
- ($2825F4736939C4A6D3AD43837233062D)rawSensorSize;
- (BOOL)applyToRenderState:(id)a3 error:(id *)a4;
- (BOOL)matchesRenderState:(id)a3;
- (BOOL)nanAwareEqual:(float)a3 with:(float)a4;
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (CGRect)sensorCropRect;
- (PTGlobalRenderingMetadataVersion1)initWithData:(id)a3;
- (PTGlobalRenderingMetadataVersion1)initWithMinorVersion:(unsigned int)a3;
- (__n128)extrinsicsMatrix;
- (__n128)setExtrinsicsMatrix:(__n128)a3;
- (double)visCropFactor;
- (float)defaultAperture;
- (float)focalLength35mm;
- (float)highlightBoostFactor;
- (float)highlightChromaFactor;
- (float)maxAperture;
- (float)minAperture;
- (float)networkBias;
- (float)noiseScaleFactor;
- (unsigned)conversionGain;
- (unsigned)hwModelID;
- (unsigned)readNoise1x;
- (unsigned)readNoise8x;
- (unsigned)renderingVersion;
- (unsigned)sensorID;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
- (unsigned)sourceColorBitDepth;
- (void)applyToRenderRequest:(id)a3;
- (void)applyToRenderState:(id)a3;
- (void)setConversionGain:(unsigned int)a3;
- (void)setDefaultAperture:(float)a3;
- (void)setFocalLength35mm:(float)a3;
- (void)setHighlightBoostFactor:(float)a3;
- (void)setHighlightChromaFactor:(float)a3;
- (void)setHwModelID:(unsigned int)a3;
- (void)setMaxAperture:(float)a3;
- (void)setMinAperture:(float)a3;
- (void)setNetworkBias:(float)a3;
- (void)setNoiseScaleFactor:(float)a3;
- (void)setRawSensorSize:(id)a3;
- (void)setReadNoise1x:(unsigned int)a3;
- (void)setReadNoise8x:(unsigned int)a3;
- (void)setRenderingVersion:(unsigned int)a3;
- (void)setSensorCropRect:(CGRect)a3;
- (void)setSensorID:(unsigned int)a3;
- (void)setSourceColorBitDepth:(unsigned int)a3;
- (void)setVisCropFactor:(PTGlobalRenderingMetadataVersion1 *)self;
@end

@implementation PTGlobalRenderingMetadataVersion1

- (PTGlobalRenderingMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PTGlobalRenderingMetadataVersion1;
  v3 = [(PTGlobalRenderingMetadata *)&v7 initWithMajorVersion:1 minorVersion:*(void *)&a3];
  v4 = v3;
  if (v3)
  {
    v3->_sourceColorBitDepth = 10;
    v3->_noiseScaleFactor = NAN;
    v3->_hwModelID = 0;
    v3->_renderingVersion = 2;
    v5 = v3;
  }

  return v4;
}

- (PTGlobalRenderingMetadataVersion1)initWithData:(id)a3
{
  id v4 = a3;
  v5 = (unsigned int *)[v4 bytes];
  uint64_t v6 = bswap32(v5[3]);
  objc_super v7 = [(PTGlobalRenderingMetadataVersion1 *)self initWithMinorVersion:v6];
  if (v7
    && (uint64_t v8 = bswap32(*v5), [v4 length] == v8)
    && (v8 & 7) == 0
    && [(PTGlobalRenderingMetadata *)v7 majorVersion] == 1
    && [(PTGlobalRenderingMetadata *)v7 majorVersion] == bswap32(v5[2]))
  {
    v9 = v5 + 4;
    unint64_t v10 = (unint64_t)(v8 + 0x7FFFFFFF0) >> 3;
    char v31 = 0;
    v7->_readSuccessAll = 1;
    +[PTParameterPairSerialization getFloatParameter:1 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_defaultAperture = v11;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:2 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_minAperture = v12;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:3 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_maxAperture = v13;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:4 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_highlightBoostFactor = v14;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:5 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_highlightChromaFactor = v15;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:6 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_focalLength35mm = v16;
    v7->_readSuccessAll &= v31;
    v7->_conversionGain = +[PTParameterPairSerialization getUIntParameter:7 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_readSuccessAll &= v31;
    v7->_readNoise1x = +[PTParameterPairSerialization getUIntParameter:8 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_readSuccessAll &= v31;
    v7->_readNoise8x = +[PTParameterPairSerialization getUIntParameter:9 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_readSuccessAll &= v31;
    v7->_rawSensorSize.width = +[PTParameterPairSerialization getUIntParameter:10 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_readSuccessAll &= v31;
    v7->_rawSensorSize.height = +[PTParameterPairSerialization getUIntParameter:11 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:12 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_sensorCropRect.origin.x = v17;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:13 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_sensorCropRect.origin.y = v18;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:14 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_sensorCropRect.size.width = v19;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:15 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    int v20 = 0;
    v7->_sensorCropRect.size.height = v21;
    v7->_readSuccessAll &= v31;
    do
    {
      +[PTParameterPairSerialization getFloatParameter:(unsigned __int16)(v20 + 16) fromPairs:v9 numPairs:v10 didFindValue:&v31];
      *((_DWORD *)&v7[1].super.super.isa + 4 * (v20 / 3u) + v20 % 3u) = v22;
      v7->_readSuccessAll &= v31;
      ++v20;
    }
    while (v20 != 12);
    +[PTParameterPairSerialization getFloatParameter:28 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    *(_DWORD *)v7->_visCropFactor = v23;
    v7->_readSuccessAll &= v31;
    +[PTParameterPairSerialization getFloatParameter:29 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    *(_DWORD *)&v7->_visCropFactor[4] = v24;
    v7->_readSuccessAll &= v31;
    v7->_sensorID = +[PTParameterPairSerialization getUIntParameter:30 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_readSuccessAll &= v31;
    v7->_renderingVersion = +[PTParameterPairSerialization getUIntParameter:31 fromPairs:v9 numPairs:v10 didFindValue:&v31];
    v7->_readSuccessAll &= v31;
    if (v6 > 3
      && (v7->_sourceColorBitDepth = +[PTParameterPairSerialization getUIntParameter:32 fromPairs:v9 numPairs:v10 didFindValue:&v31], v7->_readSuccessAll &= v31, v6 > 5))
    {
      +[PTParameterPairSerialization getFloatParameter:33 fromPairs:v9 numPairs:v10 didFindValue:&v31];
      v7->_networkBias = v28;
      v7->_readSuccessAll &= v31;
      +[PTParameterPairSerialization getFloatParameter:34 fromPairs:v9 numPairs:v10 didFindValue:&v31];
      v7->_noiseScaleFactor = v29;
      v7->_readSuccessAll &= v31;
      v7->_hwModelID = +[PTParameterPairSerialization getUIntParameter:35 fromPairs:v9 numPairs:v10 didFindValue:&v31];
      v7->_readSuccessAll &= v31;
    }
    else
    {
      int sensorID_low = LOBYTE(v7->_sensorID);
      if (sensorID_low == 20)
      {
        v7->_networkBias = 0.0;
      }
      else
      {
        if (sensorID_low == 19) {
          int v26 = 1056964608;
        }
        else {
          int v26 = 1061997773;
        }
        LODWORD(v7->_networkBias) = v26;
      }
    }
    v27 = v7;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 296;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PTGlobalRenderingMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7];
  if ([v6 length] < (unint64_t)v8
    || [(PTGlobalRenderingMetadata *)self majorVersion] != 1)
  {
    goto LABEL_14;
  }
  id v9 = v6;
  unint64_t v10 = (_DWORD *)[v9 mutableBytes];
  *unint64_t v10 = bswap32([(PTGlobalRenderingMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7]);
  v10[1] = 1684956530;
  v10[2] = bswap32([(PTGlobalRenderingMetadata *)self majorVersion]);
  v10[3] = bswap32([(PTGlobalRenderingMetadata *)self minorVersion]);
  v30 = v10 + 4;
  *(float *)&double v11 = self->_defaultAperture;
  +[PTParameterPairSerialization appendFloatParameter:1 value:&v30 toOutput:v11];
  *(float *)&double v12 = self->_minAperture;
  +[PTParameterPairSerialization appendFloatParameter:2 value:&v30 toOutput:v12];
  *(float *)&double v13 = self->_maxAperture;
  +[PTParameterPairSerialization appendFloatParameter:3 value:&v30 toOutput:v13];
  *(float *)&double v14 = self->_highlightBoostFactor;
  +[PTParameterPairSerialization appendFloatParameter:4 value:&v30 toOutput:v14];
  *(float *)&double v15 = self->_highlightChromaFactor;
  +[PTParameterPairSerialization appendFloatParameter:5 value:&v30 toOutput:v15];
  *(float *)&double v16 = self->_focalLength35mm;
  +[PTParameterPairSerialization appendFloatParameter:6 value:&v30 toOutput:v16];
  +[PTParameterPairSerialization appendUIntParameter:7 value:self->_conversionGain toOutput:&v30];
  +[PTParameterPairSerialization appendUIntParameter:8 value:self->_readNoise1x toOutput:&v30];
  +[PTParameterPairSerialization appendUIntParameter:9 value:self->_readNoise8x toOutput:&v30];
  +[PTParameterPairSerialization appendUIntParameter:10 value:self->_rawSensorSize.width toOutput:&v30];
  +[PTParameterPairSerialization appendUIntParameter:11 value:self->_rawSensorSize.height toOutput:&v30];
  CGFloat x = self->_sensorCropRect.origin.x;
  *(float *)&CGFloat x = x;
  +[PTParameterPairSerialization appendFloatParameter:12 value:&v30 toOutput:x];
  CGFloat y = self->_sensorCropRect.origin.y;
  *(float *)&CGFloat y = y;
  +[PTParameterPairSerialization appendFloatParameter:13 value:&v30 toOutput:y];
  CGFloat width = self->_sensorCropRect.size.width;
  *(float *)&CGFloat width = width;
  +[PTParameterPairSerialization appendFloatParameter:14 value:&v30 toOutput:width];
  CGFloat height = self->_sensorCropRect.size.height;
  *(float *)&CGFloat height = height;
  +[PTParameterPairSerialization appendFloatParameter:15 value:&v30 toOutput:height];
  for (int i = 0; i != 12; ++i)
  {
    LODWORD(v21) = *((_DWORD *)&self[1].super.super.isa
                   + 4 * (i / 3u)
                   + (((_BYTE)i + i / 3u) & 3));
    +[PTParameterPairSerialization appendFloatParameter:(unsigned __int16)(i + 16) value:&v30 toOutput:v21];
  }
  +[PTParameterPairSerialization appendFloatParameter:28 value:&v30 toOutput:*(double *)self->_visCropFactor];
  LODWORD(v23) = *(_DWORD *)&self->_visCropFactor[4];
  +[PTParameterPairSerialization appendFloatParameter:29 value:&v30 toOutput:v23];
  +[PTParameterPairSerialization appendUIntParameter:30 value:self->_sensorID toOutput:&v30];
  +[PTParameterPairSerialization appendUIntParameter:31 value:self->_renderingVersion toOutput:&v30];
  if ([(PTGlobalRenderingMetadata *)self minorVersion] > 3) {
    +[PTParameterPairSerialization appendUIntParameter:32 value:self->_sourceColorBitDepth toOutput:&v30];
  }
  if ([(PTGlobalRenderingMetadata *)self minorVersion] >= 5)
  {
    *(float *)&double v24 = self->_networkBias;
    +[PTParameterPairSerialization appendFloatParameter:33 value:&v30 toOutput:v24];
  }
  if ([(PTGlobalRenderingMetadata *)self minorVersion] >= 6)
  {
    *(float *)&double v25 = self->_noiseScaleFactor;
    +[PTParameterPairSerialization appendFloatParameter:34 value:&v30 toOutput:v25];
    +[PTParameterPairSerialization appendUIntParameter:35 value:self->_hwModelID toOutput:&v30];
  }
  int v26 = v30;
  uint64_t v27 = (uint64_t)v26 - [v9 bytes];
  if (v27 == [(PTGlobalRenderingMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7])BOOL v28 = 1; {
  else
  }
LABEL_14:
    BOOL v28 = 0;

  return v28;
}

- (void)applyToRenderState:(id)a3
{
}

- (BOOL)nanAwareEqual:(float)a3 with:(float)a4
{
  return a3 == a4;
}

- (BOOL)matchesRenderState:(id)a3
{
  id v4 = a3;
  unsigned int sourceColorBitDepth = self->_sourceColorBitDepth;
  if (sourceColorBitDepth == [v4 sourceColorBitDepth]
    && (uint64_t renderingVersion = self->_renderingVersion, [v4 renderingVersion] == renderingVersion)
    && (float noiseScaleFactor = self->_noiseScaleFactor,
        [v4 noiseScaleFactor],
        LODWORD(v9) = v8,
        *(float *)&double v10 = noiseScaleFactor,
        [(PTGlobalRenderingMetadataVersion1 *)self nanAwareEqual:v10 with:v9]))
  {
    unsigned int hwModelID = self->_hwModelID;
    BOOL v12 = hwModelID == [v4 hwModelID];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)applyToRenderState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4
    && !+[PTRenderPipeline isRenderVersionSupported:self->_renderingVersion])
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.Portrait.RenderingMetadata" code:2 userInfo:0];
    BOOL v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v7 = 1;
  }
  uint64_t v8 = [(PTGlobalRenderingMetadataVersion1 *)self matchesRenderState:v6] ^ 1;
  [v6 setSourceColorBitDepth:self->_sourceColorBitDepth];
  [v6 setRenderingVersion:self->_renderingVersion];
  *(float *)&double v9 = self->_noiseScaleFactor;
  [v6 setNoiseScaleFactor:v9];
  [v6 setHwModelID:self->_hwModelID];
  [v6 prepareForRendering:v8];
  if (!self->_readSuccessAll)
  {
    double v10 = _PTLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PTTimedRenderingMetadataVersion1 applyToRenderRequest:](v10);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (void)applyToRenderRequest:(id)a3
{
  float focalLength35mm = self->_focalLength35mm;
  id v5 = a3;
  *(float *)&double v6 = focalLength35mm;
  [v5 setFocalLenIn35mmFilm:v6];
  [v5 setConversionGain:self->_conversionGain];
  objc_msgSend(v5, "setReadNoise_1x:", self->_readNoise1x);
  objc_msgSend(v5, "setReadNoise_8x:", self->_readNoise8x);
  objc_msgSend(v5, "setTotalSensorCropRectSize:", self->_sensorCropRect.size.width, self->_sensorCropRect.size.height);
  [v5 setVisCropFactor:*(double *)self->_visCropFactor];
  *(float *)&double v7 = self->_networkBias;
  [v5 setNetworkBias:v7];
  [v5 setSensorID:self->_sensorID];

  if (!self->_readSuccessAll)
  {
    uint64_t v8 = _PTLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PTTimedRenderingMetadataVersion1 applyToRenderRequest:](v8);
    }
  }
}

- (unsigned)renderingVersion
{
  return self->_renderingVersion;
}

- (void)setRenderingVersion:(unsigned int)a3
{
  self->_uint64_t renderingVersion = a3;
}

- (float)defaultAperture
{
  return self->_defaultAperture;
}

- (void)setDefaultAperture:(float)a3
{
  self->_defaultAperture = a3;
}

- (float)minAperture
{
  return self->_minAperture;
}

- (void)setMinAperture:(float)a3
{
  self->_minAperture = a3;
}

- (float)maxAperture
{
  return self->_maxAperture;
}

- (void)setMaxAperture:(float)a3
{
  self->_maxAperture = a3;
}

- (float)highlightBoostFactor
{
  return self->_highlightBoostFactor;
}

- (void)setHighlightBoostFactor:(float)a3
{
  self->_highlightBoostFactor = a3;
}

- (float)highlightChromaFactor
{
  return self->_highlightChromaFactor;
}

- (void)setHighlightChromaFactor:(float)a3
{
  self->_highlightChromaFactor = a3;
}

- (CGRect)sensorCropRect
{
  double x = self->_sensorCropRect.origin.x;
  double y = self->_sensorCropRect.origin.y;
  double width = self->_sensorCropRect.size.width;
  double height = self->_sensorCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSensorCropRect:(CGRect)a3
{
  self->_sensorCropRect = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)rawSensorSize
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_rawSensorSize;
}

- (void)setRawSensorSize:(id)a3
{
  self->_rawSensorSize = ($470D365275581EF16070F5A11344F73E)a3;
}

- (float)focalLength35mm
{
  return self->_focalLength35mm;
}

- (void)setFocalLength35mm:(float)a3
{
  self->_float focalLength35mm = a3;
}

- (__n128)extrinsicsMatrix
{
  return a1[9];
}

- (__n128)setExtrinsicsMatrix:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (unsigned)conversionGain
{
  return self->_conversionGain;
}

- (void)setConversionGain:(unsigned int)a3
{
  self->_conversionGain = a3;
}

- (unsigned)readNoise1x
{
  return self->_readNoise1x;
}

- (void)setReadNoise1x:(unsigned int)a3
{
  self->_readNoise1double x = a3;
}

- (unsigned)readNoise8x
{
  return self->_readNoise8x;
}

- (void)setReadNoise8x:(unsigned int)a3
{
  self->_readNoise8double x = a3;
}

- (double)visCropFactor
{
  return *(double *)(a1 + 96);
}

- (void)setVisCropFactor:(PTGlobalRenderingMetadataVersion1 *)self
{
  *(void *)self->_visCropFactor = v2;
}

- (unsigned)sensorID
{
  return self->_sensorID;
}

- (void)setSensorID:(unsigned int)a3
{
  self->_sensorID = a3;
}

- (unsigned)sourceColorBitDepth
{
  return self->_sourceColorBitDepth;
}

- (void)setSourceColorBitDepth:(unsigned int)a3
{
  self->_unsigned int sourceColorBitDepth = a3;
}

- (float)networkBias
{
  return self->_networkBias;
}

- (void)setNetworkBias:(float)a3
{
  self->_networkBias = a3;
}

- (float)noiseScaleFactor
{
  return self->_noiseScaleFactor;
}

- (void)setNoiseScaleFactor:(float)a3
{
  self->_float noiseScaleFactor = a3;
}

- (unsigned)hwModelID
{
  return self->_hwModelID;
}

- (void)setHwModelID:(unsigned int)a3
{
  self->_unsigned int hwModelID = a3;
}

@end