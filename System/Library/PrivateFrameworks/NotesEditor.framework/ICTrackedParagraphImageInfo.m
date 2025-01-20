@interface ICTrackedParagraphImageInfo
- (BOOL)estimated;
- (CGRect)boundingRect;
- (CGRect)rect;
- (ICTrackedParagraph)trackedParagraph;
- (NSString)uuid;
- (UIImage)image;
- (UIImageView)imageViewIfExists;
- (void)setBoundingRect:(CGRect)a3;
- (void)setEstimated:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageViewIfExists:(id)a3;
- (void)setRect:(CGRect)a3;
- (void)setTrackedParagraph:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation ICTrackedParagraphImageInfo

- (ICTrackedParagraph)trackedParagraph
{
  return self->_trackedParagraph;
}

- (void)setTrackedParagraph:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (CGRect)boundingRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingRect:(CGRect)a3
{
  self->_boundingRect = a3;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (UIImageView)imageViewIfExists
{
  return self->_imageViewIfExists;
}

- (void)setImageViewIfExists:(id)a3
{
}

- (BOOL)estimated
{
  return self->_estimated;
}

- (void)setEstimated:(BOOL)a3
{
  self->_estimated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewIfExists, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_trackedParagraph, 0);
}

@end