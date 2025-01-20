@interface THPageThumbnailViewInTransition
- (CGRect)originalThumbnailFrame;
- (THPageThumbnailView)thumbnailView;
- (void)setOriginalThumbnailFrame:(CGRect)a3;
- (void)setThumbnailView:(id)a3;
@end

@implementation THPageThumbnailViewInTransition

- (THPageThumbnailView)thumbnailView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);

  return (THPageThumbnailView *)WeakRetained;
}

- (void)setThumbnailView:(id)a3
{
}

- (CGRect)originalThumbnailFrame
{
  double x = self->_originalThumbnailFrame.origin.x;
  double y = self->_originalThumbnailFrame.origin.y;
  double width = self->_originalThumbnailFrame.size.width;
  double height = self->_originalThumbnailFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalThumbnailFrame:(CGRect)a3
{
  self->_originalThumbnailFrame = a3;
}

- (void).cxx_destruct
{
}

@end