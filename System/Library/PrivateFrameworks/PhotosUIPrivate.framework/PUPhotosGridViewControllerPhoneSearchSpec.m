@interface PUPhotosGridViewControllerPhoneSearchSpec
- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5;
@end

@implementation PUPhotosGridViewControllerPhoneSearchSpec

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  v28.receiver = self;
  v28.super_class = (Class)PUPhotosGridViewControllerPhoneSearchSpec;
  id v11 = a3;
  -[PUPhotosGridViewControllerPhoneSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v28, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v11, a4, top, left, bottom, right);
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
  [v11 setSectionTopPadding:0.0];
  [v11 setGlobalTopPadding:0.0];
  [v11 setGlobalBottomPadding:4.0];
  [v11 setCropType:0];
  [v11 setCropAmount:0.0];
}

@end