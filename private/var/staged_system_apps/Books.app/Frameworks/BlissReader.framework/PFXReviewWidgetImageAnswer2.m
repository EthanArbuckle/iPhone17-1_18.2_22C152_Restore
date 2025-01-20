@interface PFXReviewWidgetImageAnswer2
- (TSDImageInfo)imageInfo;
- (void)dealloc;
- (void)setImageInfo:(id)a3;
@end

@implementation PFXReviewWidgetImageAnswer2

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXReviewWidgetImageAnswer2;
  [(PFXReviewWidgetAnswer2 *)&v3 dealloc];
}

- (TSDImageInfo)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
}

@end