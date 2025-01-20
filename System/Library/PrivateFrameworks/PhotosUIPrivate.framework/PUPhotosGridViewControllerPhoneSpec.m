@interface PUPhotosGridViewControllerPhoneSpec
- (BOOL)canDisplayOptionsInPopover;
- (BOOL)canDisplaySlideshowButton;
- (BOOL)shouldPlaceSelectAllButtonInRightNavigationBar;
- (BOOL)shouldUseAspectItems;
- (CGSize)baseInterItemSpacing;
- (UIEdgeInsets)gridContentInsets;
- (int64_t)cellFillMode;
- (int64_t)forceLoadInitialSectionCount;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)thumbnailImageFormat;
- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5;
@end

@implementation PUPhotosGridViewControllerPhoneSpec

- (BOOL)shouldUseAspectItems
{
  return 0;
}

- (UIEdgeInsets)gridContentInsets
{
  [(PUPhotosGridViewControllerSpec *)self safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = v3;
  if (v6 > 0.0 && v3 > 0.0)
  {
    [(PUPhotosGridViewControllerSpec *)self layoutMargins];
    UIEdgeInsetsAdd();
    double v5 = v11;
    double v7 = v12;
    double v9 = v13;
    double v10 = v14;
  }
  double v15 = v5;
  double v16 = v7;
  double v17 = v9;
  double v18 = v10;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (BOOL)shouldPlaceSelectAllButtonInRightNavigationBar
{
  return 0;
}

- (BOOL)canDisplaySlideshowButton
{
  return 0;
}

- (int64_t)forceLoadInitialSectionCount
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v6 >= v4) {
    double v7 = v4;
  }
  else {
    double v7 = v6;
  }
  uint64_t v8 = [MEMORY[0x1E4F902F8] photosGridLayoutColumnsForWidth:v7];
  double v9 = (void *)MEMORY[0x1E4F902F8];
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  if (v6 >= v4) {
    double v4 = v6;
  }
  [v9 bestItemSizeForAvailableWidth:v8 screenScale:&v13 columns:&v12 bestSpacing:v7 bestInset:*(double *)&PUMainScreenScale_screenScale];
  return vcvtpd_s64_f64(v4 / v10);
}

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  v28.receiver = self;
  v28.super_class = (Class)PUPhotosGridViewControllerPhoneSpec;
  id v11 = a3;
  -[PUPhotosGridViewControllerSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v28, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v11, a4, top, left, bottom, right);
  [(PUPhotosGridViewControllerPhoneSpec *)self gridContentInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = a4 - v14 - v18;
  uint64_t v21 = [MEMORY[0x1E4F902F8] photosGridLayoutColumnsForWidth:v20];
  double v26 = 0.0;
  double v27 = 0.0;
  v22 = (void *)MEMORY[0x1E4F902F8];
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  [v22 bestItemSizeForAvailableWidth:v21 screenScale:&v27 columns:&v26 bestSpacing:v20 bestInset:*(double *)&PUMainScreenScale_screenScale];
  double v23 = v27;
  double v24 = v15 + v26;
  double v25 = v19 + v26;
  objc_msgSend(v11, "setItemSize:");
  objc_msgSend(v11, "setInterItemSpacing:", v23, v23);
  objc_msgSend(v11, "setSectionContentInset:", v13, v24, v17, v25);
  [v11 setSectionTopPadding:9.5];
  [v11 setGlobalTopPadding:0.0];
  [v11 setGlobalBottomPadding:4.0];
  [v11 setCropType:0];
  [v11 setCropAmount:0.0];
}

- (BOOL)canDisplayOptionsInPopover
{
  return 0;
}

- (int64_t)cellFillMode
{
  return 1;
}

- (unsigned)thumbnailImageFormat
{
  int64_t v4 = [(PUPhotosGridViewControllerSpec *)self sizeSubclass];
  if ((unint64_t)(v4 - 2) < 2)
  {
    double v6 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
    double v7 = [v6 masterThumbnailFormat];
    unsigned __int16 v5 = [v7 formatID];
  }
  else if (v4 == 1)
  {
    if (PUMainScreenScale_onceToken != -1) {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
    }
    if (*(double *)&PUMainScreenScale_screenScale <= 1.0) {
      unsigned __int16 v5 = 3311;
    }
    else {
      unsigned __int16 v5 = 3319;
    }
  }
  else
  {
    if (!v4)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PUPhotosGridViewControllerSpec.m" lineNumber:137 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    unsigned __int16 v5 = 0;
  }
  uint64_t v8 = +[PUPhotosGridSettings sharedInstance];
  int v9 = [v8 forceJPEGThumbnailsInDefaultGrid];

  if (!v9) {
    return v5;
  }
  double v10 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
  id v11 = [v10 masterThumbnailFormat];
  unsigned __int16 v12 = [v11 formatID];

  return v12;
}

- (CGSize)baseInterItemSpacing
{
  double v2 = 2.0;
  double v3 = 2.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

@end