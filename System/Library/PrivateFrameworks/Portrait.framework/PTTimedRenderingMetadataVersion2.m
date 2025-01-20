@interface PTTimedRenderingMetadataVersion2
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (CGSize)totalSensorCropRectSize;
- (PTTimedRenderingMetadataVersion2)initWithData:(id)a3 minorVersion:(unsigned int)a4;
- (PTTimedRenderingMetadataVersion2)initWithMinorVersion:(unsigned int)a3;
- (double)visCropFactor;
- (float)alphaLowLight;
- (float)fNumber;
- (float)focalLenIn35mmFilm;
- (float)focusDisparity;
- (unsigned)AGC;
- (unsigned)conversionGain;
- (unsigned)frameId;
- (unsigned)readNoise_1x;
- (unsigned)readNoise_8x;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
- (void)applyToRenderRequest:(id)a3;
- (void)setAGC:(unsigned int)a3;
- (void)setAlphaLowLight:(float)a3;
- (void)setConversionGain:(unsigned int)a3;
- (void)setFNumber:(float)a3;
- (void)setFocalLenIn35mmFilm:(float)a3;
- (void)setFocusDisparity:(float)a3;
- (void)setFrameId:(unsigned int)a3;
- (void)setReadNoise_1x:(unsigned int)a3;
- (void)setReadNoise_8x:(unsigned int)a3;
- (void)setTotalSensorCropRectSize:(CGSize)a3;
- (void)setVisCropFactor:(PTTimedRenderingMetadataVersion2 *)self;
@end

@implementation PTTimedRenderingMetadataVersion2

- (PTTimedRenderingMetadataVersion2)initWithMinorVersion:(unsigned int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PTTimedRenderingMetadataVersion2;
  v3 = [(PTTimedRenderingMetadata *)&v6 initWithMajorVersion:2 minorVersion:*(void *)&a3];
  if (v3)
  {
    v3->_frameId = arc4random();
    v3->_alphaLowLight = 1.0;
    v4 = v3;
  }

  return v3;
}

