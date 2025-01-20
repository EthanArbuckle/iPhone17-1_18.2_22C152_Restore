@interface PBFGalleryEditingSceneViewController
- (CGRect)galleryPreviewFrame;
- (NSString)galleryPreviewType;
- (NSString)galleryPreviewUniqueIdentifier;
- (PBFGalleryOptions)galleryOptions;
- (PRPosterDescriptorGalleryOptions)descriptorGalleryOptions;
- (UIView)galleryPreviewComplicationsView;
- (UIView)galleryPreviewView;
- (double)galleryPreviewCornerRadius;
- (int64_t)galleryDismissalAction;
- (unint64_t)galleryPresentationStyle;
- (void)setDescriptorGalleryOptions:(id)a3;
- (void)setGalleryDismissalAction:(int64_t)a3;
- (void)setGalleryOptions:(id)a3;
- (void)setGalleryPresentationStyle:(unint64_t)a3;
- (void)setGalleryPreviewComplicationsView:(id)a3;
- (void)setGalleryPreviewCornerRadius:(double)a3;
- (void)setGalleryPreviewFrame:(CGRect)a3;
- (void)setGalleryPreviewType:(id)a3;
- (void)setGalleryPreviewUniqueIdentifier:(id)a3;
- (void)setGalleryPreviewView:(id)a3;
@end

@implementation PBFGalleryEditingSceneViewController

- (PBFGalleryOptions)galleryOptions
{
  return self->_galleryOptions;
}

- (void)setGalleryOptions:(id)a3
{
}

- (PRPosterDescriptorGalleryOptions)descriptorGalleryOptions
{
  return self->_descriptorGalleryOptions;
}

- (void)setDescriptorGalleryOptions:(id)a3
{
}

- (NSString)galleryPreviewUniqueIdentifier
{
  return self->_galleryPreviewUniqueIdentifier;
}

- (void)setGalleryPreviewUniqueIdentifier:(id)a3
{
}

- (UIView)galleryPreviewView
{
  return self->_galleryPreviewView;
}

- (void)setGalleryPreviewView:(id)a3
{
}

- (CGRect)galleryPreviewFrame
{
  double x = self->_galleryPreviewFrame.origin.x;
  double y = self->_galleryPreviewFrame.origin.y;
  double width = self->_galleryPreviewFrame.size.width;
  double height = self->_galleryPreviewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setGalleryPreviewFrame:(CGRect)a3
{
  self->_galleryPreviewFrame = a3;
}

- (double)galleryPreviewCornerRadius
{
  return self->_galleryPreviewCornerRadius;
}

- (void)setGalleryPreviewCornerRadius:(double)a3
{
  self->_galleryPreviewCornerRadius = a3;
}

- (NSString)galleryPreviewType
{
  return self->_galleryPreviewType;
}

- (void)setGalleryPreviewType:(id)a3
{
}

- (unint64_t)galleryPresentationStyle
{
  return self->_galleryPresentationStyle;
}

- (void)setGalleryPresentationStyle:(unint64_t)a3
{
  self->_galleryPresentationStyle = a3;
}

- (UIView)galleryPreviewComplicationsView
{
  return self->_galleryPreviewComplicationsView;
}

- (void)setGalleryPreviewComplicationsView:(id)a3
{
}

- (int64_t)galleryDismissalAction
{
  return self->_galleryDismissalAction;
}

- (void)setGalleryDismissalAction:(int64_t)a3
{
  self->_galleryDismissalAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryPreviewComplicationsView, 0);
  objc_storeStrong((id *)&self->_galleryPreviewType, 0);
  objc_storeStrong((id *)&self->_galleryPreviewView, 0);
  objc_storeStrong((id *)&self->_galleryPreviewUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_descriptorGalleryOptions, 0);
  objc_storeStrong((id *)&self->_galleryOptions, 0);
}

@end