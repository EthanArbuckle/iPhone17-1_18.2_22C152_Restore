@interface PUCurationTripKeyAssetDebugViewControllerPadSpec
- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5;
@end

@implementation PUCurationTripKeyAssetDebugViewControllerPadSpec

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  v24.receiver = self;
  v24.super_class = (Class)PUCurationTripKeyAssetDebugViewControllerPadSpec;
  id v10 = a3;
  -[PUPhotosGridViewControllerPadSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v24, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v10, a4, top, left, bottom, right);
  objc_msgSend(v10, "sectionContentInset", v24.receiver, v24.super_class);
  double v12 = v11;
  double v14 = v13;
  v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 bounds];
  double v17 = v16;

  uint64_t v18 = 3;
  if (v17 < a4) {
    uint64_t v18 = 4;
  }
  double v19 = 17.0;
  if (v17 < a4) {
    double v19 = 10.0;
  }
  double v20 = a4 - (v12 + v14);
  double v21 = (double)(v18 - 1);
  double v22 = floor((v20 - v21 * v19) / (double)v18);
  double v23 = floor((v20 - v22 * (double)v18) / v21);
  objc_msgSend(v10, "setItemSize:", v22, v22);
  objc_msgSend(v10, "setInterItemSpacing:", v23, 48.0);
}

@end