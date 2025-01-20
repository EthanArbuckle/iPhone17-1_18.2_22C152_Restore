@interface PTAssetCinematicGlobals
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration;
- (BOOL)is420YUV10Bit;
- (NSString)YCbCrMatrix;
- (NSString)colorPrimaries;
- (NSString)transferFunction;
- (PTAssetCinematicGlobals)initWithAssetReader:(id)a3;
- (PTGlobalCinematographyMetadata)globalCinematographyMetadata;
- (PTGlobalRenderingMetadata)globalRenderingMetadata;
- (PTGlobalStabilizationMetadata)globalStabilizationMetadata;
- (PTGlobalVideoHeaderMetadata)globalVideoHeaderMetadata;
- (opaqueCMFormatDescription)formatDescription;
- (unint64_t)estimatedDataRate;
- (void)_assignGlobalsFromAssetReader:(id)a3;
- (void)dealloc;
- (void)setGlobalCinematographyMetadata:(id)a3;
- (void)setGlobalRenderingMetadata:(id)a3;
- (void)setGlobalStabilizationMetadata:(id)a3;
- (void)setGlobalVideoHeaderMetadata:(id)a3;
@end

@implementation PTAssetCinematicGlobals

- (PTAssetCinematicGlobals)initWithAssetReader:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PTAssetCinematicGlobals;
  v5 = [(PTAssetCinematicGlobals *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PTAssetCinematicGlobals *)v5 _assignGlobalsFromAssetReader:v4];
  }

  return v6;
}

- (void)_assignGlobalsFromAssetReader:(id)a3
{
  id v4 = a3;
  v5 = [v4 globalCinematographyMetadata];
  globalCinematographyMetadata = self->_globalCinematographyMetadata;
  self->_globalCinematographyMetadata = v5;

  v7 = [v4 globalRenderingMetadata];
  globalRenderingMetadata = self->_globalRenderingMetadata;
  self->_globalRenderingMetadata = v7;

  v9 = [v4 globalStabilizationMetadata];
  globalStabilizationMetadata = self->_globalStabilizationMetadata;
  self->_globalStabilizationMetadata = v9;

  v11 = [v4 globalVideoHeaderMetadata];
  globalVideoHeaderMetadata = self->_globalVideoHeaderMetadata;
  self->_globalVideoHeaderMetadata = v11;

  v13 = [v4 colorPrimaries];
  colorPrimaries = self->_colorPrimaries;
  self->_colorPrimaries = v13;

  v15 = [v4 transferFunction];
  transferFunction = self->_transferFunction;
  self->_transferFunction = v15;

  v17 = [v4 YCbCrMatrix];
  YCbCrMatrix = self->_YCbCrMatrix;
  self->_YCbCrMatrix = v17;

  self->_estimatedDataRate = [v4 estimatedDataRate];
  v19 = (opaqueCMFormatDescription *)[v4 formatDescription];
  self->_formatDescription = v19;
  if (v19) {
    CFRetain(v19);
  }
  if (v4)
  {
    [v4 frameDuration];
  }
  else
  {
    long long v20 = 0uLL;
    int64_t v21 = 0;
  }
  *(_OWORD *)&self->_frameDuration.value = v20;
  self->_frameDuration.epoch = v21;
}

- (void)dealloc
{
  formatDescription = self->_formatDescription;
  if (formatDescription) {
    CFRelease(formatDescription);
  }
  v4.receiver = self;
  v4.super_class = (Class)PTAssetCinematicGlobals;
  [(PTAssetCinematicGlobals *)&v4 dealloc];
}

- (PTGlobalCinematographyMetadata)globalCinematographyMetadata
{
  return self->_globalCinematographyMetadata;
}

- (void)setGlobalCinematographyMetadata:(id)a3
{
}

- (PTGlobalRenderingMetadata)globalRenderingMetadata
{
  return self->_globalRenderingMetadata;
}

- (void)setGlobalRenderingMetadata:(id)a3
{
}

- (PTGlobalStabilizationMetadata)globalStabilizationMetadata
{
  return self->_globalStabilizationMetadata;
}

- (void)setGlobalStabilizationMetadata:(id)a3
{
}

- (PTGlobalVideoHeaderMetadata)globalVideoHeaderMetadata
{
  return self->_globalVideoHeaderMetadata;
}

- (void)setGlobalVideoHeaderMetadata:(id)a3
{
}

- (NSString)colorPrimaries
{
  return self->_colorPrimaries;
}

- (NSString)transferFunction
{
  return self->_transferFunction;
}

- (NSString)YCbCrMatrix
{
  return self->_YCbCrMatrix;
}

- (BOOL)is420YUV10Bit
{
  return self->_is420YUV10Bit;
}

- (unint64_t)estimatedDataRate
{
  return self->_estimatedDataRate;
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_YCbCrMatrix, 0);
  objc_storeStrong((id *)&self->_transferFunction, 0);
  objc_storeStrong((id *)&self->_colorPrimaries, 0);
  objc_storeStrong((id *)&self->_globalVideoHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_globalStabilizationMetadata, 0);
  objc_storeStrong((id *)&self->_globalRenderingMetadata, 0);

  objc_storeStrong((id *)&self->_globalCinematographyMetadata, 0);
}

@end