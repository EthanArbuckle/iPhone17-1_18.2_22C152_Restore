@interface SXQuickLookLayoutAttributes
- (CGRect)errorLabelFrame;
- (CGRect)thumbnailFrame;
- (SXQuickLookLayoutAttributes)initWithThumbnailFrame:(CGRect)a3 errorLabelFrame:(CGRect)a4;
@end

@implementation SXQuickLookLayoutAttributes

- (SXQuickLookLayoutAttributes)initWithThumbnailFrame:(CGRect)a3 errorLabelFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SXQuickLookLayoutAttributes;
  result = [(SXQuickLookLayoutAttributes *)&v13 init];
  if (result)
  {
    result->_thumbnailFrame.origin.CGFloat x = v11;
    result->_thumbnailFrame.origin.CGFloat y = v10;
    result->_thumbnailFrame.size.CGFloat width = v9;
    result->_thumbnailFrame.size.CGFloat height = v8;
    result->_errorLabelFrame.origin.CGFloat x = x;
    result->_errorLabelFrame.origin.CGFloat y = y;
    result->_errorLabelFrame.size.CGFloat width = width;
    result->_errorLabelFrame.size.CGFloat height = height;
  }
  return result;
}

- (CGRect)thumbnailFrame
{
  double x = self->_thumbnailFrame.origin.x;
  double y = self->_thumbnailFrame.origin.y;
  double width = self->_thumbnailFrame.size.width;
  double height = self->_thumbnailFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)errorLabelFrame
{
  double x = self->_errorLabelFrame.origin.x;
  double y = self->_errorLabelFrame.origin.y;
  double width = self->_errorLabelFrame.size.width;
  double height = self->_errorLabelFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end