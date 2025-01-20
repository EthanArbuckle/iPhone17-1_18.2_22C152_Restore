@interface PXCollectionTileLayoutTemplate
- (CGRect)imageRect;
- (CGRect)titleSubtitleRect;
- (void)prepare;
@end

@implementation PXCollectionTileLayoutTemplate

- (CGRect)titleSubtitleRect
{
  double x = self->_titleSubtitleRect.origin.x;
  double y = self->_titleSubtitleRect.origin.y;
  double width = self->_titleSubtitleRect.size.width;
  double height = self->_titleSubtitleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)imageRect
{
  double x = self->_imageRect.origin.x;
  double y = self->_imageRect.origin.y;
  double width = self->_imageRect.size.width;
  double height = self->_imageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)prepare
{
  v7.receiver = self;
  v7.super_class = (Class)PXCollectionTileLayoutTemplate;
  [(PXLayoutTemplate *)&v7 prepare];
  [(PXLayoutTemplate *)self bounds];
  self->_imageRect.origin.double x = v3;
  self->_imageRect.origin.double y = v4;
  self->_imageRect.size.double width = v5;
  self->_imageRect.size.double height = v6;
  self->_titleSubtitleRect.origin.double x = v3;
  self->_titleSubtitleRect.origin.double y = v4;
  self->_titleSubtitleRect.size.double width = v5;
  self->_titleSubtitleRect.size.double height = v6;
}

@end