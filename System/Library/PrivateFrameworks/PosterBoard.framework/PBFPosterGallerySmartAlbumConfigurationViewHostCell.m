@interface PBFPosterGallerySmartAlbumConfigurationViewHostCell
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIView)hostedView;
- (void)layoutSubviews;
- (void)setHostedView:(id)a3;
- (void)updateContent:(id)a3;
@end

@implementation PBFPosterGallerySmartAlbumConfigurationViewHostCell

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PBFPosterGallerySmartAlbumConfigurationViewHostCell;
  [(PBFPosterGallerySmartAlbumConfigurationViewHostCell *)&v4 layoutSubviews];
  hostedView = self->_hostedView;
  [(UIView *)hostedView frame];
  [(PBFPosterGallerySmartAlbumConfigurationViewHostCell *)self bounds];
  UIRectCenteredRect();
  -[UIView setFrame:](hostedView, "setFrame:");
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_hostedView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self->_hostedView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setHostedView:(id)a3
{
  double v5 = (UIView *)a3;
  hostedView = self->_hostedView;
  if (hostedView != v5)
  {
    v8 = v5;
    [(UIView *)hostedView removeFromSuperview];
    objc_storeStrong((id *)&self->_hostedView, a3);
    v7 = [(PBFPosterGallerySmartAlbumConfigurationViewHostCell *)self contentView];
    [v7 addSubview:self->_hostedView];

    [(PBFPosterGallerySmartAlbumConfigurationViewHostCell *)self invalidateIntrinsicContentSize];
    [(PBFPosterGallerySmartAlbumConfigurationViewHostCell *)self setNeedsLayout];
    double v5 = v8;
  }
}

- (void)updateContent:(id)a3
{
  if (a3) {
    (*((void (**)(id, UIView *))a3 + 2))(a3, self->_hostedView);
  }
  [(PBFPosterGallerySmartAlbumConfigurationViewHostCell *)self invalidateIntrinsicContentSize];
  [(PBFPosterGallerySmartAlbumConfigurationViewHostCell *)self setNeedsLayout];
}

- (UIView)hostedView
{
  return self->_hostedView;
}

- (void).cxx_destruct
{
}

@end