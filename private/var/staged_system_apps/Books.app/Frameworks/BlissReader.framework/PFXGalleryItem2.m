@interface PFXGalleryItem2
- (CGRect)fullresCropRect;
- (NSDictionary)accessibilityDescriptions;
- (THWPStorage)caption;
- (TSPData)fullres;
- (TSPData)thumbnail;
- (void)dealloc;
- (void)setAccessibilityDescriptions:(id)a3;
- (void)setCaption:(id)a3;
- (void)setFullres:(id)a3;
- (void)setFullresCropRect:(CGRect)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation PFXGalleryItem2

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXGalleryItem2;
  [(PFXGalleryItem2 *)&v3 dealloc];
}

- (TSPData)fullres
{
  return self->_fullres;
}

- (void)setFullres:(id)a3
{
}

- (CGRect)fullresCropRect
{
  double x = self->_fullresCropRect.origin.x;
  double y = self->_fullresCropRect.origin.y;
  double width = self->_fullresCropRect.size.width;
  double height = self->_fullresCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFullresCropRect:(CGRect)a3
{
  self->_fullresCropRect = a3;
}

- (TSPData)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (THWPStorage)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
}

- (NSDictionary)accessibilityDescriptions
{
  return self->_accessibilityDescriptions;
}

- (void)setAccessibilityDescriptions:(id)a3
{
}

@end