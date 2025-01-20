@interface CRFormAnalyzerConfiguration
- (BOOL)gatingWithOCRResults;
- (BOOL)resizeInputImage;
- (BOOL)tileInputImage;
- (BOOL)useContourBasedDetection;
- (BOOL)useModelBasedDetection;
- (BOOL)useTextBasedDetection;
- (CRFormAnalyzerConfiguration)init;
- (MTLDevice)metalDevice;
- (NSURL)customModelURL;
- (unint64_t)computeDeviceType;
- (void)setComputeDeviceType:(unint64_t)a3;
- (void)setCustomModelURL:(id)a3;
- (void)setGatingWithOCRResults:(BOOL)a3;
- (void)setMetalDevice:(id)a3;
- (void)setResizeInputImage:(BOOL)a3;
- (void)setTileInputImage:(BOOL)a3;
- (void)setUseContourBasedDetection:(BOOL)a3;
- (void)setUseModelBasedDetection:(BOOL)a3;
- (void)setUseTextBasedDetection:(BOOL)a3;
@end

@implementation CRFormAnalyzerConfiguration

- (CRFormAnalyzerConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRFormAnalyzerConfiguration;
  v2 = [(CRFormAnalyzerConfiguration *)&v7 init];
  v3 = v2;
  if (v2)
  {
    customModelURL = v2->_customModelURL;
    v2->_customModelURL = 0;

    *(_DWORD *)&v3->_gatingWithOCRResults = 16777473;
    *(_WORD *)&v3->_useModelBasedDetection = 257;
    metalDevice = v3->_metalDevice;
    v3->_metalDevice = 0;
    v3->_computeDeviceType = 0;
  }
  return v3;
}

- (BOOL)gatingWithOCRResults
{
  return self->_gatingWithOCRResults;
}

- (void)setGatingWithOCRResults:(BOOL)a3
{
  self->_gatingWithOCRResults = a3;
}

- (BOOL)resizeInputImage
{
  return self->_resizeInputImage;
}

- (void)setResizeInputImage:(BOOL)a3
{
  self->_resizeInputImage = a3;
}

- (BOOL)tileInputImage
{
  return self->_tileInputImage;
}

- (void)setTileInputImage:(BOOL)a3
{
  self->_tileInputImage = a3;
}

- (BOOL)useContourBasedDetection
{
  return self->_useContourBasedDetection;
}

- (void)setUseContourBasedDetection:(BOOL)a3
{
  self->_useContourBasedDetection = a3;
}

- (BOOL)useModelBasedDetection
{
  return self->_useModelBasedDetection;
}

- (void)setUseModelBasedDetection:(BOOL)a3
{
  self->_useModelBasedDetection = a3;
}

- (BOOL)useTextBasedDetection
{
  return self->_useTextBasedDetection;
}

- (void)setUseTextBasedDetection:(BOOL)a3
{
  self->_useTextBasedDetection = a3;
}

- (NSURL)customModelURL
{
  return self->_customModelURL;
}

- (void)setCustomModelURL:(id)a3
{
}

- (MTLDevice)metalDevice
{
  return self->_metalDevice;
}

- (void)setMetalDevice:(id)a3
{
}

- (unint64_t)computeDeviceType
{
  return self->_computeDeviceType;
}

- (void)setComputeDeviceType:(unint64_t)a3
{
  self->_computeDeviceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDevice, 0);
  objc_storeStrong((id *)&self->_customModelURL, 0);
}

@end