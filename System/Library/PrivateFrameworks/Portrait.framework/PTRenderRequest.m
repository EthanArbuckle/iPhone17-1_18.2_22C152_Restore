@interface PTRenderRequest
- ($3CC19D079FD0B010EE84973AA846B91B)scissorRect;
- (CGSize)totalSensorCropRectSize;
- (MTLTexture)colorCube;
- (MTLTexture)integratedStyleCoefficientsTextureArray;
- (MTLTexture)sourceDisparity;
- (NSDictionary)options;
- (PTRenderRequest)init;
- (PTRenderState)renderState;
- (PTTexture)destinationColor;
- (PTTexture)sourceColor;
- (double)visCropFactor;
- (double)visCropFactorPreview;
- (float)alphaLowLight;
- (float)aperture;
- (float)disparityMax;
- (float)disparityMin;
- (float)fNumber;
- (float)focalLenIn35mmFilm;
- (float)focusDisparity;
- (float)focusDistance;
- (float)highlightBoostFactor;
- (float)highlightChromaFactor;
- (float)networkBias;
- (id)copyWithZone:(_NSZone *)a3;
- (int)AGC;
- (int)conversionGain;
- (int)readNoise_1x;
- (int)readNoise_8x;
- (int)sensorID;
- (unsigned)frameId;
- (void)setAGC:(int)a3;
- (void)setAlphaLowLight:(float)a3;
- (void)setAperture:(float)a3;
- (void)setColorCube:(id)a3;
- (void)setConversionGain:(int)a3;
- (void)setDestinationColor:(id)a3;
- (void)setDisparityMax:(float)a3;
- (void)setDisparityMin:(float)a3;
- (void)setFNumber:(float)a3;
- (void)setFocalLenIn35mmFilm:(float)a3;
- (void)setFocusDisparity:(float)a3;
- (void)setFocusDistance:(float)a3;
- (void)setFrameId:(unsigned int)a3;
- (void)setHighlightBoostFactor:(float)a3;
- (void)setHighlightChromaFactor:(float)a3;
- (void)setIntegratedStyleCoefficientsTextureArray:(id)a3;
- (void)setNetworkBias:(float)a3;
- (void)setOptions:(id)a3;
- (void)setReadNoise_1x:(int)a3;
- (void)setReadNoise_8x:(int)a3;
- (void)setRenderState:(id)a3;
- (void)setScissorRect:(id *)a3;
- (void)setSensorID:(int)a3;
- (void)setSourceColor:(id)a3;
- (void)setSourceDisparity:(id)a3;
- (void)setTotalSensorCropRectSize:(CGSize)a3;
- (void)setVisCropFactor:(PTRenderRequest *)self;
- (void)setVisCropFactorPreview:(PTRenderRequest *)self;
@end

@implementation PTRenderRequest

- (void)setRenderState:(id)a3
{
}

- (void)setFrameId:(unsigned int)a3
{
  self->_frameId = a3;
}

- (void)setFocusDisparity:(float)a3
{
  self->_focusDisparity = a3;
}

- (void)setFocalLenIn35mmFilm:(float)a3
{
  self->_focalLenIn35mmFilm = a3;
}

