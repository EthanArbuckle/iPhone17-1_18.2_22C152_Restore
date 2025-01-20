@interface PUCurationTripKeyAssetDebugViewControllerPhoneSpec
- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5;
@end

@implementation PUCurationTripKeyAssetDebugViewControllerPhoneSpec

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  v27.receiver = self;
  v27.super_class = (Class)PUCurationTripKeyAssetDebugViewControllerPhoneSpec;
  id v11 = a3;
  -[PUPhotosGridViewControllerPhoneSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v27, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v11, a4, top, left, bottom, right);
  [(PUPhotosGridViewControllerPhoneSpec *)self gridContentInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v25 = 0.0;
  double v26 = 0.0;
  v20 = (void *)MEMORY[0x1E4F902F8];
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  [v20 bestItemSizeForAvailableWidth:3 screenScale:&v26 columns:&v25 bestSpacing:a4 - v15 - v19 bestInset:*(double *)&PUMainScreenScale_screenScale];
  double v21 = v26;
  double v22 = v26 + 35.0;
  double v23 = v15 + v25;
  double v24 = v19 + v25;
  objc_msgSend(v11, "setItemSize:");
  objc_msgSend(v11, "setInterItemSpacing:", v21, v22);
  objc_msgSend(v11, "setSectionContentInset:", v13, v23, v17, v24);
}

@end