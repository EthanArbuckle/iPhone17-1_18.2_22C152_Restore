@interface PBFFocusEditingSceneViewController
- (CGRect)posterPreviewFrame;
- (UIView)galleryPreviewView;
- (UIView)posterPreviewComplicationsView;
- (int64_t)galleryDismissalAction;
- (void)setGalleryDismissalAction:(int64_t)a3;
- (void)setGalleryPreviewView:(id)a3;
- (void)setPosterPreviewComplicationsView:(id)a3;
- (void)setPosterPreviewFrame:(CGRect)a3;
@end

@implementation PBFFocusEditingSceneViewController

- (int64_t)galleryDismissalAction
{
  return self->_galleryDismissalAction;
}

- (void)setGalleryDismissalAction:(int64_t)a3
{
  self->_galleryDismissalAction = a3;
}

- (CGRect)posterPreviewFrame
{
  double x = self->_posterPreviewFrame.origin.x;
  double y = self->_posterPreviewFrame.origin.y;
  double width = self->_posterPreviewFrame.size.width;
  double height = self->_posterPreviewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPosterPreviewFrame:(CGRect)a3
{
  self->_posterPreviewFrame = a3;
}

- (UIView)galleryPreviewView
{
  return self->_galleryPreviewView;
}

- (void)setGalleryPreviewView:(id)a3
{
}

- (UIView)posterPreviewComplicationsView
{
  return self->_posterPreviewComplicationsView;
}

- (void)setPosterPreviewComplicationsView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterPreviewComplicationsView, 0);
  objc_storeStrong((id *)&self->_galleryPreviewView, 0);
}

@end