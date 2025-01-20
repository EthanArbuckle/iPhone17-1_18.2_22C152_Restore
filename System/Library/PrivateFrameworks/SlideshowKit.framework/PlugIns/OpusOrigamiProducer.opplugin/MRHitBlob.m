@interface MRHitBlob
- (BOOL)isEqualToHitBlob:(id)a3;
- (CGSize)innerResolution;
- (MRLayer)outerLayer;
- (MRLayerEffect)effectLayer;
- (MRSlidePositionSupport)proxyForSlide;
- (NSString)elementID;
- (NSString)innerPath;
- (NSString)mediaType;
- (double)aspectRatio;
- (id)clientObject;
- (unsigned)currentLayoutIndex;
- (void)setClientObject:(id)a3;
- (void)setCurrentLayoutIndex:(unsigned __int8)a3;
- (void)setEffectLayer:(id)a3;
- (void)setElementID:(id)a3;
- (void)setInnerPath:(id)a3;
- (void)setOuterLayer:(id)a3;
- (void)setProxyForSlide:(id)a3;
@end

@implementation MRHitBlob

- (double)aspectRatio
{
  [(MRLayer *)self->_outerLayer pixelSize];
  double v4 = v3;
  [(MRLayer *)self->_outerLayer pixelSize];
  return v4 / v5;
}

- (CGSize)innerResolution
{
  [(MRLayer *)self->_effectLayer pixelSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)mediaType
{
  CFStringRef v3 = @"image";
  if (![(NSString *)self->_elementID hasPrefix:@"image"])
  {
    CFStringRef v3 = @"text";
    if (![(NSString *)self->_elementID hasPrefix:@"text"]) {
      return 0;
    }
  }
  return &v3->isa;
}

- (BOOL)isEqualToHitBlob:(id)a3
{
  id clientObject = self->_clientObject;
  if (clientObject != [a3 clientObject]) {
    return 0;
  }
  innerPath = self->_innerPath;
  if (!innerPath) {
    return 1;
  }
  id v8 = [a3 innerPath];
  return [(NSString *)innerPath isEqualToString:v8];
}

- (MRLayer)outerLayer
{
  return (MRLayer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOuterLayer:(id)a3
{
}

- (MRLayerEffect)effectLayer
{
  return (MRLayerEffect *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEffectLayer:(id)a3
{
}

- (NSString)innerPath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInnerPath:(id)a3
{
}

- (NSString)elementID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setElementID:(id)a3
{
}

- (id)clientObject
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setClientObject:(id)a3
{
}

- (MRSlidePositionSupport)proxyForSlide
{
  return self->_proxyForSlide;
}

- (void)setProxyForSlide:(id)a3
{
  self->_proxyForSlide = (MRSlidePositionSupport *)a3;
}

- (unsigned)currentLayoutIndex
{
  return self->_currentLayoutIndex;
}

- (void)setCurrentLayoutIndex:(unsigned __int8)a3
{
  self->_currentLayoutIndex = a3;
}

@end