- (PTRenderRequest)init
{
  v12.receiver = self;
  v12.super_class = (Class)PTRenderRequest;
  v2 = [(PTRenderRequest *)&v12 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_focusDisparity = 0x408000003F000000;
    v2->_alphaLowLight = 1.0;
    +[PTRaytracingUtils focalLength];
    v3->_focalLenIn35mmFilm = v4 * 1000.0;
    __asm { FMOV            V0.2S, #1.0 }
    *(void *)v3->_visCropFactor = _D0;
    *(void *)v3->_visCropFactorPreview = _D0;
    v3->_networkBias = 0.0;
    v3->_totalSensorCropRectSize = (CGSize)xmmword_1D081FD20;
    *(_OWORD *)&v3->_sensorID = xmmword_1D081FD30;
    *(void *)&v3->_readNoise_8x = 118358;
    integratedStyleCoefficientsTextureArray = v3->_integratedStyleCoefficientsTextureArray;
    v3->_integratedStyleCoefficientsTextureArray = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  float v4 = objc_opt_new();
  [v4 setRenderState:self->_renderState];
  [v4 setSourceColor:self->_sourceColor];
  [v4 setSourceDisparity:self->_sourceDisparity];
  [v4 setDestinationColor:self->_destinationColor];
  *(float *)&double v5 = self->_focusDisparity;
  [v4 setFocusDisparity:v5];
  *(float *)&double v6 = self->_fNumber;
  [v4 setFNumber:v6];
  *(float *)&double v7 = self->_focalLenIn35mmFilm;
  [v4 setFocalLenIn35mmFilm:v7];
  [v4 setSensorID:self->_sensorID];
  objc_msgSend(v4, "setTotalSensorCropRectSize:", self->_totalSensorCropRectSize.width, self->_totalSensorCropRectSize.height);
  [v4 setVisCropFactor:*(double *)self->_visCropFactor];
  [v4 setAGC:self->_AGC];
  [v4 setConversionGain:self->_conversionGain];
  objc_msgSend(v4, "setReadNoise_1x:", self->_readNoise_1x);
  objc_msgSend(v4, "setReadNoise_8x:", self->_readNoise_8x);
  [v4 setFrameId:self->_frameId];
  long long v8 = *(_OWORD *)&self->_scissorRect.width;
  v12[0] = *(_OWORD *)&self->_scissorRect.x;
  v12[1] = v8;
  [v4 setScissorRect:v12];
  *(float *)&double v9 = self->_alphaLowLight;
  [v4 setAlphaLowLight:v9];
  *(float *)&double v10 = self->_networkBias;
  [v4 setNetworkBias:v10];
  [v4 setIntegratedStyleCoefficientsTextureArray:self->_integratedStyleCoefficientsTextureArray];
  return v4;
}

- (float)aperture
{
  return self->_fNumber;
}

- (void)setAperture:(float)a3
{
  self->_fNumber = a3;
}

- (float)focusDistance
{
  return self->_focusDisparity;
}

- (void)setFocusDistance:(float)a3
{
  self->_focusDisparity = a3;
}

- (PTRenderState)renderState
{
  return self->_renderState;
}

- (PTTexture)sourceColor
{
  return self->_sourceColor;
}

- (void)setSourceColor:(id)a3
{
}

- (MTLTexture)sourceDisparity
{
  return self->_sourceDisparity;
}

- (void)setSourceDisparity:(id)a3
{
}

- (PTTexture)destinationColor
{
  return self->_destinationColor;
}

- (void)setDestinationColor:(id)a3
{
}

- (MTLTexture)integratedStyleCoefficientsTextureArray
{
  return self->_integratedStyleCoefficientsTextureArray;
}

- (void)setIntegratedStyleCoefficientsTextureArray:(id)a3
{
}

- (MTLTexture)colorCube
{
  return self->_colorCube;
}

- (void)setColorCube:(id)a3
{
}

- (float)focusDisparity
{
  return self->_focusDisparity;
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

- (int)sensorID
{
  return self->_sensorID;
}

- (void)setSensorID:(int)a3
{
  self->_sensorID = a3;
}

- (double)visCropFactor
{
  return *(double *)(a1 + 120);
}

- (void)setVisCropFactor:(PTRenderRequest *)self
{
  *(void *)self->_visCropFactor = v2;
}

- (double)visCropFactorPreview
{
  return *(double *)(a1 + 128);
}

- (void)setVisCropFactorPreview:(PTRenderRequest *)self
{
  *(void *)self->_visCropFactorPreview = v2;
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

- (int)AGC
{
  return self->_AGC;
}

- (void)setAGC:(int)a3
{
  self->_AGC = a3;
}

- (int)conversionGain
{
  return self->_conversionGain;
}

- (void)setConversionGain:(int)a3
{
  self->_conversionGain = a3;
}

- (int)readNoise_1x
{
  return self->_readNoise_1x;
}

- (void)setReadNoise_1x:(int)a3
{
  self->_readNoise_1x = a3;
}

- (int)readNoise_8x
{
  return self->_readNoise_8x;
}

- (void)setReadNoise_8x:(int)a3
{
  self->_readNoise_8x = a3;
}

- (unsigned)frameId
{
  return self->_frameId;
}

- (float)networkBias
{
  return self->_networkBias;
}

- (void)setNetworkBias:(float)a3
{
  self->_networkBias = a3;
}

- (float)alphaLowLight
{
  return self->_alphaLowLight;
}

- (void)setAlphaLowLight:(float)a3
{
  self->_alphaLowLight = a3;
}

- (float)disparityMin
{
  return self->_disparityMin;
}

- (void)setDisparityMin:(float)a3
{
  self->_disparityMin = a3;
}

- (float)disparityMax
{
  return self->_disparityMax;
}

- (void)setDisparityMax:(float)a3
{
  self->_disparityMax = a3;
}

- (float)highlightChromaFactor
{
  return self->_highlightChromaFactor;
}

- (void)setHighlightChromaFactor:(float)a3
{
  self->_highlightChromaFactor = a3;
}

- (float)highlightBoostFactor
{
  return self->_highlightBoostFactor;
}

- (void)setHighlightBoostFactor:(float)a3
{
  self->_highlightBoostFactor = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- ($3CC19D079FD0B010EE84973AA846B91B)scissorRect
{
  long long v3 = *(_OWORD *)&self[5].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[5].var0;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)setScissorRect:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_scissorRect.x = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_scissorRect.double width = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_colorCube, 0);
  objc_storeStrong((id *)&self->_integratedStyleCoefficientsTextureArray, 0);
  objc_storeStrong((id *)&self->_destinationColor, 0);
  objc_storeStrong((id *)&self->_sourceDisparity, 0);
  objc_storeStrong((id *)&self->_sourceColor, 0);

  objc_storeStrong((id *)&self->_renderState, 0);
}

@end