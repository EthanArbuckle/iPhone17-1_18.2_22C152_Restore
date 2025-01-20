@interface _NURAWImageProperties
- (BOOL)hasLensCorrection;
- (BOOL)isAppleProRaw;
- (BOOL)isDeepFusion;
- (BOOL)isSensorRawCapture;
- (BOOL)isUnifiedBracketingHDRCapture;
- (CIFilter)rawConvert;
- (NSArray)availableDecoderVersions;
- (NSString)decoderVersion;
- (NSString)description;
- (NURAWNoiseReductionProperties)noiseReductionProperties;
- (_NURAWCameraSpaceProperties)rawCameraSpaceProperties;
- (_NURAWToneCurveProperties)rawToneCurveProperties;
- (double)temperature;
- (double)tint;
- (id)inputNeutralXYFromRGB:(const double *)a3;
- (void)setAvailableDecoderVersions:(id)a3;
- (void)setDecoderVersion:(id)a3;
- (void)setHasLensCorrection:(BOOL)a3;
- (void)setIsAppleProRaw:(BOOL)a3;
- (void)setIsDeepFusion:(BOOL)a3;
- (void)setIsSensorRawCapture:(BOOL)a3;
- (void)setIsUnifiedBracketingHDRCapture:(BOOL)a3;
- (void)setNoiseReductionProperties:(id)a3;
- (void)setRawCameraSpaceProperties:(id)a3;
- (void)setRawConvert:(id)a3;
- (void)setRawToneCurveProperties:(id)a3;
- (void)setTemperature:(double)a3;
- (void)setTint:(double)a3;
@end

@implementation _NURAWImageProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawToneCurveProperties, 0);
  objc_storeStrong((id *)&self->_rawCameraSpaceProperties, 0);
  objc_storeStrong((id *)&self->_noiseReductionProperties, 0);
  objc_storeStrong((id *)&self->_rawConvert, 0);
  objc_storeStrong((id *)&self->_availableDecoderVersions, 0);

  objc_storeStrong((id *)&self->_decoderVersion, 0);
}

- (void)setHasLensCorrection:(BOOL)a3
{
  self->_hasLensCorrection = a3;
}

- (BOOL)hasLensCorrection
{
  return self->_hasLensCorrection;
}

- (void)setIsDeepFusion:(BOOL)a3
{
  self->_isDeepFusion = a3;
}

- (BOOL)isDeepFusion
{
  return self->_isDeepFusion;
}

- (void)setIsUnifiedBracketingHDRCapture:(BOOL)a3
{
  self->_isUnifiedBracketingHDRCapture = a3;
}

- (BOOL)isUnifiedBracketingHDRCapture
{
  return self->_isUnifiedBracketingHDRCapture;
}

- (void)setIsSensorRawCapture:(BOOL)a3
{
  self->_isSensorRawCapture = a3;
}

- (BOOL)isSensorRawCapture
{
  return self->_isSensorRawCapture;
}

- (void)setIsAppleProRaw:(BOOL)a3
{
  self->_isAppleProRaw = a3;
}

- (BOOL)isAppleProRaw
{
  return self->_isAppleProRaw;
}

- (void)setRawToneCurveProperties:(id)a3
{
}

- (_NURAWToneCurveProperties)rawToneCurveProperties
{
  return (_NURAWToneCurveProperties *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRawCameraSpaceProperties:(id)a3
{
}

- (_NURAWCameraSpaceProperties)rawCameraSpaceProperties
{
  return (_NURAWCameraSpaceProperties *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNoiseReductionProperties:(id)a3
{
}

- (NURAWNoiseReductionProperties)noiseReductionProperties
{
  return (NURAWNoiseReductionProperties *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRawConvert:(id)a3
{
}

- (CIFilter)rawConvert
{
  return (CIFilter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTint:(double)a3
{
  self->_tint = a3;
}

- (double)tint
{
  return self->_tint;
}

- (void)setTemperature:(double)a3
{
  self->_temperature = a3;
}

- (double)temperature
{
  return self->_temperature;
}

- (void)setAvailableDecoderVersions:(id)a3
{
}

- (NSArray)availableDecoderVersions
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDecoderVersion:(id)a3
{
}

- (NSString)decoderVersion
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_NURAWImageProperties *)self decoderVersion];
  [(_NURAWImageProperties *)self temperature];
  uint64_t v7 = v6;
  [(_NURAWImageProperties *)self tint];
  uint64_t v9 = v8;
  v10 = [(_NURAWImageProperties *)self noiseReductionProperties];
  v11 = [v3 stringWithFormat:@"<%@:%p> kCIInputDecoderVersionKey=%@ temp=%f tint=%f noiseReduction=%@", v4, self, v5, v7, v9, v10];

  return (NSString *)v11;
}

- (id)inputNeutralXYFromRGB:(const double *)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(_NURAWImageProperties *)self rawConvert];
  v5 = (void *)[v4 copy];

  uint64_t v6 = [NSNumber numberWithDouble:*a3];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithDouble:", a3[1], v6);
  v12[1] = v7;
  uint64_t v8 = [NSNumber numberWithDouble:a3[2]];
  v12[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  [v5 setValue:v9 forKey:@"inputNeutral"];

  v10 = [v5 valueForKey:@"inputNeutralXY"];

  return v10;
}

@end