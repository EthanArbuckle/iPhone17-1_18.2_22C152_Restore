@interface THWGalleryItem
- (BOOL)isOpaque;
- (CGRect)cropRect;
- (NSDictionary)accessibilityDescriptions;
- (THImageInfo)imageInfo;
- (THWGalleryItem)initWithContext:(id)a3 imageData:(id)a4 thumbnailData:(id)a5 captionStorage:(id)a6 cropRect:(CGRect)a7 accessibilityDescriptions:(id)a8;
- (THWPStorage)captionStorage;
- (TSPData)thumbnailImageData;
- (id)childEnumerator;
- (void)dealloc;
@end

@implementation THWGalleryItem

- (THWGalleryItem)initWithContext:(id)a3 imageData:(id)a4 thumbnailData:(id)a5 captionStorage:(id)a6 cropRect:(CGRect)a7 accessibilityDescriptions:(id)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)THWGalleryItem;
  v17 = [(THWGalleryItem *)&v22 init];
  if (v17)
  {
    v18 = (THWPStorage *)a6;
    v17->_captionStorage = v18;
    [(THWPStorage *)v18 setPreventHighlighting:1];
    v17->_cropRect.origin.CGFloat x = x;
    v17->_cropRect.origin.CGFloat y = y;
    v17->_cropRect.size.CGFloat width = width;
    v17->_cropRect.size.CGFloat height = height;
    v17->_accessibilityDescriptions = (NSDictionary *)a8;
    id v19 = [objc_alloc((Class)TSDMediaStyle) initWithContext:a3 name:0 overridePropertyMap:0 isVariation:0];
    v17->_imageInfo = [[THImageInfo alloc] initWithContext:a3 geometry:0 style:v19 imageData:a4 originalImageData:0];
    id v20 = [objc_alloc((Class)TSDMaskInfo) initWithContext:a3 geometry:0 pathSource:[TSDScalarPathSource rectangleWithNaturalSize:100.0, 100.0]];
    [(THImageInfo *)v17->_imageInfo setMaskInfo:v20];

    if (a5) {
      v17->_thumbnailImageData = (TSPData *)a5;
    }
  }
  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWGalleryItem;
  [(THWGalleryItem *)&v3 dealloc];
}

- (BOOL)isOpaque
{
  return [(THImageInfo *)self->_imageInfo isOpaque];
}

- (id)childEnumerator
{
  id v3 = +[NSMutableArray array];
  v4 = v3;
  if (self->_captionStorage) {
    [v3 addObject:];
  }

  return [v4 objectEnumerator];
}

- (THImageInfo)imageInfo
{
  return self->_imageInfo;
}

- (TSPData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (THWPStorage)captionStorage
{
  return self->_captionStorage;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSDictionary)accessibilityDescriptions
{
  return self->_accessibilityDescriptions;
}

@end