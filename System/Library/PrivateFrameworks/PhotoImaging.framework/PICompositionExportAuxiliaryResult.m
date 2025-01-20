@interface PICompositionExportAuxiliaryResult
- (BOOL)canPropagateOriginalAuxiliaryData;
- (NSData)companionImageData;
- (NSDictionary)auxiliaryImages;
- (NSURL)companionVideoURL;
- (NUImageProperties)properties;
- (void)setAuxiliaryImages:(id)a3;
- (void)setCanPropagateOriginalAuxiliaryData:(BOOL)a3;
- (void)setProperties:(id)a3;
@end

@implementation PICompositionExportAuxiliaryResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_auxiliaryImages, 0);
  objc_storeStrong((id *)&self->_companionVideoURL, 0);
  objc_storeStrong((id *)&self->_companionImageData, 0);
}

- (void)setProperties:(id)a3
{
}

- (NUImageProperties)properties
{
  return (NUImageProperties *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCanPropagateOriginalAuxiliaryData:(BOOL)a3
{
  self->_canPropagateOriginalAuxiliaryData = a3;
}

- (BOOL)canPropagateOriginalAuxiliaryData
{
  return self->_canPropagateOriginalAuxiliaryData;
}

- (void)setAuxiliaryImages:(id)a3
{
}

- (NSDictionary)auxiliaryImages
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (NSURL)companionVideoURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (NSData)companionImageData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

@end