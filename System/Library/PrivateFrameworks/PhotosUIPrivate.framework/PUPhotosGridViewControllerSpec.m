@interface PUPhotosGridViewControllerSpec
- (BOOL)canCommitPreview;
- (BOOL)canDisplayEditActionsInNavigationBar;
- (BOOL)canDisplayOptionsInPopover;
- (BOOL)canDisplaySlideshowButton;
- (BOOL)displaysAvalancheStacks;
- (BOOL)shouldPlaceDeleteInCenterToolbarPosition;
- (BOOL)shouldPlaceSelectAllButtonInRightNavigationBar;
- (BOOL)shouldUseAspectItems;
- (BOOL)usesStackPopTransition;
- (BOOL)wantsBackButtonTitleForPhotoBrowser;
- (BOOL)wantsCustomNavigationTransition;
- (CGSize)baseInterItemSpacing;
- (CGSize)contentSizeForViewInPopover;
- (PUPhotosGridViewControllerSpec)init;
- (UIEdgeInsets)gridContentInsets;
- (UIEdgeInsets)layoutMargins;
- (UIEdgeInsets)safeAreaInsets;
- (UIEdgeInsets)sectionHeaderInsets;
- (double)sectionHeaderHeight;
- (int64_t)cellBannerTextAlignment;
- (int64_t)cellFillMode;
- (int64_t)forceLoadInitialSectionCount;
- (int64_t)sectionHeaderStyle;
- (int64_t)sizeSubclass;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)thumbnailImageFormat;
- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5;
- (void)setSafeAreaInsets:(UIEdgeInsets)a3;
@end

@implementation PUPhotosGridViewControllerSpec

- (int64_t)sizeSubclass
{
  return self->_sizeSubclass;
}

- (UIEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double left = self->_layoutMargins.left;
  double bottom = self->_layoutMargins.bottom;
  double right = self->_layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)usesStackPopTransition
{
  return self->_usesStackPopTransition;
}

- (BOOL)canDisplayEditActionsInNavigationBar
{
  return self->_canDisplayEditActionsInNavigationBar;
}

- (BOOL)canDisplaySlideshowButton
{
  return self->_canDisplaySlideshowButton;
}

- (BOOL)canDisplayOptionsInPopover
{
  return self->_canDisplayOptionsInPopover;
}

- (CGSize)baseInterItemSpacing
{
  double width = self->_baseInterItemSpacing.width;
  double height = self->_baseInterItemSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)gridContentInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.double right = v5;
  result.double bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (UIEdgeInsets)sectionHeaderInsets
{
  [(PUPhotosGridViewControllerSpec *)self layoutMargins];
  [(PUPhotosGridViewControllerSpec *)self safeAreaInsets];
  UIEdgeInsetsAdd();
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (int64_t)sectionHeaderStyle
{
  return 0;
}

- (double)sectionHeaderHeight
{
  return 0.0;
}

- (int64_t)forceLoadInitialSectionCount
{
  return 20;
}

- (BOOL)wantsCustomNavigationTransition
{
  return 0;
}

- (BOOL)wantsBackButtonTitleForPhotoBrowser
{
  return 0;
}

- (BOOL)displaysAvalancheStacks
{
  return 1;
}

- (BOOL)canCommitPreview
{
  return 1;
}

- (BOOL)shouldPlaceDeleteInCenterToolbarPosition
{
  return 0;
}

- (BOOL)shouldPlaceSelectAllButtonInRightNavigationBar
{
  return 1;
}

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  id v10 = a3;
  PXEdgeInsetsForEdges();
  self->_safeAreaInsets.double top = v6;
  self->_safeAreaInsets.double left = v7;
  self->_safeAreaInsets.double bottom = v8;
  self->_safeAreaInsets.double right = v9;
  objc_msgSend(v10, "setUsesAspectItems:", -[PUPhotosGridViewControllerSpec shouldUseAspectItems](self, "shouldUseAspectItems"));
}

- (BOOL)shouldUseAspectItems
{
  return 0;
}

- (int64_t)cellBannerTextAlignment
{
  return 1;
}

- (int64_t)cellFillMode
{
  return 1;
}

- (unsigned)thumbnailImageFormat
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUPhotosGridViewControllerSpec.m" lineNumber:52 description:@"Required override not found"];

  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (CGSize)contentSizeForViewInPopover
{
  double v2 = 320.0;
  double v3 = 480.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (PUPhotosGridViewControllerSpec)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUPhotosGridViewControllerSpec;
  double v2 = [(PUPhotosGridViewControllerSpec *)&v10 init];
  if (v2)
  {
    double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    v2->_sizeSubclass = objc_msgSend(MEMORY[0x1E4F902F8], "photosGridSizeSubclassForScreenSize:", v5, v7);
    objc_msgSend(MEMORY[0x1E4FB1EB0], "pu_layoutMarginWidthForCurrentScreenSize");
    v2->_layoutMargins.double top = 0.0;
    v2->_layoutMargins.double left = v8;
    v2->_layoutMargins.double bottom = 0.0;
    v2->_layoutMargins.double right = v8;
  }
  return v2;
}

@end