- (PTTimedRenderingMetadataVersion2)initWithData:(id)a3 minorVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [(PTTimedRenderingMetadataVersion2 *)self initWithMinorVersion:v4];
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
    char v24 = 0;
    v7->_readSuccessAll = 1;
    +[PTParameterPairSerialization getFloatParameter:1 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    v7->_focusDisparity = v14;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:2 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    v7->_fNumber = v15;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:3 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    v7->_focalLenIn35mmFilm = v16;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:4 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    v7->_totalSensorCropRectSize.width = v17;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:5 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    v7->_totalSensorCropRectSize.height = v18;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:6 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    *(_DWORD *)v7->_visCropFactor = v19;
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:7 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    *(_DWORD *)&v7->_visCropFactor[4] = v20;
    v7->_readSuccessAll &= v24;
    v7->_AGC = +[PTParameterPairSerialization getUIntParameter:8 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    v7->_readSuccessAll &= v24;
    v7->_conversionGain = +[PTParameterPairSerialization getUIntParameter:9 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    v7->_readSuccessAll &= v24;
    v7->_readNoise_1x = +[PTParameterPairSerialization getUIntParameter:10 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    v7->_readSuccessAll &= v24;
    v7->_readNoise_8x = +[PTParameterPairSerialization getUIntParameter:11 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    v7->_readSuccessAll &= v24;
    v7->_frameId = +[PTParameterPairSerialization getUIntParameter:12 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    v7->_readSuccessAll &= v24;
    +[PTParameterPairSerialization getFloatParameter:13 fromPairs:v12 numPairs:v13 didFindValue:&v24];
    v7->_alphaLowLight = v21;
    v7->_readSuccessAll &= v24;
    v22 = v7;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 112;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PTTimedRenderingMetadataVersion2 *)self sizeOfSerializedObjectWithOptions:v7];
  if ([v6 length] < (unint64_t)v8) {
    goto LABEL_5;
  }
  if ([(PTTimedRenderingMetadata *)self majorVersion] != 2) {
    goto LABEL_5;
  }
  id v9 = v6;
  uint64_t v10 = (_DWORD *)[v9 mutableBytes];
  *uint64_t v10 = bswap32([(PTTimedRenderingMetadataVersion2 *)self sizeOfSerializedObjectWithOptions:v7]);
  v10[1] = 1684956530;
  v22 = v10 + 2;
  *(float *)&double v11 = self->_focusDisparity;
  BOOL v12 = 1;
  +[PTParameterPairSerialization appendFloatParameter:1 value:&v22 toOutput:v11];
  *(float *)&double v13 = self->_fNumber;
  +[PTParameterPairSerialization appendFloatParameter:2 value:&v22 toOutput:v13];
  *(float *)&double v14 = self->_focalLenIn35mmFilm;
  +[PTParameterPairSerialization appendFloatParameter:3 value:&v22 toOutput:v14];
  CGFloat width = self->_totalSensorCropRectSize.width;
  *(float *)&CGFloat width = width;
  +[PTParameterPairSerialization appendFloatParameter:4 value:&v22 toOutput:width];
  CGFloat height = self->_totalSensorCropRectSize.height;
  *(float *)&CGFloat height = height;
  +[PTParameterPairSerialization appendFloatParameter:5 value:&v22 toOutput:height];
  +[PTParameterPairSerialization appendFloatParameter:6 value:&v22 toOutput:*(double *)self->_visCropFactor];
  LODWORD(v17) = *(_DWORD *)&self->_visCropFactor[4];
  +[PTParameterPairSerialization appendFloatParameter:7 value:&v22 toOutput:v17];
  +[PTParameterPairSerialization appendUIntParameter:8 value:self->_AGC toOutput:&v22];
  +[PTParameterPairSerialization appendUIntParameter:9 value:self->_conversionGain toOutput:&v22];
  +[PTParameterPairSerialization appendUIntParameter:10 value:self->_readNoise_1x toOutput:&v22];
  +[PTParameterPairSerialization appendUIntParameter:11 value:self->_readNoise_8x toOutput:&v22];
  +[PTParameterPairSerialization appendUIntParameter:12 value:self->_frameId toOutput:&v22];
  *(float *)&double v18 = self->_alphaLowLight;
  +[PTParameterPairSerialization appendFloatParameter:13 value:&v22 toOutput:v18];
  int v19 = v22;
  uint64_t v20 = (uint64_t)v19 - [v9 bytes];
  if (v20 != [(PTTimedRenderingMetadataVersion2 *)self sizeOfSerializedObjectWithOptions:v7])LABEL_5:BOOL v12 = 0; {

  }
  return v12;
}

- (void)applyToRenderRequest:(id)a3
{
  float focusDisparity = self->_focusDisparity;
  id v5 = a3;
  *(float *)&double v6 = focusDisparity;
  [v5 setFocusDisparity:v6];
  *(float *)&double v7 = self->_fNumber;
  [v5 setFNumber:v7];
  *(float *)&double v8 = self->_focalLenIn35mmFilm;
  [v5 setFocalLenIn35mmFilm:v8];
  objc_msgSend(v5, "setTotalSensorCropRectSize:", self->_totalSensorCropRectSize.width, self->_totalSensorCropRectSize.height);
  [v5 setVisCropFactor:*(double *)self->_visCropFactor];
  [v5 setAGC:self->_AGC];
  [v5 setConversionGain:self->_conversionGain];
  objc_msgSend(v5, "setReadNoise_1x:", self->_readNoise_1x);
  objc_msgSend(v5, "setReadNoise_8x:", self->_readNoise_8x);
  [v5 setFrameId:self->_frameId];
  *(float *)&double v9 = self->_alphaLowLight;
  [v5 setAlphaLowLight:v9];

  if (!self->_readSuccessAll)
  {
    uint64_t v10 = _PTLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PTTimedRenderingMetadataVersion1 applyToRenderRequest:](v10);
    }
  }
}

- (float)focusDisparity
{
  return self->_focusDisparity;
}

- (void)setFocusDisparity:(float)a3
{
  self->_float focusDisparity = a3;
}

- (float)fNumber
{
  return self->_fNumber;
}

- (void)setFNumber:(float)a3
{
  self->_fNumber = a3;
}

- (float)focalLenIn35mmFilm
{
  return self->_focalLenIn35mmFilm;
}

- (void)setFocalLenIn35mmFilm:(float)a3
{
  self->_focalLenIn35mmFilm = a3;
}

- (CGSize)totalSensorCropRectSize
{
  double width = self->_totalSensorCropRectSize.width;
  double height = self->_totalSensorCropRectSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTotalSensorCropRectSize:(CGSize)a3
{
  self->_totalSensorCropRectSize = a3;
}

- (double)visCropFactor
{
  return *(double *)(a1 + 56);
}

- (void)setVisCropFactor:(PTTimedRenderingMetadataVersion2 *)self
{
  *(void *)self->_visCropFactor = v2;
}

- (unsigned)AGC
{
  return self->_AGC;
}

- (void)setAGC:(unsigned int)a3
{
  self->_AGC = a3;
}

- (unsigned)conversionGain
{
  return self->_conversionGain;
}

- (void)setConversionGain:(unsigned int)a3
{
  self->_conversionGain = a3;
}

- (unsigned)readNoise_1x
{
  return self->_readNoise_1x;
}

- (void)setReadNoise_1x:(unsigned int)a3
{
  self->_readNoise_1x = a3;
}

- (unsigned)readNoise_8x
{
  return self->_readNoise_8x;
}

- (void)setReadNoise_8x:(unsigned int)a3
{
  self->_readNoise_8x = a3;
}

- (unsigned)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unsigned int)a3
{
  self->_frameId = a3;
}

- (float)alphaLowLight
{
  return self->_alphaLowLight;
}

- (void)setAlphaLowLight:(float)a3
{
  self->_alphaLowLight = a3;
}

@end