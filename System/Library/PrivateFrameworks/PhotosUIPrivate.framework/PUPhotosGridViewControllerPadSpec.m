@interface PUPhotosGridViewControllerPadSpec
- (BOOL)canDisplayEditActionsInNavigationBar;
- (BOOL)canDisplayOptionsInPopover;
- (BOOL)canDisplaySlideshowButton;
- (BOOL)shouldPlaceDeleteInCenterToolbarPosition;
- (BOOL)shouldPlaceSelectAllButtonInRightNavigationBar;
- (BOOL)shouldUseAspectItems;
- (BOOL)usesStackPopTransition;
- (BOOL)wantsBackButtonTitleForPhotoBrowser;
- (BOOL)wantsCustomNavigationTransition;
- (CGSize)baseInterItemSpacing;
- (int64_t)cellBannerTextAlignment;
- (int64_t)cellFillMode;
- (int64_t)sectionHeaderStyle;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)thumbnailImageFormat;
- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5;
@end

@implementation PUPhotosGridViewControllerPadSpec

- (int64_t)sectionHeaderStyle
{
  return 0;
}

- (BOOL)wantsCustomNavigationTransition
{
  return 1;
}

- (BOOL)wantsBackButtonTitleForPhotoBrowser
{
  return 1;
}

- (BOOL)shouldPlaceDeleteInCenterToolbarPosition
{
  return 1;
}

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  v31.receiver = self;
  v31.super_class = (Class)PUPhotosGridViewControllerPadSpec;
  id v11 = a3;
  -[PUPhotosGridViewControllerSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v31, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v11, a4, top, left, bottom, right);
  [(PUPhotosGridViewControllerSpec *)self layoutMargins];
  [(PUPhotosGridViewControllerSpec *)self safeAreaInsets];
  UIEdgeInsetsAdd();
  PXEdgeInsetsForEdges();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v20 bounds];
  double v22 = v21;

  int v23 = PLIsPadMini();
  uint64_t v24 = 5;
  uint64_t v25 = 7;
  if (v22 >= a4) {
    uint64_t v25 = 5;
  }
  double v26 = 17.0;
  if (v22 < a4) {
    double v26 = 10.0;
  }
  if (!v23) {
    uint64_t v24 = v25;
  }
  double v27 = a4 - (v15 + v19);
  double v28 = (double)(v24 - 1);
  double v29 = floor((v27 - v28 * v26) / (double)v24);
  double v30 = floor((v27 - v29 * (double)v24) / v28);
  objc_msgSend(v11, "setItemSize:", v29, v29);
  objc_msgSend(v11, "setInterItemSpacing:", v30, v30);
  objc_msgSend(v11, "setSectionContentInset:", v13, v15, v17, v19);
  [v11 setSectionTopPadding:9.5];
  [v11 setGlobalTopPadding:9.0];
  [v11 setGlobalBottomPadding:12.0];
  [v11 setCropType:0];
  [v11 setCropAmount:0.0];
}

- (BOOL)shouldUseAspectItems
{
  return 1;
}

- (BOOL)shouldPlaceSelectAllButtonInRightNavigationBar
{
  return 1;
}

- (BOOL)canDisplaySlideshowButton
{
  return 1;
}

- (BOOL)usesStackPopTransition
{
  return 1;
}

- (BOOL)canDisplayEditActionsInNavigationBar
{
  return 1;
}

- (BOOL)canDisplayOptionsInPopover
{
  return 1;
}

- (int64_t)cellBannerTextAlignment
{
  return 2;
}

- (int64_t)cellFillMode
{
  return 2;
}

- (unsigned)thumbnailImageFormat
{
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  if (*(double *)&PUMainScreenScale_screenScale <= 1.0) {
    return 3501;
  }
  else {
    return 5003;
  }
}

- (CGSize)baseInterItemSpacing
{
  v2 = +[PUPhotosGridSettings sharedInstance];
  [v2 maximumSpacing];
  double v4 = v3;
  [v2 maximumSpacing];
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

@end